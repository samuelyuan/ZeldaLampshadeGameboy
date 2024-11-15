SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

JTHouseInsideTileImage::
    db $89, $00
    INCBIN "gfx/bank004_jthouseinside_4002.2bpp"

DimHouseInsideTileImage::
    db $81, $00
    INCBIN "gfx/bank004_dimhouseinside_4894.2bpp"

DimHouseOutsideTileImage::
    db $82, $00
    INCBIN "gfx/bank004_dimhouseoutside_50a6.2bpp"

NgHeadquartersInsideTileImage::
    db $66, $00
    INCBIN "gfx/bank004_ngheadquartersinside_58c8.2bpp"

McdonaldsTileImage::
    db $84, $00
    INCBIN "gfx/bank004_mcdonalds_5f2a.2bpp"

JRInsideTileImage::
    db $7f, $00
    INCBIN "gfx/bank004_jrinside_676c.2bpp"

JROutsideTileImage::
    db $81, $00
    INCBIN "gfx/bank004_jroutside_6f5e.2bpp"

LampshadeBossMusic::
    INCLUDE "audio/lampshadeboss.asm"

Palette0:: ; 0x7fb4
    db $ff, $e4, $00

bank004_7fb7:
    db $22, $01, $30, $d9, $a4
    db $22, $19, $00, $d9, $a6
    db $22, $29, $00, $d9, $aa
    db $22, $0f, $a0, $d9, $a8
    db $22, $00, $98, $d9, $ac
    db $22, $00, $e4, $d9, $ae
    db $22, $00, $d0, $d9, $b0
    db $22, $40, $00, $d9, $b2
    db $22, $07, $00, $d9, $b4
    db $22, $02, $00, $d9, $b6
    db $22, $4e, $20, $d9, $b8
    db $22, $00, $10, $da, $34
    db $22, $00, $08, $d9, $be
    db $22, $00, $01, $da, $1e
    db $0b, $00, $ff