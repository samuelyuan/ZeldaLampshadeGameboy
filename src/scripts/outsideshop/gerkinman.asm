    db $25
    db $40, $00

    db "I'm Gerkinman.", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db $44, $07, $01
    db $40, $00
    
    db "Revel in my\n"
    db "weirdery.", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db $44, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db $44, $03, $01
    db $00