    db $25
    db $12, $04
    db vm_if_const, $00, $4d, $fb, $00, $03, $00, $00, $02 ; item < 3
    db vm_jump, $4e, $b6
    db vm_load_text, $00

    db "I just want to die!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Namco just won't\n"
    db "kill me off...", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I'm dug my own\n"
    db "grave,", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "with flowers and a\n"
    db "vase and\n"
    db "everything...", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $4e, $c2, $00, $03, $00, $00, $01 ; item == 3
    db vm_jump, $50, $04
    db vm_load_text, $00

    db "What's this little\n"
    db "iron?", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Maybe I should\n"
    db "chew on  it...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "URGH!", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Make sure no-one\n"
    db "steals my vase...", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $03, $ff, $fc
    db vm_set_const, $01, $00, $ff, $fd
    db vm_set_const, $05, $00, $ff, $fe
    db vm_set_const, $00, $01, $ff, $ff
    db $30, $ff, $fc
    db vm_set_const, $00, $03, $ff, $fc
    db $33, $ff, $fc
    db vm_set_const, $00, $04, $00, $00
    db vm_set_const, $00, $06, $ff, $fc
    db vm_set_const, $00, $04, $ff, $fd
    db $75, $ff, $fc
    db vm_load_text, $00

    db "You got the Vase!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "There's a little\n"
    db "water left at\n"
    db "the bottom...  ", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00