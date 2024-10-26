    db $25, $40, $00

    db "Welcome to the top\n"
    db "secret NG\n"
    db "headquarters.", $00

    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db $41, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00
    
    db "We finally set up\n"
    db "an office.", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $41, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00
    
    db "YOINK!", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $41, $ff, $00
    db vm_overlay_wait, $07, $01, $45, $fe, $12, $00
    db vm_overlay_wait, $03
    db $01, $00