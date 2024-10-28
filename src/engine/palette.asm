_palette_init:
    ; DMG_palette[0] = DMG_palette[2] = DMG_PALETTE(3, 2, 1, 0);
    ld hl, _DMG_palette + 2
    ld [hl], $1b
    ld hl, _DMG_palette
    ld [hl], $1b
    ; DMG_palette[1] = DMG_PALETTE(3, 1, 0, 2);
    ld hl, _DMG_palette + 1
    ld [hl], $87
    ret