    db $25
    db $12, $05
    db $1a, $00, $4e, $27, $00, $07, $00, $00, $02
    db $09, $4e, $57
    db vm_load_text, $00

    db "Aww...\n"
    db "he's asleep...", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $1a, $00, $4e, $63, $00, $08, $00, $00, $05
    db $09, $4e, $88
    db vm_load_text, $00
    
    db "Oh dear...", $00

    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $1a, $00, $4e, $94, $00, $07, $00, $00, $01
    db $09, $4f, $44 
    db vm_load_text, $00
    
    db "Maybe this taser\n"
    db "will wake him up...", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $01, $ff, $fc
    db $84, $00, $02, $ff, $fc
    db vm_set_const, $00, $01, $ff, $fc
    db $3d, $03, $ff, $fc
    db vm_set_const, $00, $1e, $ff, $fb
    db $0d, $ff, $fb, $00, $55, $af, $02
    db vm_set_const, $00, $01, $ff, $fc
    db vm_set_const, $01, $00, $ff, $fd
    db vm_set_const, $05, $80, $ff, $fe
    db vm_set_const, $00, $01, $ff, $ff
    db $30, $ff, $fc
    db vm_set_const, $00, $01, $ff, $fc
    db $84, $00, $03, $ff, $fc
    db vm_set_const, $00, $04, $ff, $fc
    db vm_set_const, $00, $00, $ff, $fd
    db $75, $ff, $fc
    db vm_set_const, $00, $02, $ff, $fc
    db vm_set_const, $02, $00, $ff, $fd
    db vm_set_const, $04, $80, $ff, $fe
    db vm_set_const, $00, $01, $ff, $ff
    db $30, $ff, $fc
    db vm_set_const, $00, $02, $ff, $fc
    db $33, $ff, $fc
    db vm_set_const, $00, $08, $00, $00
    db $00
