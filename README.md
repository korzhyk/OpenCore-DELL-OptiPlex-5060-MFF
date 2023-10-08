# Hackintosh on DELL OptiPlex 5060 MFF via [OpenCore][oc]

![About this mac](https://github.com/korzhyk/OpenCore-DELL-OptiPlex-5060-MFF/assets/1100134/f8e56319-5d79-42c9-98d8-528515baa086)

_macOS Supported:_ **12.3+**

This is light configuration to run macOS smoothly. With Chime sound at boot. 🔉

## Hardware configuration

| **Component**    | **Model**                                       |
| ---------------- | ----------------------------------------------- |
| CPU              | Intel Core i5 8500T & UHD630                    |
| Motherboard      | IPCF-BS/EK                                      |
| RAM              | 2×8GB HyperX Impact 2666MHz (HX426S15IB2/16)   |
| Audio Chipset    | ALC-3234                                        |
| Ethernet         | Intel I219-V                                    |
| WiFi & Bluetooth | Apple BCM94360CS2 802.11ac WLAN + Bluetooth 4.0 |
| OS Disk (NVMe)   | INLAND Premium 256GB PCIe3.0 x4                 |

## Before you start make sure you have

- Working hardware
- [BIOS][bios] version `<=1.25.0`
- Actual [OpenCore][oc] `=0.9.4`
- Populated `PlatformInfo > Generic` section in `config.plist`, can be easyly done with `macserial`
  tool from [OpenCore][oc] utilities.

# Installation

## BIOS Settings

- _[Restore Settings]_ → BIOS Defaults → [**OK**]
- _Secure Boot_ → Secure Boot Mode → Audit Mode [**Check**]
- _Power Management_ → DeepSleep Control → Disable [**Check**]

## IMPORTANT HIDDEN BIOS SETTINGS

In OC menu you can notice [two options](https://github.com/korzhyk/OpenCore-DELL-OptiPlex-5060-MFF/blob/8b82ee962bf2161b79b78a0bc90d3f25dd2f98d0/config.plist#L949-L992) to launch `setup_var.efi` that allows to set hidden BIOS
options. Such as `CFG-Lock` and `DVMT Pre-Allocated`. [Here](https://gist.github.com/korzhyk/1cd4a856a080069c5178823f16606bd7/raw/File_DXE_driver_Setup_1.25.0.ffs.0.0.en-US.ifr.txt) is extracted section for BIOS `1.25.0`
(identical with `1.18.0`).

⚠️ Attention: Anyway you must know the correct address for options that you want to change. Address
of the option can change within different versions of BIOS for the same hardware otherwise you can
corrupt your BIOS. ⚠️

<details>
  <summary>RAW values</summary>

  ```
  # CFG Lock = Disable
  setup_var 0x5BE 0x0
  
  # DVMT Pre-Allocated = 64MB
  setup_var 0x8DC 0x2
  ```
</details>

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
###### 13/09/2023

- OC v0.9.5

###### 23/08/2023

- OC v0.9.4

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
[virtualsmc]: https://github.com/acidanthera/VirtualSMC
[wg]: https://github.com/acidanthera/WhateverGreen
