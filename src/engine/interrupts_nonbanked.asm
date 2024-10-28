_simple_LCD_isr:
    ldh a, [rLYC]
    sub $96
    jr nz, jr_000_17b5

    ld a, [_DRAW_SCROLL_X]
    ldh [rSCX], a
    ld a, [_DRAW_SCROLL_Y]
    ldh [rSCY], a
    ld a, [$ff4a]
    or a
    jr z, jr_000_179d

    ldh a, [rWY]
    sub $90
    ret nc

    ldh a, [rWY]
    dec a
    ldh [rLYC], a
    ret


jr_000_179d:
    ldh a, [rWX]
    sub $07
    jr nz, jr_000_17af

    ld a, [_SHOW_ACTORS_ON_OVERLAY]
    or a
    jr nz, jr_000_17af

    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a

jr_000_17af:
    ld a, [_OVERLAY_CUT_SCANLINE]
    ldh [rLYC], a
    ret


jr_000_17b5:
    ldh a, [rLYC]
    ld hl, _OVERLAY_CUT_SCANLINE
    sub [hl]
    jr nc, jr_000_17db

    ldh a, [rWX]
    sub $07
    jr nz, jr_000_17d5

    ld a, [_SHOW_ACTORS_ON_OVERLAY]
    or a
    jr nz, jr_000_17d5

jr_000_17c9:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_17c9

    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a

jr_000_17d5:
    ld a, [_OVERLAY_CUT_SCANLINE]
    ldh [rLYC], a
    ret


jr_000_17db:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_17db

    ldh a, [rLCDC]
    and $df
    ldh [rLCDC], a
    ld a, [_HIDE_SPRITES]
    or a
    jr nz, jr_000_17f3

    ldh a, [rLCDC]
    or $02
    ldh [rLCDC], a

jr_000_17f3:
    ld a, $96
    ldh [rLYC], a
    ret

_fullscreen_LCD_isr:
    ldh a, [rLYC]
    sub $96
    jr nz, jr_000_1813

    ldh a, [rLCDC]
    and $ef
    ldh [rLCDC], a
    ld a, [_DRAW_SCROLL_X]
    ldh [rSCX], a
    ld a, [_DRAW_SCROLL_Y]
    ldh [rSCY], a
    ld a, $47
    ldh [rLYC], a
    ret


jr_000_1813:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_1813

    ldh a, [rLCDC]
    or $10
    ldh [rLCDC], a
    ld a, $96
    ldh [rLYC], a
    ret

_VBL_isr:
    ld a, [_WIN_POS_X]
    add $07
    ldh [rWX], a
    ld hl, _WIN_POS_Y
    ld a, [hl]
    ldh [rWY], a
    ld a, [hl]
    sub $90
    jr nc, jr_000_183e

    ldh a, [rLCDC]
    or $20
    ldh [rLCDC], a
    jr jr_000_1844

jr_000_183e:
    ldh a, [rLCDC]
    and $df
    ldh [rLCDC], a

jr_000_1844:
    ld a, [_HIDE_SPRITES]
    or a
    jr z, jr_000_1852

    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a
    jr jr_000_1858

jr_000_1852:
    ldh a, [rLCDC]
    or $02
    ldh [rLCDC], a

jr_000_1858:
    ld bc, $c68b
    ld a, [$c690]
    ld [bc], a
    ld bc, $c691
    ld a, [$c696]
    ld [bc], a
    ld bc, $c697
    ld a, [$c69c]
    ld [bc], a
    ret