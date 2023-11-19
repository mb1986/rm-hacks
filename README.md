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
4. Do not forget to restart your device at the end.

```shell
sh -c "$(wget https://raw.githubusercontent.com/mb1986/rm-hacks/main/install.sh -O-)"
```

### Uninstallation

If, for some reason, you'd like to remove the patches,
please follow the same sequence as for installation,
but use the command below in step 2.

```shell
sh -c "$(wget https://raw.githubusercontent.com/mb1986/rm-hacks/main/install.sh -O-)" _ uninstall
```

## Patches

| Version |    3.8.2.1965    |    3.7.0.1930    |    3.6.1.1894    |
|  :---:  |       :---:      |       :---:      |       :---:      |
|**0.0.5**|:white_check_mark:|:white_check_mark:|        :x:       |
|**0.0.4**|        :x:       |:white_check_mark:|        :x:       |
|**0.0.3**|        :x:       |:white_check_mark:|        :x:       |
|**0.0.2**|        :x:       |:white_check_mark:|        :x:       |
|**0.0.1**|        :x:       |:white_check_mark:|:white_check_mark:|

### Version 0.0.5

This patch includes all the hacks from the previous one, along with the following:

- A brand new settings page to configure which hacks should be enabled and which should not (Menu &#8669; Settings &#8669; rM Hacks).
  By default, all the hacks are enabled, and the configuration will be preserved between restarts.
- Lamy button double-click now triggers an undo action.

### Version 0.0.4

This patch includes all the hacks from the previous one, along with the following:

- Additional stroke sizes (0.5, 1, 1.5, 2, 3, 5, 8, 13).
- Gesture to switch between the last two tools: swipe one finger down in the top left corner.
- Gesture to switch between the writing tool and eraser: swipe one finger up in the top left corner.

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

If you're still using a device with version 2.x, you might prefer using
[ddvk's Binary Patches](https://github.com/ddvk/remarkable-hacks).

This patch includes the following changes:

- The Lamy Pen button now works for erasing (only erasing for now).
  To use this feature, install
  [ddvk's Qt Plugin for Lamy Pen](https://github.com/ddvk/remarkable-stylus) first. You will not need to install ddvk-hacks like it recommends, as this replaces that dependency.
- The toolbar icon changes from the default open icon to a brush icon.
- The close icon (x) in the top right corner has been removed.
