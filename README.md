# mpv-acestream
Small LUA script that adds **AceStream** protocol handler to **mpv** player.

## How it works
It simply reads mpv input filename/URL argument and if it is an AceStream URL in the form `acestream://content-id`, it will send a request to AceStream engine HTTP API to get the relative stream. Obviously it will only work if AceStream engine has been already started and is running on your system.

Place `mpv-acestream.lua` file in *scripts* folder under mpv config directory. In most cases it should be `/home/your-username/.config/mpv/scripts/`.

To work with it, open the mpv pseudo-GUI, just select an AceStream link you found over the internet (it should be `acestream://content-id` format), and drag and drop it inside the GUI. The stream should start if the broadcaster is online.

To start the stream from a link inside your browser, ensure it points to a resource in the following format: `acestream://content-id`. Click on the link and you will be asked to open it with an application. Choose mpv and remember the choice.

For example, with Firefox, you should be asked to open it with an app, but mpv will not show inside the list. Then browse your filesystem and select the mpv executable installed on your distibution (it is usually placed at `/usr/bin/mpv`). If Firefox does not open it properly and will not prompt the opening popup, go in Preferences, locate "Applications" section and modify *acestream* entry by setting mpv as the default application.

If you have only the content ID without the protocol prefix `acestream://` just open the terminal and run `mpv acestream://content-id`.
