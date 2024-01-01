
; Turn off health alarm
org $90EA8C
    LDA !sram_healthalarm : ASL : PHX : TAX
    JMP (healthalarm_turn_off_table,X)

; Turn on health alarm
org $90EA9D
    LDA !sram_healthalarm : ASL : PHX : TAX
    JMP (healthalarm_turn_on_table,X)

; Turn on health alarm
org $90F339
    JSR $EA9D
    BRA $02

; Turn on health alarm from bank 91
org $91E6DA
    JML healthalarm_turn_on_remote


org $90FE00
print pc, " damage bank90 start"

healthalarm_turn_on_table:
    dw healthalarm_turn_on_vanilla
    dw healthalarm_turn_on_pb_fix
    dw healthalarm_turn_on_improved
    dw healthalarm_turn_on_never

healthalarm_turn_on_improved:
    ; Do not sound alarm until below 30 combined health
    LDA $09C2 : CLC : ADC $09D6 : CMP #$001E : BPL healthalarm_turn_on_done

healthalarm_turn_on_pb_fix:
    ; Do not sound alarm if it won't play due to power bomb explosion
    LDA $0592 : BMI healthalarm_turn_on_done

healthalarm_turn_on_vanilla:
    LDA #$0002 : JSL $80914D

healthalarm_turn_on_never:
    LDA #$0001 : STA !SAMUS_HEALTH_WARNING

healthalarm_turn_on_done:
    PLX : RTS


healthalarm_turn_off_table:
    dw healthalarm_turn_off_vanilla
    dw healthalarm_turn_off_pb_fix
    dw healthalarm_turn_off_improved
    dw healthalarm_turn_off_never

healthalarm_turn_off_improved:
healthalarm_turn_off_pb_fix:
    ; Do not stop alarm if it won't stop due to power bomb explosion
    LDA $0592 : BMI healthalarm_turn_off_done

healthalarm_turn_off_vanilla:
    LDA #$0001 : JSL $80914D

healthalarm_turn_off_never:
    STZ !SAMUS_HEALTH_WARNING

healthalarm_turn_off_done:
    PLX : RTS


healthalarm_turn_on_remote:
    JSR $EA9D
    PLB : PLP : RTL

print pc, " damage bank90 end"
warnpc $90FF00

