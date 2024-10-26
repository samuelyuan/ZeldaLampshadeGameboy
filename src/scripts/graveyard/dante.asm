    db $25, $12, $04
    db vm_if_const, $00, $4b, $b3, $00, $09, $00, $00, $02 ; item < 9
    db vm_jump, $4c, $5f
    db vm_load_text, $00

    db "Life as a grave\n"
    db "digger sure is\n"
    db "boring.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I miss my handguns\n"
    db "too - the shovel", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "just doesn't cut\n"
    db "it when fighting\n"
    db "demons", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $4c, $6b, $00, $0a, $00, $00, $05 ; item >= 0a
    db vm_jump, $4c, $bf
    db vm_load_text, $00

    db "Hey wait...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "This gun is made\n"
    db "of plastic...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $4c, $cb, $00, $09, $00, $00, $01 ; item == 9
    db vm_jump, $4d, $eb
    db vm_load_text, $00

    db "Thanks for the\n"
    db "handgun!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "You can take this\n"
    db "shovel if you\n"
    db "want...", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "It doesn't have a\n"
    db "DT mode though.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $0a, $00, $00
    db vm_set_const, $00, $06, $ff, $fc
    db vm_set_const, $00, $09, $ff, $fd
    db $75, $ff, $fc
    db vm_load_text, $00

    db "You got the Shovel!", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Tool of choice for\n"
    db "xombies and grave-\n"
    db "diggers alike...", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00