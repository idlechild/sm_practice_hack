
; When booting or starting gameplay, we are not yet recording frames,
; so you will need to compensate by adding frames to the TAS input file.
; Lag may vary from run to run, so the following are estimates:
; For initial boot, add ~258 frames
; For starting Ceres, add ~94 frames
; End Ceres on the last frame of the fadeout (before the two lag frames)
; For starting Zebes after Ceres, add ~2069 frames
; For each fanfare add 328 frames

; Define TAS playback bank order for banks E0-FF
tas_playback_next_bank:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    ; Start here for bank E0
    db $00 ; from E0
    db $00 ; from E1
    db $00 ; from E2
    db $00 ; from E3
    db $00 ; from E4
    db $00 ; from E5
    db $00 ; from E6
    db $00 ; from E7
    db $00 ; from E8
    db $00 ; from E9
    db $00 ; from EA
    db $00 ; from EB
    db $00 ; from EC
    db $00 ; from ED
    db $00 ; from EE
    db $00 ; from EF
    db $00 ; from F0
    db $00 ; from F1
    db $00 ; from F2
    db $00 ; from F3
    db $00 ; from F4
    db $00 ; from F5
    db $00 ; from F6
    db $00 ; from F7
    db $00 ; from F8
    db $00 ; from F9
    db $00 ; from FA
    db $00 ; from FB
    db $00 ; from FC
    db $00 ; from FD
    db $00 ; from FE
    db $00 ; from FF

; Include TAS playback banks here
;incsrc tasplayback_E0.asm
;incsrc tasplayback_E1.asm
;incsrc tasplayback_E2.asm
;incsrc tasplayback_E3.asm
;incsrc tasplayback_E5.asm
;incsrc tasplayback_E6.asm
;incsrc tasplayback_E7.asm
;incsrc tasplayback_E8.asm
;incsrc tasplayback_E9.asm
;incsrc tasplayback_EA.asm
;incsrc tasplayback_EB.asm
;incsrc tasplayback_EC.asm
;incsrc tasplayback_ED.asm
;incsrc tasplayback_EE.asm
;incsrc tasplayback_EF.asm
;incsrc tasplayback_F1.asm
;incsrc tasplayback_F2.asm
;incsrc tasplayback_F3.asm
;incsrc tasplayback_F4.asm
;incsrc tasplayback_F5.asm
;incsrc tasplayback_F6.asm
;incsrc tasplayback_F7.asm
;incsrc tasplayback_F8.asm
;incsrc tasplayback_F9.asm
;incsrc tasplayback_FA.asm
;incsrc tasplayback_FB.asm
;incsrc tasplayback_FC.asm
;incsrc tasplayback_FD.asm
;incsrc tasplayback_FE.asm
;incsrc tasplayback_FF.asm

; Make sure the ROM expands to 4MB (comment out if unnecessary)
org $FFFFFF : db $FF

