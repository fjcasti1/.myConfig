import time
import os
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from os.path import isfile, join
from datetime import datetime


folder_to_track = "/home/kiko/Downloads"
folder_destination = folder_to_track


class MyHandler(FileSystemEventHandler):
    def on_modified(self, event):
        files = [f for f in os.listdir(folder_to_track) if
                 isfile(join(folder_to_track, f))]
        for filename in files:
            i = 1
            try:
                extension = str(os.path.splitext(folder_to_track +
                                                 '/' + filename)[-1])
            except Exception:
                extension = 'noname'

            if extension == '.crdownload':
                break
            if extension not in extensions_dict:
                extension = 'noname'

            now = datetime.now()
            year = now.strftime("%Y")

            folder_destination_path = extensions_dict[extension] + "/" + year

            if not os.path.exists(folder_destination_path):
                os.makedirs(folder_destination_path, exist_ok=True)

            srcfile = folder_to_track + "/" + filename
            file_exists = os.path.isfile(folder_destination_path + "/" +
                                         filename)
            while file_exists:
                i += 1
                filename = os.path.splitext(folder_to_track + '/' +
                                            filename)[0] + '__' + str(i) + \
                    os.path.splitext(folder_to_track + '/' + filename)[-1]
                filename = filename.split("/")[-1]
                file_exists = os.path.isfile(folder_destination_path + "/" +
                                             filename)

            filename = folder_destination_path + "/" + filename
            os.rename(srcfile, filename)


extensions_dict = {
    # No name
    'noname': folder_destination + "/Uncategorized",
    # Temporary/Downloading Files
    '.crdownload': folder_destination + "/",
    # Audio
    '.aif':   folder_destination + "/Media/Audio/",
    '.cda':   folder_destination + "/Media/Audio/",
    '.mid':   folder_destination + "/Media/Audio/",
    '.midi':  folder_destination + "/Media/Audio/",
    '.mp3':   folder_destination + "/Media/Audio/",
    '.mpa':   folder_destination + "/Media/Audio/",
    '.ogg':   folder_destination + "/Media/Audio/",
    '.wav':   folder_destination + "/Media/Audio/",
    '.wma':   folder_destination + "/Media/Audio/",
    '.wpl':   folder_destination + "/Media/Audio/",
    '.m3u':   folder_destination + "/Media/Audio/",
    # Text
    '.txt':   folder_destination + "/Text/TextFiles/",
    '.doc':   folder_destination + "/Text/Microsoft/Word/",
    '.docx':  folder_destination + "/Text/Microsoft/Word/",
    '.odt':   folder_destination + "/Text/TextFiles/",
    '.pdf':   folder_destination + "/Text/PDF/",
    '.rtf':   folder_destination + "/Text/TextFiles/",
    '.tex':   folder_destination + "/Text/TextFiles/",
    '.wks':   folder_destination + "/Text/TextFiles/",
    '.wps':   folder_destination + "/Text/TextFiles/",
    '.wpd':   folder_destination + "/Text/TextFiles/",
    # Video
    '.3g2':   folder_destination + "/Media/Video/",
    '.3gp':   folder_destination + "/Media/Video/",
    '.avi':   folder_destination + "/Media/Video/",
    '.flv':   folder_destination + "/Media/Video/",
    '.h264':  folder_destination + "/Media/Video/",
    '.m4v':   folder_destination + "/Media/Video/",
    '.mkv':   folder_destination + "/Media/Video/",
    '.mov':   folder_destination + "/Media/Video/",
    '.mp4':   folder_destination + "/Media/Video/",
    '.mpg':   folder_destination + "/Media/Video/",
    '.mpeg':  folder_destination + "/Media/Video/",
    '.rm':    folder_destination + "/Media/Video/",
    '.swf':   folder_destination + "/Media/Video/",
    '.vob':   folder_destination + "/Media/Video/",
    '.wmv':   folder_destination + "/Media/Video/",
    # Image
    '.ai':    folder_destination + "/Media/Images/",
    '.bmp':   folder_destination + "/Media/Images/",
    '.gif':   folder_destination + "/Media/Images/",
    '.ico':   folder_destination + "/Media/Images/",
    '.jpg':   folder_destination + "/Media/Images/",
    '.jpeg':  folder_destination + "/Media/Images/",
    '.png':   folder_destination + "/Media/Images/",
    '.ps':    folder_destination + "/Media/Images/",
    '.psd':   folder_destination + "/Media/Images/",
    '.svg':   folder_destination + "/Media/Images/",
    '.tif':   folder_destination + "/Media/Images/",
    '.tiff':  folder_destination + "/Media/Images/",
    '.CR2':   folder_destination + "/Media/Images/",
    # Interne t
    '.asp':   folder_destination + "/Other/Internet/",
    '.aspx':  folder_destination + "/Other/Internet/",
    '.cer':   folder_destination + "/Other/Internet/",
    '.cfm':   folder_destination + "/Other/Internet/",
    '.cgi':   folder_destination + "/Other/Internet/",
    '.pl':    folder_destination + "/Other/Internet/",
    '.css':   folder_destination + "/Other/Internet/",
    '.htm':   folder_destination + "/Other/Internet/",
    '.js':    folder_destination + "/Other/Internet/",
    '.jsp':   folder_destination + "/Other/Internet/",
    '.part':  folder_destination + "/Other/Internet/",
    '.php':   folder_destination + "/Other/Internet/",
    '.rss':   folder_destination + "/Other/Internet/",
    '.xhtml': folder_destination + "/Other/Internet/",
    # Compressed
    '.7z':    folder_destination + "/Other/Compressed/",
    '.arj':   folder_destination + "/Other/Compressed/",
    '.deb':   folder_destination + "/Other/Compressed/",
    '.pkg':   folder_destination + "/Other/Compressed/",
    '.rar':   folder_destination + "/Other/Compressed/",
    '.rpm':   folder_destination + "/Other/Compressed/",
    '.tar.gz': folder_destination + "/Other/Compressed/",
    '.z':     folder_destination + "/Other/Compressed/",
    '.zip':   folder_destination + "/Other/Compressed/",
    # Disc
    '.bin':   folder_destination + "/Other/Disc/",
    '.dmg':   folder_destination + "/Other/Disc/",
    '.iso':   folder_destination + "/Other/Disc/",
    '.toast': folder_destination + "/Other/Disc/",
    '.vcd':   folder_destination + "/Other/Disc/",
    # Data
    '.csv':   folder_destination + "/Programming/Database/",
    '.dat':   folder_destination + "/Programming/Database/",
    '.db':    folder_destination + "/Programming/Database/",
    '.dbf':   folder_destination + "/Programming/Database/",
    '.log':   folder_destination + "/Programming/Database/",
    '.mdb':   folder_destination + "/Programming/Database/",
    '.sav':   folder_destination + "/Programming/Database/",
    '.sql':   folder_destination + "/Programming/Database/",
    '.tar':   folder_destination + "/Programming/Database/",
    '.xml':   folder_destination + "/Programming/Database/",
    '.json':  folder_destination + "/Programming/Database/",
    # Executables
    '.apk':   folder_destination + "/Other/Executables/",
    '.bat':   folder_destination + "/Other/Executables/",
    '.com':   folder_destination + "/Other/Executables/",
    '.exe':   folder_destination + "/Other/Executables/",
    '.gadget': folder_destination + "/Other/Executables/",
    '.jar':   folder_destination + "/Other/Executables/",
    '.wsf':   folder_destination + "/Other/Executables/",
    # Fonts
    '.fnt':   folder_destination + "/Other/Fonts/",
    '.fon':   folder_destination + "/Other/Fonts/",
    '.otf':   folder_destination + "/Other/Fonts/",
    '.ttf':   folder_destination + "/Other/Fonts/",
    # Presentations
    '.key':   folder_destination + "/Presentations/",
    '.odp':   folder_destination + "/Presentations/",
    '.pps':   folder_destination + "/Presentations/",
    '.ppt':   folder_destination + "/Presentations/",
    '.pptx':  folder_destination + "/Presentations/",
    # Programming
    '.c':     folder_destination + "/Programming/C&C++/",
    '.class': folder_destination + "/Programming/Java/",
    '.dart':  folder_destination + "/Programming/Dart/",
    '.py':    folder_destination + "/Programming/Python/",
    '.sh':    folder_destination + "/Programming/Shell/",
    '.f':     folder_destination + "/Programming/Fortran/",
    '.f90':   folder_destination + "/Programming/Fortran/",
    '.swift': folder_destination + "/Programming/Swift/",
    '.html':  folder_destination + "/Programming/html/",
    '.h':     folder_destination + "/Programming/C&C++/",
    # Spreadsheets
    '.ods':   folder_destination + "/SpreadSheets/",
    '.xlr':   folder_destination + "/SpreadSheets/",
    '.xls':   folder_destination + "/SpreadSheets/",
    '.xlsx':  folder_destination + "/SpreadSheets/",
    # System
    '.bak':   folder_destination + "/Text/Other/System/",
    '.cab':   folder_destination + "/Text/Other/System/",
    '.cfg':   folder_destination + "/Text/Other/System/",
    '.cpl':   folder_destination + "/Text/Other/System/",
    '.cur':   folder_destination + "/Text/Other/System/",
    '.dll':   folder_destination + "/Text/Other/System/",
    '.dmp':   folder_destination + "/Text/Other/System/",
    '.drv':   folder_destination + "/Text/Other/System/",
    '.icns':  folder_destination + "/Text/Other/System/",
    '.ini':   folder_destination + "/Text/Other/System/",
    '.lnk':   folder_destination + "/Text/Other/System/",
    '.msi':   folder_destination + "/Text/Other/System/",
    '.sys':   folder_destination + "/Text/Other/System/",
    '.tmp':   folder_destination + "/Text/Other/System/",
}

event_handler = MyHandler()
observer = Observer()
observer.schedule(event_handler, folder_to_track, recursive=True)
observer.start()

try:
    while True:
        time.sleep(10)
except KeyboardInterrupt:
    observer.stop()
observer.join()
