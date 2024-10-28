SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

    INCLUDE "src/engine/vm_palette.asm"

    INCLUDE "src/game/tilemap.asm"

    INCLUDE "src/game/collision.asm"

DanteSpriteImage:: ; 0x7b07
    db $16, $00
    INCBIN "gfx/bank008_dante_7b09.2bpp"

ItemSpriteFrames::
    ; 0x7c69
    db $80, $00, $00, $00

    ; 0x7c6d big bag of money
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80, $00, $00, $00

    ; 0x7c79 hair products sprite
    db $00, $08, $04, $00, $00, $f8, $06, $00, $80, $00, $00, $00

    ; 0x7c85 tiny extreme iron sprite
    db $00, $08, $08, $00, $00, $f8, $0a, $00, $80, $00, $00, $00

    ; 0x7c91 vase
    db $00, $08, $0c, $00, $00, $f8, $0c, $20, $80, $00, $00, $00

    ; 0x7c9d frog
    db $00, $08, $0e, $00, $00, $f8, $10, $00, $80, $00, $00, $00

    ; 0x7ca9 tiger face paint
    db $00, $08, $12, $00, $00, $f8, $14, $00, $80, $00, $00, $00

    ; 0x7cb5 taser
    db $00, $08, $16, $00, $00, $f8, $18, $00, $80, $00, $00, $00

    ; 0x7cc1 light gun
    db $00, $08, $1a, $00, $00, $f8, $1c, $00, $80, $00, $00, $00

    ; 0x7ccd shovel
    db $00, $08, $1e, $00, $00, $f8, $20, $00, $80, $00, $00, $00

    ; 0x7cd9 human corpse
    db $00, $08, $22, $00, $00, $f8, $24, $00, $80, $00, $00, $00

    ; 0x7ce5 hamburger
    db $00, $08, $26, $00, $00, $f8, $26, $20, $80, $00, $00, $00

    ; 0x7cf1 source of lamp sprite
    db $00, $08, $28, $00, $00, $f8, $2a, $00, $80, $00, $00, $00

    ; frames
    db $69, $7c
    db $6d, $7c
    db $79, $7c
    db $85, $7c
    db $91, $7c
    db $9d, $7c
    db $a9, $7c
    db $b5, $7c
    db $c1, $7c
    db $cd, $7c
    db $d9, $7c
    db $e5, $7c
    db $f1, $7c
    
    db $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c, $00, $0c
    db $00, $00

    ; bank 8: 0x7d29 item sprite
    db $0d, $00, $f0, $fd, $7c, $17, $7d, $27, $7d, $00, $0f, $f8, $07

    ; bank 8: 0x7d36
    db $07, $19, $77, $00, $00, $00 ; bank 7: 0x7719 item sprite

RandySpriteImage:: ;0x7d3c
    db $16, $00
    INCBIN "gfx/bank008_randy_7d3e.2bpp"

JTSpriteImage:: ; 0x7e9e
    db $16, $00
    INCBIN "gfx/bank008_jt_7ea0.2bpp"

