    db vm_lock
    db vm_reserve, $04
    db vm_if_const, $00, $56, $ef, $00, $02, $00, $00, $02 ; item < 2
    db vm_jump, $57, $64
    db vm_load_text, $00

    db "All this greasy\n"
    db "food is doing\n"
    db "nothing for my\n"
    db "hair!", $00
    
    db vm_overlay_clear, $03, $01, $06, $14, $00, $00
    db vm_overlay_move_to, $ff, $0c, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I need to sort\n"
    db "it out...", $00

    db vm_overlay_clear, $03, $01, $06, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $57, $70, $00, $03, $00, $00, $05
    db vm_jump, $57, $e5
    db vm_load_text, $00

    db "Now I can always\n"
    db "look my best when", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "I'm fighting those\n"
    db "creepy space\n"
    db "pirates!", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_if_const, $00, $57, $f1, $00, $02, $00, $00, $01 ; item == 2
    db vm_jump, $58, $e9
    db vm_load_text, $00

    db "Can I take those\n"
    db "hair products?", $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_overlay_move_to, $ff, $0d, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "You can have this\n"
    db "free toy I got with\n"
    db "my Happy Meal...",  $00
    
    db vm_overlay_clear, $03, $01, $05, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db vm_set_const, $00, $03, $00, $00
    db vm_set_const, $00, $04, $ff, $fc
    db vm_set_const, $00, $03, $ff, $fd
    db vm_actor_set_anim_frame, $ff, $fc
    db vm_load_text, $00

    db "You got the Tiny\n"
    db "Extreme Iron!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_overlay_move_to, $ff, $0e, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_load_text, $00

    db "Warning: Deadly\n" ; 0x58b7
    db "if swallowed!", $00
    
    db vm_overlay_clear, $03, $01, $04, $14, $00, $00
    db vm_display_text, $ff, $00
    db vm_overlay_wait, $07, $01
    db vm_overlay_move_to, $fe, $12, $00
    db vm_overlay_wait, $03, $01
    db $00