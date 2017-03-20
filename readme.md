### WTH is this?

I made this little bot to help me practice my counters on **DCUO**. It serves no other purpose and its completely harmless to the game. Its pretty much like a sparring target for counters.

Most files are for test purposes only.
The file that actually does the work is **core-ahk.ahk** (*or **core-ahk.exe** if you don't have AutoHotkey installed*).

------

### Quick instructions

1. Start **core-ahk.ahk** (*or **core-ahk.exe** if you don't have AutoHotkey installed*).
2. Move your mouse cursor to the DCUO window you want to use the bot and press the **middle mouse button**.
3. Practice so you become less noob.
4. Press **Alt+End** when you want to pause the script. (A sound will be played to confirm you paused it)
------

### Notes

- Unfortunately, `ControlSend` doesn't work with DCUO (`ControlClick` does though, read [notes.txt](/data-tools-tests/notes.txt) for more info). You have to execute the script in a different computer (or a [virtual machine](https://en.wikipedia.org/wiki/Virtual_machine), good luck with performance issues =D).

- The bot is stupid in its initial version and only fights with weapons for now. I might implement use of powers in the future.

------

### "Standing in the shoulders of giants"

Some of the core script uses snippets from the [Control Click Tester](https://autohotkey.com/board/topic/82924-basic-controlclick-tester/) made by @girlgamer.

I also used [Send and Click Tool V4.1](https://autohotkey.com/board/topic/95653-send-and-click-tool-v41/), made by @SnowFlake_FlowSnake.

------

[Docs for pywin32](http://timgolden.me.uk/pywin32-docs/contents.html)