This is primarily a UI extension for MPV, it very slightly alters the layout of the base OSC, adds shuffle and repeat buttons, and thumbnail support based on thumbfast, and a configurable history management script that auto-opens the last file or auto opens the history list when opening mpv without a file selected. 

Only tested on Linux and my edit of thumbfast also works only on Linux (I stripped out the windows and macos parts because I don't use those operating systems, and never will.)

https://github.com/user-attachments/assets/ca3c7b0a-6f8a-44a5-b825-6ef04198fdb5

Dependencies: 

* Fontawesome (for shuffle and repeat icons).

Installation:
* Install the dependencies: `fontawesome`
* Put the scripts in `~/.config/mpv/scripts`
* Optionally put the script-opts in `~/.config/mpv/script-opts`
* Open the `mpv.conf` in this repository and modify your own `~/.config/mpv/mpv.conf` to have **all** the necessary settings, and preferably the recommended ones as well.
* open the `input.conf` in this repository and add the keybinds to your own `~/.config/mpv/input.conf`

Known bugs:
* hwdec must be off or set to copyback for my thumbfast to work properly
