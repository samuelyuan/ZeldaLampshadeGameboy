; instructions
DEF vm_jump EQU $09
DEF vm_invoke EQU $0d
DEF vm_reserve EQU $12
DEF vm_set_const EQU $14
DEF vm_if_const EQU $1a
DEF vm_lock EQU $25
DEF vm_actor_move_to EQU $30
DEF vm_actor_deactivate EQU $33
DEF vm_load_text EQU $40
DEF vm_display_text EQU $41
DEF vm_overlay_wait EQU $44
DEF vm_overlay_move_to EQU $45
DEF vm_overlay_clear EQU $47
DEF vm_actor_set_anim_frame EQU $75

; operators
DEF VM_OP_EQ EQU $01
DEF VM_OP_LT EQU $02
DEF VM_OP_LE EQU $03
DEF VM_OP_GT EQU $04
DEF VM_OP_GE EQU $05
DEF VM_OP_NE EQU $06
DEF VM_OP_AND EQU $07
DEF VM_OP_OR EQU $08
DEF VM_OP_NOT EQU $09
