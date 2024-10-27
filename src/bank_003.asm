SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

    INCLUDE "src/engine/data_manager.asm"

    INCLUDE "src/engine/projectiles.asm"

GraveyardTileImage::
    db $8c, $00
    INCBIN "gfx/bank003_graveyard_5031.2bpp" ; sprite sheet

LampshadeBossRoomTileImage::
    db $ba, $00
    INCBIN "gfx/bank003_lampshadeboss_58f3.2bpp" ; sprite sheet for lampshade boss

_font_gbs_mono_table: ; 0x6493
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
    db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
    db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f
    db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f
    db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f
    db $60, $5f, $0c, $61, $62, $63, $64, $65, $3e, $66, $67, $68, $69, $5f, $6a, $5f
    db $5f, $6b, $6c, $6d, $02, $6e, $6f, $70, $71, $72, $67, $73, $74, $5f, $6a, $75
    db $5f, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $5f, $82, $83
    db $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $84, $8e, $5f, $5f, $5f, $8f
    db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
    db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $58, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae
    db $af, $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $9c, $9d, $9e, $9f
    db $bb, $bc, $bd, $be, $bf, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca

_font_gbs_mono_bitmaps: ; 0x6593
    INCBIN "gfx/bank003_font_6593.2bpp" ; font

_font_gbs_mono: ; 0x7243
    db $01
    db $ff
    dw _font_gbs_mono_table ; 0x6493
    dw $0000
    dw _font_gbs_mono_bitmaps ; 0x6593

ExplorationMusic::
    INCLUDE "audio/exploration.asm"

RoomBeforeLampshadeBossSceneInit:: ; 0x7fe1
    db $25
    db $12, $04
    db $61
    db $14, $00, $00, $ff, $fc
    db $31, $ff, $fc
    db $14, $00, $01, $ff, $fc
    db $0d, $ff, $fc, $00, $55, $af, $02
    db $21, $01, $c6, $0d, $57, $03, $00
