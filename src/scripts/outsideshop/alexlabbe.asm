    db $25, $40, $00

    db "Enjoy the movie!"

    db $00
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00, $44
    db $07, $01, $40, $00

    db "... mmmm popcorn"

    db $00
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00