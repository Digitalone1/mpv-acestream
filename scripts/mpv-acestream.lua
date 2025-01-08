-- CONFIGURATION SECTION

    local aceStreamPort = 6878  -- Do not enclose port number between quotes
    
-- DO NOT EDIT BELOW HERE


    -- This script adds AceStream protocol support to mpv.
    --
    -- It simply reads input filename/URL argument and if it is an AceStream URL
    -- in the form "acestream://content-id", it will send a request to AceStream
    -- engine HTTP API to get the relative stream.
    -- Obviously it will only work if AceStream engine has been already started 
    -- and is running on your system.
    --
    -- Place this script in "scripts" folder under mpv config directory.
    -- It should be "/home/your-username/.config/mpv/scripts/" under Unix-like systems.
    --
    -- To work with it, open the mpv pseudo-GUI, just select an AceStream link you
    -- found over the internet (it should be "acestream://content-id" format), and 
    -- drag and drop it inside the GUI. The stream should start if the broadcaster 
    -- is online.
    --
    -- To start the stream from a link inside your browser, ensure it points to a 
    -- resource in the following format: "acestream://content-id". Click on the link
    -- and you will be asked to open it with an application. Choose mpv and remember 
    -- the choice.
    --
    -- If you have only the content ID without the protocol prefix "acestream://",
    -- just open the terminal and run `mpv acestream://content-id`.
    --
    -- Written by Digitalone1
    --
    -- LICENSE GPLv3

local utils = require 'mp.utils'
local msg = require 'mp.msg'

local function on_start()
    local streamOpenFN = mp.get_property_native("stream-open-filename")
    if (type(streamOpenFN) ~= "string") then do return end end
    
    local aceContentID = string.match(streamOpenFN, "^acestream://(%w+)")
    if (aceContentID == nil) then do return end end
    
    msg.log("info", "AceStream protocol detected.")
    
    if (type(aceStreamPort) ~= "number") then do 
        msg.log("error", "AceStream port number is not properly set.")
        return end 
    end
    
    mp.set_property(
        "stream-open-filename", 
        "http://127.0.0.1:" .. aceStreamPort .. "/ace/getstream?content_id=" .. aceContentID
    )
end

mp.add_hook("on_load", 50, on_start)
