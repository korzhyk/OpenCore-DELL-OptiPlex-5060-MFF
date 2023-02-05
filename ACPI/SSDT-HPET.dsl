/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLrkFi1j.aml, Sun Feb  5 17:24:03 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000D6 (214)
 *     Revision         0x02
 *     Checksum         0x9E
 *     OEM ID           "CORP"
 *     OEM Table ID     "HPET"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET.XCRS, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8,11}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If ((_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.LPCB.HPET.XCRS)))
            {
                Return (BUFX) /* \_SB_.PCI0.LPCB.HPET.BUFX */
            }

            Return (\_SB.PCI0.LPCB.HPET.XCRS ())
        }
    }
}

