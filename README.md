This is an OSC extension for MPV, along with a few useful scripts. Although it is fully functional, it is still experimental, scroll down and read about known bugs before using.

Only tested on Linux and my edit of thumbfast also probably only works on Linux.



https://github.com/user-attachments/assets/a8f874a9-9a5b-46af-b9b9-fed66b2187d6



Changes from original OSC:
* Removed the most pointless (fullscreen) button to free up space.
* Added Shuffle and Repeat buttons
* Added support for thumbfast (bare minimum)

Other Features:
* A configurable watch-history management script that auto-opens the last file or auto opens the history list when opening mpv without a file selected.
* A modified version of thumbfast that automatically scales with the window size (without using scale_factor)
* Smart Chapter Seeking (when using the keybind in my input.conf for it, if trying to seek to next/prev chapter but no chapter is found, skip to next/prev playlist item instead)

Dependencies: 

* Fontawesome (for shuffle and repeat icons).

Installation:
* Install the dependencies: `fontawesome`
* Put the scripts in `~/.config/mpv/scripts`
* Optionally put the script-opts in `~/.config/mpv/script-opts`
* Open the `mpv.conf` in this repository and modify your own `~/.config/mpv/mpv.conf` to have **all** the necessary settings, and preferably the recommended ones as well.
* open the `input.conf` in this repository and add the keybinds to your own `~/.config/mpv/input.conf`

Limitations:
* Only the default layout is supported, even if the code for the other layouts is still there, they may be broken and will be missing some or all of the added features. I keep this code because I want to keep the difference from the original OSC as minimal as possible to make updating simpler.

Known bugs:
* hwdec must be off or set to copyback for my thumbfast to work properly
* The loop and shuffle symbols may be smaller for some users, I am not sure why this is. It will throw off the accuracy of the buttons a bit (e.g. the clickable area will be a bit bigger than the buttons); if this happens to you [here's how you can replace the icon](https://github.com/Rabcor/mpv-extended-osc/wiki/How-to-replace-a-button-icon-in-mpv).
Planned Features:
* Loop and Shuffle buttons will be dark/grey when looping/shuffling is disabled, and normal (white) when they are on respectively.



