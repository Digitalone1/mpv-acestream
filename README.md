# mpv-acestream
Small LUA script that adds **AceStream** protocol handler to **mpv** player.

## How it works
It simply reads mpv input filename/URL argument and if it is an AceStream URL in the form `acestream://content-id`, it will send a request to AceStream engine HTTP API to get the relative stream. Obviously it will only work if AceStream engine has been already started and is running on your system.

To work with it, open the mpv pseudo-GUI, just select an AceStream link you found over the internet (it should be `acestream://content-id` format), and drag and drop it inside the GUI. The stream should start if the broadcaster is online.

To start the stream from an hyperlink inside your browser, ensure it points to a resource in the following format: `acestream://content-id`. Click on the link and you should be asked to open it with an application. Choose mpv and remember the choice.

If you have only the content ID without the protocol prefix `acestream://`, just open the terminal and run: 

```mpv acestream://content-id```

## Installation

Place `mpv-acestream.lua` file in *scripts* folder under mpv config directory. On Unix-like systems it should be

```/home/your-username/.config/mpv/scripts/```


* **Arch Linux**: [AUR package](https://aur.archlinux.org/packages/mpv-acestream/)

## Configuration

The script should work out of the box and usually you don't need to modify anything. But you may need to change the AceStream HTTP engine port if you set it differently from the default *6878* number in AceStream configuration.

Open `mpv-acestream.lua` and change `aceStreamPort` value in the upper part of the text. For example, if you changed port to *12345*, modify port variable like the following:

`local aceStreamPort = 12345`

## F.A.Q.

### I still can't open AceStream hyperlinks from an internet browser
For **Firefox**, you should be asked to open it with an app, but usually mpv will not be shown inside the list. If so, browse your filesystem and select the mpv executable installed on your distibution (it is usually placed at `/usr/bin/mpv`). If Firefox still does not open the link and will also not prompt the opening popup, go in *Preferences*, locate *Applications* section and modify *acestream* entry by setting mpv as the default application.

For **Chrome**/**Chromium**, AceStream protocol has to be registered on your system to be opened properly. This depends on your distribution and your desktop environment.

On **Plasma 5**, create the following text file `/usr/share/kservices5/acestream.protocol`:

```
[Protocol]
exec=/usr/bin/mpv %u
protocol=acestream
input=none
output=none
helper=true
listing=false
reading=false
writing=false
makedir=false
deleting=false
```
