
_scroll_init:
    xor a
    ld hl, _DRAW_SCROLL_X
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _DRAW_SCROLL_Y
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _SCROLL_X_MAX
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _SCROLL_Y_MAX
    ld [hl+], a
    ld [hl], a
    ld hl, _SCROLL_OFFSET_X
    ld [hl], $00
    ld hl, _SCROLL_OFFSET_Y
    ld [hl], $00
    ld e, $05
    ld hl, _scroll_reset ; jumps to bank 5: 0x40aa
    jp RST_08

_scroll_reset:
    ld hl, _pending_w_i
    ld [hl], $00
    ld hl, _pending_h_i
    ld [hl], $00
    ld hl, _scroll_x
    ld a, $ff
    ld [hl+], a
    ld [hl], $7f
    ld hl, _scroll_y
    ld a, $ff
    ld [hl+], a
    ld [hl], $7f
    ld hl, _GAME_TIME
    ld [hl], $00
    ret

_scroll_update:
    dec sp
    dec sp
    ld hl, _camera_x
    ld a, [hl+]
    add $b0
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    ld hl, _camera_y
    ld a, [hl+]
    add $b8
    ld e, a
    ld a, [hl]
    adc $ff
    ld d, a
    bit 7, b
    jr z, jr_005_40eb

    ld bc, $0000
    jr jr_005_4103

jr_005_40eb:
    inc sp
    inc sp
    push bc
    push de
    ld de, _SCROLL_X_MAX
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    pop de
    jr nc, jr_005_4103

    ld hl, _SCROLL_X_MAX
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_005_4103:
    bit 7, d
    jr z, jr_005_410c

    ld de, $0000
    jr jr_005_4124

jr_005_410c:
    inc sp
    inc sp
    push de
    push de
    ld de, _SCROLL_Y_MAX
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    pop de
    jr nc, jr_005_4124

    ld hl, _SCROLL_Y_MAX
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_005_4124:
    ld a, [_scroll_x]
    ld [_current_col], a
    ld a, [_scroll_x + 1]
    ld hl, _current_col + 1
    ld [hl], a
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld a, [_scroll_y]
    ld [_current_row], a
    ld a, [_scroll_y + 1]
    ld hl, _current_row + 1
    ld [hl], a
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, _new_col
    ld a, c
    ld [hl+], a
    ld [hl], b
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, _new_row
    ld a, e
    ld [hl+], a
    ld [hl], d
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, _scroll_x
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _scroll_y
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [_SCROLL_OFFSET_X]
    ld hl, sp+$00
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    pop hl
    push hl
    add hl, bc
    ld a, l
    ld [_DRAW_SCROLL_X], a
    ld a, h
    ld [_DRAW_SCROLL_X + 1], a
    ld a, [_SCROLL_OFFSET_Y]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, c
    add e
    ld hl, _DRAW_SCROLL_Y
    ld [hl+], a
    ld a, b
    adc d
    ld [hl], a
    ld de, _PARALLAX_ROWS
    push de
    call _scroll_viewport
    pop hl
    ld a, e
    or a
    jr nz, jr_005_41de

    ld de, $c691
    push de
    call _scroll_viewport
    pop hl
    ld a, e
    or a
    jr nz, jr_005_41de

    ld de, $c697
    push de
    call _scroll_viewport
    pop hl

jr_005_41de:
    inc sp
    inc sp
    ret


_scroll_viewport:
    add sp, -$0d
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld a, [bc]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$08
    ld a, [hl]
    or a
    jp z, Jump_005_435d

    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ld c, a
    sub $7f
    jr nz, jr_005_422f

    xor a
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], a
    jr jr_005_425f

jr_005_422f:
    bit 7, c
    jr z, jr_005_424a

    xor a
    sub c
    ld b, a
    ld hl, _DRAW_SCROLL_X
    ld a, [hl+]
    ld c, [hl]
    inc b
    jr jr_005_4241

jr_005_423e:
    add a
    rl c

jr_005_4241:
    dec b
    jr nz, jr_005_423e

    ld hl, sp+$05
    ld [hl+], a
    ld [hl], c
    jr jr_005_425f

jr_005_424a:
    ld hl, _DRAW_SCROLL_X
    ld a, [hl+]
    ld b, a
    ld e, [hl]
    inc c
    jr jr_005_4257

jr_005_4253:
    sra e
    rr b

jr_005_4257:
    dec c
    jr nz, jr_005_4253

    ld hl, sp+$05
    ld a, b
    ld [hl+], a
    ld [hl], e

jr_005_425f:
    ld hl, sp+$05
    ld c, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld [hl], c
    ld hl, _new_col
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    dec bc
    ld hl, sp+$07
    ld a, [hl+]
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl], a
    ld hl, _current_col
    ld a, [hl]
    sub c
    jr nz, jr_005_42bf

    inc hl
    ld a, [hl]
    sub b
    jr nz, jr_005_42bf

    ld hl, sp+$08
    ld a, [hl+]
    add $15
    ld c, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld b, a
    pop de
    push de
    ld a, [de]
    push bc
    inc sp
    ld b, a
    push bc
    call Call_000_220b
    add sp, $03
    jp Jump_005_4358


jr_005_42bf:
    ld hl, _new_col
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0d
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0c
    ld [hl], a
    ld a, [_current_col]
    ld hl, sp+$0b
    sub [hl]
    jr nz, jr_005_4329

    ld a, [$c7ed]
    ld hl, sp+$0c
    sub [hl]
    jr nz, jr_005_4329

    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$07
    ld [hl-], a
    ld a, e
    ld [hl+], a
    bit 7, [hl]
    jr z, jr_005_4305

    xor a
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], a
    jr jr_005_4311

jr_005_4305:
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld hl, sp+$0c
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a

jr_005_4311:
    ld hl, sp+$0b
    ld a, [hl-]
    dec hl
    ld c, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld b, a
    pop de
    push de
    ld a, [de]
    push bc
    inc sp
    ld b, a
    push bc
    call Call_000_220b
    add sp, $03
    jr jr_005_4358

jr_005_4329:
    ld a, [_current_col]
    ld hl, _new_col
    sub [hl]
    jr nz, jr_005_433b

    ld a, [_current_col + 1]
    ld hl, _new_col + 1
    sub [hl]
    jr z, jr_005_4358

jr_005_433b:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld b, a
    pop de
    push de
    ld a, [de]
    push bc
    inc sp
    push af
    inc sp
    ld de, $0000
    push de
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _scroll_render_rows
    add sp, $06

Jump_005_4358:
jr_005_4358:
    ld e, $00
    jp Jump_005_468c


Jump_005_435d:
    ld hl, _DRAW_SCROLL_X
    ld c, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld hl, _new_col
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$0b
    ld [hl-], a
    ld [hl], e
    ld a, [_new_col]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, _new_row
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$03
    ld [hl-], a
    ld [hl], e
    ld a, [_new_row]
    dec a
    ld hl, sp+$04
    ld [hl-], a
    ld a, [hl+]
    inc hl
    rlca
    and $01
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld a, [_current_col]
    ld hl, sp+$0a
    sub [hl]
    jp nz, Jump_005_4453

    ld a, [$c7ed]
    ld hl, sp+$0b
    sub [hl]
    jp nz, Jump_005_4453

    ld hl, sp+$0c
    ld a, [hl]
    add $15
    ld hl, sp+$08
    ld [hl+], a
    pop de
    push de
    ld a, [de]
    ld [hl], a
    ld a, [hl+]
    inc hl
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$0b
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_005_43e0

    bit 7, d
    jr nz, jr_005_43e5

    cp a
    jr jr_005_43e5

jr_005_43e0:
    bit 7, d
    jr z, jr_005_43e5

    scf

jr_005_43e5:
    ld a, $00
    rla
    ld hl, sp+$0a
    ld [hl], a
    or a
    jr z, jr_005_43fa

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a

jr_005_43fa:
    ld hl, sp+$0c
    bit 7, [hl]
    jr z, jr_005_4406

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a
    jr jr_005_4421

jr_005_4406:
    ld hl, sp+$0a
    ld a, [hl]
    or a
    jr z, jr_005_4414

    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    jr jr_005_441a

jr_005_4414:
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a

jr_005_441a:
    ld hl, sp+$0c
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a

jr_005_4421:
    ld hl, sp+$0b
    ld c, [hl]
    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_005_442f

    ld de, $0000
    jr jr_005_4433

jr_005_442f:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a

jr_005_4433:
    ld b, e
    push bc
    ld a, c
    push af
    inc sp
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    call _scroll_queue_col
    pop hl
    inc sp
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, _activate_actors_in_col
    call RST_08
    pop hl
    jp Jump_005_4559


Jump_005_4453:
    ld hl, _new_col
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, _current_col
    ld a, [hl]
    sub c
    jp nz, Jump_005_451b

    inc hl
    ld a, [hl]
    sub b
    jp nz, Jump_005_451b

    ld hl, sp+$0b
    bit 7, [hl]
    jr z, jr_005_4472

    ld c, $00
    jr jr_005_4478

jr_005_4472:
    ld hl, sp+$0c
    ld a, [hl]
    dec a
    ld c, a
    rlca

jr_005_4478:
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    pop de
    push de
    ld a, [de]
    ld [hl], a
    ld a, [hl+]
    inc hl
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$0b
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_005_449e

    bit 7, d
    jr nz, jr_005_44a3

    cp a
    jr jr_005_44a3

jr_005_449e:
    bit 7, d
    jr z, jr_005_44a3

    scf

jr_005_44a3:
    ld a, $00
    rla
    ld hl, sp+$0a
    ld [hl], a
    or a
    jr z, jr_005_44b8

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a

jr_005_44b8:
    ld hl, sp+$0c
    bit 7, [hl]
    jr z, jr_005_44c4

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a
    jr jr_005_44d9

jr_005_44c4:
    ld hl, sp+$0a
    ld a, [hl]
    or a
    jr z, jr_005_44cf

    ld hl, sp+$04
    ld e, [hl]
    jr jr_005_44d2

jr_005_44cf:
    ld hl, sp+$09
    ld e, [hl]

jr_005_44d2:
    ld a, e
    ld hl, sp+$0b
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a

jr_005_44d9:
    ld hl, sp+$0b
    ld a, [hl+]
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_005_44ea

    xor a
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], a
    jr jr_005_44f6

jr_005_44ea:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a

jr_005_44f6:
    ld hl, sp+$0a
    ld a, [hl+]
    ld [hl+], a
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    call _scroll_queue_col
    pop hl
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, $4411
    call RST_08
    pop hl
    jr jr_005_4559

Jump_005_451b:
    ld a, [_current_col]
    ld hl, _new_col
    sub [hl]
    jr nz, jr_005_452d

    ld a, [$c7ed]
    ld hl, $c7ef
    sub [hl]
    jr z, jr_005_4559

jr_005_452d:
    ld hl, $c53d
    ld a, [hl]
    dec a
    jr nz, jr_005_4539

    pop de
    push de
    ld a, [de]
    jr jr_005_453b

jr_005_4539:
    ld a, $ff

jr_005_453b:
    ld h, $15
    push hl
    inc sp
    push af
    inc sp
    ld hl, _DRAW_SCROLL_Y
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, _DRAW_SCROLL_X
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _scroll_render_rows
    add sp, $06
    ld e, $01
    jp Jump_005_468c


Jump_005_4559:
jr_005_4559:
    ld hl, _new_row
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$08
    ld [hl-], a
    ld [hl], e
    ld hl, _new_col
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    dec bc
    ld e, [hl]
    ld a, [_new_row]
    ld hl, sp+$09
    ld [hl], a
    ld a, e
    dec a
    ld hl, sp+$0c
    ld [hl-], a
    dec hl
    ld a, b
    rlca
    and $01
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld a, [$c7e8]
    ld hl, sp+$07
    sub [hl]
    jr nz, jr_005_45c9

    ld a, [$c7e9]
    ld hl, sp+$08
    sub [hl]
    jr nz, jr_005_45c9

    ld hl, sp+$0a
    ld a, [hl]
    or a
    jr z, jr_005_45a5

    inc hl
    xor a
    ld [hl+], a
    ld [hl], a

jr_005_45a5:
    ld hl, sp+$0b
    ld a, [hl+]
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl+]
    inc hl
    add $13
    ld [hl+], a
    ld d, a
    ld e, [hl]
    push de
    call _scroll_queue_row
    pop hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    push de
    ld e, $01
    ld hl, $431a
    call RST_08
    pop hl
    jp Jump_005_4672


jr_005_45c9:
    ld hl, _new_row
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, $c7e8
    ld a, [hl]
    sub c
    jr nz, jr_005_4635

    inc hl
    ld a, [hl]
    sub b
    jr nz, jr_005_4635

    ld hl, sp+$0a
    ld a, [hl]
    or a
    jr z, jr_005_45e6

    inc hl
    xor a
    ld [hl+], a
    ld [hl], a

jr_005_45e6:
    ld hl, sp+$0b
    ld a, [hl+]
    ld [hl-], a
    pop de
    push de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$07
    ld e, l
    ld d, h
    ld hl, sp+$05
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_005_460c

    bit 7, d
    jr nz, jr_005_4611

    cp a
    jr jr_005_4611

jr_005_460c:
    bit 7, d
    jr z, jr_005_4611

    scf

jr_005_4611:
    jr c, jr_005_4619

    ld hl, sp+$09
    ld a, [hl+]
    inc hl
    dec a
    ld [hl], a

jr_005_4619:
    ld hl, sp+$0b
    ld a, [hl+]
    ld b, a
    push bc
    ld c, [hl]
    push bc
    call _scroll_queue_row
    pop hl
    inc sp
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, $431a
    call RST_08
    pop hl
    jr jr_005_4672

jr_005_4635:
    ld a, [_current_row]
    ld hl, _new_row
    sub [hl]
    jr nz, jr_005_4647

    ld a, [_current_row + 1]
    ld hl, _new_row + 1
    sub [hl]
    jr z, jr_005_4672

jr_005_4647:
    ld hl, _scene_LCD_type
    ld a, [hl]
    dec a
    jr nz, jr_005_4653

    pop de
    push de
    ld a, [de]
    jr jr_005_4655

jr_005_4653:
    ld a, $ff

jr_005_4655:
    ld h, $15
    push hl
    inc sp
    push af
    inc sp
    ld hl, _DRAW_SCROLL_Y
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, _DRAW_SCROLL_X
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _scroll_render_rows
    add sp, $06
    ld e, $01
    jr jr_005_468c

Jump_005_4672:
jr_005_4672:
    ld a, [_GAME_TIME]
    rrca
    jr c, jr_005_468a

    ld a, [_pending_h_i]
    or a
    jr z, jr_005_4681

    call _scroll_load_pending_col

jr_005_4681:
    ld a, [_pending_w_i]
    or a
    jr z, jr_005_468a

    call _scroll_load_pending_row

jr_005_468a:
    ld e, $01

Jump_005_468c:
jr_005_468c:
    add sp, $0d
    ret

_scroll_repaint:
    ld e, $05
    ld hl, _scroll_reset
    call RST_08
    ld e, $05
    ld hl, _scroll_update
    jp RST_08


_scroll_render_rows:
    dec sp
    ld hl, _pending_w_i
    ld [hl], $00
    ld hl, _pending_h_i
    ld [hl], $00
    ld hl, sp+$03
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    ld l, c
    ld h, b
    dec hl
    bit 7, h
    jr z, jr_005_46c6

    ld c, $00
    jr jr_005_46c9

jr_005_46c6:
    dec c
    ld a, c
    rlca

jr_005_46c9:
    ld hl, sp+$00
    ld [hl], c
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    ld a, [hl]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld l, e
    ld h, d
    add hl, bc
    bit 7, h
    jr z, jr_005_46ee

    ld b, $00
    jr jr_005_46f4

jr_005_46ee:
    ld a, c
    ld hl, sp+$07
    add [hl]
    ld b, a
    rlca

jr_005_46f4:
    ld c, $00

jr_005_46f6:
    ld hl, sp+$08
    ld a, [hl]
    sub c
    jr z, jr_005_4725

    ld a, [_image_tile_height]
    sub b
    jr z, jr_005_4725

    push bc
    push bc
    inc sp
    ld hl, sp+$03
    ld a, [hl]
    push af
    inc sp
    call Call_000_21c6
    pop hl
    pop bc
    push bc
    push bc
    inc sp
    ld hl, sp+$03
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, _activate_actors_in_row
    call RST_08
    pop hl
    pop bc
    inc c
    inc b
    jr jr_005_46f6

jr_005_4725:
    inc sp
    ret


_scroll_queue_row:
jr_005_4727:
    ld a, [_pending_w_i]
    or a
    jr z, jr_005_4732

    call _scroll_load_pending_row
    jr jr_005_4727

jr_005_4732:
    ld hl, sp+$03
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    ret nc

    ld hl, sp+$02
    ld a, [hl]
    ld [_pending_w_x], a
    ld hl, sp+$03
    ld a, [hl]
    ld [_pending_w_y], a
    ld hl, _pending_w_i
    ld [hl], $17
    ret


_scroll_queue_col:
jr_005_474c:
    ld a, [_pending_h_i]
    or a
    jr z, jr_005_4757

    call _scroll_load_pending_col
    jr jr_005_474c

jr_005_4757:
    ld hl, sp+$02
    ld a, [hl]
    ld [_pending_h_x], a
    ld hl, sp+$03
    ld c, [hl]
    ld hl, _pending_h_y
    ld [hl], c
    ld a, [_image_tile_height]
    ld b, $00
    ld e, c
    ld d, $00
    sub e
    ld l, a
    ld a, b
    sbc d
    ld b, a
    ld e, b
    ld d, $00
    ld a, $15
    cp l
    ld a, $00
    sbc b
    bit 7, e
    jr z, jr_005_4785

    bit 7, d
    jr nz, jr_005_478a

    cp a
    jr jr_005_478a

jr_005_4785:
    bit 7, d
    jr z, jr_005_478a

    scf

jr_005_478a:
    jr nc, jr_005_4790

    ld a, $15
    jr jr_005_4794

jr_005_4790:
    ld a, [_image_tile_height]
    sub c

jr_005_4794:
    ld [_pending_h_i], a
    ret