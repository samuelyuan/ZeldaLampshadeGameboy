
_actors_update:
    add sp, -$08
    ldh a, [$90]
    ld hl, sp+$00
    ld [hl], a
    ld hl, _DRAW_SCROLL_X
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    ld a, c
    add $40
    ld [_allocated_hardware_sprites + 3], a
    ld hl, _DRAW_SCROLL_Y
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    ld a, c
    add $40
    ld [$c512], a
    ld hl, $c50c
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_0f7c

    ld a, [hl+]
    ld b, [hl]
    add $22
    ld c, a
    jr nc, jr_000_0ec2

    inc b

jr_000_0ec2:
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld a, [_EMOTE_ACTOR]
    ld hl, sp+$06
    ld [hl], a
    ld a, [$c50c]
    ld hl, sp+$07
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    ld hl, _scroll_x
    ld e, [hl]
    sub e
    add $08
    ld l, c
    ld h, b
    inc hl
    ld e, [hl]
    add e
    ld [_screen_x], a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    ld hl, _scroll_y
    ld e, [hl]
    sub e
    add $08
    ld e, a
    inc bc
    inc bc
    ld a, [bc]
    add e
    ld [_screen_y], a
    ld a, $01
    ldh [$90], a
    ld a, $01
    ld [$2000], a
    ld hl, _EMOTE_TIMER
    ld a, [hl]
    sub $0f
    jr nc, jr_000_0f54

    ld bc, $403a
    ld a, c
    add [hl]
    ld c, a
    jr nc, jr_000_0f4d

    inc b

jr_000_0f4d:
    ld a, [bc]
    ld hl, _screen_y
    ld c, [hl]
    add c
    ld [hl], a

jr_000_0f54:
    ld hl, _screen_y
    ld e, [hl]
    ld hl, _screen_x
    ld b, [hl]
    ld hl, _allocated_hardware_sprites
    ld c, [hl]
    ld hl, ___current_metasprite
    ld [hl], $49
    inc hl
    ld [hl], $40
    ld hl, ___current_base_tile
    ld [hl], $7c
    ld a, e
    push af
    inc sp
    push bc
    call _move_metasprite
    add sp, $03
    ld a, e
    ld hl, _allocated_hardware_sprites
    add [hl]

Call_000_0f7b:
    ld [hl], a

Jump_000_0f7c:
    ld a, [_ACTORS_ACTIVE_TAIL]
    ld [_allocated_hardware_sprites + 1], a
    ld a, [_ACTORS_ACTIVE_TAIL + 1]
    ld [_allocated_hardware_sprites + 2], a

Jump_000_0f88:
    ld hl, _allocated_hardware_sprites + 2
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_1263

    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld a, [_allocated_hardware_sprites + 2]
    ld hl, sp+$02
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl]
    rrca
    and $01
    ld hl, sp+$03
    ld [hl-], a
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [hl]
    or a
    jr z, jr_000_1013

    ld a, c
    add $08
    ld [_screen_x], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, c
    add $08
    ld [_screen_y], a
    jp Jump_000_1100


jr_000_1013:
    ld hl, _DRAW_SCROLL_X
    ld b, [hl]
    ld a, c
    sub b
    add $08
    ld [_screen_x], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, c
    ld hl, $c7da
    ld c, [hl]
    sub c
    add $08
    ld [_screen_y], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    inc de
    ld a, [de]
    add $43
    ld [$c513], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    inc de
    ld a, [de]
    add $43
    ld [$c514], a
    ld a, [$c513]
    ld hl, $c511
    sub [hl]
    jr c, jr_000_109f

    ld a, [$c513]
    ld c, $00
    add $f0
    ld e, a
    ld a, c
    adc $ff
    ld d, a
    ld hl, $c511
    ld c, [hl]
    ld b, $00
    ld a, c
    sub e
    ld a, b
    sbc d
    jr c, jr_000_109f

    ld a, [$c514]
    ld hl, $c512
    sub [hl]
    jr c, jr_000_109f

    ld a, [$c514]
    ld c, $00
    add $f1
    ld e, a
    ld a, c
    adc $ff
    ld d, a
    ld hl, $c512
    ld c, [hl]
    ld b, $00
    ld a, c
    sub e
    ld a, b
    sbc d
    jr nc, jr_000_1100

jr_000_109f:
    ld hl, sp+$01
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl]
    rlca
    and $01
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, [hl]
    or a
    jr z, jr_000_10d4

    dec hl
    dec hl
    ld a, [hl]
    ld [$c50f], a
    ld hl, sp+$06
    ld a, [hl]
    ld [$c510], a
    jp Jump_000_0f88


jr_000_10d4:
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [$cb90]
    sub $01
    ld a, $00
    rla
    xor $01
    jr nz, jr_000_10f7

    push bc
    ld hl, $c50f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _deactivate_actor
    call RST_08
    pop hl
    pop bc

jr_000_10f7:
    ld hl, $c50f
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_0f88


Jump_000_1100:
jr_000_1100:
    ld a, [_SHOW_ACTORS_ON_OVERLAY]
    or a
    jr nz, jr_000_1173

    ldh a, [rWX]
    sub $07
    jr z, jr_000_1173

    ld hl, _screen_x
    ld c, [hl]
    ld b, $00
    ld hl, $0008
    add hl, bc
    ldh a, [rWX]
    ld c, a
    ld b, $00
    ld e, h
    ld d, b
    ld a, c
    sub l
    ld a, b
    sbc h
    bit 7, e
    jr z, jr_000_112c

    bit 7, d
    jr nz, jr_000_1131

    cp a
    jr jr_000_1131

jr_000_112c:
    bit 7, d
    jr z, jr_000_1131

    scf

jr_000_1131:
    jr nc, jr_000_1173

    ld a, [_screen_y]
    ld b, $00
    add $f8
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    ldh a, [rWY]
    ld l, a
    ld h, $00
    ld e, b
    ld d, h
    ld a, l
    sub c
    ld a, h
    sbc b
    bit 7, e
    jr z, jr_000_1155

    bit 7, d
    jr nz, jr_000_115a

    cp a
    jr jr_000_115a

jr_000_1155:
    bit 7, d
    jr z, jr_000_115a

    scf

jr_000_115a:
    jr nc, jr_000_1173

    ld hl, $c50f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0032
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, $c50f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_000_0f88


jr_000_1173:
    ld hl, $c50f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl]
    rrca
    rrca
    and $01
    jr z, jr_000_1193

    ld hl, $0032
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, $c50f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_000_0f88


jr_000_1193:
    ld hl, $000e
    add hl, bc
    ld a, [hl]
    cp $ff
    jr z, jr_000_11dc

    ld hl, _GAME_TIME
    and [hl]
    jr nz, jr_000_11dc

    ld hl, $000b
    add hl, bc
    inc [hl]
    ld a, [hl]
    ld hl, $c50f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000b
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$06
    ld [hl], a
    ld hl, $000d
    add hl, de
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl+]
    sub [hl]
    jr nz, jr_000_11dc

    ld l, e
    ld h, d
    ld a, [hl]
    swap a
    and $01
    jr z, jr_000_11d6

    ld hl, sp+$06
    ld a, [hl]
    dec a
    ld [bc], a
    jr jr_000_11dc

jr_000_11d6:
    ld hl, $000c
    add hl, de
    ld a, [hl]
    ld [bc], a

jr_000_11dc:
    ld hl, $c50f
    ld a, [hl+]
    ld b, [hl]
    add $22
    ld c, a
    jr nc, jr_000_11e7

    inc b

jr_000_11e7:
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld hl, $c50f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0023
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [_screen_y]
    ld hl, sp+$05
    ld [hl], a
    ld a, [_screen_x]
    ld hl, sp+$06
    ld [hl], a
    ld a, [_allocated_hardware_sprites]
    ld hl, sp+$07
    ld [hl], a
    ld hl, $000a
    add hl, bc
    ld a, [hl]
    ld [___current_base_tile], a
    ld l, e
    ld h, d
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    add $0b
    ld c, a
    jr nc, jr_000_1225

    inc b

jr_000_1225:
    ld a, [bc]
    ld c, a
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, ___current_metasprite
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$05
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    push de
    ld a, [hl]
    push af
    inc sp
    call _move_metasprite
    add sp, $03
    ld a, e
    ld hl, _allocated_hardware_sprites
    add [hl]
    ld [hl], a
    ld hl, $c50f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0032
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, $c50f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_000_0f88


Jump_000_1263:
    ld hl, sp+$00
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    add sp, $08
    ret