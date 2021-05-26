import java.net.*;
import java.io.*;
import java.lang.*;
import java.nio.charset.Charset;
import java.nio.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Stack;
import java.util.concurrent.TimeUnit;

public class TaxonomySearcher {
    static int address, host;
    static Socket socket;
    static String command, encodedCommand, response;
    static InputStreamReader inputStream;
    static BufferedReader buffReader;
    static BufferedWriter buffWriter;

    static HashSet<String> toDownload;

    public static void main(String[] args) throws Exception{
        // Connecting with Server
        host = Integer.parseInt(args[1]); 
        socket = new Socket(args[0], host);
        socket.setSoTimeout( 500);
        String res = "";
       
        // Username and Password Authentication
        sendCommand("USER bilkentstu\r\n");
        sendCommand("PASS cs421f2020\r\n");


        // Getting Folder and Animal
        toDownload = new HashSet<>();
        res = sendCommand("OBJ\r\n");
        String[] parts = res.split(" ");
        for( int i = 1; i < parts.length; i++)
            toDownload.add( parts[i].trim());

        //traversing throught the structure to find
        traverse();

        // Exit
        sendCommand( "EXIT\r\n");

        socket.close();
    }

    public static void traverse(){
        ArrayList<String> folders = new ArrayList<>();

        String res = sendCommand("NLST\r\n");
        String[] parts = res.split(" ");
        for( int i = 1; i < parts.length; i++) {
            if( parts[i].trim().contains(".")){
                if( toDownload.contains( parts[i].trim())){
                    toDownload.remove( parts[i].trim());
                    downloadFile("GET " + parts[i].trim() + "\r\n");
                }
            } else {
                folders.add( parts[i].trim());
            }
        }

        for( String f: folders){
            sendCommand("CWDR " + f +"\r\n");
            traverse();
            sendCommand("CDUP\r\n");
        }
    }

    public static void downloadFile( String command){
        try {
            encodedCommand = asciiEncode(command);
            buffWriter = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));


            buffWriter.write(encodedCommand);
            buffWriter.flush();

            inputStream = new InputStreamReader(socket.getInputStream());
            buffReader = new BufferedReader(inputStream);

            System.out.println("Sending: " + encodedCommand.trim());

            System.out.println( "ISND");

            String line;
            int count = 0;
            while( (line = buffReader.readLine()) != null){
//                if( count == 0)
//                    System.out.println( line);
                count++;
            }
        } catch( Exception e){
            return;
        }
    }

    public static String sendCommand( String command){
        try {
            encodedCommand = asciiEncode(command);
            buffWriter = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

            buffWriter.write(encodedCommand);
            buffWriter.flush();

            inputStream = new InputStreamReader(socket.getInputStream());
            buffReader = new BufferedReader(inputStream);

            response = buffReader.readLine();
            System.out.print("Sending: " + encodedCommand);
            if( !command.contains("GET"))
                System.out.println(response);

            return response;

        } catch( Exception e){
            return null;
        }
    }

    public static String asciiEncode(String input) {
        Charset characterSet = Charset.forName("US-ASCII");
        byte[] asciiBytes = input.getBytes(characterSet);
        String encodedInput = new String(asciiBytes, characterSet);
        return encodedInput;
    }
}