    db $25
    db $12, $04
    db vm_if_const, $00, $50, $14, $00, $05, $00, $00, $02 ; < 5
    db vm_jump, $50, $bc
    db vm_load_text, $00

    db "I'm waiting to get\n"
    db "Tom Fulp's\n"
    db "autograph!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "But I'm getting\n"
    db "peckish -", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "I only like\n"
    db "helpless animals\n"
    db "to eat, though.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, 
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $50, $c8, $00, $06, $00, $00, $05 ; >= 6
    db vm_jump, $51, $72
    db vm_load_text, $00

    db "If I collect all\n"
    db "of these frogs I\n"
    db "get the stealth\n"
    db "camo...", $00

    db vm_overlay_clear, $03, $01, $06, $14, $00, $00
    db $45, $ff, $0c, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait
    db $07, $01, $40, $00

    db "or I could do a no-\n"
    db "alert playthrough.", $00

    db vm_overlay_clear, $03, $01, $06, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "Which is easier?", $00

    db vm_overlay_clear, $03, $01, $06, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, 
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $51, $7e, $00, $05, $00, $00, $01 ; == 5
    db vm_jump, $52, $d1
    db vm_load_text, $00

    db "You brought me a\n"
    db "frog to eat?", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "Thanks!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "Here, take this\n" ; 0x51c8
    db "tiger face paint.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "It's not lowering\n"
    db "my camo index\n"
    db "enough...", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $06, $00, $00
    db vm_set_const, $00, $03, $ff, $fc
    db vm_set_const, $00, $06, $ff, $fd
    db $75, $ff, $fc
    db vm_load_text, $00

    db "You got the\n"
    db "Tiger Face Paints!", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "Great for stealth\n"
    db "missions...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, $40, $00

    db "and kids' parties.", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01, 
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00