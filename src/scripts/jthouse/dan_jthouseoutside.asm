    db $25
    db $1a, $00, $50, $18, $00, $07, $00, $00, $03
    db $09, $50, $80
    db vm_load_text, $00
    
    db "That water didn't\n"
    db "wake him up,", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00
    
    db "he needs to be\n"
    db "shocked awake...", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00
