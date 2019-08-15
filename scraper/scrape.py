from urllib.request import urlopen, urlretrieve
from os.path import basename, exists, join
import json
import subprocess

IMG_DIR = "/images"

def get_cats():
    request = urlopen("https://api.thecatapi.com/v1/images/search")
    cats = json.loads(request.read().decode())
    cat = cats[0]['url']
    download = join(IMG_DIR, basename(cat))

    if not exists(download):
        print("Downloading: {}".format(cat))
        # TODO: User Agent is Blocked
        # urlretrieve(cat, download)
        subprocess.check_call(["wget", "-O", download, cat])

if __name__ == '__main__':
    get_cats()
