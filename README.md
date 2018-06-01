# DCS LSO Camera
Add description here

## Usage
- Download the latest release [here](https://github.com/Cephel/DCS-LSO-Camera/releases/latest).
- No install required. Just run the executable.
- If you don't trust the bundled executable, you can download and install [AutoHotkey](https://autohotkey.com/) yourself and run the script directly.

## Features
- Time and date tracking.
	- Time and date displayed correspond to your computer time.
- Carrier ID.
- Wind speed indicator.
- (Nonfunctional) range and time to trap.
- (Nonfunctional) unknown bottom left quadrant value. If you know what this is for in the real camera, hit me up with a message.

## Parameters
Since the script doesn't extract any data from DCS, you have to set up some values yourself.
```
overlay.exe [wind speed](0-999) [white text](1|0) [carrier ID](0-99)
```
- [wind speed] is a number indicating the wind speed across the deck, assumed to be aligned with the center line. Example: `overlay.exe 51`.
- [white text] is a setting to change the text color from black to white. Example: `overlay.exe 51 1`.
- [carrier ID] is a number indicating the carrier ID, 74 for the Stennis by default. Example: `overlay.exe 51 1 33`.

Note: You can only omit options at the end. You have to add all previous ones. For example `overlay.exe 1` to set just the text color to white will not work.