    db $25
    db $12, $04
    db vm_if_const, $00, $49, $f5, $00, $06, $00, $00, $02 ; item < 6
    db $09, $4a, $61
    db vm_load_text, $00

    db "I'm going on a\n" ; 0x49f7
    db "jungle mission\n"
    db "soon,", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "need to practice\n" ; 0x4a2e
    db "my stealth...", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $4a, $6d, $00, $07, $00, $00, $05 ; item >= 7
    db $09, $4a, $ad
    db vm_load_text, $00

    db "ROAR!", $00 ; 0x4a6e
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Man, I'm good...", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $4a, $b9, $00, $06, $00, $00, $01 ; item == 6
    db $09, $4b, $a3
    db vm_load_text, $00

    db "Woohoo! These face\n" ; 0x4abb
    db "paints are cool!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Here, take this.\n" ; 0x4af2
    db "I've got 20.", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $07, $00, $00
    db vm_set_const, $00, $04, $ff, $fc
    db vm_set_const, $00, $07, $ff, $fd
    db $75, $ff, $fc
    db vm_load_text, $00

    db "You got the Taser!", $00 ; 0x4b38
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Caution: Keep away\n"
    db "from water and\n"
    db "small puppies.", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00