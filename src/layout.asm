
; Hijack loading destination room CRE
org $82E1D9
    JSR hijack_loading_room_CRE


org $82FD40
print pc, " layout bank82 start"

hijack_loading_room_CRE:
{
    LDA !ram_door_portals_enabled : BEQ .noChange
    PHX : LDA !ram_door_portal_left : ASL : TAX
    LDA portals_left_vanilla_table,X : CMP !DOOR_ID : BEQ .leftToRight
    LDA !ram_door_portal_right : ASL : TAX
    LDA portals_right_vanilla_table,X : CMP !DOOR_ID : BEQ .rightToLeft
    LDA !ram_door_portal_up : ASL : TAX
    LDA portals_up_vanilla_table,X : CMP !DOOR_ID : BEQ .upToDown
    LDA !ram_door_portal_down : ASL : TAX
    LDA portals_down_vanilla_table,X : CMP !DOOR_ID : BEQ .downToUp

  .noChangePLX
    PLX

  .noChange
    ; Overridden routine
    JMP $DDF1

  .leftToRight
    LDA !ram_door_portal_right : ASL : TAX
    LDA portals_right_vanilla_table,X : BMI .saveDoor
    BRA .noChangePLX

  .rightToLeft
    LDA !ram_door_portal_left : ASL : TAX
    LDA portals_left_vanilla_table,X : BMI .saveDoor
    BRA .noChangePLX

  .upToDown
    LDA !ram_door_portal_down : ASL : TAX
    LDA portals_down_vanilla_table,X : BMI .saveDoor
    BRA .noChangePLX

  .downToUp
    LDA !ram_door_portal_up : ASL : TAX
    LDA portals_up_vanilla_table,X : BMI .saveDoor
    BRA .noChangePLX

  .saveDoor
    ; Implement the DDF1 routine here to load CRE bitset
    ; We already have pushed X to the stack,
    ; and A conveniently contains the DOOR_ID
    ; However we still need to execute the randomize door routine
    PHB : PHA           ; save result
    PEA $8F00 : PLB : PLB
    %arcade_randomizedoor()
    PLX : STX !DOOR_ID  ; restore result

    LDA $830000,X : TAX
    LDA !CRE_BITSET : STA !PREVIOUS_CRE_BITSET
    LDA $0008,X : AND #$00FF

    ; Ensure either BIT #$0004 or #$0002 are set
    ; so that the CRE is loaded or reloaded
    BIT #$0004 : BNE .storeBitset
    ORA #$0002

  .storeBitset
    STA !CRE_BITSET

    ; Remember we pushed X and bank in opposite order
    PLB : PLX
    RTS
}

print pc, " layout bank82 end"
warnpc $82FE00


org $83E000
print pc, " layout bank83 start"

incsrc layoutportaltables.asm

layout_override_door_close:
{
    LDA $830002,X
    ORA !ram_override_grey_door_close
    RTL
}

print pc, " layout bank83 end"


org $84FE04
hook_layout_override_door_close:
    JSL layout_override_door_close

