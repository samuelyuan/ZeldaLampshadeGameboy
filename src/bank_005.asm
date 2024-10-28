SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    INCLUDE "src/engine/events.asm"

    INCLUDE "src/engine/scroll.asm"

    INCLUDE "src/engine/vm_ui.asm"

OutsideShopTileImage::
    db $72, $00
    INCBIN "gfx/bank005_outsideshop_4d6b.2bpp"

BridgeTileImage::
    db $79, $00
    INCBIN "gfx/bank005_bridge_548d.2bpp"

RoomBeforeLampshadeBossTileImage::
    db $75, $00
    INCBIN "gfx/bank005_roombeforelampshadeboss_5c1f.2bpp"

TempleLightOutsideTileImage::
    db $74, $00
    INCBIN "gfx/bank005_templelightoutside_6371.2bpp"

    INCLUDE "src/engine/states/adventure.asm"

    INCLUDE "src/engine/states/shmup.asm"

    INCLUDE "src/engine/states/topdown.asm"

    db $ff
