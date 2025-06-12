This is an OSC extension for MPV, along with a few useful scripts.

Only tested on Linux and my edit of thumbfast also probably only works on Linux.

https://github.com/user-attachments/assets/ca3c7b0a-6f8a-44a5-b825-6ef04198fdb5

Changes from original OSC:
* Removed Fullscreen Button
* Added Shuffle and Repeat buttons
* Added support for thumbfast (bare minimum)

Other Features:
* A configurable history management script that auto-opens the last file or auto opens the history list when opening mpv without a file selected.
* A modified version of thumbfast that automatically scales with the window size (without using scale_factor)

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

Limitations:
* Only the default layout is supported, even if the code for the other layouts is still there, they may be broken and will be missing some or all of the added features.
