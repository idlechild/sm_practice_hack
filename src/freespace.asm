
; Original design by cout https://github.com/cout/baby_metroid/blob/main/src/freespace.asm

; Assign start of freespace per bank
; Only one chunk allowed per bank
; Ommited banks have no freespace
!START_FREESPACE_80 = $80CD8E ; $3232
!START_FREESPACE_81 = $81EF1A ; $FE6
!START_FREESPACE_82 = $82F70F ; $8F1
!START_FREESPACE_83 = $83AD66 ; $529A
!START_FREESPACE_84 = $84EFD9 ; $1027 (PAL)
!START_FREESPACE_85 = $859643 ; $69BF
!START_FREESPACE_86 = $86F4E2 ; $B1E (PAL)
!START_FREESPACE_87 = $87C964 ; $369C
!START_FREESPACE_88 = $88EE32 ; $11CE
!START_FREESPACE_89 = $89AEFD ; $5103
!START_FREESPACE_8A = $8AE980 ; $1680
!START_FREESPACE_8B = $8BF760 ; $8A0
if !FEATURE_PAL
!START_FREESPACE_8C = $8CF79D ; $C17 (PAL)
else
; NTSC needs more freespace for cutscenes
!START_FREESPACE_8C = $8CF3E9 ; $C17
endif
!START_FREESPACE_8D = $8DFFF1 ; $F
!START_FREESPACE_8E = $8EE600 ; $1A00
!START_FREESPACE_8F = $8FE99B ; $1665
!START_FREESPACE_90 = $90F63A ; $9C6
!START_FREESPACE_91 = $91FFEE ; $12
!START_FREESPACE_92 = $92EDF4 ; $120C
!START_FREESPACE_93 = $93F61D ; $9E3
!START_FREESPACE_94 = $94B19F ; $1661
!START_FREESPACE_99 = $99EE21 ; $11DF
!START_FREESPACE_9A = $9AFC20 ; $3E0
!START_FREESPACE_9B = $9BCBFB ; $1405
!START_FREESPACE_9C = $9CFA80 ; $580
!START_FREESPACE_9D = $9DF780 ; $880
!START_FREESPACE_9E = $9EF6C0 ; $940
!START_FREESPACE_9F = $9FF740 ; $8C0
!START_FREESPACE_A0 = $A0F7F3 ; $80D (PAL)
!START_FREESPACE_A1 = $A1EBD1 ; $142F
!START_FREESPACE_A2 = $A2F4B0 ; $B50 (PAL)
!START_FREESPACE_A3 = $A3F32D ; $CD3 (PAL)
!START_FREESPACE_A4 = $A4F6D9 ; $927 (PAL)
!START_FREESPACE_A5 = $A5F99F ; $661 (PAL)
!START_FREESPACE_A6 = $A6FE93 ; $16D (PAL)
!START_FREESPACE_A7 = $A7FFB6 ; $4A (PAL)
!START_FREESPACE_A8 = $A8F9CD ; $633 (PAL)
!START_FREESPACE_A9 = $A9FBBD ; $443 (PAL)
!START_FREESPACE_AA = $AAF7E3 ; $81D (PAL)
!START_FREESPACE_AB = $ABF800 ; $800
!START_FREESPACE_AC = $ACEE00 ; $1200
!START_FREESPACE_AD = $ADF710 ; $8F0 (PAL)
!START_FREESPACE_AE = $AEFD20 ; $2E0
!START_FREESPACE_AF = $AFEC00 ; $1400
!START_FREESPACE_B0 = $B0EE00 ; $1200
!START_FREESPACE_B2 = $B2FF23 ; $DD (PAL)
!START_FREESPACE_B3 = $B3ED87 ; $1279 (PAL)
!START_FREESPACE_B4 = $B4F4B8 ; $B48
!START_FREESPACE_B5 = $B5F000 ; $1000
!START_FREESPACE_B6 = $B6F200 ; $E00
!START_FREESPACE_B7 = $B7FFC0 ; $40 (PAL)
!START_FREESPACE_B8 = $B88000 ; $8000
!START_FREESPACE_CE = $CEB22E ; $4DD2
!START_FREESPACE_DE = $DED1C0 ; $2E40
!START_FREESPACE_DF = $DF8000 ; $8000
!START_FREESPACE_E0 = $E08000 ; $8000
!START_FREESPACE_E1 = $E18000 ; $8000
!START_FREESPACE_E2 = $E28000 ; $8000
!START_FREESPACE_E3 = $E38000 ; $8000
!START_FREESPACE_E4 = $E48000 ; $8000
!START_FREESPACE_E5 = $E58000 ; $8000
!START_FREESPACE_E6 = $E68000 ; $8000
!START_FREESPACE_E7 = $E78000 ; $8000
!START_FREESPACE_E8 = $E88000 ; $8000
!START_FREESPACE_E9 = $E98000 ; $8000
!START_FREESPACE_EA = $EA8000 ; $8000
!START_FREESPACE_EB = $EB8000 ; $8000
!START_FREESPACE_EC = $EC8000 ; $8000
!START_FREESPACE_ED = $ED8000 ; $8000
!START_FREESPACE_EE = $EE8000 ; $8000
!START_FREESPACE_EF = $EF8000 ; $8000
!START_FREESPACE_F0 = $F08000 ; $8000
!START_FREESPACE_F1 = $F18000 ; $8000
!START_FREESPACE_F2 = $F28000 ; $8000
!START_FREESPACE_F3 = $F38000 ; $8000
!START_FREESPACE_F4 = $F48000 ; $8000
!START_FREESPACE_F5 = $F58000 ; $8000
!START_FREESPACE_F6 = $F68000 ; $8000
!START_FREESPACE_F7 = $F78000 ; $8000
!START_FREESPACE_F8 = $F88000 ; $8000
!START_FREESPACE_F9 = $F98000 ; $8000
!START_FREESPACE_FA = $FA8000 ; $8000
!START_FREESPACE_FB = $FB8000 ; $8000
!START_FREESPACE_FC = $FC8000 ; $8000
!START_FREESPACE_FD = $FD8000 ; $8000
!START_FREESPACE_FE = $FE8000 ; $8000
!START_FREESPACE_FF = $FF8000 ; $8000

; These defines will be reassigned by the endfree macro
; This leaves our starting location untouched for later evaluation
!FREESPACE_80 = !START_FREESPACE_80
!FREESPACE_81 = !START_FREESPACE_81
!FREESPACE_82 = !START_FREESPACE_82
!FREESPACE_83 = !START_FREESPACE_83
!FREESPACE_84 = !START_FREESPACE_84
!FREESPACE_85 = !START_FREESPACE_85
!FREESPACE_86 = !START_FREESPACE_86
!FREESPACE_87 = !START_FREESPACE_87
!FREESPACE_88 = !START_FREESPACE_88
!FREESPACE_89 = !START_FREESPACE_89
!FREESPACE_8A = !START_FREESPACE_8A
!FREESPACE_8B = !START_FREESPACE_8B
!FREESPACE_8C = !START_FREESPACE_8C
!FREESPACE_8D = !START_FREESPACE_8D
!FREESPACE_8E = !START_FREESPACE_8E
!FREESPACE_8F = !START_FREESPACE_8F
!FREESPACE_90 = !START_FREESPACE_90
!FREESPACE_91 = !START_FREESPACE_91
!FREESPACE_92 = !START_FREESPACE_92
!FREESPACE_93 = !START_FREESPACE_93
!FREESPACE_94 = !START_FREESPACE_94
!FREESPACE_99 = !START_FREESPACE_99
!FREESPACE_9A = !START_FREESPACE_9A
!FREESPACE_9B = !START_FREESPACE_9B
!FREESPACE_9C = !START_FREESPACE_9C
!FREESPACE_9D = !START_FREESPACE_9D
!FREESPACE_9E = !START_FREESPACE_9E
!FREESPACE_9F = !START_FREESPACE_9F
!FREESPACE_A0 = !START_FREESPACE_A0
!FREESPACE_A1 = !START_FREESPACE_A1
!FREESPACE_A2 = !START_FREESPACE_A2
!FREESPACE_A3 = !START_FREESPACE_A3
!FREESPACE_A4 = !START_FREESPACE_A4
!FREESPACE_A5 = !START_FREESPACE_A5
!FREESPACE_A6 = !START_FREESPACE_A6
!FREESPACE_A7 = !START_FREESPACE_A7
!FREESPACE_A8 = !START_FREESPACE_A8
!FREESPACE_A9 = !START_FREESPACE_A9
!FREESPACE_AA = !START_FREESPACE_AA
!FREESPACE_AB = !START_FREESPACE_AB
!FREESPACE_AC = !START_FREESPACE_AC
!FREESPACE_AD = !START_FREESPACE_AD
!FREESPACE_AE = !START_FREESPACE_AE
!FREESPACE_AF = !START_FREESPACE_AF
!FREESPACE_B0 = !START_FREESPACE_B0
!FREESPACE_B2 = !START_FREESPACE_B2
!FREESPACE_B3 = !START_FREESPACE_B3
!FREESPACE_B4 = !START_FREESPACE_B4
!FREESPACE_B5 = !START_FREESPACE_B5
!FREESPACE_B6 = !START_FREESPACE_B6
!FREESPACE_B7 = !START_FREESPACE_B7
!FREESPACE_B8 = !START_FREESPACE_B8
!FREESPACE_CE = !START_FREESPACE_CE
!FREESPACE_DE = !START_FREESPACE_DE
!FREESPACE_DF = !START_FREESPACE_DF
!FREESPACE_E0 = !START_FREESPACE_E0
!FREESPACE_E1 = !START_FREESPACE_E1
!FREESPACE_E2 = !START_FREESPACE_E2
!FREESPACE_E3 = !START_FREESPACE_E3
!FREESPACE_E4 = !START_FREESPACE_E4
!FREESPACE_E5 = !START_FREESPACE_E5
!FREESPACE_E6 = !START_FREESPACE_E6
!FREESPACE_E7 = !START_FREESPACE_E7
!FREESPACE_E8 = !START_FREESPACE_E8
!FREESPACE_E9 = !START_FREESPACE_E9
!FREESPACE_EA = !START_FREESPACE_EA
!FREESPACE_EB = !START_FREESPACE_EB
!FREESPACE_EC = !START_FREESPACE_EC
!FREESPACE_ED = !START_FREESPACE_ED
!FREESPACE_EE = !START_FREESPACE_EE
!FREESPACE_EF = !START_FREESPACE_EF
!FREESPACE_F0 = !START_FREESPACE_F0
!FREESPACE_F1 = !START_FREESPACE_F1
!FREESPACE_F2 = !START_FREESPACE_F2
!FREESPACE_F3 = !START_FREESPACE_F3
!FREESPACE_F4 = !START_FREESPACE_F4
!FREESPACE_F5 = !START_FREESPACE_F5
!FREESPACE_F6 = !START_FREESPACE_F6
!FREESPACE_F7 = !START_FREESPACE_F7
!FREESPACE_F8 = !START_FREESPACE_F8
!FREESPACE_F9 = !START_FREESPACE_F9
!FREESPACE_FA = !START_FREESPACE_FA
!FREESPACE_FB = !START_FREESPACE_FB
!FREESPACE_FC = !START_FREESPACE_FC
!FREESPACE_FD = !START_FREESPACE_FD
!FREESPACE_FE = !START_FREESPACE_FE
!FREESPACE_FF = !START_FREESPACE_FF

; Assign end of freespace per bank
; Set for freespace that doesn't end at the bank border
!END_FREESPACE_80 = $80FFC0 ; Game header
!END_FREESPACE_81 = $81FF00 ; Thanks Genji!
!END_FREESPACE_82 = $820000+$10000
!END_FREESPACE_83 = $830000+$10000
!END_FREESPACE_84 = $840000+$10000
!END_FREESPACE_85 = $850000+$10000
!END_FREESPACE_86 = $860000+$10000
!END_FREESPACE_87 = $870000+$10000
!END_FREESPACE_88 = $880000+$10000
!END_FREESPACE_89 = $890000+$10000
!END_FREESPACE_8A = $8A0000+$10000
!END_FREESPACE_8B = $8B0000+$10000
!END_FREESPACE_8C = $8C0000+$10000
!END_FREESPACE_8D = $8D0000+$10000
!END_FREESPACE_8E = $8E0000+$10000
!END_FREESPACE_8F = $8F0000+$10000
!END_FREESPACE_90 = $900000+$10000
!END_FREESPACE_91 = $910000+$10000
!END_FREESPACE_92 = $920000+$10000
!END_FREESPACE_93 = $930000+$10000
!END_FREESPACE_94 = $94C800 ; Ship tiles
!END_FREESPACE_99 = $990000+$10000
!END_FREESPACE_9A = $9A0000+$10000
!END_FREESPACE_9B = $9BE000 ; Samus tiles
!END_FREESPACE_9C = $9C0000+$10000
!END_FREESPACE_9D = $9D0000+$10000
!END_FREESPACE_9E = $9E0000+$10000
!END_FREESPACE_9F = $9F0000+$10000
!END_FREESPACE_A0 = $A00000+$10000
!END_FREESPACE_A1 = $A10000+$10000
!END_FREESPACE_A2 = $A20000+$10000
!END_FREESPACE_A3 = $A30000+$10000
!END_FREESPACE_A4 = $A40000+$10000
!END_FREESPACE_A5 = $A50000+$10000
!END_FREESPACE_A6 = $A60000+$10000
!END_FREESPACE_A7 = $A70000+$10000
!END_FREESPACE_A8 = $A80000+$10000
!END_FREESPACE_A9 = $A90000+$10000
!END_FREESPACE_AA = $AA0000+$10000
!END_FREESPACE_AB = $AB0000+$10000
!END_FREESPACE_AC = $AC0000+$10000
!END_FREESPACE_AD = $AD0000+$10000
!END_FREESPACE_AE = $AE0000+$10000
!END_FREESPACE_AF = $AF0000+$10000
!END_FREESPACE_B0 = $B00000+$10000
!END_FREESPACE_B2 = $B20000+$10000
!END_FREESPACE_B3 = $B30000+$10000
!END_FREESPACE_B4 = $B40000+$10000
!END_FREESPACE_B5 = $B50000+$10000
!END_FREESPACE_B6 = $B60000+$10000
!END_FREESPACE_B7 = $B70000+$10000
!END_FREESPACE_B8 = $B80000+$10000
!END_FREESPACE_CE = $CE0000+$10000
!END_FREESPACE_DE = $DE0000+$10000
!END_FREESPACE_DF = $DF0000+$10000
!END_FREESPACE_E0 = $E00000+$10000
!END_FREESPACE_E1 = $E10000+$10000
!END_FREESPACE_E2 = $E20000+$10000
!END_FREESPACE_E3 = $E30000+$10000
!END_FREESPACE_E4 = $E40000+$10000
!END_FREESPACE_E5 = $E50000+$10000
!END_FREESPACE_E6 = $E68000 ; tilegraphics.asm
!END_FREESPACE_E7 = $E78000 ; tilegraphics.asm
!END_FREESPACE_E8 = $E88000 ; tilegraphics.asm + presets.asm
!END_FREESPACE_E9 = $E98000 ; presets.asm
!END_FREESPACE_EA = $EA8000 ; presets.asm
!END_FREESPACE_EB = $EB8000 ; presets.asm
!END_FREESPACE_EC = $EC8000 ; presets.asm
!END_FREESPACE_ED = $ED8000 ; presets.asm
!END_FREESPACE_EE = $EE8000 ; presets.asm
!END_FREESPACE_EF = $EF0000+$10000
!END_FREESPACE_F0 = $F00000+$10000
!END_FREESPACE_F1 = $F10000+$10000
!END_FREESPACE_F2 = $F20000+$10000
!END_FREESPACE_F3 = $F30000+$10000
!END_FREESPACE_F4 = $F4D800 ; tilegraphics.asm
!END_FREESPACE_F5 = $F58000 ; tilegraphics.asm
!END_FREESPACE_F6 = $F68000 ; tilegraphics.asm
!END_FREESPACE_F7 = $F78000 ; tilegraphics.asm
!END_FREESPACE_F8 = $F88000 ; tilegraphics.asm
!END_FREESPACE_F9 = $F98000 ; tilegraphics.asm
!END_FREESPACE_FA = $FA8000 ; tilegraphics.asm
!END_FREESPACE_FB = $FB8000 ; tilegraphics.asm
!END_FREESPACE_FC = $FC8000 ; tilegraphics.asm
!END_FREESPACE_FD = $FD8000 ; tilegraphics.asm
!END_FREESPACE_FE = $FE8000 ; tilegraphics.asm
!END_FREESPACE_FF = $1000000

; Allows us to setup warnings for mishandled macros
!FREESPACE_BANK = -1

macro startfree(bank)
; Allows us to assign freespace without gaps from different files
assert !FREESPACE_BANK < 0, "You forgot to close out bank !FREESPACE_BANK"
org !FREESPACE_<bank>
!FREESPACE_BANK = $<bank>
endmacro

macro endfree(bank)
; Used to close out an org and track the next free byte
assert !FREESPACE_BANK >= 0, "No matching startfree(<bank>)"
assert $<bank> = !FREESPACE_BANK, "You closed out the wrong bank. (Check bank !FREESPACE_BANK)"
!FREESPACE_COUNTER_<bank> ?= 0
FreespaceLabel<bank>_!FREESPACE_COUNTER_<bank>:
!FREESPACE_<bank> := FreespaceLabel<bank>_!FREESPACE_COUNTER_<bank>
!FREESPACE_COUNTER_<bank> #= !FREESPACE_COUNTER_<bank>+1
!FREESPACE_BANK = -1
warnpc !END_FREESPACE_<bank>
endmacro

macro printfreespacebank(bank)
; Print some numbers about our freespace usage
org !FREESPACE_<bank>
!FREESPACE_COUNTER_<bank> ?= 0
if !FREESPACE_COUNTER_<bank>
print "Bank $<bank> ended at $", pc, " with $", hex(!END_FREESPACE_<bank>-!FREESPACE_<bank>), " bytes remaining"
endif
endmacro

macro printfreespace()
; Hide this long list in a single macro
%printfreespacebank(80)
%printfreespacebank(81)
%printfreespacebank(82)
%printfreespacebank(83)
%printfreespacebank(84)
%printfreespacebank(85)
%printfreespacebank(86)
%printfreespacebank(87)
%printfreespacebank(88)
%printfreespacebank(89)
%printfreespacebank(8A)
%printfreespacebank(8B)
%printfreespacebank(8C)
%printfreespacebank(8D)
%printfreespacebank(8E)
%printfreespacebank(8F)
%printfreespacebank(90)
%printfreespacebank(91)
%printfreespacebank(92)
%printfreespacebank(93)
%printfreespacebank(99)
%printfreespacebank(9A)
%printfreespacebank(9C)
%printfreespacebank(9D)
%printfreespacebank(9E)
%printfreespacebank(9F)
%printfreespacebank(A0)
%printfreespacebank(A1)
%printfreespacebank(A2)
%printfreespacebank(A3)
%printfreespacebank(A4)
%printfreespacebank(A5)
%printfreespacebank(A6)
%printfreespacebank(A7)
%printfreespacebank(A8)
%printfreespacebank(A9)
%printfreespacebank(AA)
%printfreespacebank(AB)
%printfreespacebank(AC)
%printfreespacebank(AD)
%printfreespacebank(AE)
%printfreespacebank(AF)
%printfreespacebank(B0)
%printfreespacebank(B2)
%printfreespacebank(B3)
%printfreespacebank(B4)
%printfreespacebank(B5)
%printfreespacebank(B6)
%printfreespacebank(B7)
%printfreespacebank(B8)
%printfreespacebank(CE)
%printfreespacebank(DE)
%printfreespacebank(DF)
%printfreespacebank(E0)
%printfreespacebank(E1)
%printfreespacebank(E2)
%printfreespacebank(E3)
%printfreespacebank(E4)
%printfreespacebank(E5)
%printfreespacebank(E6)
%printfreespacebank(E7)
%printfreespacebank(E8)
%printfreespacebank(E9)
%printfreespacebank(EA)
%printfreespacebank(EB)
%printfreespacebank(EC)
%printfreespacebank(ED)
%printfreespacebank(EE)
%printfreespacebank(EF)
%printfreespacebank(F0)
%printfreespacebank(F1)
%printfreespacebank(F2)
%printfreespacebank(F3)
%printfreespacebank(F4)
%printfreespacebank(F5)
%printfreespacebank(F6)
%printfreespacebank(F7)
%printfreespacebank(F8)
%printfreespacebank(F9)
%printfreespacebank(FA)
%printfreespacebank(FB)
%printfreespacebank(FC)
%printfreespacebank(FD)
%printfreespacebank(FE)
%printfreespacebank(FF)
endmacro

