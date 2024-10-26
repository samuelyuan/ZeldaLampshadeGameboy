    db $25
    db $12, $04
    db vm_if_const, $00, $63, $b3, $00, $04, $00, $00, $02 ; item < 4
    db $09, $64, $4a
    db vm_load_text, $00

    db "I'm trying to get\n"
    db "some water out of\n"
    db "the well", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "to wake up JT...", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "but there's no\n"
    db "bucket to hold it", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $64, $56, $00, $04, $00, $00, $01 ; item == 4
    db $09, $65, $bf
    db vm_load_text, $00

    db "That vase will\n"
    db "work in the well!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $1e, $ff, $fc
    db $0d, $ff, $fc, $00, $55, $af, $02
    db vm_load_text, $00

    db "There was a frog\n"
    db "in the water,", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "you can have it.", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $05, $00, $00
    db vm_set_const, $00, $06, $ff, $fc
    db vm_set_const, $00, $05, $ff, $fd
    db $75, $ff, $fc
    db vm_load_text, $00

    db "You got the\n"
    db "Frog of Legend!", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "This frog has a\n"
    db "world-wide fanbase,", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "as well as being\n"
    db "quite tasty...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $04, $ff, $fc
    db vm_set_const, $00, $00, $ff, $fd
    db vm_set_const, $04, $80, $ff, $fe
    db vm_set_const, $00, $01, $ff, $ff
    db $30, $ff, $fc
    db vm_set_const, $00, $04, $ff, $fc
    db $33, $ff, $fc
    db $00