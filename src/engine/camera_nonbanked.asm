_camera_update:
    add sp, -$07
    ld a, [_camera_settings]
    ld hl, sp+$00
    ld [hl], a
    push hl
    bit 0, [hl]
    pop hl
    jp z, Jump_000_148c

    ld hl, _ACTORS + 1

Call_000_1403:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, $0008
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$03
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$02
    ld [hl], a
    ld a, [_camera_deadzone_x]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld b, a
    ld c, e
    ld a, [_camera_offset_x]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld a, [_camera_x]
    ld hl, sp+$05
    ld [hl], a
    ld a, [_camera_x + 1]
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_000_1468

    ld hl, _camera_x
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_148c

jr_000_1468:
    push de
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    pop de
    ld c, l
    ld b, h
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld hl, sp+$05
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr nc, jr_000_148c

    ld hl, _camera_x
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_000_148c:
jr_000_148c:
    push hl
    ld hl, sp+$02
    bit 1, [hl]
    pop hl
    jp z, Jump_000_1521

    ld hl, _ACTORS + 3
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, $0008
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$03
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$02
    ld [hl], a
    ld a, [_camera_deadzone_y]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld b, a
    ld c, e
    ld a, [_camera_offset_y]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld a, [_camera_y]
    ld hl, sp+$05
    ld [hl], a
    ld a, [_camera_y + 1]
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_000_14fd

    ld hl, _camera_y
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_1521

jr_000_14fd:
    push de
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    pop de
    ld c, l
    ld b, h
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld hl, sp+$05
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr nc, jr_000_1521

    ld hl, _camera_y
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_000_1521:
jr_000_1521:
    add sp, $07
    ret