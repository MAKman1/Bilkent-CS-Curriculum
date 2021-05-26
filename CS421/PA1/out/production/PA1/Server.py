# -*- coding: utf-8 -*-
import socket
import random
import sys
import os
import shutil


ENCODING = "ascii"
NEWLINE = "\r\n"
USERNAME = "bilkentstu"
PASS = "cs421f2020"


#plant vocab
plant_root = ["tree","flower"]
conif_root = ["pine","fruit"]
cycads_root = ["basal", "core"]
conif_1 = ["turkish", "black", "scotch"]
conif_2 = ["apple", "cherry", "orange"]
cyca_1 = ["water_lily", "schisandra"]
cyca_2 = ["orchid", "magnolia"]

#animal vocab
animal_root = ["arthropoda","chordata"]
arthr_root = ["spider","insect", "shellfish"]
chord_root = ["bird", "mammal", "reptile"]
arthr_1 = ["harvester", "scorpion"]
arthr_2 = ["butterfly", "bee"]
arthr_3 = ["crab"]
chord_1 = ["eagle", "pigeon"]
chord_2 = ["cat", "panda"]
chord_3 = ["turtle","crocodile"]


SERVER_SHUTDOWN_MESSAGE = "Server shutdown. Please fix your code according to the response message and retry."

HEADER_SIZE = 2
MAX_DATA_SIZE = 2**(HEADER_SIZE*8) - 1

# Socket stuff
IP = sys.argv[1]
CONTROL_PORT = int(sys.argv[2])

class NoObjectiveException(Exception):
    pass

class NoAvailableParentException(Exception):
    pass

class InvalidDirectoryRequestException(Exception):
    pass

class ServerShutdownException(Exception):
    pass
       
def createFullDirectory(root, image_root, tree_list, animal_list):
    FILE_PREFIXES = ["animal", "dog", "experiment", "statistics", "read", "project_final", "verylongfilenamewhosefiledoesessentiallynothing", "old_midterms"]
    FILE_EXTENSIONS = [".png", ".py", ".bin", ".txt"]
    if os.path.exists(root):
        shutil.rmtree(root)
    os.mkdir(root)
    TREE_ROOT = os.path.join(ROOT_DIR, "plant")
    ANIMAL_ROOT = os.path.join(ROOT_DIR, "animal")
    os.mkdir(TREE_ROOT)
    os.mkdir(ANIMAL_ROOT)
    
    LEAF_INDEX_THRESHOLD = 3
    SUB_ROOTS = [TREE_ROOT,ANIMAL_ROOT]
    sub_lists = [tree_list, animal_list]
    for sub_root,sub_list in zip(SUB_ROOTS, sub_lists):
        folderStack = list()
        for index,trees in enumerate(sub_list):
            if(index == 0):
                for folder in trees:
                    folder_to_create = os.path.join(sub_root, folder)
                    os.mkdir(folder_to_create)
                    folderStack.append(folder_to_create)
            else:
                saveFolder = folderStack.pop(0)
                for folder in trees:
                    folder_to_create = os.path.join(saveFolder, folder)
                    os.mkdir(folder_to_create)
                    folderStack.append(folder_to_create) 
                    #relocate images 
                    if(index >= LEAF_INDEX_THRESHOLD):
                    # matches string to load the image from image_root to folder
                        jpg_filename = folder.lower() + '.jpg'
                        shutil.copy(os.path.join(image_root,jpg_filename), folder_to_create)
                    #put random mumbo-jumbo files for distraction
                    if(random.uniform(0,10) >= 6):
                        filename = random.choice(FILE_PREFIXES) + random.choice(FILE_EXTENSIONS)
                        open(os.path.join(folder_to_create,filename), 'a').close()
                        
                    
                       
                    
# removed nod is calulcted form a Gussion distribution with mean (tree depth) and variance 1, variance can be changed to temper with folder behavior.
# total removed depth can be observed to follow common behavior                  
def randomChopDirectory(root):
    #randomly decide on the nodes to chop
    # this seems to work on macOS, I hope it also works from windows, I think it should.
    min_depth = root.count("\\") + root.count("/")
    
    max_depth = 4
    #total_rm_depth = 0
    for root, dirs, files in os.walk(root, topdown=True):
        for name in dirs:
            current_dir = os.path.join(root, name)
            depth = current_dir.count("\\") + current_dir.count("/") - min_depth  
            gauss_sample = random.gauss(depth,1)
            if gauss_sample >= max_depth:
                shutil.rmtree(current_dir)
                #total_rm_depth += max_depth - depth
    #print(total_rm_depth)
    
def getImageList(root):    
    listOfFiles = list()
    listofJPGFiles = list()
    for (dirpath, dirnames, filenames) in os.walk(root):
        listOfFiles += [file for file in filenames]
    for file_name in listOfFiles:
        if(file_name.endswith(".jpg")):
            listofJPGFiles.append(file_name)        
    return listofJPGFiles
        
        

def send_response(s, success, info=""):
    response = "OK" if success else "INVALID " + info
    response = response + "\r\n"
    s.sendall(response.encode())

def send_get_response(s, args, success):
    code = "ISND"

    myfile = open(os.path.join(os.getcwd(), args), 'rb')
    data = myfile.read()
    size = len(data)
    bytesize = size.to_bytes(3, byteorder="big")

    response = code.encode()+bytesize+data
    s.sendall(response)

def send_response_with_exp(s, success, info=""):
    response = "OK " + info if success else "INVALID " + info
    response = response + "\r\n"
    s.sendall(response.encode())

def nlst(conn):
    info = ' '.join([str(i) for i in os.listdir()]) 
    send_response_with_exp(conn, success=True, info = info)

def cwdr(conn, args):
	os.chdir(os.path.expanduser(args))
	send_response(conn, success=True)

def cdup(conn):
	os.chdir(os.path.dirname(os.getcwd()))
	send_response(conn, success=True)

def objective_selection():
    img_list = getImageList(ROOT_DIR)  
    while (len(img_list)) < 3:
        createFullDirectory(ROOT_DIR, IMAGE_PATH, tree_list, animal_list)    
        randomChopDirectory(ROOT_DIR)
        img_list = getImageList(ROOT_DIR)  
    #choose the images requested to be found randomly
    return random.sample(img_list, 3)


def receive_command(f):
    line = f.readline()[:-len(NEWLINE)]
    idx = line.find(" ")
    
    if idx == -1:
        idx = len(line)
    
    cmd = line[:idx]
    args = line[idx+1:]
    print("Command received:", cmd, args)
    return cmd, args

def shutdown():
    print(SERVER_SHUTDOWN_MESSAGE)
    raise ServerShutdownException

def auth_check(f, conn):
    
    # Username check
    check = False
    cmd, args = receive_command(f)
    
    if cmd == "USER":
        if args == USERNAME:
            send_response(conn, success=True)
            check = True
        else:
            send_response(conn, success=False, info="Wrong username.")
    else:
        send_response(conn, success=False, info="Wrong command. Expecting USER.")
        
    if not check:
        return check
        
    # Password check
    check = False
    cmd, args = receive_command(f)
    if cmd == "PASS":
        if args == PASS:
            send_response(conn, success=True)
            check = True
        else:
            send_response(conn, success=False, info="Wrong password.")
    else:
        send_response(conn, success=False, info="Wrong command. Expecting PASS.")
    
    if not check:
        return check
        



# =============================================================================
# MAIN
# =============================================================================
if __name__ == "__main__":

    cwd = os.getcwd()
    ROOT_DIR = os.path.join(cwd, "root")  
    IMAGE_PATH = os.path.join(cwd, "image_root")
    tree_list = [plant_root,conif_root,cycads_root,conif_1,conif_2,cyca_1,cyca_2]
    animal_list = [animal_root,arthr_root,chord_root,arthr_1,arthr_2,arthr_3,chord_1,chord_2,chord_3]


    createFullDirectory(ROOT_DIR, IMAGE_PATH, tree_list, animal_list)
    randomChopDirectory(ROOT_DIR)
    os.chdir(os.path.expanduser("root"))
    #Guarantee there is more than three JPG files
    objective_list = objective_selection()   
    obj = ' '.join([str(i) for i in objective_list])
    # Create socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    

    try:
        # Listen from the control port
        s.bind((IP, CONTROL_PORT))
        s.listen(1)
        conn, addr = s.accept()
        print("Client connected.")
        
        # Readfile
        f = conn.makefile(buffering=1, encoding=ENCODING, newline=NEWLINE)
        # Authenticate and get client data port
        check = auth_check(f, conn)
        if check == False:
            shutdown()
            
        # Main loop
        while True:
            cmd, args = receive_command(f)
            
            if cmd == "OBJ":
                try:
                    send_response_with_exp(conn, success=True, info=obj)

                except NoObjectiveException:
                    send_response(conn, success=False, info= "No objective found.")

            elif cmd == "GET":               
                # Send GET response
                label = send_get_response(conn, args, success=True)
            
            elif cmd == "NLST":
                try:
                    nlst(conn)

                except InvalidDirectoryRequestException:
                    send_response(conn, success=False, info= "Invalid directory request.")

            elif cmd == "CWDR":
                try:
                    cwdr(conn, args)

                except InvalidDirectoryRequestException:
                    send_response(conn, success=False, info= "Invalid directory request.")

            elif cmd == "CDUP":
                try:
                    cdup(conn)

                except NoAvailableParentException:
                    send_response(conn, success=False, info= "No available parent folder found.")

            elif cmd == "EXIT":
                send_response(conn, success=True)
                break
            
            elif cmd in ["USER", "PASS"]:
                send_response(conn, success=False, info=cmd + " command is already sent and processed.")
                shutdown()
                
            else:
                send_response(conn, success=False, info="Unknown command.")
                shutdown()
        
    except ServerShutdownException:
        pass
    
    except ConnectionResetError as e:
        print(e)
        
    finally:
        conn.close()
        s.close()
    
