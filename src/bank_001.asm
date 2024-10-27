SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

    INCLUDE "src/engine/actor.asm"

    INCLUDE "src/engine/ui.asm"

WellWelcomeSign::    ; bank 1 0x61ad
    INCLUDE "src/scripts/well/welcomesign.asm"
    
PcWorldTileImage:: ; 0x61dc
    db $7a, $00
    INCBIN "gfx/bank001_pcworld_61de.2bpp"

TitlescreenTileImage:: ; 0x697e
    db $68, $01
    INCBIN "gfx/bank001_title_6980.2bpp" ; 0x6980 title screen
