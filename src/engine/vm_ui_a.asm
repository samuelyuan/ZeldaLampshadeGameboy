
_itoa_fmt:
    push bc
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    ld a, d
    add a
    jr c, jr_009_490f

    call _utoa_fmt
    jr jr_009_4925

jr_009_490f:
    rra
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de
    ld hl, _itoa_fmt_len
    ld a, [hl]
    or a
    jr z, jr_009_491e

    dec [hl]

jr_009_491e:
    ld a, $2d
    ld [bc], a
    inc bc
    call _utoa_fmt

jr_009_4925:
    ld h, b
    ld l, c
    pop de
    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de
    add hl, de
    ld d, h
    ld e, l
    pop bc
    ret


_utoa_fmt:
    push bc
    ld hl, _itoa_fmt_buf + 2
    xor a
    ld [hl-], a
    ld [hl-], a
    ld [hl], a
    ld b, $10

jr_009_493e:
    sla e
    rl d
    ld a, [hl]
    adc a
    daa
    ld [hl+], a
    ld a, [hl]
    adc a
    daa
    ld [hl+], a
    ld a, [hl]
    adc a
    daa
    ld [hl-], a
    dec hl
    dec b
    jr nz, jr_009_493e

    pop bc
    ld a, [_itoa_fmt_len]
    sub $05
    jr c, jr_009_4969

    jr z, jr_009_4969

    ld d, a
    ld a, $30

jr_009_495f:
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_009_495f

    ld a, $05
    ld [_itoa_fmt_len], a

jr_009_4969:
    ld a, [_itoa_fmt_len]
    or a
    jr z, jr_009_4971

    ld a, $01

jr_009_4971:
    ld d, a
    ld e, $30
    ld hl, _itoa_fmt_buf + 2
    ld a, [hl-]
    and $0f
    add d
    jr z, jr_009_498e

    sub d
    add e
    ld d, $01
    ld [bc], a
    inc bc
    ld a, [_itoa_fmt_len]
    or a
    jr z, jr_009_498e

    cp $05
    jr nc, jr_009_498e

    dec bc

jr_009_498e:
    ld a, [hl]
    swap a
    and $0f
    add d
    jr z, jr_009_49a7

    sub d
    add e
    ld d, $01
    ld [bc], a
    inc bc
    ld a, [_itoa_fmt_len]
    or a
    jr z, jr_009_49a7

    cp $04
    jr nc, jr_009_49a7

    dec bc

jr_009_49a7:
    ld a, [hl-]
    and $0f
    add d
    jr z, jr_009_49be

    sub d
    add e
    ld d, $01
    ld [bc], a
    inc bc
    ld a, [_itoa_fmt_len]
    or a
    jr z, jr_009_49be

    cp $03
    jr nc, jr_009_49be

    dec bc

jr_009_49be:
    ld a, [hl]
    swap a
    and $0f
    add d
    jr z, jr_009_49d5

    sub d
    add e
    ld [bc], a
    inc bc
    ld a, [_itoa_fmt_len]
    or a
    jr z, jr_009_49d5

    cp $02
    jr nc, jr_009_49d5

    dec bc

jr_009_49d5:
    ld a, [hl]
    and $0f
    add e
    ld [bc], a
    inc bc
    xor a
    ld [bc], a
    ret