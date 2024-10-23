; bank 6: 0x579f
    db vm_lock
    db vm_reserve, $04
    db vm_if_const, $00, $57, $ae, $00, $01, $00, $00, $02 ; item < 1
    db vm_jump, $58, $4f

DimDialogueBeforeItem:: ; 0x57ae
    db vm_load_text, $00

    db "Hey I'm Dim of the\n"
    db "Super Flash Bros.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I wonder when\n"
    db "Randy will bring", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "me the latest\n"
    db "advertising\n"
    db "payment...", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01

DimDialogueCheckAfterItem:: ; 0x584f
    db vm_if_const, $00, $58, $5b, $00, $02, $00, $00, VM_OP_GE ; item >= 2
    db vm_jump, $58, $c1

DimDialogueAfterItem:: ; 0x585b
    db vm_load_text, $00

    db "Have you used the\n"
    db "hair products?", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Your hair looks\n"
    db "so shiny...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01

DimDialogueCheckReceivesItem:: ; 0x58c1
    db vm_if_const, $00, $58, $cd, $00, $01, $00, $00, $01 ; item == 1
    db vm_jump, $59, $ee

DimDialogueReceivesItem:: ; 0x58cd
    db vm_load_text, $00
    
    db "You've got my big\n"
    db "bag of money?", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00
    
    db "Thanks - now I can\n"
    db "buy a Revolution!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00
    
    db "Please take this\n"
    db "spray bottle as a\n"
    db "gift.", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $02, $00, $00 ; set item to 2
    db vm_set_const, $00, $03, $ff, $fc
    db vm_set_const, $00, $02, $ff, $fd
    db vm_actor_set_anim_frame, $ff, $fc
    db vm_load_text, $00
    
    db "You got the Girly\n"
    db "Hair Products!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Perfect for\n"
    db "fighting hat hair!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01

DimDialogueEnd:: ; 0x59ee
    db $00