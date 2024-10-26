    db $25
    db $40, $00

    db "T0t411Y\n" ; 0x40e0
    db "1337\n"
    db "Pr1C35", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db $44, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db $44, $03, $01
    db $00