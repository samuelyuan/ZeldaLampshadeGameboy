    db $25
    db $12, $04
    db vm_load_text, $00

    db "Poor JT..."

    db $00, $47, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Oh well, I get his\n"
    db "stuff!"

    db $00, $47, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "You can have his\n"
    db "light gun though."

    db $00, $47, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    
    db vm_if_const, $00, $56, $62, $00, $08, $00, $00, $01 ; item == 8
    db $09, $56, $df
    db vm_set_const, $00, $09, $00, $00 ; set item to 9
    db vm_set_const, $00, $05, $ff, $fc
    db vm_set_const, $00, $08, $ff, $fd
    db $75, $ff, $fc
    db vm_load_text, $00

    db "You got the\n"
    db "Light Gun!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "It's so well made,\n"
    db "it almost looks\n"
    db "real..."

    db $00, $47, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01, $00