/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190509 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt2.aml, Fri Jun 14 22:53:59 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000054B (1355)
 *     Revision         0x02
 *     Checksum         0xBE
 *     OEM ID           "INTEL "
 *     OEM Table ID     "Ther_Rvp"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)
 */
DefinitionBlock ("", "SSDT", 2, "INTEL ", "Ther_Rvp", 0x00001001)
{
    External (_PR_.AAC0, FieldUnitObj)
    External (_PR_.ACRT, FieldUnitObj)
    External (_PR_.APSV, FieldUnitObj)
    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU1, ProcessorObj)
    External (_PR_.CPU2, ProcessorObj)
    External (_PR_.CPU3, ProcessorObj)
    External (_PR_.CPU4, ProcessorObj)
    External (_PR_.CPU5, ProcessorObj)
    External (_PR_.CPU6, ProcessorObj)
    External (_PR_.CPU7, ProcessorObj)
    External (_PR_.DTS1, FieldUnitObj)
    External (_PR_.DTS2, FieldUnitObj)
    External (_PR_.DTS3, FieldUnitObj)
    External (_PR_.DTS4, FieldUnitObj)
    External (_PR_.DTSE, FieldUnitObj)
    External (_PR_.PDTS, FieldUnitObj)
    External (_PR_.PKGA, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.THOT, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.XHPP, FieldUnitObj)
    External (ACT1, FieldUnitObj)
    External (ACTT, FieldUnitObj)
    External (CRTT, FieldUnitObj)
    External (CTYP, FieldUnitObj)
    External (PSVT, FieldUnitObj)
    External (TC1V, FieldUnitObj)
    External (TC2V, FieldUnitObj)
    External (TCNT, FieldUnitObj)
    External (TSPV, FieldUnitObj)

    Scope (\_TZ)
    {
        ThermalZone (TZ00)
        {
            Name (PTMP, 0x0BB8)
            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                \CTYP = Arg0
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (CondRefOf (\_PR.ACRT))
                {
                    If ((\_PR.ACRT != Zero))
                    {
                        Return ((0x0AAC + (\_PR.ACRT * 0x0A)))
                    }
                }

                Return ((0x0AAC + (\CRTT * 0x0A)))
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If (CondRefOf (\_PR.AAC0))
                {
                    If ((\_PR.AAC0 != Zero))
                    {
                        Return ((0x0AAC + (\_PR.AAC0 * 0x0A)))
                    }
                }

                Return ((0x0AAC + (\ACTT * 0x0A)))
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return ((0x0AAC + (\ACT1 * 0x0A)))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (((0x0AAC + (\ACT1 * 0x0A)) - 0x32))
            }

            Method (_AC3, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (((0x0AAC + (\ACT1 * 0x0A)) - 0x64))
            }

            Method (_AC4, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (((0x0AAC + (\ACT1 * 0x0A)) - 0x96))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (CondRefOf (\_PR.DTSE))
                {
                    If ((\_PR.DTSE == 0x03))
                    {
                        Return ((0x0B10 + (\CRTT * 0x0A)))
                    }
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If ((\_PR.DTSE == One))
                    {
                        If ((\_PR.PKGA == One))
                        {
                            Local0 = \_PR.PDTS
                            Return ((0x0AAC + (Local0 * 0x0A)))
                        }

                        Local0 = \_PR.DTS1
                        If ((\_PR.DTS2 > Local0))
                        {
                            Local0 = \_PR.DTS2
                        }

                        If ((\_PR.DTS3 > Local0))
                        {
                            Local0 = \_PR.DTS3
                        }

                        If ((\_PR.DTS4 > Local0))
                        {
                            Local0 = \_PR.DTS4
                        }

                        Return ((0x0AAC + (Local0 * 0x0A)))
                    }
                }

                If ((\_SB.PCI0.LPCB.EC0.THOT != Zero))
                {
                    \_SB.PCI0.LPCB.EC0.THOT = Zero
                    If (CondRefOf (\_PR.ACRT))
                    {
                        If ((\_PR.ACRT != Zero))
                        {
                            Return ((0x0AAC + (\_PR.ACRT * 0x0A)))
                        }
                    }

                    Local0 = (\CRTT - 0x05)
                    Return ((0x0AAC + (Local0 * 0x0A)))
                }
                Else
                {
                    Local0 = \_SB.PCI0.LPCB.EC0.XHPP
                    Return ((0x0AAC + (Local0 * 0x0A)))
                }

                Return (0x0BC2)
            }
        }

        ThermalZone (TZ01)
        {
            Name (PTMP, 0x0BB8)
            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                \CTYP = Arg0
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (CondRefOf (\_PR.ACRT))
                {
                    If ((\_PR.ACRT != Zero))
                    {
                        Return ((0x0AAC + (\_PR.ACRT * 0x0A)))
                    }
                }

                Return ((0x0AAC + (\CRTT * 0x0A)))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (CondRefOf (\_PR.DTSE))
                {
                    If ((\_PR.DTSE == 0x03))
                    {
                        Return ((0x0B10 + (\CRTT * 0x0A)))
                    }
                }

                If (CondRefOf (\_PR.DTSE))
                {
                    If ((\_PR.DTSE == One))
                    {
                        If ((\_PR.PKGA == One))
                        {
                            Local0 = \_PR.PDTS
                            Return ((0x0AAC + (Local0 * 0x0A)))
                        }

                        Local0 = \_PR.DTS1
                        If ((\_PR.DTS2 > Local0))
                        {
                            Local0 = \_PR.DTS2
                        }

                        If ((\_PR.DTS3 > Local0))
                        {
                            Local0 = \_PR.DTS3
                        }

                        If ((\_PR.DTS4 > Local0))
                        {
                            Local0 = \_PR.DTS4
                        }

                        Return ((0x0AAC + (Local0 * 0x0A)))
                    }
                }

                Return (0x0BD6)
            }

            Method (_PSL, 0, Serialized)  // _PSL: Passive List
            {
                If ((\TCNT == 0x08))
                {
                    Return (Package (0x08)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1, 
                        \_PR.CPU2, 
                        \_PR.CPU3, 
                        \_PR.CPU4, 
                        \_PR.CPU5, 
                        \_PR.CPU6, 
                        \_PR.CPU7
                    })
                }

                If ((\TCNT == 0x04))
                {
                    Return (Package (0x04)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1, 
                        \_PR.CPU2, 
                        \_PR.CPU3
                    })
                }

                If ((\TCNT == 0x02))
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                If (CondRefOf (\_PR.APSV))
                {
                    If ((\_PR.APSV != Zero))
                    {
                        Return ((0x0AAC + (\_PR.APSV * 0x0A)))
                    }
                }

                Return ((0x0AAC + (\PSVT * 0x0A)))
            }

            Method (_TC1, 0, Serialized)  // _TC1: Thermal Constant 1
            {
                Return (\TC1V)
            }

            Method (_TC2, 0, Serialized)  // _TC2: Thermal Constant 2
            {
                Return (\TC2V)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (\TSPV)
            }
        }
    }
}

