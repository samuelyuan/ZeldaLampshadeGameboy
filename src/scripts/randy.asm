    db vm_lock
    db vm_reserve, $05
    db vm_if_const, $00, $52, $e1, $00, $0c, $00, $00, $02 ; < 0xc
    db vm_jump, $53, $54

RandyDialogueCheckAfterBagMoney:: ; 0x52e1
    db vm_if_const, $00, $52, $ed, $00, $01, $00, $00, $05 ; >= 1
    db vm_jump, $53, $54
    
RandyDialogueAfterBagMoney:: ; 0x52ed
    db vm_load_text, $00

    db "Get me some food,\n"
    db "could you?", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I'll have a burger\n"
    db "and a sprite.", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01

RandyDialogueCheckNoItem:: ; 0x5354
    db vm_if_const, $00, $53, $60, $00, $00, $00, $00, $01 ; == 0
    db vm_jump, $54, $b8
    db vm_load_text, $00

    db "I'm guarding the\n"
    db "temple!", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I missed lunch\n"
    db "and I'm starving...", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Take this money\n"
    db "and get me some\n"
    db "lunch, could you?", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I'll have a burger\n"
    db "and a sprite.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $01, $00, $00
    db vm_set_const, $00, $04, $ff, $fc
    db vm_set_const, $00, $01, $ff, $fd
    db vm_actor_set_anim_frame, $ff, $fc
    db vm_load_text, $00

    db "You got the\n"
    db "Big Bag of Money!", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "It looks like\n"
    db "Randy's advertising\n"
    db "money.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01

RandyDialogueCheckReceivesBurger:: ; 0x54b8
    db vm_if_const, $00, $54, $c4, $00, $0c, $00, $00, $01 ; item == 0xc
    db vm_jump, $55, $d2

RandyDialogueReceivesBurger:: ; 0x54c4
    db vm_load_text, $00

    db "Hey you finally\n"
    db "got some food!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "What took you so\n"
    db "long?", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Thanks anyway.", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $1e, $ff, $fb
    db vm_invoke, $ff, $fb, $00, $55, $af, $02
    db vm_load_text, $00

    db "uurghh......", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "stomach.........", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "pain......", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $02, $ff, $fc
    db vm_set_const, $03, $80, $ff, $fd
    db vm_set_const, $08, $80, $ff, $fe
    db vm_set_const, $00, $01, $ff, $ff
    db vm_actor_move_to, $ff, $fc
    db vm_set_const, $00, $02, $ff, $fc
    db vm_actor_deactivate, $ff, $fc
    db vm_set_const, $00, $0d, $00, $00

RandyDialogueEnd:: ; 0x55d2
    db $00