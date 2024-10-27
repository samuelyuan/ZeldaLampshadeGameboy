SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

    INCLUDE "src/engine/core.asm"

    INCLUDE "src/engine/gbprinter.asm"

    INCLUDE "src/engine/load_save.asm"

    INCLUDE "src/engine/trigger.asm"

    INCLUDE "src/engine/vm_gameboy.asm"

    INCLUDE "src/engine/vm_sio.asm"

DimDialogue:: ; bank 6: 0x579f
    INCLUDE "src/scripts/dim.asm"

LampshadeBossApproachMessage:: ; 0x59ef message when you press button next to boss
    db $25
    db $40, $00

    db "Yikes!!!", $00

    db $47, $03, $01, $04, $14, $00, $00
    db $45, $ff, $0e, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $45, $fe, $12, $00
    db $44, $03, $01
    db $00

JTHouseOutsideTileImage::
    db $6c, $00
    INCBIN "gfx/bank006_jthouseoutside_5a16.2bpp"

WellTileImage::
    db $6d, $00
    INCBIN "gfx/bank006_well_60d8.2bpp"

NgHeadquartersOutsideTileImage::
    db $70, $00
    INCBIN "gfx/bank006_ngheadquartersoutside_67aa.2bpp"

DefeatedLampshadeBossScreenTileImage::
    db $4e, $00
    INCBIN "gfx/bank006_defeatedlampshadeboss_6eac.2bpp"

TempleLightInsideTileImage::
    db $6f, $00
    INCBIN "gfx/bank006_templelightinside_738e.2bpp"

GameFinishedScreenTileImage::
    db $58, $00
    INCBIN "gfx/bank006_gamefinished_7a80.2bpp"
