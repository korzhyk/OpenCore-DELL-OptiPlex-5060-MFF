/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL7RHoyi.aml, Tue May 31 16:55:04 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000095F (2399)
 *     Revision         0x02
 *     Checksum         0x2E
 *     OEM ID           "KRZH"
 *     OEM Table ID     "SsdtExt"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "KRZH", "SsdtExt", 0x00000000)
{
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.RP08.PXSX, DeviceObj)
    External (_SB_.PCI0.RP17.PXSX, DeviceObj)
    External (_SB_.PCI0.SATA, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (OSYS, IntObj)

    If (_OSI ("Darwin"))
    {
        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                            {
                                 0x03                                             // .
                            }
                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
                {
                     0x00                                             // .
                }
            Return (Zero)
        }

        Method (PMPM, 4, NotSerialized)
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x02)
            {
                "plugin-type", 
                One
            })
        }

        If (CondRefOf (\_PR.PR00))
        {
            If ((ObjectType (\_PR.PR00) == 0x0C))
            {
                Scope (\_PR.PR00)
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                    }
                }
            }
        }

        Scope (\)
        {
            OSYS = 0x07DF
            OperationRegion (GPIO, SystemIO, 0x0500, 0x3C)
            Field (GPIO, ByteAcc, NoLock, Preserve)
            {
                Offset (0x0C), 
                GL00,   8, 
                Offset (0x2C), 
                    ,   1, 
                GI01,   1, 
                    ,   1, 
                GI06,   1, 
                Offset (0x2D), 
                GL04,   8
            }
        }

        Scope (\_SB)
        {
            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x08)
                    {
                        "kUSBSleepPowerSupply", 
                        0x13EC, 
                        "kUSBSleepPortCurrentLimit", 
                        0x0834, 
                        "kUSBWakePowerSupply", 
                        0x13EC, 
                        "kUSBWakePortCurrentLimit", 
                        0x0834
                    })
                }
            }

            Scope (PCI0)
            {
                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Device (IMEI)
                {
                    Name (_ADR, 0x00160000)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x08)
                        {
                            "AAPL,slot-name", 
                            "Built In", 
                            "model", 
                            Buffer (0x1F)
                            {
                                "Intel Q370 Chipset Family IMEI"
                            }, 

                            "name", 
                            Buffer (0x16)
                            {
                                "Intel IMEI Controller"
                            }, 

                            "device_type", 
                            Buffer (0x10)
                            {
                                "IMEI Controller"
                            }
                        })
                    }
                }

                Device (XSPI)
                {
                    Name (_ADR, 0x001F0005)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "pci-device-hidden", 
                            Buffer (0x08)
                            {
                                 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                            }
                        })
                    }
                }
            }
        }

        Scope (\_SB.PCI0.SBUS)
        {
            Device (BUS0)
            {
                Name (_CID, "smbus")  // _CID: Compatible ID
                Name (_ADR, Zero)  // _ADR: Address
                Device (DVL0)
                {
                    Name (_ADR, 0x57)  // _ADR: Address
                    Name (_CID, "diagsvault")  // _CID: Compatible ID
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (!Arg2)
                        {
                            Return (Buffer (One)
                            {
                                 0x57                                             // W
                            })
                        }

                        Return (Package (0x02)
                        {
                            "address", 
                            0x57
                        })
                    }
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }
        }

        Scope (\_SB.PCI0.HECI)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }
        }

        Scope (\_SB.PCI0.XHC)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "name", 
                    Buffer (0x15)
                    {
                        "Intel USB Controller"
                    }, 

                    "device_type", 
                    Buffer (0x0F)
                    {
                        "USB Controller"
                    }, 

                    "model", 
                    Buffer (0x32)
                    {
                        "Intel Q370 Chipset Family USB 3.0 Host Controller"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.XHC.RHUB)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x06)
                {
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "subsystem-id", 
                    Buffer (0x04)
                    {
                         0x70, 0x72, 0x00, 0x00                           // pr..
                    }, 

                    "subsystem-vendor-id", 
                    Buffer (0x04)
                    {
                         0x86, 0x80, 0x00, 0x00                           // ....
                    }
                })
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x6D, 
                    0x04
                })
            }
        }

        Scope (\_SB.PCI0.LPCB)
        {
            Scope (HPET)
            {
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    IRQNoFlags ()
                        {0,8,11}
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        )
                })
            }

            Device (EC)
            {
                Name (_HID, "ACID0001")  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }

            Device (DMAC)
            {
                Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x20,               // Length
                        )
                    IO (Decode16,
                        0x0081,             // Range Minimum
                        0x0081,             // Range Maximum
                        0x01,               // Alignment
                        0x11,               // Length
                        )
                    IO (Decode16,
                        0x0093,             // Range Minimum
                        0x0093,             // Range Maximum
                        0x01,               // Alignment
                        0x0D,               // Length
                        )
                    IO (Decode16,
                        0x00C0,             // Range Minimum
                        0x00C0,             // Range Maximum
                        0x01,               // Alignment
                        0x20,               // Length
                        )
                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                        {4}
                })
            }
        }

        Scope (\_SB.PCI0.HDAS)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0C)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "name", 
                    Buffer (0x11)
                    {
                        "Audio Controller"
                    }, 

                    "model", 
                    Buffer (0x27)
                    {
                        "Realtek ALC 3234 High Definition Audio"
                    }, 

                    "device_type", 
                    Buffer (0x11)
                    {
                        "Audio Controller"
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "layout-id", 
                    Buffer (0x04)
                    {
                         0x0B, 0x00, 0x00, 0x00                           // ....
                    }
                })
            }
        }

        Scope (\_SB.PCI0.GLAN)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "model", 
                    Buffer ()
                    {
                        "Intel I219-V PCIe Gigabit Ethernet"
                    }, 

                    "name", 
                    Buffer (0x14)
                    {
                        "Ethernet Controller"
                    }, 

                    "device_type", 
                    Buffer (0x14)
                    {
                        "Ethernet Controller"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.SATA)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0C)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "name", 
                    Buffer (0x16)
                    {
                        "Intel AHCI Controller"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x02, 0xA1, 0x00, 0x00                           // ....
                    }, 

                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci8086,a102"
                    }, 

                    "model", 
                    Buffer (0x2A)
                    {
                        "Intel Q370 Chipset Family SATA Controller"
                    }, 

                    "device_type", 
                    Buffer (0x10)
                    {
                        "AHCI Controller"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.RP08.PXSX)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    Buffer ()
                    {
                        "M.2 WIFI"
                    }, 

                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "model", 
                    Buffer (0x1C)
                    {
                        "AirPort Extreme BCM94360CS2"
                    }, 

                    "name", 
                    Buffer (0x13)
                    {
                        "AirPort Controller"
                    }, 

                    "device_type", 
                    Buffer (0x10)
                    {
                        "AirPort Extreme"
                    }
                })
            }
        }


        Scope (\_SB.PCI0.RP17.PXSX)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    Buffer ()
                    {
                        "M.2 SSD"
                    }, 

                    "built-in", 
                    Buffer (0x09)
                    {
                        "NVMe SSD"
                    }, 

                    "name", 
                    Buffer (0x13)
                    {
                        "Storage Controller"
                    }, 

                    "device_type", 
                    Buffer (0x13)
                    {
                        "Storage Controller"
                    }, 

                    "model", 
                    Buffer (0x2C)
                    {
                        "MyDigitalSSD SBX 128GB M.2 NVMe Flash drive"
                    }
                })
            }
        }
    }
}

