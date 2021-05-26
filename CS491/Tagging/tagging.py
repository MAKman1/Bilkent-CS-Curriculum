import requests
from bs4 import BeautifulSoup
import random
from google.cloud import vision
import io
import webcolors

allowedTags = ["T-shirt", "Sweatshirt", "Jeans"]
color = ["Blue", "Black", "Red", "White", "Grey", "Brown"]


def main():
    # for i in range(0, 9):
    #     print("image" + str(i) + ": ", end="\n")
    #     print("	Tags for image" + str(i) + ": ", end="")
    #     tags = detect_labels('image' + str(i) + '.jpg')
    #     filtered = [a for a in tags if a in allowedTags or a in color]
    #     print("	Filtered tags for image" + str(i) + ": " + ', '.join(filtered))
    #     print("	Texts for image" + str(i) + ": ", end="")
    #     detect_text('image' + str(i) + '.jpg')
    #     print("	Colors for image" + str(i) + ": ")
    #     detect_properties('image' + str(i) + '.jpg')
    #     print()

    scrapeResults('site:www.boyner.com.tr/ black t-shirt',
                  'https://www.boyner.com.tr')


def detect_labels(path):
    """Detects labels in the file."""

    client = vision.ImageAnnotatorClient()

    with io.open(path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)

    response = client.label_detection(image=image)
    labels = response.label_annotations

    tags = []
    for label in labels:
        tags.append(label.description)
        print(label.description, end=", ")
    print()

    if response.error.message:
        raise Exception(
            '{}\nFor more info on error messages, check: '
            'https://cloud.google.com/apis/design/errors'.format(
                response.error.message))

    return tags


def detect_text(path):
    client = vision.ImageAnnotatorClient()

    with io.open(path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)

    response = client.text_detection(image=image)
    texts = response.text_annotations

    for text in texts:
        print(text.description.replace("\n", ""), end=", ")

        # vertices = (['({},{})'.format(vertex.x, vertex.y)
        # for vertex in text.bounding_poly.vertices])

        # print('bounds: {}'.format(','.join(vertices)))
    print('')

    if response.error.message:
        raise Exception(
            '{}\nFor more info on error messages, check: '
            'https://cloud.google.com/apis/design/errors'.format(
                response.error.message))


def detect_properties(path):
    client = vision.ImageAnnotatorClient()

    with io.open(path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)

    response = client.image_properties(image=image)
    props = response.image_properties_annotation

    count = 0
    for color in props.dominant_colors.colors:
        if(count < 2):
            print("{}".format(webcolors.rgb_to_hex(
                (int(color.color.red), int(color.color.green), int(color.color.blue)))))
            print('}', end=",\n")
            count += 1
    print()

    if response.error.message:
        raise Exception(
            '{}\nFor more info on error messages, check: '
            'https://cloud.google.com/apis/design/errors'.format(
                response.error.message))


def scrapeResults(query, website):
    query = query.replace(":", "%3A").replace(
        " ", "+").replace("/", "%2F").replace("@", "%40")
    text = '' + query
    url = 'https://www.google.com/search?q=' + text + '&source=lnms&tbm=isch'
    print(url)
    A = ("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",
         "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36",
         "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36",
         )

    Agent = A[random.randrange(len(A))]

    headers = {'user-agent': Agent}
    r = requests.get(url, headers=headers)

    print('Search result: ')
    soup = BeautifulSoup(r.text, 'lxml')
    count = 0
    for info in soup.findAll('a', href=True):
        if(count < 1 and info['href'].startswith(website)):
            print(info['href'])

            request = requests.get(info['href'], headers=headers)
            anotherSoup = BeautifulSoup(request.text, 'lxml')
            for image in anotherSoup.findAll('img'):
                try:
                    if (len(image['src']) > 40 and ".jpg" in image['src'] and "header" not in image['src'] and "icon" not in image['src'] and "logo" not in image['src'] and "navigasyon" not in image['src']):

                        if(image['src'].startswith("//")):
                            image['src'] = "https://" + image['src'][2:]
                        if( "defacto" in image['src'] and "/6/" not in image['src']):
                            continue
                        print("Image: " + image['src'])
                        
                except Exception:
                    a = 1

            print('#######')
            count += 1


main()

# export GOOGLE_APPLICATION_CREDENTIALS='/users/mak/Downloads/keyFile.json'
