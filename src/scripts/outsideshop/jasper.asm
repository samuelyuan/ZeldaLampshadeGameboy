    db $25, $40, $00

    db "I'm so bored!" ; 0x4110

    db $00, $47, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db $45, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00