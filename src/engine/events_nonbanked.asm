_events_update:
    add sp, -$08
    ld hl, sp+$05
    ld a, $e8
    ld [hl+], a
    ld [hl], $c5
    ld a, [_FRAME_JOY]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$00
    ld [hl], $01

Jump_000_1596:
    ld hl, sp+$07
    ld a, [hl]
    or a
    jp z, Jump_000_1648

    push hl
    bit 0, [hl]
    pop hl
    jp z, Jump_000_1632

    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [de]
    ld [hl], a
    or a
    jp z, Jump_000_1632

    and $0f
    dec a
    ld c, a
    rlca
    sbc a
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, $c5c0
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0003
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$03
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$02
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    or l
    jr z, jr_000_1632

    push hl
    ld hl, sp+$06
    bit 7, [hl]
    pop hl
    jr z, jr_000_15ec

    ld a, [_FRAME_JOY]
    ld hl, sp+$00
    xor [hl]
    ld [_FRAME_JOY], a

jr_000_15ec:
    ld a, [_LAST_JOY]
    ld hl, sp+$00
    and [hl]
    jr nz, jr_000_1632

    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_000_15ff

    add hl, hl
    jr nc, jr_000_1632

jr_000_15ff:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$03
    ld [hl+], a
    ld a, $00
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    ld d, a
    ld l, c
    ld h, b
    inc hl
    inc hl
    ld a, [hl]
    push af
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    push hl
    ld h, $01
    push hl
    inc sp
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08

Jump_000_1632:
jr_000_1632:
    ld hl, sp+$07
    ld a, [hl]
    srl a
    ld [hl], a
    ld hl, sp+$00
    ld a, [hl]
    add a
    ld [hl], a

Jump_000_163d:
    ld hl, sp+$05
    inc [hl]
    jp nz, Jump_000_1596

    inc hl
    inc [hl]
    jp Jump_000_1596


Jump_000_1648:
    ld a, [$c61d]
    ld hl, _FRAME_JOY
    and [hl]
    ld [$c61d], a
    add sp, $08
    ret


_timers_update:
    add sp, -$05
    ld bc, _TIMER_VALUES
    ld hl, sp+$04
    ld [hl], $00

jr_000_165e:
    ld hl, sp+$04
    ld a, [hl]
    sub $04
    jr z, jr_000_16da

    ld a, [bc]
    or a
    jr z, jr_000_16d3

    ld e, c
    ld d, b
    inc de
    ld a, [de]
    dec a
    ld [de], a
    or a
    jr nz, jr_000_16d3

    ld a, [bc]
    ld [de], a
    ld hl, sp+$04
    ld e, [hl]
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, hl
    add hl, de
    ld a, l
    add $f0
    ld e, a
    ld a, h
    adc $c5
    ld d, a
    inc sp
    inc sp
    ld l, e
    ld h, d
    push hl
    inc hl
    inc hl
    inc hl
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl-]
    or [hl]
    jr z, jr_000_16d5

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    or l
    jr z, jr_000_16aa

    add hl, hl
    jr nc, jr_000_16d3

jr_000_16aa:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    inc hl
    inc hl
    ld a, [hl]
    push bc
    ld hl, $0000
    push hl
    ld h, $00
    push hl
    inc sp
    push af
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    push hl
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    pop bc

jr_000_16d3:
    inc bc
    inc bc

jr_000_16d5:
    ld hl, sp+$04
    inc [hl]
    jr jr_000_165e

jr_000_16da:
    add sp, $05
    ret