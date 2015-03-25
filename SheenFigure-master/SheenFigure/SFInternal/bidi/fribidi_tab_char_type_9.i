/*
 This file was automatically created from UnicodeData.txt version 4.1.0
 by fribidi_create_char_types
 */

#ifndef FRIBIDI_TAB_CHAR_TYPE_9_I
#define FRIBIDI_TAB_CHAR_TYPE_9_I

#include "SFTypes.h"
#include "bidi_class.h"

/*
 * Define character types that char_type_tables use.
 * define them to be 0, 1, 2, ... and then in fribidi_get_type.c map them
 * to FriBidiCharTypes.
 */
typedef char FriBidiPropCharType;

#define LTR L
#define RTL R
#define BS  B
#define SS  S

#define PACKTAB_UINT8   SFUByte
#define PACKTAB_UINT16  SFUShort
#define PACKTAB_UINT32  SFUInt

static const FriBidiPropCharType FriBidiPropertyBlockLevel8[2*58] = {
    
#define FriBidiPropertyBlockLevel8_0000 0x0
    
    BN, BN,
    
#define FriBidiPropertyBlockLevel8_0008 0x2
    
    BN, SS,
    
#define FriBidiPropertyBlockLevel8_000A 0x4
    
    BS, SS,
    
#define FriBidiPropertyBlockLevel8_000C 0x6
    
    WS, BS,
    
#define FriBidiPropertyBlockLevel8_001C 0x8
    
    BS, BS,
    
#define FriBidiPropertyBlockLevel8_0020 0xA
    
    WS, ON,
    
#define FriBidiPropertyBlockLevel8_0022 0xC
    
    ON, ET,
    
#define FriBidiPropertyBlockLevel8_0024 0xE
    
    ET, ET,
    
#define FriBidiPropertyBlockLevel8_0026 0x10
    
    ON, ON,
    
#define FriBidiPropertyBlockLevel8_002A 0x12
    
    ON, ES,
    
#define FriBidiPropertyBlockLevel8_002C 0x14
    
    CS, ES,
    
#define FriBidiPropertyBlockLevel8_002E 0x16
    
    CS, CS,
    
#define FriBidiPropertyBlockLevel8_0030 0x18
    
    EN, EN,
    
#define FriBidiPropertyBlockLevel8_003A 0x1A
    
    CS, ON,
    
#define FriBidiPropertyBlockLevel8_0040 0x1C
    
    ON,LTR,
    
#define FriBidiPropertyBlockLevel8_0042 0x1E
    
    LTR,LTR,
    
#define FriBidiPropertyBlockLevel8_005A 0x20
    
    LTR, ON,
    
#define FriBidiPropertyBlockLevel8_007E 0x22
    
    ON, BN,
    
#define FriBidiPropertyBlockLevel8_0084 0x24
    
    BN, BS,
    
#define FriBidiPropertyBlockLevel8_00B8 0x26
    
    ON, EN,
    
#define FriBidiPropertyBlockLevel8_0300 0x28
    
    NSM,NSM,
    
#define FriBidiPropertyBlockLevel8_0482 0x2A
    
    LTR,NSM,
    
#define FriBidiPropertyBlockLevel8_0486 0x2C
    
    NSM,LTR,
    
#define FriBidiPropertyBlockLevel8_0590 0x2E
    
    RTL,NSM,
    
#define FriBidiPropertyBlockLevel8_05C2 0x30
    
    NSM,RTL,
    
#define FriBidiPropertyBlockLevel8_05C8 0x32
    
    RTL,RTL,
    
#define FriBidiPropertyBlockLevel8_0600 0x34
    
    AL, AL,
    
#define FriBidiPropertyBlockLevel8_060C 0x36
    
    CS, AL,
    
#define FriBidiPropertyBlockLevel8_064A 0x38
    
    AL,NSM,
    
#define FriBidiPropertyBlockLevel8_065E 0x3A
    
    NSM, AL,
    
#define FriBidiPropertyBlockLevel8_0660 0x3C
    
    AN, AN,
    
#define FriBidiPropertyBlockLevel8_066A 0x3E
    
    ET, AN,
    
#define FriBidiPropertyBlockLevel8_066C 0x40
    
    AN, AL,
    
#define FriBidiPropertyBlockLevel8_06E8 0x42
    
    NSM, ON,
    
#define FriBidiPropertyBlockLevel8_070E 0x44
    
    AL, BN,
    
#define FriBidiPropertyBlockLevel8_0AF0 0x46
    
    LTR, ET,
    
#define FriBidiPropertyBlockLevel8_1680 0x48
    
    WS,LTR,
    
#define FriBidiPropertyBlockLevel8_180A 0x4A
    
    ON,NSM,
    
#define FriBidiPropertyBlockLevel8_2000 0x4C
    
    WS, WS,
    
#define FriBidiPropertyBlockLevel8_200A 0x4E
    
    WS, BN,
    
#define FriBidiPropertyBlockLevel8_200E 0x50
    
    LTR,RTL,
    
#define FriBidiPropertyBlockLevel8_202A 0x52
    
    LRE,RLE,
    
#define FriBidiPropertyBlockLevel8_202C 0x54
    
    PDF,LRO,
    
#define FriBidiPropertyBlockLevel8_202E 0x56
    
    RLO, CS,
    
#define FriBidiPropertyBlockLevel8_2034 0x58
    
    ET, ON,
    
#define FriBidiPropertyBlockLevel8_205E 0x5A
    
    ON, WS,
    
#define FriBidiPropertyBlockLevel8_2070 0x5C
    
    EN,LTR,
    
#define FriBidiPropertyBlockLevel8_207A 0x5E
    
    ES, ES,
    
#define FriBidiPropertyBlockLevel8_212E 0x60
    
    ET,LTR,
    
#define FriBidiPropertyBlockLevel8_2212 0x62
    
    ES, ET,
    
#define FriBidiPropertyBlockLevel8_FB28 0x64
    
    RTL, ES,
    
#define FriBidiPropertyBlockLevel8_FDFC 0x66
    
    AL, ON,
    
#define FriBidiPropertyBlockLevel8_FE52 0x68
    
    CS,LTR,
    
#define FriBidiPropertyBlockLevel8_FE54 0x6A
    
    ON, CS,
    
#define FriBidiPropertyBlockLevel8_FFF8 0x6C
    
    BN, ON,
    
#define FriBidiPropertyBlockLevel8_1091E 0x6E
    
    RTL, ON,
    
#define FriBidiPropertyBlockLevel8_1D172 0x70
    
    LTR, BN,
    
#define FriBidiPropertyBlockLevel8_1D17A 0x72
    
    BN,NSM,
};

static const PACKTAB_UINT8 FriBidiPropertyBlockLevel7[2*113] = {
    
#define FriBidiPropertyBlockLevel7_0000 0x0
    
    FriBidiPropertyBlockLevel8_0000,  /* 0000..0001 */
    FriBidiPropertyBlockLevel8_0000,  /* 0002..0003 */
    
#define FriBidiPropertyBlockLevel7_0008 0x2
    
    FriBidiPropertyBlockLevel8_0008,  /* 0008..0009 */
    FriBidiPropertyBlockLevel8_000A,  /* 000A..000B */
    
#define FriBidiPropertyBlockLevel7_000C 0x4
    
    FriBidiPropertyBlockLevel8_000C,  /* 000C..000D */
    FriBidiPropertyBlockLevel8_0000,  /* 000E..000F */
    
#define FriBidiPropertyBlockLevel7_001C 0x6
    
    FriBidiPropertyBlockLevel8_001C,  /* 001C..001D */
    FriBidiPropertyBlockLevel8_000A,  /* 001E..001F */
    
#define FriBidiPropertyBlockLevel7_0020 0x8
    
    FriBidiPropertyBlockLevel8_0020,  /* 0020..0021 */
    FriBidiPropertyBlockLevel8_0022,  /* 0022..0023 */
    
#define FriBidiPropertyBlockLevel7_0024 0xA
    
    FriBidiPropertyBlockLevel8_0024,  /* 0024..0025 */
    FriBidiPropertyBlockLevel8_0026,  /* 0026..0027 */
    
#define FriBidiPropertyBlockLevel7_0028 0xC
    
    FriBidiPropertyBlockLevel8_0026,  /* 0028..0029 */
    FriBidiPropertyBlockLevel8_002A,  /* 002A..002B */
    
#define FriBidiPropertyBlockLevel7_002C 0xE
    
    FriBidiPropertyBlockLevel8_002C,  /* 002C..002D */
    FriBidiPropertyBlockLevel8_002E,  /* 002E..002F */
    
#define FriBidiPropertyBlockLevel7_0030 0x10
    
    FriBidiPropertyBlockLevel8_0030,  /* 0030..0031 */
    FriBidiPropertyBlockLevel8_0030,  /* 0032..0033 */
    
#define FriBidiPropertyBlockLevel7_0038 0x12
    
    FriBidiPropertyBlockLevel8_0030,  /* 0038..0039 */
    FriBidiPropertyBlockLevel8_003A,  /* 003A..003B */
    
#define FriBidiPropertyBlockLevel7_003C 0x14
    
    FriBidiPropertyBlockLevel8_0026,  /* 003C..003D */
    FriBidiPropertyBlockLevel8_0026,  /* 003E..003F */
    
#define FriBidiPropertyBlockLevel7_0040 0x16
    
    FriBidiPropertyBlockLevel8_0040,  /* 0040..0041 */
    FriBidiPropertyBlockLevel8_0042,  /* 0042..0043 */
    
#define FriBidiPropertyBlockLevel7_0044 0x18
    
    FriBidiPropertyBlockLevel8_0042,  /* 0044..0045 */
    FriBidiPropertyBlockLevel8_0042,  /* 0046..0047 */
    
#define FriBidiPropertyBlockLevel7_0058 0x1A
    
    FriBidiPropertyBlockLevel8_0042,  /* 0058..0059 */
    FriBidiPropertyBlockLevel8_005A,  /* 005A..005B */
    
#define FriBidiPropertyBlockLevel7_007C 0x1C
    
    FriBidiPropertyBlockLevel8_0026,  /* 007C..007D */
    FriBidiPropertyBlockLevel8_007E,  /* 007E..007F */
    
#define FriBidiPropertyBlockLevel7_0084 0x1E
    
    FriBidiPropertyBlockLevel8_0084,  /* 0084..0085 */
    FriBidiPropertyBlockLevel8_0000,  /* 0086..0087 */
    
#define FriBidiPropertyBlockLevel7_00A0 0x20
    
    FriBidiPropertyBlockLevel8_003A,  /* 00A0..00A1 */
    FriBidiPropertyBlockLevel8_0024,  /* 00A2..00A3 */
    
#define FriBidiPropertyBlockLevel7_00A8 0x22
    
    FriBidiPropertyBlockLevel8_0026,  /* 00A8..00A9 */
    FriBidiPropertyBlockLevel8_005A,  /* 00AA..00AB */
    
#define FriBidiPropertyBlockLevel7_00AC 0x24
    
    FriBidiPropertyBlockLevel8_007E,  /* 00AC..00AD */
    FriBidiPropertyBlockLevel8_0026,  /* 00AE..00AF */
    
#define FriBidiPropertyBlockLevel7_00B0 0x26
    
    FriBidiPropertyBlockLevel8_0024,  /* 00B0..00B1 */
    FriBidiPropertyBlockLevel8_0030,  /* 00B2..00B3 */
    
#define FriBidiPropertyBlockLevel7_00B4 0x28
    
    FriBidiPropertyBlockLevel8_0040,  /* 00B4..00B5 */
    FriBidiPropertyBlockLevel8_0026,  /* 00B6..00B7 */
    
#define FriBidiPropertyBlockLevel7_00B8 0x2A
    
    FriBidiPropertyBlockLevel8_00B8,  /* 00B8..00B9 */
    FriBidiPropertyBlockLevel8_005A,  /* 00BA..00BB */
    
#define FriBidiPropertyBlockLevel7_02B8 0x2C
    
    FriBidiPropertyBlockLevel8_005A,  /* 02B8..02B9 */
    FriBidiPropertyBlockLevel8_0040,  /* 02BA..02BB */
    
#define FriBidiPropertyBlockLevel7_02C0 0x2E
    
    FriBidiPropertyBlockLevel8_0042,  /* 02C0..02C1 */
    FriBidiPropertyBlockLevel8_0026,  /* 02C2..02C3 */
    
#define FriBidiPropertyBlockLevel7_02E4 0x30
    
    FriBidiPropertyBlockLevel8_005A,  /* 02E4..02E5 */
    FriBidiPropertyBlockLevel8_0026,  /* 02E6..02E7 */
    
#define FriBidiPropertyBlockLevel7_0300 0x32
    
    FriBidiPropertyBlockLevel8_0300,  /* 0300..0301 */
    FriBidiPropertyBlockLevel8_0300,  /* 0302..0303 */
    
#define FriBidiPropertyBlockLevel7_0374 0x34
    
    FriBidiPropertyBlockLevel8_0026,  /* 0374..0375 */
    FriBidiPropertyBlockLevel8_0042,  /* 0376..0377 */
    
#define FriBidiPropertyBlockLevel7_037C 0x36
    
    FriBidiPropertyBlockLevel8_0042,  /* 037C..037D */
    FriBidiPropertyBlockLevel8_0040,  /* 037E..037F */
    
#define FriBidiPropertyBlockLevel7_0480 0x38
    
    FriBidiPropertyBlockLevel8_0042,  /* 0480..0481 */
    FriBidiPropertyBlockLevel8_0482,  /* 0482..0483 */
    
#define FriBidiPropertyBlockLevel7_0484 0x3A
    
    FriBidiPropertyBlockLevel8_0300,  /* 0484..0485 */
    FriBidiPropertyBlockLevel8_0486,  /* 0486..0487 */
    
#define FriBidiPropertyBlockLevel7_0488 0x3C
    
    FriBidiPropertyBlockLevel8_0300,  /* 0488..0489 */
    FriBidiPropertyBlockLevel8_0042,  /* 048A..048B */
    
#define FriBidiPropertyBlockLevel7_0590 0x3E
    
    FriBidiPropertyBlockLevel8_0590,  /* 0590..0591 */
    FriBidiPropertyBlockLevel8_0300,  /* 0592..0593 */
    
#define FriBidiPropertyBlockLevel7_05BC 0x40
    
    FriBidiPropertyBlockLevel8_0300,  /* 05BC..05BD */
    FriBidiPropertyBlockLevel8_0590,  /* 05BE..05BF */
    
#define FriBidiPropertyBlockLevel7_05C0 0x42
    
    FriBidiPropertyBlockLevel8_0590,  /* 05C0..05C1 */
    FriBidiPropertyBlockLevel8_05C2,  /* 05C2..05C3 */
    
#define FriBidiPropertyBlockLevel7_05C8 0x44
    
    FriBidiPropertyBlockLevel8_05C8,  /* 05C8..05C9 */
    FriBidiPropertyBlockLevel8_05C8,  /* 05CA..05CB */
    
#define FriBidiPropertyBlockLevel7_0600 0x46
    
    FriBidiPropertyBlockLevel8_0600,  /* 0600..0601 */
    FriBidiPropertyBlockLevel8_0600,  /* 0602..0603 */
    
#define FriBidiPropertyBlockLevel7_060C 0x48
    
    FriBidiPropertyBlockLevel8_060C,  /* 060C..060D */
    FriBidiPropertyBlockLevel8_0026,  /* 060E..060F */
    
#define FriBidiPropertyBlockLevel7_0614 0x4A
    
    FriBidiPropertyBlockLevel8_0300,  /* 0614..0615 */
    FriBidiPropertyBlockLevel8_0600,  /* 0616..0617 */
    
#define FriBidiPropertyBlockLevel7_0648 0x4C
    
    FriBidiPropertyBlockLevel8_0600,  /* 0648..0649 */
    FriBidiPropertyBlockLevel8_064A,  /* 064A..064B */
    
#define FriBidiPropertyBlockLevel7_065C 0x4E
    
    FriBidiPropertyBlockLevel8_0300,  /* 065C..065D */
    FriBidiPropertyBlockLevel8_065E,  /* 065E..065F */
    
#define FriBidiPropertyBlockLevel7_0660 0x50
    
    FriBidiPropertyBlockLevel8_0660,  /* 0660..0661 */
    FriBidiPropertyBlockLevel8_0660,  /* 0662..0663 */
    
#define FriBidiPropertyBlockLevel7_0668 0x52
    
    FriBidiPropertyBlockLevel8_0660,  /* 0668..0669 */
    FriBidiPropertyBlockLevel8_066A,  /* 066A..066B */
    
#define FriBidiPropertyBlockLevel7_066C 0x54
    
    FriBidiPropertyBlockLevel8_066C,  /* 066C..066D */
    FriBidiPropertyBlockLevel8_0600,  /* 066E..066F */
    
#define FriBidiPropertyBlockLevel7_0670 0x56
    
    FriBidiPropertyBlockLevel8_065E,  /* 0670..0671 */
    FriBidiPropertyBlockLevel8_0600,  /* 0672..0673 */
    
#define FriBidiPropertyBlockLevel7_06D4 0x58
    
    FriBidiPropertyBlockLevel8_0600,  /* 06D4..06D5 */
    FriBidiPropertyBlockLevel8_0300,  /* 06D6..06D7 */
    
#define FriBidiPropertyBlockLevel7_06DC 0x5A
    
    FriBidiPropertyBlockLevel8_065E,  /* 06DC..06DD */
    FriBidiPropertyBlockLevel8_0300,  /* 06DE..06DF */
    
#define FriBidiPropertyBlockLevel7_06E4 0x5C
    
    FriBidiPropertyBlockLevel8_065E,  /* 06E4..06E5 */
    FriBidiPropertyBlockLevel8_064A,  /* 06E6..06E7 */
    
#define FriBidiPropertyBlockLevel7_06E8 0x5E
    
    FriBidiPropertyBlockLevel8_06E8,  /* 06E8..06E9 */
    FriBidiPropertyBlockLevel8_0300,  /* 06EA..06EB */
    
#define FriBidiPropertyBlockLevel7_06F8 0x60
    
    FriBidiPropertyBlockLevel8_0030,  /* 06F8..06F9 */
    FriBidiPropertyBlockLevel8_0600,  /* 06FA..06FB */
    
#define FriBidiPropertyBlockLevel7_070C 0x62
    
    FriBidiPropertyBlockLevel8_0600,  /* 070C..070D */
    FriBidiPropertyBlockLevel8_070E,  /* 070E..070F */
    
#define FriBidiPropertyBlockLevel7_0710 0x64
    
    FriBidiPropertyBlockLevel8_064A,  /* 0710..0711 */
    FriBidiPropertyBlockLevel8_0600,  /* 0712..0713 */
    
#define FriBidiPropertyBlockLevel7_07E8 0x66
    
    FriBidiPropertyBlockLevel8_05C8,  /* 07E8..07E9 */
    FriBidiPropertyBlockLevel8_0590,  /* 07EA..07EB */
    
#define FriBidiPropertyBlockLevel7_07F4 0x68
    
    FriBidiPropertyBlockLevel8_05C8,  /* 07F4..07F5 */
    FriBidiPropertyBlockLevel8_0026,  /* 07F6..07F7 */
    
#define FriBidiPropertyBlockLevel7_07F8 0x6A
    
    FriBidiPropertyBlockLevel8_0026,  /* 07F8..07F9 */
    FriBidiPropertyBlockLevel8_05C8,  /* 07FA..07FB */
    
#define FriBidiPropertyBlockLevel7_0900 0x6C
    
    FriBidiPropertyBlockLevel8_0482,  /* 0900..0901 */
    FriBidiPropertyBlockLevel8_0486,  /* 0902..0903 */
    
#define FriBidiPropertyBlockLevel7_093C 0x6E
    
    FriBidiPropertyBlockLevel8_0486,  /* 093C..093D */
    FriBidiPropertyBlockLevel8_0042,  /* 093E..093F */
    
#define FriBidiPropertyBlockLevel7_0940 0x70
    
    FriBidiPropertyBlockLevel8_0482,  /* 0940..0941 */
    FriBidiPropertyBlockLevel8_0300,  /* 0942..0943 */
    
#define FriBidiPropertyBlockLevel7_094C 0x72
    
    FriBidiPropertyBlockLevel8_0482,  /* 094C..094D */
    FriBidiPropertyBlockLevel8_0042,  /* 094E..094F */
    
#define FriBidiPropertyBlockLevel7_0960 0x74
    
    FriBidiPropertyBlockLevel8_0042,  /* 0960..0961 */
    FriBidiPropertyBlockLevel8_0300,  /* 0962..0963 */
    
#define FriBidiPropertyBlockLevel7_09F0 0x76
    
    FriBidiPropertyBlockLevel8_0042,  /* 09F0..09F1 */
    FriBidiPropertyBlockLevel8_0024,  /* 09F2..09F3 */
    
#define FriBidiPropertyBlockLevel7_0A48 0x78
    
    FriBidiPropertyBlockLevel8_0486,  /* 0A48..0A49 */
    FriBidiPropertyBlockLevel8_0482,  /* 0A4A..0A4B */
    
#define FriBidiPropertyBlockLevel7_0AC4 0x7A
    
    FriBidiPropertyBlockLevel8_0300,  /* 0AC4..0AC5 */
    FriBidiPropertyBlockLevel8_0482,  /* 0AC6..0AC7 */
    
#define FriBidiPropertyBlockLevel7_0AF0 0x7C
    
    FriBidiPropertyBlockLevel8_0AF0,  /* 0AF0..0AF1 */
    FriBidiPropertyBlockLevel8_0042,  /* 0AF2..0AF3 */
    
#define FriBidiPropertyBlockLevel7_0B54 0x7E
    
    FriBidiPropertyBlockLevel8_0042,  /* 0B54..0B55 */
    FriBidiPropertyBlockLevel8_0486,  /* 0B56..0B57 */
    
#define FriBidiPropertyBlockLevel7_0BF8 0x80
    
    FriBidiPropertyBlockLevel8_0022,  /* 0BF8..0BF9 */
    FriBidiPropertyBlockLevel8_0040,  /* 0BFA..0BFB */
    
#define FriBidiPropertyBlockLevel7_0C48 0x82
    
    FriBidiPropertyBlockLevel8_0486,  /* 0C48..0C49 */
    FriBidiPropertyBlockLevel8_0300,  /* 0C4A..0C4B */
    
#define FriBidiPropertyBlockLevel7_0DD4 0x84
    
    FriBidiPropertyBlockLevel8_0486,  /* 0DD4..0DD5 */
    FriBidiPropertyBlockLevel8_0486,  /* 0DD6..0DD7 */
    
#define FriBidiPropertyBlockLevel7_0E3C 0x86
    
    FriBidiPropertyBlockLevel8_0042,  /* 0E3C..0E3D */
    FriBidiPropertyBlockLevel8_0AF0,  /* 0E3E..0E3F */
    
#define FriBidiPropertyBlockLevel7_0F34 0x88
    
    FriBidiPropertyBlockLevel8_0482,  /* 0F34..0F35 */
    FriBidiPropertyBlockLevel8_0482,  /* 0F36..0F37 */
    
#define FriBidiPropertyBlockLevel7_0F38 0x8A
    
    FriBidiPropertyBlockLevel8_0482,  /* 0F38..0F39 */
    FriBidiPropertyBlockLevel8_0026,  /* 0F3A..0F3B */
    
#define FriBidiPropertyBlockLevel7_1680 0x8C
    
    FriBidiPropertyBlockLevel8_1680,  /* 1680..1681 */
    FriBidiPropertyBlockLevel8_0042,  /* 1682..1683 */
    
#define FriBidiPropertyBlockLevel7_1808 0x8E
    
    FriBidiPropertyBlockLevel8_0026,  /* 1808..1809 */
    FriBidiPropertyBlockLevel8_180A,  /* 180A..180B */
    
#define FriBidiPropertyBlockLevel7_180C 0x90
    
    FriBidiPropertyBlockLevel8_0300,  /* 180C..180D */
    FriBidiPropertyBlockLevel8_1680,  /* 180E..180F */
    
#define FriBidiPropertyBlockLevel7_1FBC 0x92
    
    FriBidiPropertyBlockLevel8_005A,  /* 1FBC..1FBD */
    FriBidiPropertyBlockLevel8_005A,  /* 1FBE..1FBF */
    
#define FriBidiPropertyBlockLevel7_2000 0x94
    
    FriBidiPropertyBlockLevel8_2000,  /* 2000..2001 */
    FriBidiPropertyBlockLevel8_2000,  /* 2002..2003 */
    
#define FriBidiPropertyBlockLevel7_2008 0x96
    
    FriBidiPropertyBlockLevel8_2000,  /* 2008..2009 */
    FriBidiPropertyBlockLevel8_200A,  /* 200A..200B */
    
#define FriBidiPropertyBlockLevel7_200C 0x98
    
    FriBidiPropertyBlockLevel8_0000,  /* 200C..200D */
    FriBidiPropertyBlockLevel8_200E,  /* 200E..200F */
    
#define FriBidiPropertyBlockLevel7_2028 0x9A
    
    FriBidiPropertyBlockLevel8_000C,  /* 2028..2029 */
    FriBidiPropertyBlockLevel8_202A,  /* 202A..202B */
    
#define FriBidiPropertyBlockLevel7_202C 0x9C
    
    FriBidiPropertyBlockLevel8_202C,  /* 202C..202D */
    FriBidiPropertyBlockLevel8_202E,  /* 202E..202F */
    
#define FriBidiPropertyBlockLevel7_2030 0x9E
    
    FriBidiPropertyBlockLevel8_0024,  /* 2030..2031 */
    FriBidiPropertyBlockLevel8_0024,  /* 2032..2033 */
    
#define FriBidiPropertyBlockLevel7_2034 0xA0
    
    FriBidiPropertyBlockLevel8_2034,  /* 2034..2035 */
    FriBidiPropertyBlockLevel8_0026,  /* 2036..2037 */
    
#define FriBidiPropertyBlockLevel7_2044 0xA2
    
    FriBidiPropertyBlockLevel8_003A,  /* 2044..2045 */
    FriBidiPropertyBlockLevel8_0026,  /* 2046..2047 */
    
#define FriBidiPropertyBlockLevel7_205C 0xA4
    
    FriBidiPropertyBlockLevel8_0026,  /* 205C..205D */
    FriBidiPropertyBlockLevel8_205E,  /* 205E..205F */
    
#define FriBidiPropertyBlockLevel7_2070 0xA6
    
    FriBidiPropertyBlockLevel8_2070,  /* 2070..2071 */
    FriBidiPropertyBlockLevel8_0042,  /* 2072..2073 */
    
#define FriBidiPropertyBlockLevel7_2078 0xA8
    
    FriBidiPropertyBlockLevel8_0030,  /* 2078..2079 */
    FriBidiPropertyBlockLevel8_207A,  /* 207A..207B */
    
#define FriBidiPropertyBlockLevel7_207C 0xAA
    
    FriBidiPropertyBlockLevel8_0026,  /* 207C..207D */
    FriBidiPropertyBlockLevel8_0040,  /* 207E..207F */
    
#define FriBidiPropertyBlockLevel7_20B4 0xAC
    
    FriBidiPropertyBlockLevel8_0024,  /* 20B4..20B5 */
    FriBidiPropertyBlockLevel8_0042,  /* 20B6..20B7 */
    
#define FriBidiPropertyBlockLevel7_2128 0xAE
    
    FriBidiPropertyBlockLevel8_005A,  /* 2128..2129 */
    FriBidiPropertyBlockLevel8_0042,  /* 212A..212B */
    
#define FriBidiPropertyBlockLevel7_212C 0xB0
    
    FriBidiPropertyBlockLevel8_0042,  /* 212C..212D */
    FriBidiPropertyBlockLevel8_212E,  /* 212E..212F */
    
#define FriBidiPropertyBlockLevel7_2210 0xB2
    
    FriBidiPropertyBlockLevel8_0026,  /* 2210..2211 */
    FriBidiPropertyBlockLevel8_2212,  /* 2212..2213 */
    
#define FriBidiPropertyBlockLevel7_3000 0xB4
    
    FriBidiPropertyBlockLevel8_0020,  /* 3000..3001 */
    FriBidiPropertyBlockLevel8_0026,  /* 3002..3003 */
    
#define FriBidiPropertyBlockLevel7_3098 0xB6
    
    FriBidiPropertyBlockLevel8_0482,  /* 3098..3099 */
    FriBidiPropertyBlockLevel8_06E8,  /* 309A..309B */
    
#define FriBidiPropertyBlockLevel7_FB1C 0xB8
    
    FriBidiPropertyBlockLevel8_200E,  /* FB1C..FB1D */
    FriBidiPropertyBlockLevel8_05C2,  /* FB1E..FB1F */
    
#define FriBidiPropertyBlockLevel7_FB28 0xBA
    
    FriBidiPropertyBlockLevel8_FB28,  /* FB28..FB29 */
    FriBidiPropertyBlockLevel8_05C8,  /* FB2A..FB2B */
    
#define FriBidiPropertyBlockLevel7_FD3C 0xBC
    
    FriBidiPropertyBlockLevel8_0600,  /* FD3C..FD3D */
    FriBidiPropertyBlockLevel8_0026,  /* FD3E..FD3F */
    
#define FriBidiPropertyBlockLevel7_FDFC 0xBE
    
    FriBidiPropertyBlockLevel8_FDFC,  /* FDFC..FDFD */
    FriBidiPropertyBlockLevel8_0600,  /* FDFE..FDFF */
    
#define FriBidiPropertyBlockLevel7_FE50 0xC0
    
    FriBidiPropertyBlockLevel8_003A,  /* FE50..FE51 */
    FriBidiPropertyBlockLevel8_FE52,  /* FE52..FE53 */
    
#define FriBidiPropertyBlockLevel7_FE54 0xC2
    
    FriBidiPropertyBlockLevel8_FE54,  /* FE54..FE55 */
    FriBidiPropertyBlockLevel8_0026,  /* FE56..FE57 */
    
#define FriBidiPropertyBlockLevel7_FE5C 0xC4
    
    FriBidiPropertyBlockLevel8_0026,  /* FE5C..FE5D */
    FriBidiPropertyBlockLevel8_0022,  /* FE5E..FE5F */
    
#define FriBidiPropertyBlockLevel7_FE60 0xC6
    
    FriBidiPropertyBlockLevel8_0026,  /* FE60..FE61 */
    FriBidiPropertyBlockLevel8_207A,  /* FE62..FE63 */
    
#define FriBidiPropertyBlockLevel7_FE68 0xC8
    
    FriBidiPropertyBlockLevel8_0022,  /* FE68..FE69 */
    FriBidiPropertyBlockLevel8_2034,  /* FE6A..FE6B */
    
#define FriBidiPropertyBlockLevel7_FF00 0xCA
    
    FriBidiPropertyBlockLevel8_005A,  /* FF00..FF01 */
    FriBidiPropertyBlockLevel8_0022,  /* FF02..FF03 */
    
#define FriBidiPropertyBlockLevel7_FFE4 0xCC
    
    FriBidiPropertyBlockLevel8_0022,  /* FFE4..FFE5 */
    FriBidiPropertyBlockLevel8_212E,  /* FFE6..FFE7 */
    
#define FriBidiPropertyBlockLevel7_FFF8 0xCE
    
    FriBidiPropertyBlockLevel8_FFF8,  /* FFF8..FFF9 */
    FriBidiPropertyBlockLevel8_0026,  /* FFFA..FFFB */
    
#define FriBidiPropertyBlockLevel7_FFFC 0xD0
    
    FriBidiPropertyBlockLevel8_0026,  /* FFFC..FFFD */
    FriBidiPropertyBlockLevel8_0000,  /* FFFE..FFFF */
    
#define FriBidiPropertyBlockLevel7_1091C 0xD2
    
    FriBidiPropertyBlockLevel8_05C8,  /* 1091C..1091D */
    FriBidiPropertyBlockLevel8_1091E,  /* 1091E..1091F */
    
#define FriBidiPropertyBlockLevel7_10A38 0xD4
    
    FriBidiPropertyBlockLevel8_0300,  /* 10A38..10A39 */
    FriBidiPropertyBlockLevel8_05C2,  /* 10A3A..10A3B */
    
#define FriBidiPropertyBlockLevel7_1D170 0xD6
    
    FriBidiPropertyBlockLevel8_0042,  /* 1D170..1D171 */
    FriBidiPropertyBlockLevel8_1D172,  /* 1D172..1D173 */
    
#define FriBidiPropertyBlockLevel7_1D178 0xD8
    
    FriBidiPropertyBlockLevel8_0000,  /* 1D178..1D179 */
    FriBidiPropertyBlockLevel8_1D17A,  /* 1D17A..1D17B */
    
#define FriBidiPropertyBlockLevel7_1D240 0xDA
    
    FriBidiPropertyBlockLevel8_0026,  /* 1D240..1D241 */
    FriBidiPropertyBlockLevel8_0300,  /* 1D242..1D243 */
    
#define FriBidiPropertyBlockLevel7_1D244 0xDC
    
    FriBidiPropertyBlockLevel8_06E8,  /* 1D244..1D245 */
    FriBidiPropertyBlockLevel8_0042,  /* 1D246..1D247 */
    
#define FriBidiPropertyBlockLevel7_1D7CC 0xDE
    
    FriBidiPropertyBlockLevel8_0042,  /* 1D7CC..1D7CD */
    FriBidiPropertyBlockLevel8_0030,  /* 1D7CE..1D7CF */
    
#define FriBidiPropertyBlockLevel7_1FFFC 0xE0
    
    FriBidiPropertyBlockLevel8_0042,  /* 1FFFC..1FFFD */
    FriBidiPropertyBlockLevel8_0000,  /* 1FFFE..1FFFF */
};

static const PACKTAB_UINT8 FriBidiPropertyBlockLevel6[4*177] = {
    
#define FriBidiPropertyBlockLevel6_0000 0x0
    
    FriBidiPropertyBlockLevel7_0000,  /* 0000..0003 */
    FriBidiPropertyBlockLevel7_0000,  /* 0004..0007 */
    FriBidiPropertyBlockLevel7_0008,  /* 0008..000B */
    FriBidiPropertyBlockLevel7_000C,  /* 000C..000F */
    
#define FriBidiPropertyBlockLevel6_0010 0x4
    
    FriBidiPropertyBlockLevel7_0000,  /* 0010..0013 */
    FriBidiPropertyBlockLevel7_0000,  /* 0014..0017 */
    FriBidiPropertyBlockLevel7_0000,  /* 0018..001B */
    FriBidiPropertyBlockLevel7_001C,  /* 001C..001F */
    
#define FriBidiPropertyBlockLevel6_0020 0x8
    
    FriBidiPropertyBlockLevel7_0020,  /* 0020..0023 */
    FriBidiPropertyBlockLevel7_0024,  /* 0024..0027 */
    FriBidiPropertyBlockLevel7_0028,  /* 0028..002B */
    FriBidiPropertyBlockLevel7_002C,  /* 002C..002F */
    
#define FriBidiPropertyBlockLevel6_0030 0xC
    
    FriBidiPropertyBlockLevel7_0030,  /* 0030..0033 */
    FriBidiPropertyBlockLevel7_0030,  /* 0034..0037 */
    FriBidiPropertyBlockLevel7_0038,  /* 0038..003B */
    FriBidiPropertyBlockLevel7_003C,  /* 003C..003F */
    
#define FriBidiPropertyBlockLevel6_0040 0x10
    
    FriBidiPropertyBlockLevel7_0040,  /* 0040..0043 */
    FriBidiPropertyBlockLevel7_0044,  /* 0044..0047 */
    FriBidiPropertyBlockLevel7_0044,  /* 0048..004B */
    FriBidiPropertyBlockLevel7_0044,  /* 004C..004F */
    
#define FriBidiPropertyBlockLevel6_0050 0x14
    
    FriBidiPropertyBlockLevel7_0044,  /* 0050..0053 */
    FriBidiPropertyBlockLevel7_0044,  /* 0054..0057 */
    FriBidiPropertyBlockLevel7_0058,  /* 0058..005B */
    FriBidiPropertyBlockLevel7_003C,  /* 005C..005F */
    
#define FriBidiPropertyBlockLevel6_0070 0x18
    
    FriBidiPropertyBlockLevel7_0044,  /* 0070..0073 */
    FriBidiPropertyBlockLevel7_0044,  /* 0074..0077 */
    FriBidiPropertyBlockLevel7_0058,  /* 0078..007B */
    FriBidiPropertyBlockLevel7_007C,  /* 007C..007F */
    
#define FriBidiPropertyBlockLevel6_0080 0x1C
    
    FriBidiPropertyBlockLevel7_0000,  /* 0080..0083 */
    FriBidiPropertyBlockLevel7_0084,  /* 0084..0087 */
    FriBidiPropertyBlockLevel7_0000,  /* 0088..008B */
    FriBidiPropertyBlockLevel7_0000,  /* 008C..008F */
    
#define FriBidiPropertyBlockLevel6_0090 0x20
    
    FriBidiPropertyBlockLevel7_0000,  /* 0090..0093 */
    FriBidiPropertyBlockLevel7_0000,  /* 0094..0097 */
    FriBidiPropertyBlockLevel7_0000,  /* 0098..009B */
    FriBidiPropertyBlockLevel7_0000,  /* 009C..009F */
    
#define FriBidiPropertyBlockLevel6_00A0 0x24
    
    FriBidiPropertyBlockLevel7_00A0,  /* 00A0..00A3 */
    FriBidiPropertyBlockLevel7_0024,  /* 00A4..00A7 */
    FriBidiPropertyBlockLevel7_00A8,  /* 00A8..00AB */
    FriBidiPropertyBlockLevel7_00AC,  /* 00AC..00AF */
    
#define FriBidiPropertyBlockLevel6_00B0 0x28
    
    FriBidiPropertyBlockLevel7_00B0,  /* 00B0..00B3 */
    FriBidiPropertyBlockLevel7_00B4,  /* 00B4..00B7 */
    FriBidiPropertyBlockLevel7_00B8,  /* 00B8..00BB */
    FriBidiPropertyBlockLevel7_003C,  /* 00BC..00BF */
    
#define FriBidiPropertyBlockLevel6_00C0 0x2C
    
    FriBidiPropertyBlockLevel7_0044,  /* 00C0..00C3 */
    FriBidiPropertyBlockLevel7_0044,  /* 00C4..00C7 */
    FriBidiPropertyBlockLevel7_0044,  /* 00C8..00CB */
    FriBidiPropertyBlockLevel7_0044,  /* 00CC..00CF */
    
#define FriBidiPropertyBlockLevel6_00D0 0x30
    
    FriBidiPropertyBlockLevel7_0044,  /* 00D0..00D3 */
    FriBidiPropertyBlockLevel7_0058,  /* 00D4..00D7 */
    FriBidiPropertyBlockLevel7_0044,  /* 00D8..00DB */
    FriBidiPropertyBlockLevel7_0044,  /* 00DC..00DF */
    
#define FriBidiPropertyBlockLevel6_02B0 0x34
    
    FriBidiPropertyBlockLevel7_0044,  /* 02B0..02B3 */
    FriBidiPropertyBlockLevel7_0044,  /* 02B4..02B7 */
    FriBidiPropertyBlockLevel7_02B8,  /* 02B8..02BB */
    FriBidiPropertyBlockLevel7_0044,  /* 02BC..02BF */
    
#define FriBidiPropertyBlockLevel6_02C0 0x38
    
    FriBidiPropertyBlockLevel7_02C0,  /* 02C0..02C3 */
    FriBidiPropertyBlockLevel7_003C,  /* 02C4..02C7 */
    FriBidiPropertyBlockLevel7_003C,  /* 02C8..02CB */
    FriBidiPropertyBlockLevel7_003C,  /* 02CC..02CF */
    
#define FriBidiPropertyBlockLevel6_02E0 0x3C
    
    FriBidiPropertyBlockLevel7_0044,  /* 02E0..02E3 */
    FriBidiPropertyBlockLevel7_02E4,  /* 02E4..02E7 */
    FriBidiPropertyBlockLevel7_003C,  /* 02E8..02EB */
    FriBidiPropertyBlockLevel7_00A8,  /* 02EC..02EF */
    
#define FriBidiPropertyBlockLevel6_02F0 0x40
    
    FriBidiPropertyBlockLevel7_003C,  /* 02F0..02F3 */
    FriBidiPropertyBlockLevel7_003C,  /* 02F4..02F7 */
    FriBidiPropertyBlockLevel7_003C,  /* 02F8..02FB */
    FriBidiPropertyBlockLevel7_003C,  /* 02FC..02FF */
    
#define FriBidiPropertyBlockLevel6_0300 0x44
    
    FriBidiPropertyBlockLevel7_0300,  /* 0300..0303 */
    FriBidiPropertyBlockLevel7_0300,  /* 0304..0307 */
    FriBidiPropertyBlockLevel7_0300,  /* 0308..030B */
    FriBidiPropertyBlockLevel7_0300,  /* 030C..030F */
    
#define FriBidiPropertyBlockLevel6_0370 0x48
    
    FriBidiPropertyBlockLevel7_0044,  /* 0370..0373 */
    FriBidiPropertyBlockLevel7_0374,  /* 0374..0377 */
    FriBidiPropertyBlockLevel7_0044,  /* 0378..037B */
    FriBidiPropertyBlockLevel7_037C,  /* 037C..037F */
    
#define FriBidiPropertyBlockLevel6_0380 0x4C
    
    FriBidiPropertyBlockLevel7_0044,  /* 0380..0383 */
    FriBidiPropertyBlockLevel7_00A8,  /* 0384..0387 */
    FriBidiPropertyBlockLevel7_0044,  /* 0388..038B */
    FriBidiPropertyBlockLevel7_0044,  /* 038C..038F */
    
#define FriBidiPropertyBlockLevel6_03F0 0x50
    
    FriBidiPropertyBlockLevel7_0044,  /* 03F0..03F3 */
    FriBidiPropertyBlockLevel7_037C,  /* 03F4..03F7 */
    FriBidiPropertyBlockLevel7_0044,  /* 03F8..03FB */
    FriBidiPropertyBlockLevel7_0044,  /* 03FC..03FF */
    
#define FriBidiPropertyBlockLevel6_0480 0x54
    
    FriBidiPropertyBlockLevel7_0480,  /* 0480..0483 */
    FriBidiPropertyBlockLevel7_0484,  /* 0484..0487 */
    FriBidiPropertyBlockLevel7_0488,  /* 0488..048B */
    FriBidiPropertyBlockLevel7_0044,  /* 048C..048F */
    
#define FriBidiPropertyBlockLevel6_0580 0x58
    
    FriBidiPropertyBlockLevel7_0044,  /* 0580..0583 */
    FriBidiPropertyBlockLevel7_0044,  /* 0584..0587 */
    FriBidiPropertyBlockLevel7_037C,  /* 0588..058B */
    FriBidiPropertyBlockLevel7_0044,  /* 058C..058F */
    
#define FriBidiPropertyBlockLevel6_0590 0x5C
    
    FriBidiPropertyBlockLevel7_0590,  /* 0590..0593 */
    FriBidiPropertyBlockLevel7_0300,  /* 0594..0597 */
    FriBidiPropertyBlockLevel7_0300,  /* 0598..059B */
    FriBidiPropertyBlockLevel7_0300,  /* 059C..059F */
    
#define FriBidiPropertyBlockLevel6_05B0 0x60
    
    FriBidiPropertyBlockLevel7_0300,  /* 05B0..05B3 */
    FriBidiPropertyBlockLevel7_0300,  /* 05B4..05B7 */
    FriBidiPropertyBlockLevel7_0300,  /* 05B8..05BB */
    FriBidiPropertyBlockLevel7_05BC,  /* 05BC..05BF */
    
#define FriBidiPropertyBlockLevel6_05C0 0x64
    
    FriBidiPropertyBlockLevel7_05C0,  /* 05C0..05C3 */
    FriBidiPropertyBlockLevel7_05BC,  /* 05C4..05C7 */
    FriBidiPropertyBlockLevel7_05C8,  /* 05C8..05CB */
    FriBidiPropertyBlockLevel7_05C8,  /* 05CC..05CF */
    
#define FriBidiPropertyBlockLevel6_05D0 0x68
    
    FriBidiPropertyBlockLevel7_05C8,  /* 05D0..05D3 */
    FriBidiPropertyBlockLevel7_05C8,  /* 05D4..05D7 */
    FriBidiPropertyBlockLevel7_05C8,  /* 05D8..05DB */
    FriBidiPropertyBlockLevel7_05C8,  /* 05DC..05DF */
    
#define FriBidiPropertyBlockLevel6_0600 0x6C
    
    FriBidiPropertyBlockLevel7_0600,  /* 0600..0603 */
    FriBidiPropertyBlockLevel7_0600,  /* 0604..0607 */
    FriBidiPropertyBlockLevel7_0600,  /* 0608..060B */
    FriBidiPropertyBlockLevel7_060C,  /* 060C..060F */
    
#define FriBidiPropertyBlockLevel6_0610 0x70
    
    FriBidiPropertyBlockLevel7_0300,  /* 0610..0613 */
    FriBidiPropertyBlockLevel7_0614,  /* 0614..0617 */
    FriBidiPropertyBlockLevel7_0600,  /* 0618..061B */
    FriBidiPropertyBlockLevel7_0600,  /* 061C..061F */
    
#define FriBidiPropertyBlockLevel6_0620 0x74
    
    FriBidiPropertyBlockLevel7_0600,  /* 0620..0623 */
    FriBidiPropertyBlockLevel7_0600,  /* 0624..0627 */
    FriBidiPropertyBlockLevel7_0600,  /* 0628..062B */
    FriBidiPropertyBlockLevel7_0600,  /* 062C..062F */
    
#define FriBidiPropertyBlockLevel6_0640 0x78
    
    FriBidiPropertyBlockLevel7_0600,  /* 0640..0643 */
    FriBidiPropertyBlockLevel7_0600,  /* 0644..0647 */
    FriBidiPropertyBlockLevel7_0648,  /* 0648..064B */
    FriBidiPropertyBlockLevel7_0300,  /* 064C..064F */
    
#define FriBidiPropertyBlockLevel6_0650 0x7C
    
    FriBidiPropertyBlockLevel7_0300,  /* 0650..0653 */
    FriBidiPropertyBlockLevel7_0300,  /* 0654..0657 */
    FriBidiPropertyBlockLevel7_0300,  /* 0658..065B */
    FriBidiPropertyBlockLevel7_065C,  /* 065C..065F */
    
#define FriBidiPropertyBlockLevel6_0660 0x80
    
    FriBidiPropertyBlockLevel7_0660,  /* 0660..0663 */
    FriBidiPropertyBlockLevel7_0660,  /* 0664..0667 */
    FriBidiPropertyBlockLevel7_0668,  /* 0668..066B */
    FriBidiPropertyBlockLevel7_066C,  /* 066C..066F */
    
#define FriBidiPropertyBlockLevel6_0670 0x84
    
    FriBidiPropertyBlockLevel7_0670,  /* 0670..0673 */
    FriBidiPropertyBlockLevel7_0600,  /* 0674..0677 */
    FriBidiPropertyBlockLevel7_0600,  /* 0678..067B */
    FriBidiPropertyBlockLevel7_0600,  /* 067C..067F */
    
#define FriBidiPropertyBlockLevel6_06D0 0x88
    
    FriBidiPropertyBlockLevel7_0600,  /* 06D0..06D3 */
    FriBidiPropertyBlockLevel7_06D4,  /* 06D4..06D7 */
    FriBidiPropertyBlockLevel7_0300,  /* 06D8..06DB */
    FriBidiPropertyBlockLevel7_06DC,  /* 06DC..06DF */
    
#define FriBidiPropertyBlockLevel6_06E0 0x8C
    
    FriBidiPropertyBlockLevel7_0300,  /* 06E0..06E3 */
    FriBidiPropertyBlockLevel7_06E4,  /* 06E4..06E7 */
    FriBidiPropertyBlockLevel7_06E8,  /* 06E8..06EB */
    FriBidiPropertyBlockLevel7_0614,  /* 06EC..06EF */
    
#define FriBidiPropertyBlockLevel6_06F0 0x90
    
    FriBidiPropertyBlockLevel7_0030,  /* 06F0..06F3 */
    FriBidiPropertyBlockLevel7_0030,  /* 06F4..06F7 */
    FriBidiPropertyBlockLevel7_06F8,  /* 06F8..06FB */
    FriBidiPropertyBlockLevel7_0600,  /* 06FC..06FF */
    
#define FriBidiPropertyBlockLevel6_0700 0x94
    
    FriBidiPropertyBlockLevel7_0600,  /* 0700..0703 */
    FriBidiPropertyBlockLevel7_0600,  /* 0704..0707 */
    FriBidiPropertyBlockLevel7_0600,  /* 0708..070B */
    FriBidiPropertyBlockLevel7_070C,  /* 070C..070F */
    
#define FriBidiPropertyBlockLevel6_0710 0x98
    
    FriBidiPropertyBlockLevel7_0710,  /* 0710..0713 */
    FriBidiPropertyBlockLevel7_0600,  /* 0714..0717 */
    FriBidiPropertyBlockLevel7_0600,  /* 0718..071B */
    FriBidiPropertyBlockLevel7_0600,  /* 071C..071F */
    
#define FriBidiPropertyBlockLevel6_0740 0x9C
    
    FriBidiPropertyBlockLevel7_0300,  /* 0740..0743 */
    FriBidiPropertyBlockLevel7_0300,  /* 0744..0747 */
    FriBidiPropertyBlockLevel7_065C,  /* 0748..074B */
    FriBidiPropertyBlockLevel7_0600,  /* 074C..074F */
    
#define FriBidiPropertyBlockLevel6_07A0 0xA0
    
    FriBidiPropertyBlockLevel7_0600,  /* 07A0..07A3 */
    FriBidiPropertyBlockLevel7_06D4,  /* 07A4..07A7 */
    FriBidiPropertyBlockLevel7_0300,  /* 07A8..07AB */
    FriBidiPropertyBlockLevel7_0300,  /* 07AC..07AF */
    
#define FriBidiPropertyBlockLevel6_07E0 0xA4
    
    FriBidiPropertyBlockLevel7_05C8,  /* 07E0..07E3 */
    FriBidiPropertyBlockLevel7_05C8,  /* 07E4..07E7 */
    FriBidiPropertyBlockLevel7_07E8,  /* 07E8..07EB */
    FriBidiPropertyBlockLevel7_0300,  /* 07EC..07EF */
    
#define FriBidiPropertyBlockLevel6_07F0 0xA8
    
    FriBidiPropertyBlockLevel7_0300,  /* 07F0..07F3 */
    FriBidiPropertyBlockLevel7_07F4,  /* 07F4..07F7 */
    FriBidiPropertyBlockLevel7_07F8,  /* 07F8..07FB */
    FriBidiPropertyBlockLevel7_05C8,  /* 07FC..07FF */
    
#define FriBidiPropertyBlockLevel6_0900 0xAC
    
    FriBidiPropertyBlockLevel7_0900,  /* 0900..0903 */
    FriBidiPropertyBlockLevel7_0044,  /* 0904..0907 */
    FriBidiPropertyBlockLevel7_0044,  /* 0908..090B */
    FriBidiPropertyBlockLevel7_0044,  /* 090C..090F */
    
#define FriBidiPropertyBlockLevel6_0930 0xB0
    
    FriBidiPropertyBlockLevel7_0044,  /* 0930..0933 */
    FriBidiPropertyBlockLevel7_0044,  /* 0934..0937 */
    FriBidiPropertyBlockLevel7_0044,  /* 0938..093B */
    FriBidiPropertyBlockLevel7_093C,  /* 093C..093F */
    
#define FriBidiPropertyBlockLevel6_0940 0xB4
    
    FriBidiPropertyBlockLevel7_0940,  /* 0940..0943 */
    FriBidiPropertyBlockLevel7_0300,  /* 0944..0947 */
    FriBidiPropertyBlockLevel7_093C,  /* 0948..094B */
    FriBidiPropertyBlockLevel7_094C,  /* 094C..094F */
    
#define FriBidiPropertyBlockLevel6_0950 0xB8
    
    FriBidiPropertyBlockLevel7_0940,  /* 0950..0953 */
    FriBidiPropertyBlockLevel7_093C,  /* 0954..0957 */
    FriBidiPropertyBlockLevel7_0044,  /* 0958..095B */
    FriBidiPropertyBlockLevel7_0044,  /* 095C..095F */
    
#define FriBidiPropertyBlockLevel6_0960 0xBC
    
    FriBidiPropertyBlockLevel7_0960,  /* 0960..0963 */
    FriBidiPropertyBlockLevel7_0044,  /* 0964..0967 */
    FriBidiPropertyBlockLevel7_0044,  /* 0968..096B */
    FriBidiPropertyBlockLevel7_0044,  /* 096C..096F */
    
#define FriBidiPropertyBlockLevel6_0980 0xC0
    
    FriBidiPropertyBlockLevel7_094C,  /* 0980..0983 */
    FriBidiPropertyBlockLevel7_0044,  /* 0984..0987 */
    FriBidiPropertyBlockLevel7_0044,  /* 0988..098B */
    FriBidiPropertyBlockLevel7_0044,  /* 098C..098F */
    
#define FriBidiPropertyBlockLevel6_09C0 0xC4
    
    FriBidiPropertyBlockLevel7_0940,  /* 09C0..09C3 */
    FriBidiPropertyBlockLevel7_093C,  /* 09C4..09C7 */
    FriBidiPropertyBlockLevel7_0044,  /* 09C8..09CB */
    FriBidiPropertyBlockLevel7_094C,  /* 09CC..09CF */
    
#define FriBidiPropertyBlockLevel6_09F0 0xC8
    
    FriBidiPropertyBlockLevel7_09F0,  /* 09F0..09F3 */
    FriBidiPropertyBlockLevel7_0044,  /* 09F4..09F7 */
    FriBidiPropertyBlockLevel7_0044,  /* 09F8..09FB */
    FriBidiPropertyBlockLevel7_0044,  /* 09FC..09FF */
    
#define FriBidiPropertyBlockLevel6_0A40 0xCC
    
    FriBidiPropertyBlockLevel7_0900,  /* 0A40..0A43 */
    FriBidiPropertyBlockLevel7_0480,  /* 0A44..0A47 */
    FriBidiPropertyBlockLevel7_0A48,  /* 0A48..0A4B */
    FriBidiPropertyBlockLevel7_0488,  /* 0A4C..0A4F */
    
#define FriBidiPropertyBlockLevel6_0A70 0xD0
    
    FriBidiPropertyBlockLevel7_0488,  /* 0A70..0A73 */
    FriBidiPropertyBlockLevel7_0044,  /* 0A74..0A77 */
    FriBidiPropertyBlockLevel7_0044,  /* 0A78..0A7B */
    FriBidiPropertyBlockLevel7_0044,  /* 0A7C..0A7F */
    
#define FriBidiPropertyBlockLevel6_0AC0 0xD4
    
    FriBidiPropertyBlockLevel7_0940,  /* 0AC0..0AC3 */
    FriBidiPropertyBlockLevel7_0AC4,  /* 0AC4..0AC7 */
    FriBidiPropertyBlockLevel7_093C,  /* 0AC8..0ACB */
    FriBidiPropertyBlockLevel7_094C,  /* 0ACC..0ACF */
    
#define FriBidiPropertyBlockLevel6_0AF0 0xD8
    
    FriBidiPropertyBlockLevel7_0AF0,  /* 0AF0..0AF3 */
    FriBidiPropertyBlockLevel7_0044,  /* 0AF4..0AF7 */
    FriBidiPropertyBlockLevel7_0044,  /* 0AF8..0AFB */
    FriBidiPropertyBlockLevel7_0044,  /* 0AFC..0AFF */
    
#define FriBidiPropertyBlockLevel6_0B30 0xDC
    
    FriBidiPropertyBlockLevel7_0044,  /* 0B30..0B33 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B34..0B37 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B38..0B3B */
    FriBidiPropertyBlockLevel7_0A48,  /* 0B3C..0B3F */
    
#define FriBidiPropertyBlockLevel6_0B40 0xE0
    
    FriBidiPropertyBlockLevel7_0940,  /* 0B40..0B43 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B44..0B47 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B48..0B4B */
    FriBidiPropertyBlockLevel7_094C,  /* 0B4C..0B4F */
    
#define FriBidiPropertyBlockLevel6_0B50 0xE4
    
    FriBidiPropertyBlockLevel7_0044,  /* 0B50..0B53 */
    FriBidiPropertyBlockLevel7_0B54,  /* 0B54..0B57 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B58..0B5B */
    FriBidiPropertyBlockLevel7_0044,  /* 0B5C..0B5F */
    
#define FriBidiPropertyBlockLevel6_0B80 0xE8
    
    FriBidiPropertyBlockLevel7_0B54,  /* 0B80..0B83 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B84..0B87 */
    FriBidiPropertyBlockLevel7_0044,  /* 0B88..0B8B */
    FriBidiPropertyBlockLevel7_0044,  /* 0B8C..0B8F */
    
#define FriBidiPropertyBlockLevel6_0BC0 0xEC
    
    FriBidiPropertyBlockLevel7_093C,  /* 0BC0..0BC3 */
    FriBidiPropertyBlockLevel7_0044,  /* 0BC4..0BC7 */
    FriBidiPropertyBlockLevel7_0044,  /* 0BC8..0BCB */
    FriBidiPropertyBlockLevel7_094C,  /* 0BCC..0BCF */
    
#define FriBidiPropertyBlockLevel6_0BF0 0xF0
    
    FriBidiPropertyBlockLevel7_0058,  /* 0BF0..0BF3 */
    FriBidiPropertyBlockLevel7_003C,  /* 0BF4..0BF7 */
    FriBidiPropertyBlockLevel7_0BF8,  /* 0BF8..0BFB */
    FriBidiPropertyBlockLevel7_0044,  /* 0BFC..0BFF */
    
#define FriBidiPropertyBlockLevel6_0C30 0xF4
    
    FriBidiPropertyBlockLevel7_0044,  /* 0C30..0C33 */
    FriBidiPropertyBlockLevel7_0044,  /* 0C34..0C37 */
    FriBidiPropertyBlockLevel7_0044,  /* 0C38..0C3B */
    FriBidiPropertyBlockLevel7_0960,  /* 0C3C..0C3F */
    
#define FriBidiPropertyBlockLevel6_0C40 0xF8
    
    FriBidiPropertyBlockLevel7_093C,  /* 0C40..0C43 */
    FriBidiPropertyBlockLevel7_0960,  /* 0C44..0C47 */
    FriBidiPropertyBlockLevel7_0C48,  /* 0C48..0C4B */
    FriBidiPropertyBlockLevel7_0488,  /* 0C4C..0C4F */
    
#define FriBidiPropertyBlockLevel6_0C50 0xFC
    
    FriBidiPropertyBlockLevel7_0044,  /* 0C50..0C53 */
    FriBidiPropertyBlockLevel7_0900,  /* 0C54..0C57 */
    FriBidiPropertyBlockLevel7_0044,  /* 0C58..0C5B */
    FriBidiPropertyBlockLevel7_0044,  /* 0C5C..0C5F */
    
#define FriBidiPropertyBlockLevel6_0CC0 0x100
    
    FriBidiPropertyBlockLevel7_0044,  /* 0CC0..0CC3 */
    FriBidiPropertyBlockLevel7_0044,  /* 0CC4..0CC7 */
    FriBidiPropertyBlockLevel7_0044,  /* 0CC8..0CCB */
    FriBidiPropertyBlockLevel7_0488,  /* 0CCC..0CCF */
    
#define FriBidiPropertyBlockLevel6_0CF0 0x104
    
    FriBidiPropertyBlockLevel7_02B8,  /* 0CF0..0CF3 */
    FriBidiPropertyBlockLevel7_0044,  /* 0CF4..0CF7 */
    FriBidiPropertyBlockLevel7_0044,  /* 0CF8..0CFB */
    FriBidiPropertyBlockLevel7_0044,  /* 0CFC..0CFF */
    
#define FriBidiPropertyBlockLevel6_0DC0 0x108
    
    FriBidiPropertyBlockLevel7_0044,  /* 0DC0..0DC3 */
    FriBidiPropertyBlockLevel7_0044,  /* 0DC4..0DC7 */
    FriBidiPropertyBlockLevel7_0B54,  /* 0DC8..0DCB */
    FriBidiPropertyBlockLevel7_0044,  /* 0DCC..0DCF */
    
#define FriBidiPropertyBlockLevel6_0DD0 0x10C
    
    FriBidiPropertyBlockLevel7_0960,  /* 0DD0..0DD3 */
    FriBidiPropertyBlockLevel7_0DD4,  /* 0DD4..0DD7 */
    FriBidiPropertyBlockLevel7_0044,  /* 0DD8..0DDB */
    FriBidiPropertyBlockLevel7_0044,  /* 0DDC..0DDF */
    
#define FriBidiPropertyBlockLevel6_0E30 0x110
    
    FriBidiPropertyBlockLevel7_094C,  /* 0E30..0E33 */
    FriBidiPropertyBlockLevel7_0300,  /* 0E34..0E37 */
    FriBidiPropertyBlockLevel7_0484,  /* 0E38..0E3B */
    FriBidiPropertyBlockLevel7_0E3C,  /* 0E3C..0E3F */
    
#define FriBidiPropertyBlockLevel6_0E40 0x114
    
    FriBidiPropertyBlockLevel7_0044,  /* 0E40..0E43 */
    FriBidiPropertyBlockLevel7_0480,  /* 0E44..0E47 */
    FriBidiPropertyBlockLevel7_0300,  /* 0E48..0E4B */
    FriBidiPropertyBlockLevel7_0484,  /* 0E4C..0E4F */
    
#define FriBidiPropertyBlockLevel6_0EB0 0x118
    
    FriBidiPropertyBlockLevel7_094C,  /* 0EB0..0EB3 */
    FriBidiPropertyBlockLevel7_0300,  /* 0EB4..0EB7 */
    FriBidiPropertyBlockLevel7_0AC4,  /* 0EB8..0EBB */
    FriBidiPropertyBlockLevel7_093C,  /* 0EBC..0EBF */
    
#define FriBidiPropertyBlockLevel6_0EC0 0x11C
    
    FriBidiPropertyBlockLevel7_0044,  /* 0EC0..0EC3 */
    FriBidiPropertyBlockLevel7_0044,  /* 0EC4..0EC7 */
    FriBidiPropertyBlockLevel7_0300,  /* 0EC8..0ECB */
    FriBidiPropertyBlockLevel7_0488,  /* 0ECC..0ECF */
    
#define FriBidiPropertyBlockLevel6_0F10 0x120
    
    FriBidiPropertyBlockLevel7_0044,  /* 0F10..0F13 */
    FriBidiPropertyBlockLevel7_0044,  /* 0F14..0F17 */
    FriBidiPropertyBlockLevel7_0488,  /* 0F18..0F1B */
    FriBidiPropertyBlockLevel7_0044,  /* 0F1C..0F1F */
    
#define FriBidiPropertyBlockLevel6_0F30 0x124
    
    FriBidiPropertyBlockLevel7_0044,  /* 0F30..0F33 */
    FriBidiPropertyBlockLevel7_0F34,  /* 0F34..0F37 */
    FriBidiPropertyBlockLevel7_0F38,  /* 0F38..0F3B */
    FriBidiPropertyBlockLevel7_0374,  /* 0F3C..0F3F */
    
#define FriBidiPropertyBlockLevel6_0F70 0x128
    
    FriBidiPropertyBlockLevel7_0940,  /* 0F70..0F73 */
    FriBidiPropertyBlockLevel7_0300,  /* 0F74..0F77 */
    FriBidiPropertyBlockLevel7_0300,  /* 0F78..0F7B */
    FriBidiPropertyBlockLevel7_0484,  /* 0F7C..0F7F */
    
#define FriBidiPropertyBlockLevel6_0F80 0x12C
    
    FriBidiPropertyBlockLevel7_0300,  /* 0F80..0F83 */
    FriBidiPropertyBlockLevel7_0C48,  /* 0F84..0F87 */
    FriBidiPropertyBlockLevel7_0044,  /* 0F88..0F8B */
    FriBidiPropertyBlockLevel7_0044,  /* 0F8C..0F8F */
    
#define FriBidiPropertyBlockLevel6_0F90 0x130
    
    FriBidiPropertyBlockLevel7_0300,  /* 0F90..0F93 */
    FriBidiPropertyBlockLevel7_0300,  /* 0F94..0F97 */
    FriBidiPropertyBlockLevel7_0940,  /* 0F98..0F9B */
    FriBidiPropertyBlockLevel7_0300,  /* 0F9C..0F9F */
    
#define FriBidiPropertyBlockLevel6_0FB0 0x134
    
    FriBidiPropertyBlockLevel7_0300,  /* 0FB0..0FB3 */
    FriBidiPropertyBlockLevel7_0300,  /* 0FB4..0FB7 */
    FriBidiPropertyBlockLevel7_0300,  /* 0FB8..0FBB */
    FriBidiPropertyBlockLevel7_093C,  /* 0FBC..0FBF */
    
#define FriBidiPropertyBlockLevel6_1020 0x138
    
    FriBidiPropertyBlockLevel7_0044,  /* 1020..1023 */
    FriBidiPropertyBlockLevel7_0044,  /* 1024..1027 */
    FriBidiPropertyBlockLevel7_0044,  /* 1028..102B */
    FriBidiPropertyBlockLevel7_0940,  /* 102C..102F */
    
#define FriBidiPropertyBlockLevel6_1030 0x13C
    
    FriBidiPropertyBlockLevel7_0DD4,  /* 1030..1033 */
    FriBidiPropertyBlockLevel7_0960,  /* 1034..1037 */
    FriBidiPropertyBlockLevel7_094C,  /* 1038..103B */
    FriBidiPropertyBlockLevel7_0044,  /* 103C..103F */
    
#define FriBidiPropertyBlockLevel6_1350 0x140
    
    FriBidiPropertyBlockLevel7_0044,  /* 1350..1353 */
    FriBidiPropertyBlockLevel7_0044,  /* 1354..1357 */
    FriBidiPropertyBlockLevel7_0044,  /* 1358..135B */
    FriBidiPropertyBlockLevel7_0480,  /* 135C..135F */
    
#define FriBidiPropertyBlockLevel6_1390 0x144
    
    FriBidiPropertyBlockLevel7_003C,  /* 1390..1393 */
    FriBidiPropertyBlockLevel7_003C,  /* 1394..1397 */
    FriBidiPropertyBlockLevel7_0374,  /* 1398..139B */
    FriBidiPropertyBlockLevel7_0044,  /* 139C..139F */
    
#define FriBidiPropertyBlockLevel6_1680 0x148
    
    FriBidiPropertyBlockLevel7_1680,  /* 1680..1683 */
    FriBidiPropertyBlockLevel7_0044,  /* 1684..1687 */
    FriBidiPropertyBlockLevel7_0044,  /* 1688..168B */
    FriBidiPropertyBlockLevel7_0044,  /* 168C..168F */
    
#define FriBidiPropertyBlockLevel6_1690 0x14C
    
    FriBidiPropertyBlockLevel7_0044,  /* 1690..1693 */
    FriBidiPropertyBlockLevel7_0044,  /* 1694..1697 */
    FriBidiPropertyBlockLevel7_0058,  /* 1698..169B */
    FriBidiPropertyBlockLevel7_0040,  /* 169C..169F */
    
#define FriBidiPropertyBlockLevel6_1710 0x150
    
    FriBidiPropertyBlockLevel7_0960,  /* 1710..1713 */
    FriBidiPropertyBlockLevel7_093C,  /* 1714..1717 */
    FriBidiPropertyBlockLevel7_0044,  /* 1718..171B */
    FriBidiPropertyBlockLevel7_0044,  /* 171C..171F */
    
#define FriBidiPropertyBlockLevel6_17B0 0x154
    
    FriBidiPropertyBlockLevel7_0044,  /* 17B0..17B3 */
    FriBidiPropertyBlockLevel7_0480,  /* 17B4..17B7 */
    FriBidiPropertyBlockLevel7_0300,  /* 17B8..17BB */
    FriBidiPropertyBlockLevel7_0488,  /* 17BC..17BF */
    
#define FriBidiPropertyBlockLevel6_17C0 0x158
    
    FriBidiPropertyBlockLevel7_0044,  /* 17C0..17C3 */
    FriBidiPropertyBlockLevel7_0B54,  /* 17C4..17C7 */
    FriBidiPropertyBlockLevel7_0940,  /* 17C8..17CB */
    FriBidiPropertyBlockLevel7_0300,  /* 17CC..17CF */
    
#define FriBidiPropertyBlockLevel6_17D0 0x15C
    
    FriBidiPropertyBlockLevel7_0300,  /* 17D0..17D3 */
    FriBidiPropertyBlockLevel7_0044,  /* 17D4..17D7 */
    FriBidiPropertyBlockLevel7_0E3C,  /* 17D8..17DB */
    FriBidiPropertyBlockLevel7_094C,  /* 17DC..17DF */
    
#define FriBidiPropertyBlockLevel6_1800 0x160
    
    FriBidiPropertyBlockLevel7_003C,  /* 1800..1803 */
    FriBidiPropertyBlockLevel7_003C,  /* 1804..1807 */
    FriBidiPropertyBlockLevel7_1808,  /* 1808..180B */
    FriBidiPropertyBlockLevel7_180C,  /* 180C..180F */
    
#define FriBidiPropertyBlockLevel6_18A0 0x164
    
    FriBidiPropertyBlockLevel7_0044,  /* 18A0..18A3 */
    FriBidiPropertyBlockLevel7_0044,  /* 18A4..18A7 */
    FriBidiPropertyBlockLevel7_094C,  /* 18A8..18AB */
    FriBidiPropertyBlockLevel7_0044,  /* 18AC..18AF */
    
#define FriBidiPropertyBlockLevel6_1920 0x168
    
    FriBidiPropertyBlockLevel7_0484,  /* 1920..1923 */
    FriBidiPropertyBlockLevel7_0480,  /* 1924..1927 */
    FriBidiPropertyBlockLevel7_0300,  /* 1928..192B */
    FriBidiPropertyBlockLevel7_0044,  /* 192C..192F */
    
#define FriBidiPropertyBlockLevel6_1930 0x16C
    
    FriBidiPropertyBlockLevel7_0B54,  /* 1930..1933 */
    FriBidiPropertyBlockLevel7_0044,  /* 1934..1937 */
    FriBidiPropertyBlockLevel7_0940,  /* 1938..193B */
    FriBidiPropertyBlockLevel7_0044,  /* 193C..193F */
    
#define FriBidiPropertyBlockLevel6_1940 0x170
    
    FriBidiPropertyBlockLevel7_0040,  /* 1940..1943 */
    FriBidiPropertyBlockLevel7_0374,  /* 1944..1947 */
    FriBidiPropertyBlockLevel7_0044,  /* 1948..194B */
    FriBidiPropertyBlockLevel7_0044,  /* 194C..194F */
    
#define FriBidiPropertyBlockLevel6_19D0 0x174
    
    FriBidiPropertyBlockLevel7_0044,  /* 19D0..19D3 */
    FriBidiPropertyBlockLevel7_0044,  /* 19D4..19D7 */
    FriBidiPropertyBlockLevel7_0044,  /* 19D8..19DB */
    FriBidiPropertyBlockLevel7_02C0,  /* 19DC..19DF */
    
#define FriBidiPropertyBlockLevel6_1A10 0x178
    
    FriBidiPropertyBlockLevel7_0044,  /* 1A10..1A13 */
    FriBidiPropertyBlockLevel7_0480,  /* 1A14..1A17 */
    FriBidiPropertyBlockLevel7_093C,  /* 1A18..1A1B */
    FriBidiPropertyBlockLevel7_0044,  /* 1A1C..1A1F */
    
#define FriBidiPropertyBlockLevel6_1B00 0x17C
    
    FriBidiPropertyBlockLevel7_0300,  /* 1B00..1B03 */
    FriBidiPropertyBlockLevel7_0044,  /* 1B04..1B07 */
    FriBidiPropertyBlockLevel7_0044,  /* 1B08..1B0B */
    FriBidiPropertyBlockLevel7_0044,  /* 1B0C..1B0F */
    
#define FriBidiPropertyBlockLevel6_1B30 0x180
    
    FriBidiPropertyBlockLevel7_0044,  /* 1B30..1B33 */
    FriBidiPropertyBlockLevel7_0C48,  /* 1B34..1B37 */
    FriBidiPropertyBlockLevel7_0484,  /* 1B38..1B3B */
    FriBidiPropertyBlockLevel7_093C,  /* 1B3C..1B3F */
    
#define FriBidiPropertyBlockLevel6_1B60 0x184
    
    FriBidiPropertyBlockLevel7_0044,  /* 1B60..1B63 */
    FriBidiPropertyBlockLevel7_0044,  /* 1B64..1B67 */
    FriBidiPropertyBlockLevel7_0480,  /* 1B68..1B6B */
    FriBidiPropertyBlockLevel7_0300,  /* 1B6C..1B6F */
    
#define FriBidiPropertyBlockLevel6_1DC0 0x188
    
    FriBidiPropertyBlockLevel7_0300,  /* 1DC0..1DC3 */
    FriBidiPropertyBlockLevel7_0300,  /* 1DC4..1DC7 */
    FriBidiPropertyBlockLevel7_0484,  /* 1DC8..1DCB */
    FriBidiPropertyBlockLevel7_0044,  /* 1DCC..1DCF */
    
#define FriBidiPropertyBlockLevel6_1FB0 0x18C
    
    FriBidiPropertyBlockLevel7_0044,  /* 1FB0..1FB3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FB4..1FB7 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FB8..1FBB */
    FriBidiPropertyBlockLevel7_1FBC,  /* 1FBC..1FBF */
    
#define FriBidiPropertyBlockLevel6_1FC0 0x190
    
    FriBidiPropertyBlockLevel7_0374,  /* 1FC0..1FC3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FC4..1FC7 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FC8..1FCB */
    FriBidiPropertyBlockLevel7_02E4,  /* 1FCC..1FCF */
    
#define FriBidiPropertyBlockLevel6_1FD0 0x194
    
    FriBidiPropertyBlockLevel7_0044,  /* 1FD0..1FD3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FD4..1FD7 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FD8..1FDB */
    FriBidiPropertyBlockLevel7_02E4,  /* 1FDC..1FDF */
    
#define FriBidiPropertyBlockLevel6_1FF0 0x198
    
    FriBidiPropertyBlockLevel7_0044,  /* 1FF0..1FF3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FF4..1FF7 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FF8..1FFB */
    FriBidiPropertyBlockLevel7_02B8,  /* 1FFC..1FFF */
    
#define FriBidiPropertyBlockLevel6_2000 0x19C
    
    FriBidiPropertyBlockLevel7_2000,  /* 2000..2003 */
    FriBidiPropertyBlockLevel7_2000,  /* 2004..2007 */
    FriBidiPropertyBlockLevel7_2008,  /* 2008..200B */
    FriBidiPropertyBlockLevel7_200C,  /* 200C..200F */
    
#define FriBidiPropertyBlockLevel6_2020 0x1A0
    
    FriBidiPropertyBlockLevel7_003C,  /* 2020..2023 */
    FriBidiPropertyBlockLevel7_003C,  /* 2024..2027 */
    FriBidiPropertyBlockLevel7_2028,  /* 2028..202B */
    FriBidiPropertyBlockLevel7_202C,  /* 202C..202F */
    
#define FriBidiPropertyBlockLevel6_2030 0x1A4
    
    FriBidiPropertyBlockLevel7_2030,  /* 2030..2033 */
    FriBidiPropertyBlockLevel7_2034,  /* 2034..2037 */
    FriBidiPropertyBlockLevel7_003C,  /* 2038..203B */
    FriBidiPropertyBlockLevel7_003C,  /* 203C..203F */
    
#define FriBidiPropertyBlockLevel6_2040 0x1A8
    
    FriBidiPropertyBlockLevel7_003C,  /* 2040..2043 */
    FriBidiPropertyBlockLevel7_2044,  /* 2044..2047 */
    FriBidiPropertyBlockLevel7_003C,  /* 2048..204B */
    FriBidiPropertyBlockLevel7_003C,  /* 204C..204F */
    
#define FriBidiPropertyBlockLevel6_2050 0x1AC
    
    FriBidiPropertyBlockLevel7_003C,  /* 2050..2053 */
    FriBidiPropertyBlockLevel7_003C,  /* 2054..2057 */
    FriBidiPropertyBlockLevel7_003C,  /* 2058..205B */
    FriBidiPropertyBlockLevel7_205C,  /* 205C..205F */
    
#define FriBidiPropertyBlockLevel6_2070 0x1B0
    
    FriBidiPropertyBlockLevel7_2070,  /* 2070..2073 */
    FriBidiPropertyBlockLevel7_0030,  /* 2074..2077 */
    FriBidiPropertyBlockLevel7_2078,  /* 2078..207B */
    FriBidiPropertyBlockLevel7_207C,  /* 207C..207F */
    
#define FriBidiPropertyBlockLevel6_2080 0x1B4
    
    FriBidiPropertyBlockLevel7_0030,  /* 2080..2083 */
    FriBidiPropertyBlockLevel7_0030,  /* 2084..2087 */
    FriBidiPropertyBlockLevel7_2078,  /* 2088..208B */
    FriBidiPropertyBlockLevel7_207C,  /* 208C..208F */
    
#define FriBidiPropertyBlockLevel6_20A0 0x1B8
    
    FriBidiPropertyBlockLevel7_2030,  /* 20A0..20A3 */
    FriBidiPropertyBlockLevel7_2030,  /* 20A4..20A7 */
    FriBidiPropertyBlockLevel7_2030,  /* 20A8..20AB */
    FriBidiPropertyBlockLevel7_2030,  /* 20AC..20AF */
    
#define FriBidiPropertyBlockLevel6_20B0 0x1BC
    
    FriBidiPropertyBlockLevel7_2030,  /* 20B0..20B3 */
    FriBidiPropertyBlockLevel7_20B4,  /* 20B4..20B7 */
    FriBidiPropertyBlockLevel7_0044,  /* 20B8..20BB */
    FriBidiPropertyBlockLevel7_0044,  /* 20BC..20BF */
    
#define FriBidiPropertyBlockLevel6_2100 0x1C0
    
    FriBidiPropertyBlockLevel7_00A8,  /* 2100..2103 */
    FriBidiPropertyBlockLevel7_207C,  /* 2104..2107 */
    FriBidiPropertyBlockLevel7_0374,  /* 2108..210B */
    FriBidiPropertyBlockLevel7_0044,  /* 210C..210F */
    
#define FriBidiPropertyBlockLevel6_2110 0x1C4
    
    FriBidiPropertyBlockLevel7_0044,  /* 2110..2113 */
    FriBidiPropertyBlockLevel7_00B4,  /* 2114..2117 */
    FriBidiPropertyBlockLevel7_0040,  /* 2118..211B */
    FriBidiPropertyBlockLevel7_02C0,  /* 211C..211F */
    
#define FriBidiPropertyBlockLevel6_2120 0x1C8
    
    FriBidiPropertyBlockLevel7_003C,  /* 2120..2123 */
    FriBidiPropertyBlockLevel7_1FBC,  /* 2124..2127 */
    FriBidiPropertyBlockLevel7_2128,  /* 2128..212B */
    FriBidiPropertyBlockLevel7_212C,  /* 212C..212F */
    
#define FriBidiPropertyBlockLevel6_2130 0x1CC
    
    FriBidiPropertyBlockLevel7_0044,  /* 2130..2133 */
    FriBidiPropertyBlockLevel7_0044,  /* 2134..2137 */
    FriBidiPropertyBlockLevel7_02C0,  /* 2138..213B */
    FriBidiPropertyBlockLevel7_0044,  /* 213C..213F */
    
#define FriBidiPropertyBlockLevel6_2140 0x1D0
    
    FriBidiPropertyBlockLevel7_003C,  /* 2140..2143 */
    FriBidiPropertyBlockLevel7_0040,  /* 2144..2147 */
    FriBidiPropertyBlockLevel7_02C0,  /* 2148..214B */
    FriBidiPropertyBlockLevel7_0374,  /* 214C..214F */
    
#define FriBidiPropertyBlockLevel6_2150 0x1D4
    
    FriBidiPropertyBlockLevel7_0058,  /* 2150..2153 */
    FriBidiPropertyBlockLevel7_003C,  /* 2154..2157 */
    FriBidiPropertyBlockLevel7_003C,  /* 2158..215B */
    FriBidiPropertyBlockLevel7_003C,  /* 215C..215F */
    
#define FriBidiPropertyBlockLevel6_2210 0x1D8
    
    FriBidiPropertyBlockLevel7_2210,  /* 2210..2213 */
    FriBidiPropertyBlockLevel7_003C,  /* 2214..2217 */
    FriBidiPropertyBlockLevel7_003C,  /* 2218..221B */
    FriBidiPropertyBlockLevel7_003C,  /* 221C..221F */
    
#define FriBidiPropertyBlockLevel6_2330 0x1DC
    
    FriBidiPropertyBlockLevel7_003C,  /* 2330..2333 */
    FriBidiPropertyBlockLevel7_0374,  /* 2334..2337 */
    FriBidiPropertyBlockLevel7_0044,  /* 2338..233B */
    FriBidiPropertyBlockLevel7_0044,  /* 233C..233F */
    
#define FriBidiPropertyBlockLevel6_2390 0x1E0
    
    FriBidiPropertyBlockLevel7_003C,  /* 2390..2393 */
    FriBidiPropertyBlockLevel7_00B4,  /* 2394..2397 */
    FriBidiPropertyBlockLevel7_003C,  /* 2398..239B */
    FriBidiPropertyBlockLevel7_003C,  /* 239C..239F */
    
#define FriBidiPropertyBlockLevel6_23E0 0x1E4
    
    FriBidiPropertyBlockLevel7_003C,  /* 23E0..23E3 */
    FriBidiPropertyBlockLevel7_003C,  /* 23E4..23E7 */
    FriBidiPropertyBlockLevel7_0044,  /* 23E8..23EB */
    FriBidiPropertyBlockLevel7_0044,  /* 23EC..23EF */
    
#define FriBidiPropertyBlockLevel6_2420 0x1E8
    
    FriBidiPropertyBlockLevel7_003C,  /* 2420..2423 */
    FriBidiPropertyBlockLevel7_207C,  /* 2424..2427 */
    FriBidiPropertyBlockLevel7_0044,  /* 2428..242B */
    FriBidiPropertyBlockLevel7_0044,  /* 242C..242F */
    
#define FriBidiPropertyBlockLevel6_2440 0x1EC
    
    FriBidiPropertyBlockLevel7_003C,  /* 2440..2443 */
    FriBidiPropertyBlockLevel7_003C,  /* 2444..2447 */
    FriBidiPropertyBlockLevel7_207C,  /* 2448..244B */
    FriBidiPropertyBlockLevel7_0044,  /* 244C..244F */
    
#define FriBidiPropertyBlockLevel6_2480 0x1F0
    
    FriBidiPropertyBlockLevel7_003C,  /* 2480..2483 */
    FriBidiPropertyBlockLevel7_003C,  /* 2484..2487 */
    FriBidiPropertyBlockLevel7_0030,  /* 2488..248B */
    FriBidiPropertyBlockLevel7_0030,  /* 248C..248F */
    
#define FriBidiPropertyBlockLevel6_2490 0x1F4
    
    FriBidiPropertyBlockLevel7_0030,  /* 2490..2493 */
    FriBidiPropertyBlockLevel7_0030,  /* 2494..2497 */
    FriBidiPropertyBlockLevel7_0030,  /* 2498..249B */
    FriBidiPropertyBlockLevel7_0044,  /* 249C..249F */
    
#define FriBidiPropertyBlockLevel6_24E0 0x1F8
    
    FriBidiPropertyBlockLevel7_0044,  /* 24E0..24E3 */
    FriBidiPropertyBlockLevel7_0044,  /* 24E4..24E7 */
    FriBidiPropertyBlockLevel7_02C0,  /* 24E8..24EB */
    FriBidiPropertyBlockLevel7_003C,  /* 24EC..24EF */
    
#define FriBidiPropertyBlockLevel6_2690 0x1FC
    
    FriBidiPropertyBlockLevel7_003C,  /* 2690..2693 */
    FriBidiPropertyBlockLevel7_003C,  /* 2694..2697 */
    FriBidiPropertyBlockLevel7_003C,  /* 2698..269B */
    FriBidiPropertyBlockLevel7_0040,  /* 269C..269F */
    
#define FriBidiPropertyBlockLevel6_26A0 0x200
    
    FriBidiPropertyBlockLevel7_003C,  /* 26A0..26A3 */
    FriBidiPropertyBlockLevel7_003C,  /* 26A4..26A7 */
    FriBidiPropertyBlockLevel7_003C,  /* 26A8..26AB */
    FriBidiPropertyBlockLevel7_02E4,  /* 26AC..26AF */
    
#define FriBidiPropertyBlockLevel6_26B0 0x204
    
    FriBidiPropertyBlockLevel7_207C,  /* 26B0..26B3 */
    FriBidiPropertyBlockLevel7_0044,  /* 26B4..26B7 */
    FriBidiPropertyBlockLevel7_0044,  /* 26B8..26BB */
    FriBidiPropertyBlockLevel7_0044,  /* 26BC..26BF */
    
#define FriBidiPropertyBlockLevel6_2700 0x208
    
    FriBidiPropertyBlockLevel7_02E4,  /* 2700..2703 */
    FriBidiPropertyBlockLevel7_00B4,  /* 2704..2707 */
    FriBidiPropertyBlockLevel7_0374,  /* 2708..270B */
    FriBidiPropertyBlockLevel7_003C,  /* 270C..270F */
    
#define FriBidiPropertyBlockLevel6_2720 0x20C
    
    FriBidiPropertyBlockLevel7_003C,  /* 2720..2723 */
    FriBidiPropertyBlockLevel7_003C,  /* 2724..2727 */
    FriBidiPropertyBlockLevel7_02E4,  /* 2728..272B */
    FriBidiPropertyBlockLevel7_003C,  /* 272C..272F */
    
#define FriBidiPropertyBlockLevel6_2740 0x210
    
    FriBidiPropertyBlockLevel7_003C,  /* 2740..2743 */
    FriBidiPropertyBlockLevel7_003C,  /* 2744..2747 */
    FriBidiPropertyBlockLevel7_003C,  /* 2748..274B */
    FriBidiPropertyBlockLevel7_1FBC,  /* 274C..274F */
    
#define FriBidiPropertyBlockLevel6_2750 0x214
    
    FriBidiPropertyBlockLevel7_207C,  /* 2750..2753 */
    FriBidiPropertyBlockLevel7_037C,  /* 2754..2757 */
    FriBidiPropertyBlockLevel7_003C,  /* 2758..275B */
    FriBidiPropertyBlockLevel7_207C,  /* 275C..275F */
    
#define FriBidiPropertyBlockLevel6_2760 0x218
    
    FriBidiPropertyBlockLevel7_02E4,  /* 2760..2763 */
    FriBidiPropertyBlockLevel7_003C,  /* 2764..2767 */
    FriBidiPropertyBlockLevel7_003C,  /* 2768..276B */
    FriBidiPropertyBlockLevel7_003C,  /* 276C..276F */
    
#define FriBidiPropertyBlockLevel6_2790 0x21C
    
    FriBidiPropertyBlockLevel7_003C,  /* 2790..2793 */
    FriBidiPropertyBlockLevel7_0040,  /* 2794..2797 */
    FriBidiPropertyBlockLevel7_003C,  /* 2798..279B */
    FriBidiPropertyBlockLevel7_003C,  /* 279C..279F */
    
#define FriBidiPropertyBlockLevel6_27B0 0x220
    
    FriBidiPropertyBlockLevel7_02E4,  /* 27B0..27B3 */
    FriBidiPropertyBlockLevel7_003C,  /* 27B4..27B7 */
    FriBidiPropertyBlockLevel7_003C,  /* 27B8..27BB */
    FriBidiPropertyBlockLevel7_207C,  /* 27BC..27BF */
    
#define FriBidiPropertyBlockLevel6_27E0 0x224
    
    FriBidiPropertyBlockLevel7_003C,  /* 27E0..27E3 */
    FriBidiPropertyBlockLevel7_003C,  /* 27E4..27E7 */
    FriBidiPropertyBlockLevel7_003C,  /* 27E8..27EB */
    FriBidiPropertyBlockLevel7_0044,  /* 27EC..27EF */
    
#define FriBidiPropertyBlockLevel6_2B20 0x228
    
    FriBidiPropertyBlockLevel7_003C,  /* 2B20..2B23 */
    FriBidiPropertyBlockLevel7_0044,  /* 2B24..2B27 */
    FriBidiPropertyBlockLevel7_0044,  /* 2B28..2B2B */
    FriBidiPropertyBlockLevel7_0044,  /* 2B2C..2B2F */
    
#define FriBidiPropertyBlockLevel6_2CE0 0x22C
    
    FriBidiPropertyBlockLevel7_0044,  /* 2CE0..2CE3 */
    FriBidiPropertyBlockLevel7_02E4,  /* 2CE4..2CE7 */
    FriBidiPropertyBlockLevel7_207C,  /* 2CE8..2CEB */
    FriBidiPropertyBlockLevel7_0044,  /* 2CEC..2CEF */
    
#define FriBidiPropertyBlockLevel6_2CF0 0x230
    
    FriBidiPropertyBlockLevel7_0044,  /* 2CF0..2CF3 */
    FriBidiPropertyBlockLevel7_0044,  /* 2CF4..2CF7 */
    FriBidiPropertyBlockLevel7_02E4,  /* 2CF8..2CFB */
    FriBidiPropertyBlockLevel7_003C,  /* 2CFC..2CFF */
    
#define FriBidiPropertyBlockLevel6_2E10 0x234
    
    FriBidiPropertyBlockLevel7_003C,  /* 2E10..2E13 */
    FriBidiPropertyBlockLevel7_003C,  /* 2E14..2E17 */
    FriBidiPropertyBlockLevel7_0044,  /* 2E18..2E1B */
    FriBidiPropertyBlockLevel7_0374,  /* 2E1C..2E1F */
    
#define FriBidiPropertyBlockLevel6_2E90 0x238
    
    FriBidiPropertyBlockLevel7_003C,  /* 2E90..2E93 */
    FriBidiPropertyBlockLevel7_003C,  /* 2E94..2E97 */
    FriBidiPropertyBlockLevel7_00A8,  /* 2E98..2E9B */
    FriBidiPropertyBlockLevel7_003C,  /* 2E9C..2E9F */
    
#define FriBidiPropertyBlockLevel6_3000 0x23C
    
    FriBidiPropertyBlockLevel7_3000,  /* 3000..3003 */
    FriBidiPropertyBlockLevel7_0040,  /* 3004..3007 */
    FriBidiPropertyBlockLevel7_003C,  /* 3008..300B */
    FriBidiPropertyBlockLevel7_003C,  /* 300C..300F */
    
#define FriBidiPropertyBlockLevel6_3020 0x240
    
    FriBidiPropertyBlockLevel7_0040,  /* 3020..3023 */
    FriBidiPropertyBlockLevel7_0044,  /* 3024..3027 */
    FriBidiPropertyBlockLevel7_0960,  /* 3028..302B */
    FriBidiPropertyBlockLevel7_0300,  /* 302C..302F */
    
#define FriBidiPropertyBlockLevel6_3030 0x244
    
    FriBidiPropertyBlockLevel7_0040,  /* 3030..3033 */
    FriBidiPropertyBlockLevel7_02C0,  /* 3034..3037 */
    FriBidiPropertyBlockLevel7_0044,  /* 3038..303B */
    FriBidiPropertyBlockLevel7_02E4,  /* 303C..303F */
    
#define FriBidiPropertyBlockLevel6_3090 0x248
    
    FriBidiPropertyBlockLevel7_0044,  /* 3090..3093 */
    FriBidiPropertyBlockLevel7_0044,  /* 3094..3097 */
    FriBidiPropertyBlockLevel7_3098,  /* 3098..309B */
    FriBidiPropertyBlockLevel7_0040,  /* 309C..309F */
    
#define FriBidiPropertyBlockLevel6_30F0 0x24C
    
    FriBidiPropertyBlockLevel7_0044,  /* 30F0..30F3 */
    FriBidiPropertyBlockLevel7_0044,  /* 30F4..30F7 */
    FriBidiPropertyBlockLevel7_0058,  /* 30F8..30FB */
    FriBidiPropertyBlockLevel7_0044,  /* 30FC..30FF */
    
#define FriBidiPropertyBlockLevel6_3270 0x250
    
    FriBidiPropertyBlockLevel7_0044,  /* 3270..3273 */
    FriBidiPropertyBlockLevel7_0044,  /* 3274..3277 */
    FriBidiPropertyBlockLevel7_0044,  /* 3278..327B */
    FriBidiPropertyBlockLevel7_207C,  /* 327C..327F */
    
#define FriBidiPropertyBlockLevel6_32C0 0x254
    
    FriBidiPropertyBlockLevel7_0044,  /* 32C0..32C3 */
    FriBidiPropertyBlockLevel7_0044,  /* 32C4..32C7 */
    FriBidiPropertyBlockLevel7_0044,  /* 32C8..32CB */
    FriBidiPropertyBlockLevel7_003C,  /* 32CC..32CF */
    
#define FriBidiPropertyBlockLevel6_3370 0x258
    
    FriBidiPropertyBlockLevel7_0044,  /* 3370..3373 */
    FriBidiPropertyBlockLevel7_0058,  /* 3374..3377 */
    FriBidiPropertyBlockLevel7_207C,  /* 3378..337B */
    FriBidiPropertyBlockLevel7_0044,  /* 337C..337F */
    
#define FriBidiPropertyBlockLevel6_33F0 0x25C
    
    FriBidiPropertyBlockLevel7_0044,  /* 33F0..33F3 */
    FriBidiPropertyBlockLevel7_0044,  /* 33F4..33F7 */
    FriBidiPropertyBlockLevel7_0044,  /* 33F8..33FB */
    FriBidiPropertyBlockLevel7_0058,  /* 33FC..33FF */
    
#define FriBidiPropertyBlockLevel6_A720 0x260
    
    FriBidiPropertyBlockLevel7_0374,  /* A720..A723 */
    FriBidiPropertyBlockLevel7_0044,  /* A724..A727 */
    FriBidiPropertyBlockLevel7_0044,  /* A728..A72B */
    FriBidiPropertyBlockLevel7_0044,  /* A72C..A72F */
    
#define FriBidiPropertyBlockLevel6_A800 0x264
    
    FriBidiPropertyBlockLevel7_0B54,  /* A800..A803 */
    FriBidiPropertyBlockLevel7_0B54,  /* A804..A807 */
    FriBidiPropertyBlockLevel7_0480,  /* A808..A80B */
    FriBidiPropertyBlockLevel7_0044,  /* A80C..A80F */
    
#define FriBidiPropertyBlockLevel6_A820 0x268
    
    FriBidiPropertyBlockLevel7_0044,  /* A820..A823 */
    FriBidiPropertyBlockLevel7_0900,  /* A824..A827 */
    FriBidiPropertyBlockLevel7_003C,  /* A828..A82B */
    FriBidiPropertyBlockLevel7_0044,  /* A82C..A82F */
    
#define FriBidiPropertyBlockLevel6_A870 0x26C
    
    FriBidiPropertyBlockLevel7_0044,  /* A870..A873 */
    FriBidiPropertyBlockLevel7_003C,  /* A874..A877 */
    FriBidiPropertyBlockLevel7_0044,  /* A878..A87B */
    FriBidiPropertyBlockLevel7_0044,  /* A87C..A87F */
    
#define FriBidiPropertyBlockLevel6_FB10 0x270
    
    FriBidiPropertyBlockLevel7_0044,  /* FB10..FB13 */
    FriBidiPropertyBlockLevel7_0044,  /* FB14..FB17 */
    FriBidiPropertyBlockLevel7_0044,  /* FB18..FB1B */
    FriBidiPropertyBlockLevel7_FB1C,  /* FB1C..FB1F */
    
#define FriBidiPropertyBlockLevel6_FB20 0x274
    
    FriBidiPropertyBlockLevel7_05C8,  /* FB20..FB23 */
    FriBidiPropertyBlockLevel7_05C8,  /* FB24..FB27 */
    FriBidiPropertyBlockLevel7_FB28,  /* FB28..FB2B */
    FriBidiPropertyBlockLevel7_05C8,  /* FB2C..FB2F */
    
#define FriBidiPropertyBlockLevel6_FD30 0x278
    
    FriBidiPropertyBlockLevel7_0600,  /* FD30..FD33 */
    FriBidiPropertyBlockLevel7_0600,  /* FD34..FD37 */
    FriBidiPropertyBlockLevel7_0600,  /* FD38..FD3B */
    FriBidiPropertyBlockLevel7_FD3C,  /* FD3C..FD3F */
    
#define FriBidiPropertyBlockLevel6_FDF0 0x27C
    
    FriBidiPropertyBlockLevel7_0600,  /* FDF0..FDF3 */
    FriBidiPropertyBlockLevel7_0600,  /* FDF4..FDF7 */
    FriBidiPropertyBlockLevel7_0600,  /* FDF8..FDFB */
    FriBidiPropertyBlockLevel7_FDFC,  /* FDFC..FDFF */
    
#define FriBidiPropertyBlockLevel6_FE50 0x280
    
    FriBidiPropertyBlockLevel7_FE50,  /* FE50..FE53 */
    FriBidiPropertyBlockLevel7_FE54,  /* FE54..FE57 */
    FriBidiPropertyBlockLevel7_003C,  /* FE58..FE5B */
    FriBidiPropertyBlockLevel7_FE5C,  /* FE5C..FE5F */
    
#define FriBidiPropertyBlockLevel6_FE60 0x284
    
    FriBidiPropertyBlockLevel7_FE60,  /* FE60..FE63 */
    FriBidiPropertyBlockLevel7_207C,  /* FE64..FE67 */
    FriBidiPropertyBlockLevel7_FE68,  /* FE68..FE6B */
    FriBidiPropertyBlockLevel7_0044,  /* FE6C..FE6F */
    
#define FriBidiPropertyBlockLevel6_FF00 0x288
    
    FriBidiPropertyBlockLevel7_FF00,  /* FF00..FF03 */
    FriBidiPropertyBlockLevel7_0024,  /* FF04..FF07 */
    FriBidiPropertyBlockLevel7_0028,  /* FF08..FF0B */
    FriBidiPropertyBlockLevel7_002C,  /* FF0C..FF0F */
    
#define FriBidiPropertyBlockLevel6_FFE0 0x28C
    
    FriBidiPropertyBlockLevel7_0024,  /* FFE0..FFE3 */
    FriBidiPropertyBlockLevel7_FFE4,  /* FFE4..FFE7 */
    FriBidiPropertyBlockLevel7_003C,  /* FFE8..FFEB */
    FriBidiPropertyBlockLevel7_207C,  /* FFEC..FFEF */
    
#define FriBidiPropertyBlockLevel6_FFF0 0x290
    
    FriBidiPropertyBlockLevel7_0000,  /* FFF0..FFF3 */
    FriBidiPropertyBlockLevel7_0000,  /* FFF4..FFF7 */
    FriBidiPropertyBlockLevel7_FFF8,  /* FFF8..FFFB */
    FriBidiPropertyBlockLevel7_FFFC,  /* FFFC..FFFF */
    
#define FriBidiPropertyBlockLevel6_10100 0x294
    
    FriBidiPropertyBlockLevel7_2128,  /* 10100..10103 */
    FriBidiPropertyBlockLevel7_0044,  /* 10104..10107 */
    FriBidiPropertyBlockLevel7_0044,  /* 10108..1010B */
    FriBidiPropertyBlockLevel7_0044,  /* 1010C..1010F */
    
#define FriBidiPropertyBlockLevel6_10910 0x298
    
    FriBidiPropertyBlockLevel7_05C8,  /* 10910..10913 */
    FriBidiPropertyBlockLevel7_05C8,  /* 10914..10917 */
    FriBidiPropertyBlockLevel7_05C8,  /* 10918..1091B */
    FriBidiPropertyBlockLevel7_1091C,  /* 1091C..1091F */
    
#define FriBidiPropertyBlockLevel6_10A00 0x29C
    
    FriBidiPropertyBlockLevel7_0590,  /* 10A00..10A03 */
    FriBidiPropertyBlockLevel7_05C0,  /* 10A04..10A07 */
    FriBidiPropertyBlockLevel7_05C8,  /* 10A08..10A0B */
    FriBidiPropertyBlockLevel7_0300,  /* 10A0C..10A0F */
    
#define FriBidiPropertyBlockLevel6_10A30 0x2A0
    
    FriBidiPropertyBlockLevel7_05C8,  /* 10A30..10A33 */
    FriBidiPropertyBlockLevel7_05C8,  /* 10A34..10A37 */
    FriBidiPropertyBlockLevel7_10A38,  /* 10A38..10A3B */
    FriBidiPropertyBlockLevel7_07E8,  /* 10A3C..10A3F */
    
#define FriBidiPropertyBlockLevel6_1D160 0x2A4
    
    FriBidiPropertyBlockLevel7_0044,  /* 1D160..1D163 */
    FriBidiPropertyBlockLevel7_0480,  /* 1D164..1D167 */
    FriBidiPropertyBlockLevel7_0488,  /* 1D168..1D16B */
    FriBidiPropertyBlockLevel7_0044,  /* 1D16C..1D16F */
    
#define FriBidiPropertyBlockLevel6_1D170 0x2A8
    
    FriBidiPropertyBlockLevel7_1D170,  /* 1D170..1D173 */
    FriBidiPropertyBlockLevel7_0000,  /* 1D174..1D177 */
    FriBidiPropertyBlockLevel7_1D178,  /* 1D178..1D17B */
    FriBidiPropertyBlockLevel7_0300,  /* 1D17C..1D17F */
    
#define FriBidiPropertyBlockLevel6_1D180 0x2AC
    
    FriBidiPropertyBlockLevel7_0484,  /* 1D180..1D183 */
    FriBidiPropertyBlockLevel7_0940,  /* 1D184..1D187 */
    FriBidiPropertyBlockLevel7_0300,  /* 1D188..1D18B */
    FriBidiPropertyBlockLevel7_0044,  /* 1D18C..1D18F */
    
#define FriBidiPropertyBlockLevel6_1D1A0 0x2B0
    
    FriBidiPropertyBlockLevel7_0044,  /* 1D1A0..1D1A3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1D1A4..1D1A7 */
    FriBidiPropertyBlockLevel7_0960,  /* 1D1A8..1D1AB */
    FriBidiPropertyBlockLevel7_0488,  /* 1D1AC..1D1AF */
    
#define FriBidiPropertyBlockLevel6_1D240 0x2B4
    
    FriBidiPropertyBlockLevel7_1D240,  /* 1D240..1D243 */
    FriBidiPropertyBlockLevel7_1D244,  /* 1D244..1D247 */
    FriBidiPropertyBlockLevel7_0044,  /* 1D248..1D24B */
    FriBidiPropertyBlockLevel7_0044,  /* 1D24C..1D24F */
    
#define FriBidiPropertyBlockLevel6_1D7C0 0x2B8
    
    FriBidiPropertyBlockLevel7_0044,  /* 1D7C0..1D7C3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1D7C4..1D7C7 */
    FriBidiPropertyBlockLevel7_0044,  /* 1D7C8..1D7CB */
    FriBidiPropertyBlockLevel7_1D7CC,  /* 1D7CC..1D7CF */
    
#define FriBidiPropertyBlockLevel6_1D7D0 0x2BC
    
    FriBidiPropertyBlockLevel7_0030,  /* 1D7D0..1D7D3 */
    FriBidiPropertyBlockLevel7_0030,  /* 1D7D4..1D7D7 */
    FriBidiPropertyBlockLevel7_0030,  /* 1D7D8..1D7DB */
    FriBidiPropertyBlockLevel7_0030,  /* 1D7DC..1D7DF */
    
#define FriBidiPropertyBlockLevel6_1FFF0 0x2C0
    
    FriBidiPropertyBlockLevel7_0044,  /* 1FFF0..1FFF3 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FFF4..1FFF7 */
    FriBidiPropertyBlockLevel7_0044,  /* 1FFF8..1FFFB */
    FriBidiPropertyBlockLevel7_1FFFC,  /* 1FFFC..1FFFF */
};

static const PACKTAB_UINT16 FriBidiPropertyBlockLevel5[4*131] = {
    
#define FriBidiPropertyBlockLevel5_0000 0x0
    
    FriBidiPropertyBlockLevel6_0000,  /* 0000..000F */
    FriBidiPropertyBlockLevel6_0010,  /* 0010..001F */
    FriBidiPropertyBlockLevel6_0020,  /* 0020..002F */
    FriBidiPropertyBlockLevel6_0030,  /* 0030..003F */
    
#define FriBidiPropertyBlockLevel5_0040 0x4
    
    FriBidiPropertyBlockLevel6_0040,  /* 0040..004F */
    FriBidiPropertyBlockLevel6_0050,  /* 0050..005F */
    FriBidiPropertyBlockLevel6_0040,  /* 0060..006F */
    FriBidiPropertyBlockLevel6_0070,  /* 0070..007F */
    
#define FriBidiPropertyBlockLevel5_0080 0x8
    
    FriBidiPropertyBlockLevel6_0080,  /* 0080..008F */
    FriBidiPropertyBlockLevel6_0090,  /* 0090..009F */
    FriBidiPropertyBlockLevel6_00A0,  /* 00A0..00AF */
    FriBidiPropertyBlockLevel6_00B0,  /* 00B0..00BF */
    
#define FriBidiPropertyBlockLevel5_00C0 0xC
    
    FriBidiPropertyBlockLevel6_00C0,  /* 00C0..00CF */
    FriBidiPropertyBlockLevel6_00D0,  /* 00D0..00DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 00E0..00EF */
    FriBidiPropertyBlockLevel6_00D0,  /* 00F0..00FF */
    
#define FriBidiPropertyBlockLevel5_0100 0x10
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0100..010F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0110..011F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0120..012F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0130..013F */
    
#define FriBidiPropertyBlockLevel5_0280 0x14
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0280..028F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0290..029F */
    FriBidiPropertyBlockLevel6_00C0,  /* 02A0..02AF */
    FriBidiPropertyBlockLevel6_02B0,  /* 02B0..02BF */
    
#define FriBidiPropertyBlockLevel5_02C0 0x18
    
    FriBidiPropertyBlockLevel6_02C0,  /* 02C0..02CF */
    FriBidiPropertyBlockLevel6_02C0,  /* 02D0..02DF */
    FriBidiPropertyBlockLevel6_02E0,  /* 02E0..02EF */
    FriBidiPropertyBlockLevel6_02F0,  /* 02F0..02FF */
    
#define FriBidiPropertyBlockLevel5_0300 0x1C
    
    FriBidiPropertyBlockLevel6_0300,  /* 0300..030F */
    FriBidiPropertyBlockLevel6_0300,  /* 0310..031F */
    FriBidiPropertyBlockLevel6_0300,  /* 0320..032F */
    FriBidiPropertyBlockLevel6_0300,  /* 0330..033F */
    
#define FriBidiPropertyBlockLevel5_0340 0x20
    
    FriBidiPropertyBlockLevel6_0300,  /* 0340..034F */
    FriBidiPropertyBlockLevel6_0300,  /* 0350..035F */
    FriBidiPropertyBlockLevel6_0300,  /* 0360..036F */
    FriBidiPropertyBlockLevel6_0370,  /* 0370..037F */
    
#define FriBidiPropertyBlockLevel5_0380 0x24
    
    FriBidiPropertyBlockLevel6_0380,  /* 0380..038F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0390..039F */
    FriBidiPropertyBlockLevel6_00C0,  /* 03A0..03AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 03B0..03BF */
    
#define FriBidiPropertyBlockLevel5_03C0 0x28
    
    FriBidiPropertyBlockLevel6_00C0,  /* 03C0..03CF */
    FriBidiPropertyBlockLevel6_00C0,  /* 03D0..03DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 03E0..03EF */
    FriBidiPropertyBlockLevel6_03F0,  /* 03F0..03FF */
    
#define FriBidiPropertyBlockLevel5_0480 0x2C
    
    FriBidiPropertyBlockLevel6_0480,  /* 0480..048F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0490..049F */
    FriBidiPropertyBlockLevel6_00C0,  /* 04A0..04AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 04B0..04BF */
    
#define FriBidiPropertyBlockLevel5_0580 0x30
    
    FriBidiPropertyBlockLevel6_0580,  /* 0580..058F */
    FriBidiPropertyBlockLevel6_0590,  /* 0590..059F */
    FriBidiPropertyBlockLevel6_0300,  /* 05A0..05AF */
    FriBidiPropertyBlockLevel6_05B0,  /* 05B0..05BF */
    
#define FriBidiPropertyBlockLevel5_05C0 0x34
    
    FriBidiPropertyBlockLevel6_05C0,  /* 05C0..05CF */
    FriBidiPropertyBlockLevel6_05D0,  /* 05D0..05DF */
    FriBidiPropertyBlockLevel6_05D0,  /* 05E0..05EF */
    FriBidiPropertyBlockLevel6_05D0,  /* 05F0..05FF */
    
#define FriBidiPropertyBlockLevel5_0600 0x38
    
    FriBidiPropertyBlockLevel6_0600,  /* 0600..060F */
    FriBidiPropertyBlockLevel6_0610,  /* 0610..061F */
    FriBidiPropertyBlockLevel6_0620,  /* 0620..062F */
    FriBidiPropertyBlockLevel6_0620,  /* 0630..063F */
    
#define FriBidiPropertyBlockLevel5_0640 0x3C
    
    FriBidiPropertyBlockLevel6_0640,  /* 0640..064F */
    FriBidiPropertyBlockLevel6_0650,  /* 0650..065F */
    FriBidiPropertyBlockLevel6_0660,  /* 0660..066F */
    FriBidiPropertyBlockLevel6_0670,  /* 0670..067F */
    
#define FriBidiPropertyBlockLevel5_0680 0x40
    
    FriBidiPropertyBlockLevel6_0620,  /* 0680..068F */
    FriBidiPropertyBlockLevel6_0620,  /* 0690..069F */
    FriBidiPropertyBlockLevel6_0620,  /* 06A0..06AF */
    FriBidiPropertyBlockLevel6_0620,  /* 06B0..06BF */
    
#define FriBidiPropertyBlockLevel5_06C0 0x44
    
    FriBidiPropertyBlockLevel6_0620,  /* 06C0..06CF */
    FriBidiPropertyBlockLevel6_06D0,  /* 06D0..06DF */
    FriBidiPropertyBlockLevel6_06E0,  /* 06E0..06EF */
    FriBidiPropertyBlockLevel6_06F0,  /* 06F0..06FF */
    
#define FriBidiPropertyBlockLevel5_0700 0x48
    
    FriBidiPropertyBlockLevel6_0700,  /* 0700..070F */
    FriBidiPropertyBlockLevel6_0710,  /* 0710..071F */
    FriBidiPropertyBlockLevel6_0620,  /* 0720..072F */
    FriBidiPropertyBlockLevel6_0300,  /* 0730..073F */
    
#define FriBidiPropertyBlockLevel5_0740 0x4C
    
    FriBidiPropertyBlockLevel6_0740,  /* 0740..074F */
    FriBidiPropertyBlockLevel6_0620,  /* 0750..075F */
    FriBidiPropertyBlockLevel6_0620,  /* 0760..076F */
    FriBidiPropertyBlockLevel6_0620,  /* 0770..077F */
    
#define FriBidiPropertyBlockLevel5_0780 0x50
    
    FriBidiPropertyBlockLevel6_0620,  /* 0780..078F */
    FriBidiPropertyBlockLevel6_0620,  /* 0790..079F */
    FriBidiPropertyBlockLevel6_07A0,  /* 07A0..07AF */
    FriBidiPropertyBlockLevel6_0670,  /* 07B0..07BF */
    
#define FriBidiPropertyBlockLevel5_07C0 0x54
    
    FriBidiPropertyBlockLevel6_05D0,  /* 07C0..07CF */
    FriBidiPropertyBlockLevel6_05D0,  /* 07D0..07DF */
    FriBidiPropertyBlockLevel6_07E0,  /* 07E0..07EF */
    FriBidiPropertyBlockLevel6_07F0,  /* 07F0..07FF */
    
#define FriBidiPropertyBlockLevel5_0800 0x58
    
    FriBidiPropertyBlockLevel6_05D0,  /* 0800..080F */
    FriBidiPropertyBlockLevel6_05D0,  /* 0810..081F */
    FriBidiPropertyBlockLevel6_05D0,  /* 0820..082F */
    FriBidiPropertyBlockLevel6_05D0,  /* 0830..083F */
    
#define FriBidiPropertyBlockLevel5_0900 0x5C
    
    FriBidiPropertyBlockLevel6_0900,  /* 0900..090F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0910..091F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0920..092F */
    FriBidiPropertyBlockLevel6_0930,  /* 0930..093F */
    
#define FriBidiPropertyBlockLevel5_0940 0x60
    
    FriBidiPropertyBlockLevel6_0940,  /* 0940..094F */
    FriBidiPropertyBlockLevel6_0950,  /* 0950..095F */
    FriBidiPropertyBlockLevel6_0960,  /* 0960..096F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0970..097F */
    
#define FriBidiPropertyBlockLevel5_0980 0x64
    
    FriBidiPropertyBlockLevel6_0980,  /* 0980..098F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0990..099F */
    FriBidiPropertyBlockLevel6_00C0,  /* 09A0..09AF */
    FriBidiPropertyBlockLevel6_0930,  /* 09B0..09BF */
    
#define FriBidiPropertyBlockLevel5_09C0 0x68
    
    FriBidiPropertyBlockLevel6_09C0,  /* 09C0..09CF */
    FriBidiPropertyBlockLevel6_00C0,  /* 09D0..09DF */
    FriBidiPropertyBlockLevel6_0960,  /* 09E0..09EF */
    FriBidiPropertyBlockLevel6_09F0,  /* 09F0..09FF */
    
#define FriBidiPropertyBlockLevel5_0A40 0x6C
    
    FriBidiPropertyBlockLevel6_0A40,  /* 0A40..0A4F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0A50..0A5F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0A60..0A6F */
    FriBidiPropertyBlockLevel6_0A70,  /* 0A70..0A7F */
    
#define FriBidiPropertyBlockLevel5_0AC0 0x70
    
    FriBidiPropertyBlockLevel6_0AC0,  /* 0AC0..0ACF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0AD0..0ADF */
    FriBidiPropertyBlockLevel6_0960,  /* 0AE0..0AEF */
    FriBidiPropertyBlockLevel6_0AF0,  /* 0AF0..0AFF */
    
#define FriBidiPropertyBlockLevel5_0B00 0x74
    
    FriBidiPropertyBlockLevel6_0980,  /* 0B00..0B0F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0B10..0B1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0B20..0B2F */
    FriBidiPropertyBlockLevel6_0B30,  /* 0B30..0B3F */
    
#define FriBidiPropertyBlockLevel5_0B40 0x78
    
    FriBidiPropertyBlockLevel6_0B40,  /* 0B40..0B4F */
    FriBidiPropertyBlockLevel6_0B50,  /* 0B50..0B5F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0B60..0B6F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0B70..0B7F */
    
#define FriBidiPropertyBlockLevel5_0B80 0x7C
    
    FriBidiPropertyBlockLevel6_0B80,  /* 0B80..0B8F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0B90..0B9F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0BA0..0BAF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0BB0..0BBF */
    
#define FriBidiPropertyBlockLevel5_0BC0 0x80
    
    FriBidiPropertyBlockLevel6_0BC0,  /* 0BC0..0BCF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0BD0..0BDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0BE0..0BEF */
    FriBidiPropertyBlockLevel6_0BF0,  /* 0BF0..0BFF */
    
#define FriBidiPropertyBlockLevel5_0C00 0x84
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0C00..0C0F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0C10..0C1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0C20..0C2F */
    FriBidiPropertyBlockLevel6_0C30,  /* 0C30..0C3F */
    
#define FriBidiPropertyBlockLevel5_0C40 0x88
    
    FriBidiPropertyBlockLevel6_0C40,  /* 0C40..0C4F */
    FriBidiPropertyBlockLevel6_0C50,  /* 0C50..0C5F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0C60..0C6F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0C70..0C7F */
    
#define FriBidiPropertyBlockLevel5_0C80 0x8C
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0C80..0C8F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0C90..0C9F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0CA0..0CAF */
    FriBidiPropertyBlockLevel6_0930,  /* 0CB0..0CBF */
    
#define FriBidiPropertyBlockLevel5_0CC0 0x90
    
    FriBidiPropertyBlockLevel6_0CC0,  /* 0CC0..0CCF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0CD0..0CDF */
    FriBidiPropertyBlockLevel6_0960,  /* 0CE0..0CEF */
    FriBidiPropertyBlockLevel6_0CF0,  /* 0CF0..0CFF */
    
#define FriBidiPropertyBlockLevel5_0D40 0x94
    
    FriBidiPropertyBlockLevel6_0B40,  /* 0D40..0D4F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0D50..0D5F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0D60..0D6F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0D70..0D7F */
    
#define FriBidiPropertyBlockLevel5_0DC0 0x98
    
    FriBidiPropertyBlockLevel6_0DC0,  /* 0DC0..0DCF */
    FriBidiPropertyBlockLevel6_0DD0,  /* 0DD0..0DDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0DE0..0DEF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0DF0..0DFF */
    
#define FriBidiPropertyBlockLevel5_0E00 0x9C
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0E00..0E0F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0E10..0E1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0E20..0E2F */
    FriBidiPropertyBlockLevel6_0E30,  /* 0E30..0E3F */
    
#define FriBidiPropertyBlockLevel5_0E40 0xA0
    
    FriBidiPropertyBlockLevel6_0E40,  /* 0E40..0E4F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0E50..0E5F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0E60..0E6F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0E70..0E7F */
    
#define FriBidiPropertyBlockLevel5_0E80 0xA4
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0E80..0E8F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0E90..0E9F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0EA0..0EAF */
    FriBidiPropertyBlockLevel6_0EB0,  /* 0EB0..0EBF */
    
#define FriBidiPropertyBlockLevel5_0EC0 0xA8
    
    FriBidiPropertyBlockLevel6_0EC0,  /* 0EC0..0ECF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0ED0..0EDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0EE0..0EEF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0EF0..0EFF */
    
#define FriBidiPropertyBlockLevel5_0F00 0xAC
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0F00..0F0F */
    FriBidiPropertyBlockLevel6_0F10,  /* 0F10..0F1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0F20..0F2F */
    FriBidiPropertyBlockLevel6_0F30,  /* 0F30..0F3F */
    
#define FriBidiPropertyBlockLevel5_0F40 0xB0
    
    FriBidiPropertyBlockLevel6_00C0,  /* 0F40..0F4F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0F50..0F5F */
    FriBidiPropertyBlockLevel6_00C0,  /* 0F60..0F6F */
    FriBidiPropertyBlockLevel6_0F70,  /* 0F70..0F7F */
    
#define FriBidiPropertyBlockLevel5_0F80 0xB4
    
    FriBidiPropertyBlockLevel6_0F80,  /* 0F80..0F8F */
    FriBidiPropertyBlockLevel6_0F90,  /* 0F90..0F9F */
    FriBidiPropertyBlockLevel6_0300,  /* 0FA0..0FAF */
    FriBidiPropertyBlockLevel6_0FB0,  /* 0FB0..0FBF */
    
#define FriBidiPropertyBlockLevel5_0FC0 0xB8
    
    FriBidiPropertyBlockLevel6_0B50,  /* 0FC0..0FCF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0FD0..0FDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0FE0..0FEF */
    FriBidiPropertyBlockLevel6_00C0,  /* 0FF0..0FFF */
    
#define FriBidiPropertyBlockLevel5_1000 0xBC
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1000..100F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1010..101F */
    FriBidiPropertyBlockLevel6_1020,  /* 1020..102F */
    FriBidiPropertyBlockLevel6_1030,  /* 1030..103F */
    
#define FriBidiPropertyBlockLevel5_1040 0xC0
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1040..104F */
    FriBidiPropertyBlockLevel6_0F10,  /* 1050..105F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1060..106F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1070..107F */
    
#define FriBidiPropertyBlockLevel5_1340 0xC4
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1340..134F */
    FriBidiPropertyBlockLevel6_1350,  /* 1350..135F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1360..136F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1370..137F */
    
#define FriBidiPropertyBlockLevel5_1380 0xC8
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1380..138F */
    FriBidiPropertyBlockLevel6_1390,  /* 1390..139F */
    FriBidiPropertyBlockLevel6_00C0,  /* 13A0..13AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 13B0..13BF */
    
#define FriBidiPropertyBlockLevel5_1680 0xCC
    
    FriBidiPropertyBlockLevel6_1680,  /* 1680..168F */
    FriBidiPropertyBlockLevel6_1690,  /* 1690..169F */
    FriBidiPropertyBlockLevel6_00C0,  /* 16A0..16AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 16B0..16BF */
    
#define FriBidiPropertyBlockLevel5_1700 0xD0
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1700..170F */
    FriBidiPropertyBlockLevel6_1710,  /* 1710..171F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1720..172F */
    FriBidiPropertyBlockLevel6_1710,  /* 1730..173F */
    
#define FriBidiPropertyBlockLevel5_1740 0xD4
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1740..174F */
    FriBidiPropertyBlockLevel6_0960,  /* 1750..175F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1760..176F */
    FriBidiPropertyBlockLevel6_0960,  /* 1770..177F */
    
#define FriBidiPropertyBlockLevel5_1780 0xD8
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1780..178F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1790..179F */
    FriBidiPropertyBlockLevel6_00C0,  /* 17A0..17AF */
    FriBidiPropertyBlockLevel6_17B0,  /* 17B0..17BF */
    
#define FriBidiPropertyBlockLevel5_17C0 0xDC
    
    FriBidiPropertyBlockLevel6_17C0,  /* 17C0..17CF */
    FriBidiPropertyBlockLevel6_17D0,  /* 17D0..17DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 17E0..17EF */
    FriBidiPropertyBlockLevel6_1390,  /* 17F0..17FF */
    
#define FriBidiPropertyBlockLevel5_1800 0xE0
    
    FriBidiPropertyBlockLevel6_1800,  /* 1800..180F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1810..181F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1820..182F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1830..183F */
    
#define FriBidiPropertyBlockLevel5_1880 0xE4
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1880..188F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1890..189F */
    FriBidiPropertyBlockLevel6_18A0,  /* 18A0..18AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 18B0..18BF */
    
#define FriBidiPropertyBlockLevel5_1900 0xE8
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1900..190F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1910..191F */
    FriBidiPropertyBlockLevel6_1920,  /* 1920..192F */
    FriBidiPropertyBlockLevel6_1930,  /* 1930..193F */
    
#define FriBidiPropertyBlockLevel5_1940 0xEC
    
    FriBidiPropertyBlockLevel6_1940,  /* 1940..194F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1950..195F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1960..196F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1970..197F */
    
#define FriBidiPropertyBlockLevel5_19C0 0xF0
    
    FriBidiPropertyBlockLevel6_00C0,  /* 19C0..19CF */
    FriBidiPropertyBlockLevel6_19D0,  /* 19D0..19DF */
    FriBidiPropertyBlockLevel6_02F0,  /* 19E0..19EF */
    FriBidiPropertyBlockLevel6_02F0,  /* 19F0..19FF */
    
#define FriBidiPropertyBlockLevel5_1A00 0xF4
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1A00..1A0F */
    FriBidiPropertyBlockLevel6_1A10,  /* 1A10..1A1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1A20..1A2F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1A30..1A3F */
    
#define FriBidiPropertyBlockLevel5_1B00 0xF8
    
    FriBidiPropertyBlockLevel6_1B00,  /* 1B00..1B0F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1B10..1B1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1B20..1B2F */
    FriBidiPropertyBlockLevel6_1B30,  /* 1B30..1B3F */
    
#define FriBidiPropertyBlockLevel5_1B40 0xFC
    
    FriBidiPropertyBlockLevel6_0B80,  /* 1B40..1B4F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1B50..1B5F */
    FriBidiPropertyBlockLevel6_1B60,  /* 1B60..1B6F */
    FriBidiPropertyBlockLevel6_1B00,  /* 1B70..1B7F */
    
#define FriBidiPropertyBlockLevel5_1DC0 0x100
    
    FriBidiPropertyBlockLevel6_1DC0,  /* 1DC0..1DCF */
    FriBidiPropertyBlockLevel6_00C0,  /* 1DD0..1DDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 1DE0..1DEF */
    FriBidiPropertyBlockLevel6_0C30,  /* 1DF0..1DFF */
    
#define FriBidiPropertyBlockLevel5_1F80 0x104
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1F80..1F8F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1F90..1F9F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1FA0..1FAF */
    FriBidiPropertyBlockLevel6_1FB0,  /* 1FB0..1FBF */
    
#define FriBidiPropertyBlockLevel5_1FC0 0x108
    
    FriBidiPropertyBlockLevel6_1FC0,  /* 1FC0..1FCF */
    FriBidiPropertyBlockLevel6_1FD0,  /* 1FD0..1FDF */
    FriBidiPropertyBlockLevel6_1FD0,  /* 1FE0..1FEF */
    FriBidiPropertyBlockLevel6_1FF0,  /* 1FF0..1FFF */
    
#define FriBidiPropertyBlockLevel5_2000 0x10C
    
    FriBidiPropertyBlockLevel6_2000,  /* 2000..200F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2010..201F */
    FriBidiPropertyBlockLevel6_2020,  /* 2020..202F */
    FriBidiPropertyBlockLevel6_2030,  /* 2030..203F */
    
#define FriBidiPropertyBlockLevel5_2040 0x110
    
    FriBidiPropertyBlockLevel6_2040,  /* 2040..204F */
    FriBidiPropertyBlockLevel6_2050,  /* 2050..205F */
    FriBidiPropertyBlockLevel6_0090,  /* 2060..206F */
    FriBidiPropertyBlockLevel6_2070,  /* 2070..207F */
    
#define FriBidiPropertyBlockLevel5_2080 0x114
    
    FriBidiPropertyBlockLevel6_2080,  /* 2080..208F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2090..209F */
    FriBidiPropertyBlockLevel6_20A0,  /* 20A0..20AF */
    FriBidiPropertyBlockLevel6_20B0,  /* 20B0..20BF */
    
#define FriBidiPropertyBlockLevel5_20C0 0x118
    
    FriBidiPropertyBlockLevel6_00C0,  /* 20C0..20CF */
    FriBidiPropertyBlockLevel6_0300,  /* 20D0..20DF */
    FriBidiPropertyBlockLevel6_0300,  /* 20E0..20EF */
    FriBidiPropertyBlockLevel6_00C0,  /* 20F0..20FF */
    
#define FriBidiPropertyBlockLevel5_2100 0x11C
    
    FriBidiPropertyBlockLevel6_2100,  /* 2100..210F */
    FriBidiPropertyBlockLevel6_2110,  /* 2110..211F */
    FriBidiPropertyBlockLevel6_2120,  /* 2120..212F */
    FriBidiPropertyBlockLevel6_2130,  /* 2130..213F */
    
#define FriBidiPropertyBlockLevel5_2140 0x120
    
    FriBidiPropertyBlockLevel6_2140,  /* 2140..214F */
    FriBidiPropertyBlockLevel6_2150,  /* 2150..215F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2160..216F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2170..217F */
    
#define FriBidiPropertyBlockLevel5_2180 0x124
    
    FriBidiPropertyBlockLevel6_00C0,  /* 2180..218F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2190..219F */
    FriBidiPropertyBlockLevel6_02F0,  /* 21A0..21AF */
    FriBidiPropertyBlockLevel6_02F0,  /* 21B0..21BF */
    
#define FriBidiPropertyBlockLevel5_21C0 0x128
    
    FriBidiPropertyBlockLevel6_02F0,  /* 21C0..21CF */
    FriBidiPropertyBlockLevel6_02F0,  /* 21D0..21DF */
    FriBidiPropertyBlockLevel6_02F0,  /* 21E0..21EF */
    FriBidiPropertyBlockLevel6_02F0,  /* 21F0..21FF */
    
#define FriBidiPropertyBlockLevel5_2200 0x12C
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2200..220F */
    FriBidiPropertyBlockLevel6_2210,  /* 2210..221F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2220..222F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2230..223F */
    
#define FriBidiPropertyBlockLevel5_2300 0x130
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2300..230F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2310..231F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2320..232F */
    FriBidiPropertyBlockLevel6_2330,  /* 2330..233F */
    
#define FriBidiPropertyBlockLevel5_2340 0x134
    
    FriBidiPropertyBlockLevel6_00C0,  /* 2340..234F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2350..235F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2360..236F */
    FriBidiPropertyBlockLevel6_0050,  /* 2370..237F */
    
#define FriBidiPropertyBlockLevel5_2380 0x138
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2380..238F */
    FriBidiPropertyBlockLevel6_2390,  /* 2390..239F */
    FriBidiPropertyBlockLevel6_02F0,  /* 23A0..23AF */
    FriBidiPropertyBlockLevel6_02F0,  /* 23B0..23BF */
    
#define FriBidiPropertyBlockLevel5_23C0 0x13C
    
    FriBidiPropertyBlockLevel6_02F0,  /* 23C0..23CF */
    FriBidiPropertyBlockLevel6_02F0,  /* 23D0..23DF */
    FriBidiPropertyBlockLevel6_23E0,  /* 23E0..23EF */
    FriBidiPropertyBlockLevel6_00C0,  /* 23F0..23FF */
    
#define FriBidiPropertyBlockLevel5_2400 0x140
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2400..240F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2410..241F */
    FriBidiPropertyBlockLevel6_2420,  /* 2420..242F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2430..243F */
    
#define FriBidiPropertyBlockLevel5_2440 0x144
    
    FriBidiPropertyBlockLevel6_2440,  /* 2440..244F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2450..245F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2460..246F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2470..247F */
    
#define FriBidiPropertyBlockLevel5_2480 0x148
    
    FriBidiPropertyBlockLevel6_2480,  /* 2480..248F */
    FriBidiPropertyBlockLevel6_2490,  /* 2490..249F */
    FriBidiPropertyBlockLevel6_00C0,  /* 24A0..24AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 24B0..24BF */
    
#define FriBidiPropertyBlockLevel5_24C0 0x14C
    
    FriBidiPropertyBlockLevel6_00C0,  /* 24C0..24CF */
    FriBidiPropertyBlockLevel6_00C0,  /* 24D0..24DF */
    FriBidiPropertyBlockLevel6_24E0,  /* 24E0..24EF */
    FriBidiPropertyBlockLevel6_02F0,  /* 24F0..24FF */
    
#define FriBidiPropertyBlockLevel5_2680 0x150
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2680..268F */
    FriBidiPropertyBlockLevel6_2690,  /* 2690..269F */
    FriBidiPropertyBlockLevel6_26A0,  /* 26A0..26AF */
    FriBidiPropertyBlockLevel6_26B0,  /* 26B0..26BF */
    
#define FriBidiPropertyBlockLevel5_2700 0x154
    
    FriBidiPropertyBlockLevel6_2700,  /* 2700..270F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2710..271F */
    FriBidiPropertyBlockLevel6_2720,  /* 2720..272F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2730..273F */
    
#define FriBidiPropertyBlockLevel5_2740 0x158
    
    FriBidiPropertyBlockLevel6_2740,  /* 2740..274F */
    FriBidiPropertyBlockLevel6_2750,  /* 2750..275F */
    FriBidiPropertyBlockLevel6_2760,  /* 2760..276F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2770..277F */
    
#define FriBidiPropertyBlockLevel5_2780 0x15C
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2780..278F */
    FriBidiPropertyBlockLevel6_2790,  /* 2790..279F */
    FriBidiPropertyBlockLevel6_02F0,  /* 27A0..27AF */
    FriBidiPropertyBlockLevel6_27B0,  /* 27B0..27BF */
    
#define FriBidiPropertyBlockLevel5_27C0 0x160
    
    FriBidiPropertyBlockLevel6_2440,  /* 27C0..27CF */
    FriBidiPropertyBlockLevel6_02F0,  /* 27D0..27DF */
    FriBidiPropertyBlockLevel6_27E0,  /* 27E0..27EF */
    FriBidiPropertyBlockLevel6_02F0,  /* 27F0..27FF */
    
#define FriBidiPropertyBlockLevel5_2B00 0x164
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2B00..2B0F */
    FriBidiPropertyBlockLevel6_2440,  /* 2B10..2B1F */
    FriBidiPropertyBlockLevel6_2B20,  /* 2B20..2B2F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2B30..2B3F */
    
#define FriBidiPropertyBlockLevel5_2CC0 0x168
    
    FriBidiPropertyBlockLevel6_00C0,  /* 2CC0..2CCF */
    FriBidiPropertyBlockLevel6_00C0,  /* 2CD0..2CDF */
    FriBidiPropertyBlockLevel6_2CE0,  /* 2CE0..2CEF */
    FriBidiPropertyBlockLevel6_2CF0,  /* 2CF0..2CFF */
    
#define FriBidiPropertyBlockLevel5_2E00 0x16C
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2E00..2E0F */
    FriBidiPropertyBlockLevel6_2E10,  /* 2E10..2E1F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2E20..2E2F */
    FriBidiPropertyBlockLevel6_00C0,  /* 2E30..2E3F */
    
#define FriBidiPropertyBlockLevel5_2E80 0x170
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2E80..2E8F */
    FriBidiPropertyBlockLevel6_2E90,  /* 2E90..2E9F */
    FriBidiPropertyBlockLevel6_02F0,  /* 2EA0..2EAF */
    FriBidiPropertyBlockLevel6_02F0,  /* 2EB0..2EBF */
    
#define FriBidiPropertyBlockLevel5_2EC0 0x174
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2EC0..2ECF */
    FriBidiPropertyBlockLevel6_02F0,  /* 2ED0..2EDF */
    FriBidiPropertyBlockLevel6_02F0,  /* 2EE0..2EEF */
    FriBidiPropertyBlockLevel6_2B20,  /* 2EF0..2EFF */
    
#define FriBidiPropertyBlockLevel5_2FC0 0x178
    
    FriBidiPropertyBlockLevel6_02F0,  /* 2FC0..2FCF */
    FriBidiPropertyBlockLevel6_2330,  /* 2FD0..2FDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 2FE0..2FEF */
    FriBidiPropertyBlockLevel6_27E0,  /* 2FF0..2FFF */
    
#define FriBidiPropertyBlockLevel5_3000 0x17C
    
    FriBidiPropertyBlockLevel6_3000,  /* 3000..300F */
    FriBidiPropertyBlockLevel6_02F0,  /* 3010..301F */
    FriBidiPropertyBlockLevel6_3020,  /* 3020..302F */
    FriBidiPropertyBlockLevel6_3030,  /* 3030..303F */
    
#define FriBidiPropertyBlockLevel5_3080 0x180
    
    FriBidiPropertyBlockLevel6_00C0,  /* 3080..308F */
    FriBidiPropertyBlockLevel6_3090,  /* 3090..309F */
    FriBidiPropertyBlockLevel6_0040,  /* 30A0..30AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 30B0..30BF */
    
#define FriBidiPropertyBlockLevel5_30C0 0x184
    
    FriBidiPropertyBlockLevel6_00C0,  /* 30C0..30CF */
    FriBidiPropertyBlockLevel6_00C0,  /* 30D0..30DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 30E0..30EF */
    FriBidiPropertyBlockLevel6_30F0,  /* 30F0..30FF */
    
#define FriBidiPropertyBlockLevel5_31C0 0x188
    
    FriBidiPropertyBlockLevel6_02F0,  /* 31C0..31CF */
    FriBidiPropertyBlockLevel6_00C0,  /* 31D0..31DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 31E0..31EF */
    FriBidiPropertyBlockLevel6_00C0,  /* 31F0..31FF */
    
#define FriBidiPropertyBlockLevel5_3200 0x18C
    
    FriBidiPropertyBlockLevel6_00C0,  /* 3200..320F */
    FriBidiPropertyBlockLevel6_1FF0,  /* 3210..321F */
    FriBidiPropertyBlockLevel6_00C0,  /* 3220..322F */
    FriBidiPropertyBlockLevel6_00C0,  /* 3230..323F */
    
#define FriBidiPropertyBlockLevel5_3240 0x190
    
    FriBidiPropertyBlockLevel6_00C0,  /* 3240..324F */
    FriBidiPropertyBlockLevel6_02F0,  /* 3250..325F */
    FriBidiPropertyBlockLevel6_00C0,  /* 3260..326F */
    FriBidiPropertyBlockLevel6_3270,  /* 3270..327F */
    
#define FriBidiPropertyBlockLevel5_3280 0x194
    
    FriBidiPropertyBlockLevel6_00C0,  /* 3280..328F */
    FriBidiPropertyBlockLevel6_00C0,  /* 3290..329F */
    FriBidiPropertyBlockLevel6_00C0,  /* 32A0..32AF */
    FriBidiPropertyBlockLevel6_2760,  /* 32B0..32BF */
    
#define FriBidiPropertyBlockLevel5_32C0 0x198
    
    FriBidiPropertyBlockLevel6_32C0,  /* 32C0..32CF */
    FriBidiPropertyBlockLevel6_00C0,  /* 32D0..32DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 32E0..32EF */
    FriBidiPropertyBlockLevel6_00C0,  /* 32F0..32FF */
    
#define FriBidiPropertyBlockLevel5_3340 0x19C
    
    FriBidiPropertyBlockLevel6_00C0,  /* 3340..334F */
    FriBidiPropertyBlockLevel6_00C0,  /* 3350..335F */
    FriBidiPropertyBlockLevel6_00C0,  /* 3360..336F */
    FriBidiPropertyBlockLevel6_3370,  /* 3370..337F */
    
#define FriBidiPropertyBlockLevel5_33C0 0x1A0
    
    FriBidiPropertyBlockLevel6_00C0,  /* 33C0..33CF */
    FriBidiPropertyBlockLevel6_19D0,  /* 33D0..33DF */
    FriBidiPropertyBlockLevel6_00C0,  /* 33E0..33EF */
    FriBidiPropertyBlockLevel6_33F0,  /* 33F0..33FF */
    
#define FriBidiPropertyBlockLevel5_A4C0 0x1A4
    
    FriBidiPropertyBlockLevel6_2420,  /* A4C0..A4CF */
    FriBidiPropertyBlockLevel6_00C0,  /* A4D0..A4DF */
    FriBidiPropertyBlockLevel6_00C0,  /* A4E0..A4EF */
    FriBidiPropertyBlockLevel6_00C0,  /* A4F0..A4FF */
    
#define FriBidiPropertyBlockLevel5_A700 0x1A8
    
    FriBidiPropertyBlockLevel6_02F0,  /* A700..A70F */
    FriBidiPropertyBlockLevel6_2440,  /* A710..A71F */
    FriBidiPropertyBlockLevel6_A720,  /* A720..A72F */
    FriBidiPropertyBlockLevel6_00C0,  /* A730..A73F */
    
#define FriBidiPropertyBlockLevel5_A800 0x1AC
    
    FriBidiPropertyBlockLevel6_A800,  /* A800..A80F */
    FriBidiPropertyBlockLevel6_00C0,  /* A810..A81F */
    FriBidiPropertyBlockLevel6_A820,  /* A820..A82F */
    FriBidiPropertyBlockLevel6_00C0,  /* A830..A83F */
    
#define FriBidiPropertyBlockLevel5_A840 0x1B0
    
    FriBidiPropertyBlockLevel6_00C0,  /* A840..A84F */
    FriBidiPropertyBlockLevel6_00C0,  /* A850..A85F */
    FriBidiPropertyBlockLevel6_00C0,  /* A860..A86F */
    FriBidiPropertyBlockLevel6_A870,  /* A870..A87F */
    
#define FriBidiPropertyBlockLevel5_FB00 0x1B4
    
    FriBidiPropertyBlockLevel6_00C0,  /* FB00..FB0F */
    FriBidiPropertyBlockLevel6_FB10,  /* FB10..FB1F */
    FriBidiPropertyBlockLevel6_FB20,  /* FB20..FB2F */
    FriBidiPropertyBlockLevel6_05D0,  /* FB30..FB3F */
    
#define FriBidiPropertyBlockLevel5_FB40 0x1B8
    
    FriBidiPropertyBlockLevel6_05D0,  /* FB40..FB4F */
    FriBidiPropertyBlockLevel6_0620,  /* FB50..FB5F */
    FriBidiPropertyBlockLevel6_0620,  /* FB60..FB6F */
    FriBidiPropertyBlockLevel6_0620,  /* FB70..FB7F */
    
#define FriBidiPropertyBlockLevel5_FD00 0x1BC
    
    FriBidiPropertyBlockLevel6_0620,  /* FD00..FD0F */
    FriBidiPropertyBlockLevel6_0620,  /* FD10..FD1F */
    FriBidiPropertyBlockLevel6_0620,  /* FD20..FD2F */
    FriBidiPropertyBlockLevel6_FD30,  /* FD30..FD3F */
    
#define FriBidiPropertyBlockLevel5_FDC0 0x1C0
    
    FriBidiPropertyBlockLevel6_0620,  /* FDC0..FDCF */
    FriBidiPropertyBlockLevel6_0090,  /* FDD0..FDDF */
    FriBidiPropertyBlockLevel6_0090,  /* FDE0..FDEF */
    FriBidiPropertyBlockLevel6_FDF0,  /* FDF0..FDFF */
    
#define FriBidiPropertyBlockLevel5_FE00 0x1C4
    
    FriBidiPropertyBlockLevel6_0300,  /* FE00..FE0F */
    FriBidiPropertyBlockLevel6_1390,  /* FE10..FE1F */
    FriBidiPropertyBlockLevel6_1B00,  /* FE20..FE2F */
    FriBidiPropertyBlockLevel6_02F0,  /* FE30..FE3F */
    
#define FriBidiPropertyBlockLevel5_FE40 0x1C8
    
    FriBidiPropertyBlockLevel6_02F0,  /* FE40..FE4F */
    FriBidiPropertyBlockLevel6_FE50,  /* FE50..FE5F */
    FriBidiPropertyBlockLevel6_FE60,  /* FE60..FE6F */
    FriBidiPropertyBlockLevel6_0620,  /* FE70..FE7F */
    
#define FriBidiPropertyBlockLevel5_FEC0 0x1CC
    
    FriBidiPropertyBlockLevel6_0620,  /* FEC0..FECF */
    FriBidiPropertyBlockLevel6_0620,  /* FED0..FEDF */
    FriBidiPropertyBlockLevel6_0620,  /* FEE0..FEEF */
    FriBidiPropertyBlockLevel6_0700,  /* FEF0..FEFF */
    
#define FriBidiPropertyBlockLevel5_FF00 0x1D0
    
    FriBidiPropertyBlockLevel6_FF00,  /* FF00..FF0F */
    FriBidiPropertyBlockLevel6_0030,  /* FF10..FF1F */
    FriBidiPropertyBlockLevel6_0040,  /* FF20..FF2F */
    FriBidiPropertyBlockLevel6_0050,  /* FF30..FF3F */
    
#define FriBidiPropertyBlockLevel5_FF40 0x1D4
    
    FriBidiPropertyBlockLevel6_0040,  /* FF40..FF4F */
    FriBidiPropertyBlockLevel6_0050,  /* FF50..FF5F */
    FriBidiPropertyBlockLevel6_2330,  /* FF60..FF6F */
    FriBidiPropertyBlockLevel6_00C0,  /* FF70..FF7F */
    
#define FriBidiPropertyBlockLevel5_FFC0 0x1D8
    
    FriBidiPropertyBlockLevel6_00C0,  /* FFC0..FFCF */
    FriBidiPropertyBlockLevel6_00C0,  /* FFD0..FFDF */
    FriBidiPropertyBlockLevel6_FFE0,  /* FFE0..FFEF */
    FriBidiPropertyBlockLevel6_FFF0,  /* FFF0..FFFF */
    
#define FriBidiPropertyBlockLevel5_10100 0x1DC
    
    FriBidiPropertyBlockLevel6_10100,  /* 10100..1010F */
    FriBidiPropertyBlockLevel6_00C0,  /* 10110..1011F */
    FriBidiPropertyBlockLevel6_00C0,  /* 10120..1012F */
    FriBidiPropertyBlockLevel6_00C0,  /* 10130..1013F */
    
#define FriBidiPropertyBlockLevel5_10180 0x1E0
    
    FriBidiPropertyBlockLevel6_2440,  /* 10180..1018F */
    FriBidiPropertyBlockLevel6_00C0,  /* 10190..1019F */
    FriBidiPropertyBlockLevel6_00C0,  /* 101A0..101AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 101B0..101BF */
    
#define FriBidiPropertyBlockLevel5_10900 0x1E4
    
    FriBidiPropertyBlockLevel6_05D0,  /* 10900..1090F */
    FriBidiPropertyBlockLevel6_10910,  /* 10910..1091F */
    FriBidiPropertyBlockLevel6_05D0,  /* 10920..1092F */
    FriBidiPropertyBlockLevel6_05D0,  /* 10930..1093F */
    
#define FriBidiPropertyBlockLevel5_10A00 0x1E8
    
    FriBidiPropertyBlockLevel6_10A00,  /* 10A00..10A0F */
    FriBidiPropertyBlockLevel6_05D0,  /* 10A10..10A1F */
    FriBidiPropertyBlockLevel6_05D0,  /* 10A20..10A2F */
    FriBidiPropertyBlockLevel6_10A30,  /* 10A30..10A3F */
    
#define FriBidiPropertyBlockLevel5_1D140 0x1EC
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1D140..1D14F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D150..1D15F */
    FriBidiPropertyBlockLevel6_1D160,  /* 1D160..1D16F */
    FriBidiPropertyBlockLevel6_1D170,  /* 1D170..1D17F */
    
#define FriBidiPropertyBlockLevel5_1D180 0x1F0
    
    FriBidiPropertyBlockLevel6_1D180,  /* 1D180..1D18F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D190..1D19F */
    FriBidiPropertyBlockLevel6_1D1A0,  /* 1D1A0..1D1AF */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D1B0..1D1BF */
    
#define FriBidiPropertyBlockLevel5_1D240 0x1F4
    
    FriBidiPropertyBlockLevel6_1D240,  /* 1D240..1D24F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D250..1D25F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D260..1D26F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D270..1D27F */
    
#define FriBidiPropertyBlockLevel5_1D340 0x1F8
    
    FriBidiPropertyBlockLevel6_02F0,  /* 1D340..1D34F */
    FriBidiPropertyBlockLevel6_2420,  /* 1D350..1D35F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D360..1D36F */
    FriBidiPropertyBlockLevel6_00C0,  /* 1D370..1D37F */
    
#define FriBidiPropertyBlockLevel5_1D7C0 0x1FC
    
    FriBidiPropertyBlockLevel6_1D7C0,  /* 1D7C0..1D7CF */
    FriBidiPropertyBlockLevel6_1D7D0,  /* 1D7D0..1D7DF */
    FriBidiPropertyBlockLevel6_1D7D0,  /* 1D7E0..1D7EF */
    FriBidiPropertyBlockLevel6_1D7D0,  /* 1D7F0..1D7FF */
    
#define FriBidiPropertyBlockLevel5_1FFC0 0x200
    
    FriBidiPropertyBlockLevel6_00C0,  /* 1FFC0..1FFCF */
    FriBidiPropertyBlockLevel6_00C0,  /* 1FFD0..1FFDF */
    FriBidiPropertyBlockLevel6_00C0,  /* 1FFE0..1FFEF */
    FriBidiPropertyBlockLevel6_1FFF0,  /* 1FFF0..1FFFF */
    
#define FriBidiPropertyBlockLevel5_E0000 0x204
    
    FriBidiPropertyBlockLevel6_0090,  /* E0000..E000F */
    FriBidiPropertyBlockLevel6_0090,  /* E0010..E001F */
    FriBidiPropertyBlockLevel6_0090,  /* E0020..E002F */
    FriBidiPropertyBlockLevel6_0090,  /* E0030..E003F */
    
#define FriBidiPropertyBlockLevel5_E01C0 0x208
    
    FriBidiPropertyBlockLevel6_0300,  /* E01C0..E01CF */
    FriBidiPropertyBlockLevel6_0300,  /* E01D0..E01DF */
    FriBidiPropertyBlockLevel6_0300,  /* E01E0..E01EF */
    FriBidiPropertyBlockLevel6_0090,  /* E01F0..E01FF */
};

static const PACKTAB_UINT16 FriBidiPropertyBlockLevel4[2*91] = {
    
#define FriBidiPropertyBlockLevel4_0000 0x0
    
    FriBidiPropertyBlockLevel5_0000,  /* 0000..003F */
    FriBidiPropertyBlockLevel5_0040,  /* 0040..007F */
    
#define FriBidiPropertyBlockLevel4_0080 0x2
    
    FriBidiPropertyBlockLevel5_0080,  /* 0080..00BF */
    FriBidiPropertyBlockLevel5_00C0,  /* 00C0..00FF */
    
#define FriBidiPropertyBlockLevel4_0100 0x4
    
    FriBidiPropertyBlockLevel5_0100,  /* 0100..013F */
    FriBidiPropertyBlockLevel5_0100,  /* 0140..017F */
    
#define FriBidiPropertyBlockLevel4_0280 0x6
    
    FriBidiPropertyBlockLevel5_0280,  /* 0280..02BF */
    FriBidiPropertyBlockLevel5_02C0,  /* 02C0..02FF */
    
#define FriBidiPropertyBlockLevel4_0300 0x8
    
    FriBidiPropertyBlockLevel5_0300,  /* 0300..033F */
    FriBidiPropertyBlockLevel5_0340,  /* 0340..037F */
    
#define FriBidiPropertyBlockLevel4_0380 0xA
    
    FriBidiPropertyBlockLevel5_0380,  /* 0380..03BF */
    FriBidiPropertyBlockLevel5_03C0,  /* 03C0..03FF */
    
#define FriBidiPropertyBlockLevel4_0480 0xC
    
    FriBidiPropertyBlockLevel5_0480,  /* 0480..04BF */
    FriBidiPropertyBlockLevel5_0100,  /* 04C0..04FF */
    
#define FriBidiPropertyBlockLevel4_0580 0xE
    
    FriBidiPropertyBlockLevel5_0580,  /* 0580..05BF */
    FriBidiPropertyBlockLevel5_05C0,  /* 05C0..05FF */
    
#define FriBidiPropertyBlockLevel4_0600 0x10
    
    FriBidiPropertyBlockLevel5_0600,  /* 0600..063F */
    FriBidiPropertyBlockLevel5_0640,  /* 0640..067F */
    
#define FriBidiPropertyBlockLevel4_0680 0x12
    
    FriBidiPropertyBlockLevel5_0680,  /* 0680..06BF */
    FriBidiPropertyBlockLevel5_06C0,  /* 06C0..06FF */
    
#define FriBidiPropertyBlockLevel4_0700 0x14
    
    FriBidiPropertyBlockLevel5_0700,  /* 0700..073F */
    FriBidiPropertyBlockLevel5_0740,  /* 0740..077F */
    
#define FriBidiPropertyBlockLevel4_0780 0x16
    
    FriBidiPropertyBlockLevel5_0780,  /* 0780..07BF */
    FriBidiPropertyBlockLevel5_07C0,  /* 07C0..07FF */
    
#define FriBidiPropertyBlockLevel4_0800 0x18
    
    FriBidiPropertyBlockLevel5_0800,  /* 0800..083F */
    FriBidiPropertyBlockLevel5_0800,  /* 0840..087F */
    
#define FriBidiPropertyBlockLevel4_0900 0x1A
    
    FriBidiPropertyBlockLevel5_0900,  /* 0900..093F */
    FriBidiPropertyBlockLevel5_0940,  /* 0940..097F */
    
#define FriBidiPropertyBlockLevel4_0980 0x1C
    
    FriBidiPropertyBlockLevel5_0980,  /* 0980..09BF */
    FriBidiPropertyBlockLevel5_09C0,  /* 09C0..09FF */
    
#define FriBidiPropertyBlockLevel4_0A00 0x1E
    
    FriBidiPropertyBlockLevel5_0900,  /* 0A00..0A3F */
    FriBidiPropertyBlockLevel5_0A40,  /* 0A40..0A7F */
    
#define FriBidiPropertyBlockLevel4_0A80 0x20
    
    FriBidiPropertyBlockLevel5_0900,  /* 0A80..0ABF */
    FriBidiPropertyBlockLevel5_0AC0,  /* 0AC0..0AFF */
    
#define FriBidiPropertyBlockLevel4_0B00 0x22
    
    FriBidiPropertyBlockLevel5_0B00,  /* 0B00..0B3F */
    FriBidiPropertyBlockLevel5_0B40,  /* 0B40..0B7F */
    
#define FriBidiPropertyBlockLevel4_0B80 0x24
    
    FriBidiPropertyBlockLevel5_0B80,  /* 0B80..0BBF */
    FriBidiPropertyBlockLevel5_0BC0,  /* 0BC0..0BFF */
    
#define FriBidiPropertyBlockLevel4_0C00 0x26
    
    FriBidiPropertyBlockLevel5_0C00,  /* 0C00..0C3F */
    FriBidiPropertyBlockLevel5_0C40,  /* 0C40..0C7F */
    
#define FriBidiPropertyBlockLevel4_0C80 0x28
    
    FriBidiPropertyBlockLevel5_0C80,  /* 0C80..0CBF */
    FriBidiPropertyBlockLevel5_0CC0,  /* 0CC0..0CFF */
    
#define FriBidiPropertyBlockLevel4_0D00 0x2A
    
    FriBidiPropertyBlockLevel5_0100,  /* 0D00..0D3F */
    FriBidiPropertyBlockLevel5_0D40,  /* 0D40..0D7F */
    
#define FriBidiPropertyBlockLevel4_0D80 0x2C
    
    FriBidiPropertyBlockLevel5_0100,  /* 0D80..0DBF */
    FriBidiPropertyBlockLevel5_0DC0,  /* 0DC0..0DFF */
    
#define FriBidiPropertyBlockLevel4_0E00 0x2E
    
    FriBidiPropertyBlockLevel5_0E00,  /* 0E00..0E3F */
    FriBidiPropertyBlockLevel5_0E40,  /* 0E40..0E7F */
    
#define FriBidiPropertyBlockLevel4_0E80 0x30
    
    FriBidiPropertyBlockLevel5_0E80,  /* 0E80..0EBF */
    FriBidiPropertyBlockLevel5_0EC0,  /* 0EC0..0EFF */
    
#define FriBidiPropertyBlockLevel4_0F00 0x32
    
    FriBidiPropertyBlockLevel5_0F00,  /* 0F00..0F3F */
    FriBidiPropertyBlockLevel5_0F40,  /* 0F40..0F7F */
    
#define FriBidiPropertyBlockLevel4_0F80 0x34
    
    FriBidiPropertyBlockLevel5_0F80,  /* 0F80..0FBF */
    FriBidiPropertyBlockLevel5_0FC0,  /* 0FC0..0FFF */
    
#define FriBidiPropertyBlockLevel4_1000 0x36
    
    FriBidiPropertyBlockLevel5_1000,  /* 1000..103F */
    FriBidiPropertyBlockLevel5_1040,  /* 1040..107F */
    
#define FriBidiPropertyBlockLevel4_1300 0x38
    
    FriBidiPropertyBlockLevel5_0100,  /* 1300..133F */
    FriBidiPropertyBlockLevel5_1340,  /* 1340..137F */
    
#define FriBidiPropertyBlockLevel4_1380 0x3A
    
    FriBidiPropertyBlockLevel5_1380,  /* 1380..13BF */
    FriBidiPropertyBlockLevel5_0100,  /* 13C0..13FF */
    
#define FriBidiPropertyBlockLevel4_1680 0x3C
    
    FriBidiPropertyBlockLevel5_1680,  /* 1680..16BF */
    FriBidiPropertyBlockLevel5_0100,  /* 16C0..16FF */
    
#define FriBidiPropertyBlockLevel4_1700 0x3E
    
    FriBidiPropertyBlockLevel5_1700,  /* 1700..173F */
    FriBidiPropertyBlockLevel5_1740,  /* 1740..177F */
    
#define FriBidiPropertyBlockLevel4_1780 0x40
    
    FriBidiPropertyBlockLevel5_1780,  /* 1780..17BF */
    FriBidiPropertyBlockLevel5_17C0,  /* 17C0..17FF */
    
#define FriBidiPropertyBlockLevel4_1800 0x42
    
    FriBidiPropertyBlockLevel5_1800,  /* 1800..183F */
    FriBidiPropertyBlockLevel5_0100,  /* 1840..187F */
    
#define FriBidiPropertyBlockLevel4_1880 0x44
    
    FriBidiPropertyBlockLevel5_1880,  /* 1880..18BF */
    FriBidiPropertyBlockLevel5_0100,  /* 18C0..18FF */
    
#define FriBidiPropertyBlockLevel4_1900 0x46
    
    FriBidiPropertyBlockLevel5_1900,  /* 1900..193F */
    FriBidiPropertyBlockLevel5_1940,  /* 1940..197F */
    
#define FriBidiPropertyBlockLevel4_1980 0x48
    
    FriBidiPropertyBlockLevel5_0100,  /* 1980..19BF */
    FriBidiPropertyBlockLevel5_19C0,  /* 19C0..19FF */
    
#define FriBidiPropertyBlockLevel4_1A00 0x4A
    
    FriBidiPropertyBlockLevel5_1A00,  /* 1A00..1A3F */
    FriBidiPropertyBlockLevel5_0100,  /* 1A40..1A7F */
    
#define FriBidiPropertyBlockLevel4_1B00 0x4C
    
    FriBidiPropertyBlockLevel5_1B00,  /* 1B00..1B3F */
    FriBidiPropertyBlockLevel5_1B40,  /* 1B40..1B7F */
    
#define FriBidiPropertyBlockLevel4_1D80 0x4E
    
    FriBidiPropertyBlockLevel5_0100,  /* 1D80..1DBF */
    FriBidiPropertyBlockLevel5_1DC0,  /* 1DC0..1DFF */
    
#define FriBidiPropertyBlockLevel4_1F80 0x50
    
    FriBidiPropertyBlockLevel5_1F80,  /* 1F80..1FBF */
    FriBidiPropertyBlockLevel5_1FC0,  /* 1FC0..1FFF */
    
#define FriBidiPropertyBlockLevel4_2000 0x52
    
    FriBidiPropertyBlockLevel5_2000,  /* 2000..203F */
    FriBidiPropertyBlockLevel5_2040,  /* 2040..207F */
    
#define FriBidiPropertyBlockLevel4_2080 0x54
    
    FriBidiPropertyBlockLevel5_2080,  /* 2080..20BF */
    FriBidiPropertyBlockLevel5_20C0,  /* 20C0..20FF */
    
#define FriBidiPropertyBlockLevel4_2100 0x56
    
    FriBidiPropertyBlockLevel5_2100,  /* 2100..213F */
    FriBidiPropertyBlockLevel5_2140,  /* 2140..217F */
    
#define FriBidiPropertyBlockLevel4_2180 0x58
    
    FriBidiPropertyBlockLevel5_2180,  /* 2180..21BF */
    FriBidiPropertyBlockLevel5_21C0,  /* 21C0..21FF */
    
#define FriBidiPropertyBlockLevel4_2200 0x5A
    
    FriBidiPropertyBlockLevel5_2200,  /* 2200..223F */
    FriBidiPropertyBlockLevel5_21C0,  /* 2240..227F */
    
#define FriBidiPropertyBlockLevel4_2280 0x5C
    
    FriBidiPropertyBlockLevel5_21C0,  /* 2280..22BF */
    FriBidiPropertyBlockLevel5_21C0,  /* 22C0..22FF */
    
#define FriBidiPropertyBlockLevel4_2300 0x5E
    
    FriBidiPropertyBlockLevel5_2300,  /* 2300..233F */
    FriBidiPropertyBlockLevel5_2340,  /* 2340..237F */
    
#define FriBidiPropertyBlockLevel4_2380 0x60
    
    FriBidiPropertyBlockLevel5_2380,  /* 2380..23BF */
    FriBidiPropertyBlockLevel5_23C0,  /* 23C0..23FF */
    
#define FriBidiPropertyBlockLevel4_2400 0x62
    
    FriBidiPropertyBlockLevel5_2400,  /* 2400..243F */
    FriBidiPropertyBlockLevel5_2440,  /* 2440..247F */
    
#define FriBidiPropertyBlockLevel4_2480 0x64
    
    FriBidiPropertyBlockLevel5_2480,  /* 2480..24BF */
    FriBidiPropertyBlockLevel5_24C0,  /* 24C0..24FF */
    
#define FriBidiPropertyBlockLevel4_2680 0x66
    
    FriBidiPropertyBlockLevel5_2680,  /* 2680..26BF */
    FriBidiPropertyBlockLevel5_0100,  /* 26C0..26FF */
    
#define FriBidiPropertyBlockLevel4_2700 0x68
    
    FriBidiPropertyBlockLevel5_2700,  /* 2700..273F */
    FriBidiPropertyBlockLevel5_2740,  /* 2740..277F */
    
#define FriBidiPropertyBlockLevel4_2780 0x6A
    
    FriBidiPropertyBlockLevel5_2780,  /* 2780..27BF */
    FriBidiPropertyBlockLevel5_27C0,  /* 27C0..27FF */
    
#define FriBidiPropertyBlockLevel4_2B00 0x6C
    
    FriBidiPropertyBlockLevel5_2B00,  /* 2B00..2B3F */
    FriBidiPropertyBlockLevel5_0100,  /* 2B40..2B7F */
    
#define FriBidiPropertyBlockLevel4_2C80 0x6E
    
    FriBidiPropertyBlockLevel5_0100,  /* 2C80..2CBF */
    FriBidiPropertyBlockLevel5_2CC0,  /* 2CC0..2CFF */
    
#define FriBidiPropertyBlockLevel4_2E00 0x70
    
    FriBidiPropertyBlockLevel5_2E00,  /* 2E00..2E3F */
    FriBidiPropertyBlockLevel5_0100,  /* 2E40..2E7F */
    
#define FriBidiPropertyBlockLevel4_2E80 0x72
    
    FriBidiPropertyBlockLevel5_2E80,  /* 2E80..2EBF */
    FriBidiPropertyBlockLevel5_2EC0,  /* 2EC0..2EFF */
    
#define FriBidiPropertyBlockLevel4_2F80 0x74
    
    FriBidiPropertyBlockLevel5_21C0,  /* 2F80..2FBF */
    FriBidiPropertyBlockLevel5_2FC0,  /* 2FC0..2FFF */
    
#define FriBidiPropertyBlockLevel4_3000 0x76
    
    FriBidiPropertyBlockLevel5_3000,  /* 3000..303F */
    FriBidiPropertyBlockLevel5_0100,  /* 3040..307F */
    
#define FriBidiPropertyBlockLevel4_3080 0x78
    
    FriBidiPropertyBlockLevel5_3080,  /* 3080..30BF */
    FriBidiPropertyBlockLevel5_30C0,  /* 30C0..30FF */
    
#define FriBidiPropertyBlockLevel4_3180 0x7A
    
    FriBidiPropertyBlockLevel5_0100,  /* 3180..31BF */
    FriBidiPropertyBlockLevel5_31C0,  /* 31C0..31FF */
    
#define FriBidiPropertyBlockLevel4_3200 0x7C
    
    FriBidiPropertyBlockLevel5_3200,  /* 3200..323F */
    FriBidiPropertyBlockLevel5_3240,  /* 3240..327F */
    
#define FriBidiPropertyBlockLevel4_3280 0x7E
    
    FriBidiPropertyBlockLevel5_3280,  /* 3280..32BF */
    FriBidiPropertyBlockLevel5_32C0,  /* 32C0..32FF */
    
#define FriBidiPropertyBlockLevel4_3300 0x80
    
    FriBidiPropertyBlockLevel5_0100,  /* 3300..333F */
    FriBidiPropertyBlockLevel5_3340,  /* 3340..337F */
    
#define FriBidiPropertyBlockLevel4_3380 0x82
    
    FriBidiPropertyBlockLevel5_0100,  /* 3380..33BF */
    FriBidiPropertyBlockLevel5_33C0,  /* 33C0..33FF */
    
#define FriBidiPropertyBlockLevel4_4D80 0x84
    
    FriBidiPropertyBlockLevel5_0100,  /* 4D80..4DBF */
    FriBidiPropertyBlockLevel5_21C0,  /* 4DC0..4DFF */
    
#define FriBidiPropertyBlockLevel4_A480 0x86
    
    FriBidiPropertyBlockLevel5_2180,  /* A480..A4BF */
    FriBidiPropertyBlockLevel5_A4C0,  /* A4C0..A4FF */
    
#define FriBidiPropertyBlockLevel4_A700 0x88
    
    FriBidiPropertyBlockLevel5_A700,  /* A700..A73F */
    FriBidiPropertyBlockLevel5_0100,  /* A740..A77F */
    
#define FriBidiPropertyBlockLevel4_A800 0x8A
    
    FriBidiPropertyBlockLevel5_A800,  /* A800..A83F */
    FriBidiPropertyBlockLevel5_A840,  /* A840..A87F */
    
#define FriBidiPropertyBlockLevel4_FB00 0x8C
    
    FriBidiPropertyBlockLevel5_FB00,  /* FB00..FB3F */
    FriBidiPropertyBlockLevel5_FB40,  /* FB40..FB7F */
    
#define FriBidiPropertyBlockLevel4_FB80 0x8E
    
    FriBidiPropertyBlockLevel5_0680,  /* FB80..FBBF */
    FriBidiPropertyBlockLevel5_0680,  /* FBC0..FBFF */
    
#define FriBidiPropertyBlockLevel4_FD00 0x90
    
    FriBidiPropertyBlockLevel5_FD00,  /* FD00..FD3F */
    FriBidiPropertyBlockLevel5_0680,  /* FD40..FD7F */
    
#define FriBidiPropertyBlockLevel4_FD80 0x92
    
    FriBidiPropertyBlockLevel5_0680,  /* FD80..FDBF */
    FriBidiPropertyBlockLevel5_FDC0,  /* FDC0..FDFF */
    
#define FriBidiPropertyBlockLevel4_FE00 0x94
    
    FriBidiPropertyBlockLevel5_FE00,  /* FE00..FE3F */
    FriBidiPropertyBlockLevel5_FE40,  /* FE40..FE7F */
    
#define FriBidiPropertyBlockLevel4_FE80 0x96
    
    FriBidiPropertyBlockLevel5_0680,  /* FE80..FEBF */
    FriBidiPropertyBlockLevel5_FEC0,  /* FEC0..FEFF */
    
#define FriBidiPropertyBlockLevel4_FF00 0x98
    
    FriBidiPropertyBlockLevel5_FF00,  /* FF00..FF3F */
    FriBidiPropertyBlockLevel5_FF40,  /* FF40..FF7F */
    
#define FriBidiPropertyBlockLevel4_FF80 0x9A
    
    FriBidiPropertyBlockLevel5_0100,  /* FF80..FFBF */
    FriBidiPropertyBlockLevel5_FFC0,  /* FFC0..FFFF */
    
#define FriBidiPropertyBlockLevel4_10100 0x9C
    
    FriBidiPropertyBlockLevel5_10100,  /* 10100..1013F */
    FriBidiPropertyBlockLevel5_21C0,  /* 10140..1017F */
    
#define FriBidiPropertyBlockLevel4_10180 0x9E
    
    FriBidiPropertyBlockLevel5_10180,  /* 10180..101BF */
    FriBidiPropertyBlockLevel5_0100,  /* 101C0..101FF */
    
#define FriBidiPropertyBlockLevel4_10900 0xA0
    
    FriBidiPropertyBlockLevel5_10900,  /* 10900..1093F */
    FriBidiPropertyBlockLevel5_0800,  /* 10940..1097F */
    
#define FriBidiPropertyBlockLevel4_10A00 0xA2
    
    FriBidiPropertyBlockLevel5_10A00,  /* 10A00..10A3F */
    FriBidiPropertyBlockLevel5_0800,  /* 10A40..10A7F */
    
#define FriBidiPropertyBlockLevel4_1D100 0xA4
    
    FriBidiPropertyBlockLevel5_0100,  /* 1D100..1D13F */
    FriBidiPropertyBlockLevel5_1D140,  /* 1D140..1D17F */
    
#define FriBidiPropertyBlockLevel4_1D180 0xA6
    
    FriBidiPropertyBlockLevel5_1D180,  /* 1D180..1D1BF */
    FriBidiPropertyBlockLevel5_0100,  /* 1D1C0..1D1FF */
    
#define FriBidiPropertyBlockLevel4_1D200 0xA8
    
    FriBidiPropertyBlockLevel5_21C0,  /* 1D200..1D23F */
    FriBidiPropertyBlockLevel5_1D240,  /* 1D240..1D27F */
    
#define FriBidiPropertyBlockLevel4_1D300 0xAA
    
    FriBidiPropertyBlockLevel5_21C0,  /* 1D300..1D33F */
    FriBidiPropertyBlockLevel5_1D340,  /* 1D340..1D37F */
    
#define FriBidiPropertyBlockLevel4_1D780 0xAC
    
    FriBidiPropertyBlockLevel5_0100,  /* 1D780..1D7BF */
    FriBidiPropertyBlockLevel5_1D7C0,  /* 1D7C0..1D7FF */
    
#define FriBidiPropertyBlockLevel4_1FF80 0xAE
    
    FriBidiPropertyBlockLevel5_0100,  /* 1FF80..1FFBF */
    FriBidiPropertyBlockLevel5_1FFC0,  /* 1FFC0..1FFFF */
    
#define FriBidiPropertyBlockLevel4_E0000 0xB0
    
    FriBidiPropertyBlockLevel5_E0000,  /* E0000..E003F */
    FriBidiPropertyBlockLevel5_E0000,  /* E0040..E007F */
    
#define FriBidiPropertyBlockLevel4_E0100 0xB2
    
    FriBidiPropertyBlockLevel5_0300,  /* E0100..E013F */
    FriBidiPropertyBlockLevel5_0300,  /* E0140..E017F */
    
#define FriBidiPropertyBlockLevel4_E0180 0xB4
    
    FriBidiPropertyBlockLevel5_0300,  /* E0180..E01BF */
    FriBidiPropertyBlockLevel5_E01C0,  /* E01C0..E01FF */
};

static const PACKTAB_UINT8 FriBidiPropertyBlockLevel3[8*27] = {
    
#define FriBidiPropertyBlockLevel3_0000 0x0
    
    FriBidiPropertyBlockLevel4_0000,  /* 0000..007F */
    FriBidiPropertyBlockLevel4_0080,  /* 0080..00FF */
    FriBidiPropertyBlockLevel4_0100,  /* 0100..017F */
    FriBidiPropertyBlockLevel4_0100,  /* 0180..01FF */
    FriBidiPropertyBlockLevel4_0100,  /* 0200..027F */
    FriBidiPropertyBlockLevel4_0280,  /* 0280..02FF */
    FriBidiPropertyBlockLevel4_0300,  /* 0300..037F */
    FriBidiPropertyBlockLevel4_0380,  /* 0380..03FF */
    
#define FriBidiPropertyBlockLevel3_0400 0x8
    
    FriBidiPropertyBlockLevel4_0100,  /* 0400..047F */
    FriBidiPropertyBlockLevel4_0480,  /* 0480..04FF */
    FriBidiPropertyBlockLevel4_0100,  /* 0500..057F */
    FriBidiPropertyBlockLevel4_0580,  /* 0580..05FF */
    FriBidiPropertyBlockLevel4_0600,  /* 0600..067F */
    FriBidiPropertyBlockLevel4_0680,  /* 0680..06FF */
    FriBidiPropertyBlockLevel4_0700,  /* 0700..077F */
    FriBidiPropertyBlockLevel4_0780,  /* 0780..07FF */
    
#define FriBidiPropertyBlockLevel3_0800 0x10
    
    FriBidiPropertyBlockLevel4_0800,  /* 0800..087F */
    FriBidiPropertyBlockLevel4_0800,  /* 0880..08FF */
    FriBidiPropertyBlockLevel4_0900,  /* 0900..097F */
    FriBidiPropertyBlockLevel4_0980,  /* 0980..09FF */
    FriBidiPropertyBlockLevel4_0A00,  /* 0A00..0A7F */
    FriBidiPropertyBlockLevel4_0A80,  /* 0A80..0AFF */
    FriBidiPropertyBlockLevel4_0B00,  /* 0B00..0B7F */
    FriBidiPropertyBlockLevel4_0B80,  /* 0B80..0BFF */
    
#define FriBidiPropertyBlockLevel3_0C00 0x18
    
    FriBidiPropertyBlockLevel4_0C00,  /* 0C00..0C7F */
    FriBidiPropertyBlockLevel4_0C80,  /* 0C80..0CFF */
    FriBidiPropertyBlockLevel4_0D00,  /* 0D00..0D7F */
    FriBidiPropertyBlockLevel4_0D80,  /* 0D80..0DFF */
    FriBidiPropertyBlockLevel4_0E00,  /* 0E00..0E7F */
    FriBidiPropertyBlockLevel4_0E80,  /* 0E80..0EFF */
    FriBidiPropertyBlockLevel4_0F00,  /* 0F00..0F7F */
    FriBidiPropertyBlockLevel4_0F80,  /* 0F80..0FFF */
    
#define FriBidiPropertyBlockLevel3_1000 0x20
    
    FriBidiPropertyBlockLevel4_1000,  /* 1000..107F */
    FriBidiPropertyBlockLevel4_0100,  /* 1080..10FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1100..117F */
    FriBidiPropertyBlockLevel4_0100,  /* 1180..11FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1200..127F */
    FriBidiPropertyBlockLevel4_0100,  /* 1280..12FF */
    FriBidiPropertyBlockLevel4_1300,  /* 1300..137F */
    FriBidiPropertyBlockLevel4_1380,  /* 1380..13FF */
    
#define FriBidiPropertyBlockLevel3_1400 0x28
    
    FriBidiPropertyBlockLevel4_0100,  /* 1400..147F */
    FriBidiPropertyBlockLevel4_0100,  /* 1480..14FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1500..157F */
    FriBidiPropertyBlockLevel4_0100,  /* 1580..15FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1600..167F */
    FriBidiPropertyBlockLevel4_1680,  /* 1680..16FF */
    FriBidiPropertyBlockLevel4_1700,  /* 1700..177F */
    FriBidiPropertyBlockLevel4_1780,  /* 1780..17FF */
    
#define FriBidiPropertyBlockLevel3_1800 0x30
    
    FriBidiPropertyBlockLevel4_1800,  /* 1800..187F */
    FriBidiPropertyBlockLevel4_1880,  /* 1880..18FF */
    FriBidiPropertyBlockLevel4_1900,  /* 1900..197F */
    FriBidiPropertyBlockLevel4_1980,  /* 1980..19FF */
    FriBidiPropertyBlockLevel4_1A00,  /* 1A00..1A7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1A80..1AFF */
    FriBidiPropertyBlockLevel4_1B00,  /* 1B00..1B7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1B80..1BFF */
    
#define FriBidiPropertyBlockLevel3_1C00 0x38
    
    FriBidiPropertyBlockLevel4_0100,  /* 1C00..1C7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1C80..1CFF */
    FriBidiPropertyBlockLevel4_0100,  /* 1D00..1D7F */
    FriBidiPropertyBlockLevel4_1D80,  /* 1D80..1DFF */
    FriBidiPropertyBlockLevel4_0100,  /* 1E00..1E7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1E80..1EFF */
    FriBidiPropertyBlockLevel4_0100,  /* 1F00..1F7F */
    FriBidiPropertyBlockLevel4_1F80,  /* 1F80..1FFF */
    
#define FriBidiPropertyBlockLevel3_2000 0x40
    
    FriBidiPropertyBlockLevel4_2000,  /* 2000..207F */
    FriBidiPropertyBlockLevel4_2080,  /* 2080..20FF */
    FriBidiPropertyBlockLevel4_2100,  /* 2100..217F */
    FriBidiPropertyBlockLevel4_2180,  /* 2180..21FF */
    FriBidiPropertyBlockLevel4_2200,  /* 2200..227F */
    FriBidiPropertyBlockLevel4_2280,  /* 2280..22FF */
    FriBidiPropertyBlockLevel4_2300,  /* 2300..237F */
    FriBidiPropertyBlockLevel4_2380,  /* 2380..23FF */
    
#define FriBidiPropertyBlockLevel3_2400 0x48
    
    FriBidiPropertyBlockLevel4_2400,  /* 2400..247F */
    FriBidiPropertyBlockLevel4_2480,  /* 2480..24FF */
    FriBidiPropertyBlockLevel4_2280,  /* 2500..257F */
    FriBidiPropertyBlockLevel4_2280,  /* 2580..25FF */
    FriBidiPropertyBlockLevel4_2280,  /* 2600..267F */
    FriBidiPropertyBlockLevel4_2680,  /* 2680..26FF */
    FriBidiPropertyBlockLevel4_2700,  /* 2700..277F */
    FriBidiPropertyBlockLevel4_2780,  /* 2780..27FF */
    
#define FriBidiPropertyBlockLevel3_2800 0x50
    
    FriBidiPropertyBlockLevel4_0100,  /* 2800..287F */
    FriBidiPropertyBlockLevel4_0100,  /* 2880..28FF */
    FriBidiPropertyBlockLevel4_2280,  /* 2900..297F */
    FriBidiPropertyBlockLevel4_2280,  /* 2980..29FF */
    FriBidiPropertyBlockLevel4_2280,  /* 2A00..2A7F */
    FriBidiPropertyBlockLevel4_2280,  /* 2A80..2AFF */
    FriBidiPropertyBlockLevel4_2B00,  /* 2B00..2B7F */
    FriBidiPropertyBlockLevel4_0100,  /* 2B80..2BFF */
    
#define FriBidiPropertyBlockLevel3_2C00 0x58
    
    FriBidiPropertyBlockLevel4_0100,  /* 2C00..2C7F */
    FriBidiPropertyBlockLevel4_2C80,  /* 2C80..2CFF */
    FriBidiPropertyBlockLevel4_0100,  /* 2D00..2D7F */
    FriBidiPropertyBlockLevel4_0100,  /* 2D80..2DFF */
    FriBidiPropertyBlockLevel4_2E00,  /* 2E00..2E7F */
    FriBidiPropertyBlockLevel4_2E80,  /* 2E80..2EFF */
    FriBidiPropertyBlockLevel4_2280,  /* 2F00..2F7F */
    FriBidiPropertyBlockLevel4_2F80,  /* 2F80..2FFF */
    
#define FriBidiPropertyBlockLevel3_3000 0x60
    
    FriBidiPropertyBlockLevel4_3000,  /* 3000..307F */
    FriBidiPropertyBlockLevel4_3080,  /* 3080..30FF */
    FriBidiPropertyBlockLevel4_0100,  /* 3100..317F */
    FriBidiPropertyBlockLevel4_3180,  /* 3180..31FF */
    FriBidiPropertyBlockLevel4_3200,  /* 3200..327F */
    FriBidiPropertyBlockLevel4_3280,  /* 3280..32FF */
    FriBidiPropertyBlockLevel4_3300,  /* 3300..337F */
    FriBidiPropertyBlockLevel4_3380,  /* 3380..33FF */
    
#define FriBidiPropertyBlockLevel3_3400 0x68
    
    FriBidiPropertyBlockLevel4_0100,  /* 3400..347F */
    FriBidiPropertyBlockLevel4_0100,  /* 3480..34FF */
    FriBidiPropertyBlockLevel4_0100,  /* 3500..357F */
    FriBidiPropertyBlockLevel4_0100,  /* 3580..35FF */
    FriBidiPropertyBlockLevel4_0100,  /* 3600..367F */
    FriBidiPropertyBlockLevel4_0100,  /* 3680..36FF */
    FriBidiPropertyBlockLevel4_0100,  /* 3700..377F */
    FriBidiPropertyBlockLevel4_0100,  /* 3780..37FF */
    
#define FriBidiPropertyBlockLevel3_4C00 0x70
    
    FriBidiPropertyBlockLevel4_0100,  /* 4C00..4C7F */
    FriBidiPropertyBlockLevel4_0100,  /* 4C80..4CFF */
    FriBidiPropertyBlockLevel4_0100,  /* 4D00..4D7F */
    FriBidiPropertyBlockLevel4_4D80,  /* 4D80..4DFF */
    FriBidiPropertyBlockLevel4_0100,  /* 4E00..4E7F */
    FriBidiPropertyBlockLevel4_0100,  /* 4E80..4EFF */
    FriBidiPropertyBlockLevel4_0100,  /* 4F00..4F7F */
    FriBidiPropertyBlockLevel4_0100,  /* 4F80..4FFF */
    
#define FriBidiPropertyBlockLevel3_A400 0x78
    
    FriBidiPropertyBlockLevel4_0100,  /* A400..A47F */
    FriBidiPropertyBlockLevel4_A480,  /* A480..A4FF */
    FriBidiPropertyBlockLevel4_0100,  /* A500..A57F */
    FriBidiPropertyBlockLevel4_0100,  /* A580..A5FF */
    FriBidiPropertyBlockLevel4_0100,  /* A600..A67F */
    FriBidiPropertyBlockLevel4_0100,  /* A680..A6FF */
    FriBidiPropertyBlockLevel4_A700,  /* A700..A77F */
    FriBidiPropertyBlockLevel4_0100,  /* A780..A7FF */
    
#define FriBidiPropertyBlockLevel3_A800 0x80
    
    FriBidiPropertyBlockLevel4_A800,  /* A800..A87F */
    FriBidiPropertyBlockLevel4_0100,  /* A880..A8FF */
    FriBidiPropertyBlockLevel4_0100,  /* A900..A97F */
    FriBidiPropertyBlockLevel4_0100,  /* A980..A9FF */
    FriBidiPropertyBlockLevel4_0100,  /* AA00..AA7F */
    FriBidiPropertyBlockLevel4_0100,  /* AA80..AAFF */
    FriBidiPropertyBlockLevel4_0100,  /* AB00..AB7F */
    FriBidiPropertyBlockLevel4_0100,  /* AB80..ABFF */
    
#define FriBidiPropertyBlockLevel3_F800 0x88
    
    FriBidiPropertyBlockLevel4_0100,  /* F800..F87F */
    FriBidiPropertyBlockLevel4_0100,  /* F880..F8FF */
    FriBidiPropertyBlockLevel4_0100,  /* F900..F97F */
    FriBidiPropertyBlockLevel4_0100,  /* F980..F9FF */
    FriBidiPropertyBlockLevel4_0100,  /* FA00..FA7F */
    FriBidiPropertyBlockLevel4_0100,  /* FA80..FAFF */
    FriBidiPropertyBlockLevel4_FB00,  /* FB00..FB7F */
    FriBidiPropertyBlockLevel4_FB80,  /* FB80..FBFF */
    
#define FriBidiPropertyBlockLevel3_FC00 0x90
    
    FriBidiPropertyBlockLevel4_FB80,  /* FC00..FC7F */
    FriBidiPropertyBlockLevel4_FB80,  /* FC80..FCFF */
    FriBidiPropertyBlockLevel4_FD00,  /* FD00..FD7F */
    FriBidiPropertyBlockLevel4_FD80,  /* FD80..FDFF */
    FriBidiPropertyBlockLevel4_FE00,  /* FE00..FE7F */
    FriBidiPropertyBlockLevel4_FE80,  /* FE80..FEFF */
    FriBidiPropertyBlockLevel4_FF00,  /* FF00..FF7F */
    FriBidiPropertyBlockLevel4_FF80,  /* FF80..FFFF */
    
#define FriBidiPropertyBlockLevel3_10000 0x98
    
    FriBidiPropertyBlockLevel4_0100,  /* 10000..1007F */
    FriBidiPropertyBlockLevel4_0100,  /* 10080..100FF */
    FriBidiPropertyBlockLevel4_10100,  /* 10100..1017F */
    FriBidiPropertyBlockLevel4_10180,  /* 10180..101FF */
    FriBidiPropertyBlockLevel4_0100,  /* 10200..1027F */
    FriBidiPropertyBlockLevel4_0100,  /* 10280..102FF */
    FriBidiPropertyBlockLevel4_0100,  /* 10300..1037F */
    FriBidiPropertyBlockLevel4_0100,  /* 10380..103FF */
    
#define FriBidiPropertyBlockLevel3_10800 0xA0
    
    FriBidiPropertyBlockLevel4_0800,  /* 10800..1087F */
    FriBidiPropertyBlockLevel4_0800,  /* 10880..108FF */
    FriBidiPropertyBlockLevel4_10900,  /* 10900..1097F */
    FriBidiPropertyBlockLevel4_0800,  /* 10980..109FF */
    FriBidiPropertyBlockLevel4_10A00,  /* 10A00..10A7F */
    FriBidiPropertyBlockLevel4_0800,  /* 10A80..10AFF */
    FriBidiPropertyBlockLevel4_0800,  /* 10B00..10B7F */
    FriBidiPropertyBlockLevel4_0800,  /* 10B80..10BFF */
    
#define FriBidiPropertyBlockLevel3_10C00 0xA8
    
    FriBidiPropertyBlockLevel4_0800,  /* 10C00..10C7F */
    FriBidiPropertyBlockLevel4_0800,  /* 10C80..10CFF */
    FriBidiPropertyBlockLevel4_0800,  /* 10D00..10D7F */
    FriBidiPropertyBlockLevel4_0800,  /* 10D80..10DFF */
    FriBidiPropertyBlockLevel4_0800,  /* 10E00..10E7F */
    FriBidiPropertyBlockLevel4_0800,  /* 10E80..10EFF */
    FriBidiPropertyBlockLevel4_0800,  /* 10F00..10F7F */
    FriBidiPropertyBlockLevel4_0800,  /* 10F80..10FFF */
    
#define FriBidiPropertyBlockLevel3_1D000 0xB0
    
    FriBidiPropertyBlockLevel4_0100,  /* 1D000..1D07F */
    FriBidiPropertyBlockLevel4_0100,  /* 1D080..1D0FF */
    FriBidiPropertyBlockLevel4_1D100,  /* 1D100..1D17F */
    FriBidiPropertyBlockLevel4_1D180,  /* 1D180..1D1FF */
    FriBidiPropertyBlockLevel4_1D200,  /* 1D200..1D27F */
    FriBidiPropertyBlockLevel4_0100,  /* 1D280..1D2FF */
    FriBidiPropertyBlockLevel4_1D300,  /* 1D300..1D37F */
    FriBidiPropertyBlockLevel4_0100,  /* 1D380..1D3FF */
    
#define FriBidiPropertyBlockLevel3_1D400 0xB8
    
    FriBidiPropertyBlockLevel4_0100,  /* 1D400..1D47F */
    FriBidiPropertyBlockLevel4_0100,  /* 1D480..1D4FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1D500..1D57F */
    FriBidiPropertyBlockLevel4_0100,  /* 1D580..1D5FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1D600..1D67F */
    FriBidiPropertyBlockLevel4_0100,  /* 1D680..1D6FF */
    FriBidiPropertyBlockLevel4_0100,  /* 1D700..1D77F */
    FriBidiPropertyBlockLevel4_1D780,  /* 1D780..1D7FF */
    
#define FriBidiPropertyBlockLevel3_1FC00 0xC0
    
    FriBidiPropertyBlockLevel4_0100,  /* 1FC00..1FC7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1FC80..1FCFF */
    FriBidiPropertyBlockLevel4_0100,  /* 1FD00..1FD7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1FD80..1FDFF */
    FriBidiPropertyBlockLevel4_0100,  /* 1FE00..1FE7F */
    FriBidiPropertyBlockLevel4_0100,  /* 1FE80..1FEFF */
    FriBidiPropertyBlockLevel4_0100,  /* 1FF00..1FF7F */
    FriBidiPropertyBlockLevel4_1FF80,  /* 1FF80..1FFFF */
    
#define FriBidiPropertyBlockLevel3_E0000 0xC8
    
    FriBidiPropertyBlockLevel4_E0000,  /* E0000..E007F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0080..E00FF */
    FriBidiPropertyBlockLevel4_E0100,  /* E0100..E017F */
    FriBidiPropertyBlockLevel4_E0180,  /* E0180..E01FF */
    FriBidiPropertyBlockLevel4_E0000,  /* E0200..E027F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0280..E02FF */
    FriBidiPropertyBlockLevel4_E0000,  /* E0300..E037F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0380..E03FF */
    
#define FriBidiPropertyBlockLevel3_E0400 0xD0
    
    FriBidiPropertyBlockLevel4_E0000,  /* E0400..E047F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0480..E04FF */
    FriBidiPropertyBlockLevel4_E0000,  /* E0500..E057F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0580..E05FF */
    FriBidiPropertyBlockLevel4_E0000,  /* E0600..E067F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0680..E06FF */
    FriBidiPropertyBlockLevel4_E0000,  /* E0700..E077F */
    FriBidiPropertyBlockLevel4_E0000,  /* E0780..E07FF */
};

static const PACKTAB_UINT8 FriBidiPropertyBlockLevel2[4*12] = {
    
#define FriBidiPropertyBlockLevel2_0000 0x0
    
    FriBidiPropertyBlockLevel3_0000,  /* 0000..03FF */
    FriBidiPropertyBlockLevel3_0400,  /* 0400..07FF */
    FriBidiPropertyBlockLevel3_0800,  /* 0800..0BFF */
    FriBidiPropertyBlockLevel3_0C00,  /* 0C00..0FFF */
    
#define FriBidiPropertyBlockLevel2_1000 0x4
    
    FriBidiPropertyBlockLevel3_1000,  /* 1000..13FF */
    FriBidiPropertyBlockLevel3_1400,  /* 1400..17FF */
    FriBidiPropertyBlockLevel3_1800,  /* 1800..1BFF */
    FriBidiPropertyBlockLevel3_1C00,  /* 1C00..1FFF */
    
#define FriBidiPropertyBlockLevel2_2000 0x8
    
    FriBidiPropertyBlockLevel3_2000,  /* 2000..23FF */
    FriBidiPropertyBlockLevel3_2400,  /* 2400..27FF */
    FriBidiPropertyBlockLevel3_2800,  /* 2800..2BFF */
    FriBidiPropertyBlockLevel3_2C00,  /* 2C00..2FFF */
    
#define FriBidiPropertyBlockLevel2_3000 0xC
    
    FriBidiPropertyBlockLevel3_3000,  /* 3000..33FF */
    FriBidiPropertyBlockLevel3_3400,  /* 3400..37FF */
    FriBidiPropertyBlockLevel3_3400,  /* 3800..3BFF */
    FriBidiPropertyBlockLevel3_3400,  /* 3C00..3FFF */
    
#define FriBidiPropertyBlockLevel2_4000 0x10
    
    FriBidiPropertyBlockLevel3_3400,  /* 4000..43FF */
    FriBidiPropertyBlockLevel3_3400,  /* 4400..47FF */
    FriBidiPropertyBlockLevel3_3400,  /* 4800..4BFF */
    FriBidiPropertyBlockLevel3_4C00,  /* 4C00..4FFF */
    
#define FriBidiPropertyBlockLevel2_5000 0x14
    
    FriBidiPropertyBlockLevel3_3400,  /* 5000..53FF */
    FriBidiPropertyBlockLevel3_3400,  /* 5400..57FF */
    FriBidiPropertyBlockLevel3_3400,  /* 5800..5BFF */
    FriBidiPropertyBlockLevel3_3400,  /* 5C00..5FFF */
    
#define FriBidiPropertyBlockLevel2_A000 0x18
    
    FriBidiPropertyBlockLevel3_3400,  /* A000..A3FF */
    FriBidiPropertyBlockLevel3_A400,  /* A400..A7FF */
    FriBidiPropertyBlockLevel3_A800,  /* A800..ABFF */
    FriBidiPropertyBlockLevel3_3400,  /* AC00..AFFF */
    
#define FriBidiPropertyBlockLevel2_F000 0x1C
    
    FriBidiPropertyBlockLevel3_3400,  /* F000..F3FF */
    FriBidiPropertyBlockLevel3_3400,  /* F400..F7FF */
    FriBidiPropertyBlockLevel3_F800,  /* F800..FBFF */
    FriBidiPropertyBlockLevel3_FC00,  /* FC00..FFFF */
    
#define FriBidiPropertyBlockLevel2_10000 0x20
    
    FriBidiPropertyBlockLevel3_10000,  /* 10000..103FF */
    FriBidiPropertyBlockLevel3_3400,  /* 10400..107FF */
    FriBidiPropertyBlockLevel3_10800,  /* 10800..10BFF */
    FriBidiPropertyBlockLevel3_10C00,  /* 10C00..10FFF */
    
#define FriBidiPropertyBlockLevel2_1D000 0x24
    
    FriBidiPropertyBlockLevel3_1D000,  /* 1D000..1D3FF */
    FriBidiPropertyBlockLevel3_1D400,  /* 1D400..1D7FF */
    FriBidiPropertyBlockLevel3_3400,  /* 1D800..1DBFF */
    FriBidiPropertyBlockLevel3_3400,  /* 1DC00..1DFFF */
    
#define FriBidiPropertyBlockLevel2_1F000 0x28
    
    FriBidiPropertyBlockLevel3_3400,  /* 1F000..1F3FF */
    FriBidiPropertyBlockLevel3_3400,  /* 1F400..1F7FF */
    FriBidiPropertyBlockLevel3_3400,  /* 1F800..1FBFF */
    FriBidiPropertyBlockLevel3_1FC00,  /* 1FC00..1FFFF */
    
#define FriBidiPropertyBlockLevel2_E0000 0x2C
    
    FriBidiPropertyBlockLevel3_E0000,  /* E0000..E03FF */
    FriBidiPropertyBlockLevel3_E0400,  /* E0400..E07FF */
    FriBidiPropertyBlockLevel3_E0400,  /* E0800..E0BFF */
    FriBidiPropertyBlockLevel3_E0400,  /* E0C00..E0FFF */
};

static const PACKTAB_UINT8 FriBidiPropertyBlockLevel1[16*4] = {
    
#define FriBidiPropertyBlockLevel1_0000 0x0
    
    FriBidiPropertyBlockLevel2_0000,  /* 0000..0FFF */
    FriBidiPropertyBlockLevel2_1000,  /* 1000..1FFF */
    FriBidiPropertyBlockLevel2_2000,  /* 2000..2FFF */
    FriBidiPropertyBlockLevel2_3000,  /* 3000..3FFF */
    FriBidiPropertyBlockLevel2_4000,  /* 4000..4FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 5000..5FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 6000..6FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 7000..7FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 8000..8FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 9000..9FFF */
    FriBidiPropertyBlockLevel2_A000,  /* A000..AFFF */
    FriBidiPropertyBlockLevel2_5000,  /* B000..BFFF */
    FriBidiPropertyBlockLevel2_5000,  /* C000..CFFF */
    FriBidiPropertyBlockLevel2_5000,  /* D000..DFFF */
    FriBidiPropertyBlockLevel2_5000,  /* E000..EFFF */
    FriBidiPropertyBlockLevel2_F000,  /* F000..FFFF */
    
#define FriBidiPropertyBlockLevel1_10000 0x10
    
    FriBidiPropertyBlockLevel2_10000,  /* 10000..10FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 11000..11FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 12000..12FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 13000..13FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 14000..14FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 15000..15FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 16000..16FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 17000..17FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 18000..18FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 19000..19FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 1A000..1AFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 1B000..1BFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 1C000..1CFFF */
    FriBidiPropertyBlockLevel2_1D000,  /* 1D000..1DFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 1E000..1EFFF */
    FriBidiPropertyBlockLevel2_1F000,  /* 1F000..1FFFF */
    
#define FriBidiPropertyBlockLevel1_20000 0x20
    
    FriBidiPropertyBlockLevel2_5000,  /* 20000..20FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 21000..21FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 22000..22FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 23000..23FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 24000..24FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 25000..25FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 26000..26FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 27000..27FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 28000..28FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 29000..29FFF */
    FriBidiPropertyBlockLevel2_5000,  /* 2A000..2AFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 2B000..2BFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 2C000..2CFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 2D000..2DFFF */
    FriBidiPropertyBlockLevel2_5000,  /* 2E000..2EFFF */
    FriBidiPropertyBlockLevel2_1F000,  /* 2F000..2FFFF */
    
#define FriBidiPropertyBlockLevel1_E0000 0x30
    
    FriBidiPropertyBlockLevel2_E0000,  /* E0000..E0FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E1000..E1FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E2000..E2FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E3000..E3FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E4000..E4FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E5000..E5FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E6000..E6FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E7000..E7FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E8000..E8FFF */
    FriBidiPropertyBlockLevel2_5000,  /* E9000..E9FFF */
    FriBidiPropertyBlockLevel2_5000,  /* EA000..EAFFF */
    FriBidiPropertyBlockLevel2_5000,  /* EB000..EBFFF */
    FriBidiPropertyBlockLevel2_5000,  /* EC000..ECFFF */
    FriBidiPropertyBlockLevel2_5000,  /* ED000..EDFFF */
    FriBidiPropertyBlockLevel2_5000,  /* EE000..EEFFF */
    FriBidiPropertyBlockLevel2_1F000,  /* EF000..EFFFF */
};

static const PACKTAB_UINT8 FriBidiPropertyBlockLevel0[17*1] = {
    
#define FriBidiPropertyBlockLevel0_0000 0x0
    
    FriBidiPropertyBlockLevel1_0000,  /* 0000..FFFF */
    FriBidiPropertyBlockLevel1_10000,  /* 10000..1FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 20000..2FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 30000..3FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 40000..4FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 50000..5FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 60000..6FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 70000..7FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 80000..8FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 90000..9FFFF */
    FriBidiPropertyBlockLevel1_20000,  /* A0000..AFFFF */
    FriBidiPropertyBlockLevel1_20000,  /* B0000..BFFFF */
    FriBidiPropertyBlockLevel1_20000,  /* C0000..CFFFF */
    FriBidiPropertyBlockLevel1_20000,  /* D0000..DFFFF */
    FriBidiPropertyBlockLevel1_E0000,  /* E0000..EFFFF */
    FriBidiPropertyBlockLevel1_20000,  /* F0000..FFFFF */
    FriBidiPropertyBlockLevel1_20000,  /* 100000..10FFFF */
};

/* *INDENT-ON* */

#define FRIBIDI_GET_TYPE(x)	\
FriBidiPropertyBlockLevel8[(x)%2 +	\
FriBidiPropertyBlockLevel7[(x)/2%2 +	\
FriBidiPropertyBlockLevel6[(x)/4%4 +	\
FriBidiPropertyBlockLevel5[(x)/16%4 +	\
FriBidiPropertyBlockLevel4[(x)/64%2 +	\
FriBidiPropertyBlockLevel3[(x)/128%8 +	\
FriBidiPropertyBlockLevel2[(x)/1024%4 +	\
FriBidiPropertyBlockLevel1[(x)/4096%16 +	\
FriBidiPropertyBlockLevel0[(x)/65536]]]]]]]]]


#endif /* FRIBIDI_TAB_CHAR_TYPE_9_I */
