
_set_bkg_submap:
    ld hl, sp+$02
    ld a, [hl+]
    ld b, a
    ld c, [hl]
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    ld [$c7f0], a
    add [hl]
    ld d, $00
    ld e, a
    ld a, c
    ld hl, $0000

jr_000_22ad:
    srl a
    jr nc, jr_000_22b2

    add hl, de

jr_000_22b2:
    sla e
    rl d
    or a
    jr nz, jr_000_22ad

    ld a, b
    add l
    ld l, a
    adc h
    sub l
    ld h, a
    ld d, h
    ld e, l
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld b, h
    ld c, l
    ld hl, sp+$02
    ld a, [hl+]
    and $1f
    ld d, a
    ld a, [hl]
    and $1f
    ld e, a
    ld hl, sp+$05
    ld a, [hl-]
    ld h, [hl]
    ld l, a
    jr jr_000_2310

Call_000_22da:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ldh a, [$90]
    push af
    ld a, [hl+]
    ldh [$90], a
    ld [$2000], a
    ld a, [hl+]
    inc hl
    inc hl
    sub [hl]
    ld [$c7f0], a
    dec hl
    dec hl
    ld a, [hl+]
    and $1f
    ld d, a
    ld a, [hl+]
    and $1f
    ld e, a
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    call Call_000_2307
    pop af
    ldh [$90], a
    ld [$2000], a
    ret


Call_000_2307:
    push hl
    ldh a, [rLCDC]
    bit 6, a
    jr z, jr_000_2317

    jr jr_000_231c

jr_000_2310:
    push hl
    ldh a, [rLCDC]
    bit 3, a
    jr nz, jr_000_231c

jr_000_2317:
    ld hl, $9800
    jr _set_xy_submap

jr_000_231c:
    ld hl, $9c00

_set_xy_submap:
    push bc
    swap e
    rlc e
    ld a, e
    and $03
    add h
    ld b, a
    ld a, $e0
    and e
    add d
    ld c, a
    pop hl
    pop de
    push de
    push bc

jr_000_2332:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_2332

    ld a, [hl+]
    ld [bc], a
    ld a, c
    and $e0
    ld e, a

Jump_000_233e:
    ld a, c
    inc a
    and $1f
    or e
    ld c, a
    dec d
    jr nz, jr_000_2332

    ld a, [$c7f0]
    add l
    ld l, a
    adc h
    sub l
    ld h, a
    pop bc
    pop de
    dec e
    ret z

    push de
    ld a, b
    and $fc
    ld e, a
    ld a, $20
    add c
    ld c, a
    adc b
    sub c
    and $03
    or e
    ld b, a
    push bc
    jr jr_000_2332