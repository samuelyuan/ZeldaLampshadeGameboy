
_parallax_LCD_isr:
    ld hl, $c69d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ldh [rLYC], a
    or a
    jr z, jr_000_1b36

    ld d, $00
    jr jr_000_1b3a

jr_000_1b36:
    ld a, [$c7da]
    ld d, a

jr_000_1b3a:
    ldh a, [rSTAT]
    bit 1, a
    jr nz, jr_000_1b3a

    ld a, e
    ld [$ff43], a
    ld a, d
    ldh [rSCY], a
    ldh a, [rLYC]
    or a
    jr z, jr_000_1b58

    ld de, $0004
    add hl, de
    ld d, h
    ld a, l
    ld hl, $c69d
    ld [hl+], a
    ld [hl], d
    ret


jr_000_1b58:
    ld hl, $c69d
    ld a, $8b
    ld [hl+], a
    ld [hl], $c6
    ret
