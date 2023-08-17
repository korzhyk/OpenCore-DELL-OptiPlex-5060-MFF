# Hackintosh on DELL OptiPlex 5060 MFF via [OpenCore][oc]

![About this mac][system info]

_macOS Supported:_ **12.3+**

This is light configuration to run macOS smoothly. With Chime sound at boot.

## Hardware configuration

| **Component**    | **Model**                                       |
| ---------------- | ----------------------------------------------- |
| CPU              | Intel Core i5 8100T & UHD630                    |
| Motherboard      | IPCF-BS/EK                                      |
| RAM              | 2×16GB HyperX Impact 2666MHz (HX426S15IB2/16)   |
| Audio Chipset    | ALC-3234                                        |
| Ethernet         | Intel I219-V                                    |
| WiFi & Bluetooth | Apple BCM94360CS2 802.11ac WLAN + Bluetooth 4.0 |
| OS Disk (NVMe)   | INLAND Premium 256GB                            |

## Before you start make sure you have

- Working hardware
- [BIOS][bios] version `>= 1.18.0`
- Actual [OpenCore][oc] `= 0.9.3`
- Populated `PlatformInfo > Generic` section in `config.plist`, can be easyly done with `macserial`
  tool from [OpenCore][oc] utilities.

# Installation

## BIOS Settings

- _[Restore Settings]_ → BIOS Defaults → [**OK**]
- _Secure Boot_ → Secure Boot Enable → Secure Boot Enable [**Uncheck**]
- _Power Management_ → DeepSleep Control → Disable [**Check**]

## IMPORTANT HIDDEN BIOS SETTINGS

In OC menu there is option to launch `setup_var.efi` that allows to set hidden BIOS options. Such
as `CFG-Lock` and `DVMT Pre-Allocated`.
⚠️ Attention: You must know the correct address for options that you want to change. Address of the option can change within different versions of BIOS for the same hardware. Otherwise you can corrupt your BIOS.

```
# Disable CFG-Lock
setup_var 0x5BE 0x00

# Pre-Allocated DVMT 64MB
setup_var 0x8DC 0x02
```

## What's behind the scenes

You must download all not bundled kexts and drivers from repositories by yourself. `HfsPlus.efi`
driver and [resources][ocbinary] for Chime sound & OC GUI at boot.

### Kexts

- `Legacy_USB3` - Plist-only kext for USB port mapping
- [IntelMausi.kext][intelmausi] - Another intel driver for Ethernet
- [AppleALC.kext][applealc] - Getting audio to work as easy-peasy
- [Lilu.kext][lilu] - Dependency of `VirtualSMC.kext` and `WhateverGreen.kext`
- [VirtualSMC.kext][virtualsmc] - A advanced replacement of FakeSMC, almost like native mac SMC.
- [WhateverGreen.kext][wg] - Need for GPU support

### EFI drivers

- ~VirtualSMC.efi~ - only needed if you use File Vault 2 or [authrestart][fv2].

## Chnagelog
###### 20/06/2023

- OC v0.9.3 update

###### 20/06/2022

- OC v0.8.1 update

###### 01/06/2022

- The initial push to GitHub

[applealc]: https://github.com/acidanthera/AppleALC
[bios]: https://www.dell.com/support/home/en-us/product-support/product/optiplex-5060-desktop/drivers
[fv2]: https://lifehacker.com/bypass-a-filevault-password-at-startup-by-rebooting-fro-1686770324
[ocbinary]: https://github.com/acidanthera/OcBinaryData
[intelmausi]: https://github.com/acidanthera/IntelMausi
[lilu]: https://github.com/acidanthera/Lilu
[oc]: https://github.com/acidanthera/OpenCorePkg
[system info]: https://i.imgur.com/t4AyMdS.png
[virtualsmc]: https://github.com/acidanthera/VirtualSMC
[wg]: https://github.com/acidanthera/WhateverGreen
