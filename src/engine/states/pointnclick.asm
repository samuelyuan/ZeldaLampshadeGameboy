_pointnclick_init:
    ld hl, _camera_offset_x
    ld [hl], $00
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _camera_deadzone_x
    ld [hl], $18
    ld hl, _camera_deadzone_y
    ld [hl], $18
    ld hl, $c0be
    ld [hl], $01
    ld hl, $c0c9
    ld [hl], $00
    ld a, [$c0cc]
    ld b, a
    inc b
    ld a, [$c0cb]
    push bc
    inc sp
    push af
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ret

_pointnclick_update:
    add sp, -$07
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ld hl, $c61b
    ld c, [hl]
    ld a, c
    and $04
    ld b, $00
    push af
    ld a, c
    and $08
    ld e, a
    ld d, $00
    pop af
    bit 1, c
    jr z, jr_007_7d0a

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    or b
    jr z, jr_007_7cfe

    ld c, $e0
    jr jr_007_7d41

jr_007_7cfe:
    ld a, d
    or e
    jr z, jr_007_7d06

    ld c, $a0
    jr jr_007_7d41

jr_007_7d06:
    ld c, $c0
    jr jr_007_7d41

jr_007_7d0a:
    bit 0, c
    jr z, jr_007_7d26

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    or b
    jr z, jr_007_7d1a

    ld c, $20
    jr jr_007_7d41

jr_007_7d1a:
    ld a, d
    or e
    jr z, jr_007_7d22

    ld c, $60
    jr jr_007_7d41

jr_007_7d22:
    ld c, $40
    jr jr_007_7d41

jr_007_7d26:
    or b
    jr z, jr_007_7d32

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld c, $00
    jr jr_007_7d41

jr_007_7d32:
    ld a, d
    or e
    jr z, jr_007_7d3f

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld c, $80
    jr jr_007_7d41

jr_007_7d3f:
    ld c, $00

jr_007_7d41:
    ld a, [_PLAYER_MOVING]
    or a
    jp z, Jump_007_7ec6

    ld hl, $c0c8
    ld b, [hl]
    ld de, $c0ba
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, $c4
    add c
    ld e, a
    ld a, $18
    adc $00
    ld d, a
    ld a, [de]
    push bc
    push bc
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld a, h
    ld hl, sp+$05
    ld [hl], e
    inc hl
    ld [hl-], a
    ld de, $c0ba
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $c0bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    add $40
    add $c4
    ld e, a
    ld a, $00
    adc $18
    ld d, a
    ld a, [de]
    push hl
    push bc
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop hl
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c0ba
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
    ld a, [$c0bf]
    ld hl, sp+$05
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld d, a
    ld hl, $c534
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_007_7e27

    ld hl, sp+$05
    ld a, [hl+]
    ld b, [hl]
    add a
    rl b
    add a
    rl b
    add a
    rl b
    add a
    rl b
    ld hl, $c0ba
    ld [hl+], a
    ld [hl], b
    jr jr_007_7e52

jr_007_7e27:
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, e
    add c
    ld c, a
    ld a, d
    adc b
    ld b, a
    ld hl, $c534
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_007_7e52

    dec hl
    ld a, [hl+]
    sub e
    ld c, a
    ld a, [hl]
    sbc d
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_007_7e52:
    ld hl, $c0bc
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
    ld a, [$c0c1]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$05
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld c, e
    ld b, d
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c536
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_007_7e99

    ld l, e
    ld h, d
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    xor a
    sub l
    ld c, a
    sbc a
    sub h
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_007_7ec6

jr_007_7e99:
    ld a, [$c0c2]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $c536
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_007_7ec6

    dec hl
    ld a, [hl+]
    sub c
    ld c, a
    ld a, [hl]
    sbc b
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_007_7ec6:
jr_007_7ec6:
    ld de, $c0ba
    push de
    ld de, $c0bf
    push de
    ld e, $06
    ld hl, _trigger_at_intersection
    call RST_08
    add sp, $04
    ld hl, sp+$00
    ld [hl], e
    xor a
    push af
    inc sp
    ld e, $01
    ld hl, _actor_overlapping_player
    call RST_08
    inc sp
    ld c, e
    ld b, d
    ld hl, sp+$00
    ld a, [hl]
    inc a
    jr z, jr_007_7f03

    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $c821
    add hl, de
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    or a
    jr nz, jr_007_7f06

jr_007_7f03:
    xor a
    jr jr_007_7f08

jr_007_7f06:
    ld a, $01

jr_007_7f08:
    ld hl, sp+$01
    ld [hl], a
    ld hl, $0025
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld a, b
    or c
    jr z, jr_007_7f25

    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_007_7f28

jr_007_7f25:
    xor a
    jr jr_007_7f2a

jr_007_7f28:
    ld a, $01

jr_007_7f2a:
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr nz, jr_007_7f39

    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_007_7f5a

jr_007_7f39:
    ld hl, $c0c9
    ld [hl], $01
    ld a, [$c0ce]
    inc a
    ld hl, $c0cd
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
    call RST_08
    add sp, $04
    jr jr_007_7f81

jr_007_7f5a:
    ld hl, $c0c9
    ld [hl], $00
    ld a, [$c0cc]
    ld hl, sp+$06
    ld [hl-], a
    inc a
    ld [hl], a
    ld a, [$c0cb]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    push de
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
    call RST_08
    add sp, $04

jr_007_7f81:
    ld a, [$c61b]
    bit 4, a
    jr z, jr_007_7ffd

    ld a, [$c61c]
    bit 4, a
    jr nz, jr_007_7ffd

    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_007_7fea

    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$05

Jump_007_7fbf:
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl-], a
    dec hl
    ld de, $0000
    push de
    ld a, $01
    push af
    inc sp
    ld de, $0000
    push de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    jr jr_007_7ffd

jr_007_7fea:
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_007_7ffd

    dec hl
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, _trigger_interact
    call RST_08
    inc sp

jr_007_7ffd:
    add sp, $07
    ret
