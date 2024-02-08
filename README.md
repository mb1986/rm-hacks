[![rm1](https://img.shields.io/badge/rM1-supported-green)](https://remarkable.com/store/remarkable) [![rm2](https://img.shields.io/badge/rM2-supported-green)](https://remarkable.com/store/remarkable-2) [![Discord](https://img.shields.io/discord/385916768696139794.svg?label=reMarkable&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/ATqQGfu) [![rM Hacks Discord](https://img.shields.io/discord/1153374327123759104.svg?label=rM%20Hacks&logo=discord&logoColor=ffffff&color=ffb759&labelColor=d99c4c)](https://discord.gg/bgVXW2bchN)
# rM Hacks

This repository is meant to share small improvements and tweaks for rM devices,
covering both revisions (1 and 2).
These changes don't alter the application's core code directly
but impact how it functions.
Before using them, please read the disclaimer below.

> I'd like to give credit to a few very supportive individuals who dedicate their
> time and effort to help in the process of tools development, testing and
> reviving hacks. Without their contributions, this entire project might not be
> alive. And here they are:
>
> [<img src="https://github.com/ReemX.png" alt="ReemX" width="60"/>](https://github.com/ReemX)
> [<img src="https://github.com/atngames.png" alt="atngames" width="60"/>](https://github.com/atngames)
> [<img src="https://github.com/beelux.png" alt="beelux" width="60"/>](https://github.com/beelux)
> [<img src="https://github.com/ard0gg.png" alt="ard0gg" width="60"/>](https://github.com/ard0gg)

## Disclaimer

This repository contains patches and modifications for third-party software,
which are provided "as-is" and without warranty of any kind, express, implied,
or otherwise, including but not limited to the warranties of merchantability,
fitness for a particular purpose, and non-infringement.

The patches provided here are intended to enhance or modify the functionality of
the respective third-party software, and their use is at your own risk.

Please note that the original software is subject to its own licensing terms
and conditions, and this disclaimer only covers the patches and modifications
provided within this repository. Ensure that you comply with the original
software's licensing requirements when using these patches.

## Installation

For your convenience, we've provided an automated installation script.

1. Connect to your rM device via SSH.
2. Paste the below command, then press Enter.
3. Follow the on-screen instructions.
4. If prompted restart your device.

```shell
bash -c "$(wget https://raw.githubusercontent.com/mb1986/rm-hacks/main/install.sh -O-)"
```

### Uninstallation

If, for some reason, you'd like to remove the patches,
please follow the same sequence as for installation,
but use the command below in step 2.

```shell
bash -c "$(wget https://raw.githubusercontent.com/mb1986/rm-hacks/main/install.sh -O-)" _ uninstall
```

## Patches

| Version |     3.9.4.2018   |     3.9.3.1986   |    3.8.3.1976    |    3.8.2.1965    |    3.7.0.1930    |    3.6.1.1894    |    3.3.2.1666    |
|  :---:  |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |
|**0.0.9**|:white_check_mark:|:white_check_mark:|        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |
|**0.0.8**|        :x:       |:white_check_mark:|        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |
|**0.0.7**|        :x:       |:white_check_mark:|:white_check_mark:|:white_check_mark:|        :x:       |        :x:       |     :warning:    |
|**0.0.6**|        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |        :x:       |
|**0.0.5**|        :x:       |        :x:       |        :x:       |:white_check_mark:|:white_check_mark:|        :x:       |        :x:       |
|**0.0.4**|        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |
|**0.0.3**|        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |
|**0.0.2**|        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |
|**0.0.1**|        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|:white_check_mark:|        :x:       |

If you're still using a device with version 2.x, you might prefer using
[ddvk's Binary Patches](https://github.com/ddvk/remarkable-hacks).

### Version 0.0.9

This patch includes all the hacks from the previous one, along with the following:

#### New features:

- Add button at the top of documents list to trigger screen orientation change (closes #95).
- Remove the need to confirm by tapping the button after swiping right to add a new page (closes #108).
- Remove the last empty page when navigating to the previous one.
- Long press on the toolbar tags button to jump straight into Menu/Tags view (closes #129).
- Add colors abbreviations to the color icon (near the brush icon) (closes #71).
- Persist tags selection for filtering in Menu/Tags view (closes #129).
- Double tap the document:
  - in the middle to remove current and empty page,
  - on the left-hand side (up to about 3cm from the edge) to add a new empty page before the current one,
  - on the right-hand side (up to about 3cm from the edge) to add a new empty page after the current one.
- Decrease the size of both the brush icon and toolbar width to 75% of their original sizes (closes #88).
- Add configuration options for various click and press behaviors of the stylus button (closes #66).
- Add a quicktools bar to store shortcut to tools. Swipe up to show / hide. double tap to remove a tool or to move it.
- Add a setting to hide the document toggle for toolbar (closes #138)
- Add a setting to hide the toolbar header (the round toggle to fullscreen)

#### Bug fixes:

- Fix wrong margins in compressed documents list view when large font is selected (closes #145).
- Fix writing experience in the corner where bookmark button/icon is located (closes #132).
- Fixed issue with keyboard appearing when a PDF is opened after a restart (see #179).
- Fix foldouts too wide in toolbar compressed width (see #156).
- Fix Tags in the compressed list overlap the document names (see #157).
- Remove orphaned bookmarks when pages has been (re)moved (closes #218).

#### Other changes:

- Move the bookmark rename input into the header at the top of the screen (see #127).
- Move the bookmarks toolbar button between the tags and layers buttons (see #127).
- Fix native rM bug hiding drawings when going to light sleep (closes #116).

### Version 0.0.8

This patch includes all the hacks from the previous one, along with the following:

#### New features:

- Bookmarks feature
  - Tap in the top corner opposite the toolbar to toggle a bookmark for the current page.
  - Long press in the top corner opposite the toolbar to create a named bookmark or to change the name of an existing one.
  - New toolbar bookmarks button showing all bookmarks in the currently open document.
  - Long press the bookmarks toolbar button to toggle a bookmark for the current page.
  - Long press the bookmark grid item from the bookmarks menu to rename the bookmark.
  - New configuration section for bookmarks in the settings.
- Compressed list for documents navigation.
- Page numbers at the bottom of document pages are now hidden.
- Expanded the area for the 'swipe up to sleep' gesture.
- Toolbar WiFi icon is now hidden when the WiFi connection is disabled.
- The toolbar battery icon changes to a lightning icon when the device is charging.
- Improved behavior of the table of contents and page overview toolbar buttons.
- Tags are now shown in alphabetical order in the Menu/Tags view.
- Document-level toggle to disable the straight lines feature.
- The hacks version is also displayed in the hacks configuration view header.

#### Bug fixes:

- Page numbers toolbar button is now properly aligned in left-handed mode.

#### Known issues:

- The bookmarks toolbar button does not fit in the landscape mode.

### Version 0.0.7

This patch includes all the hacks from the previous one, along with the following:

#### New features:

- Toolbar button showing the current page and the page count, clicking it opens fast page scroll.
- Battery level and WiFi signal strength indicators available on the bottom of the toolbar.
- Screen refresh trigger via five-finger tap - natively available but disabled by experimental flag.
- Additional table-of-contents toolbar button.
- Enable sleep mode by swiping up from the top of the screen (light or deep sleep selectable in Settings/Security).
- Display `...zzZ` in the top right corner during light sleep mode instead of a big black banner.

#### Bug fixes:

- Configuration items may be scrolled vertically.
- Pen thickness and color indicator show only for the tools that make use of them.
- All the tools remember last two strokes and colors separately.

#### Other changes:

- Document-level clock moved from the bottom to the top of the toolbar.
- Make clock toggle option permanent between restarts.
- Changed names of document-level toggles (i.e. remove "Disabled" and "Enabled" words).

### Version 0.0.6

This patch includes all the hacks from the previous one, along with the following:

- Document-level toggle buttons (accessible through the _Share and Convert_ menu):
  - Show/hide clock
  - Suppress all swipes and gestures
  - Toggle WiFi
  - Disable/enable rM1 buttons
  - Toggle automatic updates
- Cycle between two recent documents by swiping two fingers up from the bottom of the page.
- Gesture to swap the last two pen thicknesses (strokes) by swiping one finger down in the top right corner (right-handed)/left corner (left-handed).
- Gesture to swap the last two colors by swiping one finger up in the top right corner (right-handed)/left corner (left-handed).
- Clock in the bottom of the toolbar.
- Configuration setting to disable the hack that adds additional stroke sizes.
- Staedtler pencil eraser support (hopefully).
- Taller area for the writing tool/eraser switch gesture.
- Better placement of the back button on hacks configuration views.
- Fewer stroke sizes for the eraser compared to other tools, and fixed eraser stroke sizes panel overflow.

### Version 0.0.5

This patch includes all the hacks from the previous one, along with the following:

- A brand new settings page to configure which hacks should be enabled and which should not (Menu &#8669; Settings &#8669; rM Hacks).
  By default, all the hacks are enabled, and the configuration will be preserved between restarts.
- Lamy button double-click now triggers an undo action.

### Version 0.0.4

This patch includes all the hacks from the previous one, along with the following:

- Additional stroke sizes (0.5, 1.5, 5, 8, 13).
- Gesture to switch between the last two tools: swipe one finger down in the top left corner (right-handed)/right corner (left-handed).
- Gesture to switch between the writing tool and eraser: swipe one finger up in the top left corner (right-handed)/right corner (left-handed).

### Version 0.0.3

This patch includes all the hacks from the previous one, along with the following:

- The toolbar may be opened or closed with a one-finger swipe down.
- The Lamy button, in addition to erasing when pressed, toggles the last two tools when clicked.

### Version 0.0.2

This patch includes all the hacks from the previous one, along with the following:

- New notebook name defaults to the current date and time (format: `yyyy-mm-dd_hhmmss`).

### Version 0.0.1

Our first patch, a pilot and proof of concept, is designed to bring back some
popular features for devices updated to version 3.x.

This patch includes the following changes:

- The Lamy Pen button now works for erasing (erasing only for now).
  To use this feature, install
  [ddvk's Qt Plugin for Lamy Pen](https://github.com/ddvk/remarkable-stylus) first. You will not need to install ddvk-hacks like it recommends, as this replaces that dependency.
- The toolbar icon changes from the default open icon to a brush icon.
- The close icon (x) in the top right corner (right-handed)/left corner (left-handed) has been removed.
  You can still close the document by swiping one finger down from the top.

For information on the licensing conditions of this software, please refer to the accompanying [LICENSE](LICENSE) file.
