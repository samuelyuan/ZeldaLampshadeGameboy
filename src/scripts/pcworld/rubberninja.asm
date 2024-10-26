    db $25
    db $40, $00

    ; 0x4b70
    db "We might be\n"
    db "stamping down on\n"
    db "prices,", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db $40, $00

    db "but we don't seem\n"
    db "to sell any PCs!", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00