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

The wonderful and up-to-date documentation, detailing configuration and how the hacks work, is managed thanks to [@knox-dawson](https://github.com/knox-dawson) and can be found in the [Wiki](https://github.com/mb1986/rm-hacks/wiki).
The full list of features and bug fixes for each release is available in the [CHANGELOG.md](CHANGELOG.md).

| Version  |      3.11.2.5    |    3.10.2.2063   |     3.9.5.2026   |     3.9.4.2018   |     3.9.3.1986   |    3.8.3.1976    |    3.8.2.1965    |    3.7.0.1930    |    3.6.1.1894    |    3.3.2.1666    |
|  :---:   |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |       :---:      |
|**0.0.10**|:white_check_mark:|        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |
|**0.0.9** |:white_check_mark:|:white_check_mark:|:white_check_mark:|:white_check_mark:|:white_check_mark:|        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |
|**0.0.8** |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |
|**0.0.7** |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|:white_check_mark:|:white_check_mark:|        :x:       |        :x:       |     :warning:    |
|**0.0.6** |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |        :x:       |
|**0.0.5** |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|:white_check_mark:|        :x:       |        :x:       |
|**0.0.4** |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |
|**0.0.3** |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |
|**0.0.2** |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|        :x:       |        :x:       |
|**0.0.1** |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |        :x:       |:white_check_mark:|:white_check_mark:|        :x:       |

If you're still using a device with version 2.x, you might prefer using
[ddvk's Binary Patches](https://github.com/ddvk/remarkable-hacks).

For information on the licensing conditions of this software, please refer to the accompanying [LICENSE](LICENSE) file.
