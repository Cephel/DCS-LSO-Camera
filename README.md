# DCS LSO Camera
A picture speaks more than a thousand words. Click on the image to see all the detail:
![Preview](https://i.imgur.com/7lb8GO0.png)

## Usage
- **Download the latest release [here](https://github.com/Cephel/DCS-LSO-Camera/releases/latest)**.
- No install required. Just run the executable.
- If you don't trust the bundled executable, you can download and install [AutoHotkey](https://autohotkey.com/) yourself and run the script directly.

## Features
- Time and date tracking.
	- Time and date displayed correspond to your computer time.
- Carrier ID.
- Wind speed indicator.
- (Nonfunctional) range and time to trap.
- (Nonfunctional) speed of the plane in the groove.

## Parameters
Since the script doesn't extract any data from DCS, you have to set up some values yourself. You can do this via the command line:

```
overlay.exe [wind speed](0-999) [white text](1|0) [carrier ID](0-99)
```

- [wind speed] is a number indicating the wind speed across the deck, assumed to be aligned with the center line. Example: `overlay.exe 51`.
- [white text] is a setting to change the text color from black to white. Example: `overlay.exe 51 1`.
- [carrier ID] is a number indicating the carrier ID, 74 for the Stennis by default. Example: `overlay.exe 51 1 33`.

Note: You can only omit options at the end. You have to add all previous ones. For example `overlay.exe 1` to set just the text color to white will not work.

## Scaling in High DPI Displays
If using scaling in Windows 10 on HiDPI displays disable it for the executable:
- Right-click 'overlay.exe' and go to 'Properties'
- Select the 'Compatibility' tab
- Click 'Change high DPI settings'
- Check 'Override high DPI scaling behavior.' and select 'System' under Scaling performed by:
