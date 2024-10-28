
_platform_init:
    add sp, -$07
    xor a
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], a
    ld a, [$d9b4]
    ld [$d9a2], a
    ld a, [$d9b5]
    ld [$d9a3], a
    ld a, $02

jr_002_6edc:
    ld hl, $d9a2
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_002_6edc

    ld bc, _ACTORS
    ld hl, $0005
    add hl, bc
    ld a, [hl]
    cp $02
    jr z, jr_002_6ef6

    or a
    jr nz, jr_002_6ef8

jr_002_6ef6:
    ld [hl], $01

jr_002_6ef8:
    ld hl, $c0ba
    ld a, [hl+]
    ld h, [hl]
    ld e, a
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$00
    ld [hl], e
    ld hl, $c0bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    srl l
    rr e
    srl l
    rr e
    srl l
    rr e
    srl l
    rr e
    srl l
    rr e
    srl l
    rr e
    srl l
    rr e
    ld hl, $d99e
    ld [hl], $00
    dec e
    ld hl, sp+$00
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_6f8b

    ld a, e
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_6f8b

    ld a, [_COLLISION_BANK]
    ld hl, sp+$06
    ld [hl], a
    ld hl, _image_tile_width
    ld l, [hl]
    ld h, $00
    ld d, h
    push bc
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_6f8d

jr_002_6f8b:
    ld e, $0f

jr_002_6f8d:
    bit 4, e
    jp z, Jump_002_704f

    ld a, [$c0c0]
    ld hl, sp+$01
    ld [hl+], a
    rlca
    sbc a
    ld [hl+], a
    ld a, [$c0bf]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$06
    ld [hl-], a
    ld a, e
    ld [hl+], a
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    sra d
    rr e
    ld hl, sp+$00
    ld a, [hl]
    ld d, $00
    add a
    rl d
    add a
    rl d
    add a
    rl d
    push de
    ld e, a
    ld hl, $0004
    add hl, de
    pop de
    push hl
    ld a, l
    ld hl, sp+$03
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$02
    ld [hl+], a
    ld d, $00
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$04
    ld [hl-], a
    ld [hl], e
    ld a, [hl+]
    ld e, [hl]
    inc hl
    add a
    rl e
    add a
    rl e
    add a
    rl e
    add a
    rl e
    ld [hl+], a
    ld a, e
    ld [hl-], a
    ld de, $c0ba
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $c0c9
    ld [hl], $06
    ld a, [$c0d8]
    inc a
    ld hl, $c0d7
    ld h, [hl]
    push bc
    push af
    inc sp
    push hl
    inc sp
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    pop bc
    ld bc, $c0c5
    ld de, $c0c4
    ld a, [de]
    ld [bc], a
    ld bc, $c0c6
    ld a, [de]
    inc a
    ld [bc], a
    ld hl, $d99f
    ld [hl], $01
    jr jr_002_7061

Jump_002_704f:
    ld hl, $d99f
    ld [hl], $00
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl

jr_002_7061:
    ld hl, _camera_offset_x
    ld [hl], $00
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _camera_deadzone_x 
    ld [hl], $04
    ld hl, _camera_deadzone_y
    ld [hl], $10
    ld hl, _GAME_TIME
    ld [hl], $00
    add sp, $07
    ret

_platform_update:
    add sp, -$13
    ld a, [$c0c0]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [$c0bf]
    ld hl, sp+$00
    ld [hl+], a
    rlca
    sbc a
    ld [hl+], a
    pop de
    push de
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld b, a
    ld c, e
    sra b
    rr c
    ld a, c
    ld [hl+], a
    ld [hl], $00
    ld a, [_FRAME_JOY]
    ld hl, sp+$12
    ld [hl], a
    ld a, [_COLLISION_BANK]
    ld hl, sp+$04
    ld [hl], a
    ld a, [_image_tile_width]
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl]
    and $04
    ld hl, sp+$09
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$12
    ld a, [hl]
    and $08
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$12
    ld a, [hl]
    and $02
    ld hl, sp+$0d
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$12
    ld a, [hl]
    and $01
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], $00
    ld a, [$d99f]
    or a
    jp z, Jump_002_73ec

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
    ld hl, sp+$00
    ld a, [hl+]
    ld e, [hl]
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$12
    ld [hl], c
    xor a
    ld hl, $d9a2
    ld [hl+], a
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    ld a, $00
    rla
    ld c, a
    ld hl, sp+$0a
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_71ca

    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$10
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [$c0c1]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
    ld h, a
    add hl, de
    inc hl
    ld e, l
    srl h
    rr e
    srl h
    rr e
    srl h
    rr e
    ld a, c
    or a
    jr z, jr_002_71b0

    ld a, e
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_71b0

    ld d, $00
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    push de
    call Call_000_3569
    add sp, $04
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld c, a
    ld a, d
    adc [hl]
    ld b, a
    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_71b2

jr_002_71b0:
    ld e, $0f

jr_002_71b2:
    bit 4, e
    jp z, Jump_002_73d0

    xor a
    ld hl, $d9a8
    sub [hl]
    ld [$d9a2], a
    sbc a
    ld hl, $d9a9
    sub [hl]
    ld [$d9a3], a
    jp Jump_002_73d0


Jump_002_71ca:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_725a

    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$10
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [$c0c2]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
    ld h, a
    add hl, de
    inc hl
    ld e, l
    srl h
    rr e
    srl h
    rr e
    srl h
    rr e
    ld a, c
    or a
    jr z, jr_002_7244

    ld a, e
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_7244

    ld d, $00
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    push de
    call Call_000_3569
    add sp, $04
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld c, a
    ld a, d
    adc [hl]
    ld b, a
    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_7246

jr_002_7244:
    ld e, $0f

jr_002_7246:
    bit 4, e
    jp z, Jump_002_73d0

    ld a, [$d9a8]
    ld [$d9a2], a
    ld a, [$d9a9]
    ld [$d9a3], a
    jp Jump_002_73d0


Jump_002_725a:
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_7316

    ld hl, $d99f
    ld [hl], $00
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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$11
    ld [hl], e
    ld a, [$c0c2]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c
    inc c

jr_002_72ab:
    ld hl, sp+$11
    ld a, [hl]
    sub c
    jp z, Jump_002_73d0

    ld hl, sp+$12
    ld a, [hl]
    dec a
    ld hl, sp+$0f
    ld [hl], a
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_7303

    ld hl, sp+$11
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_7303

    ld a, [_COLLISION_BANK]
    ld hl, sp+$10
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$11
    ld a, [hl]
    ld b, $00
    push bc
    push de
    ld e, a
    ld d, b
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$0f
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$10
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_7305

jr_002_7303:
    ld e, $0f

jr_002_7305:
    bit 3, e
    jr z, jr_002_7311

    ld hl, $d99f
    ld [hl], $01
    jp Jump_002_73d0


jr_002_7311:
    ld hl, sp+$11
    inc [hl]
    jr jr_002_72ab

Jump_002_7316:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_73d0

    ld hl, $d99f
    ld [hl], $00
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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$11
    ld [hl], e
    ld a, [$c0c2]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c
    inc c

jr_002_7367:
    ld hl, sp+$11
    ld a, [hl]
    sub c
    jr z, jr_002_73d0

    ld hl, sp+$12
    ld a, [hl]
    inc a
    ld hl, sp+$0f
    ld [hl], a
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_73be

    ld hl, sp+$11
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_73be

    ld a, [_COLLISION_BANK]
    ld hl, sp+$10
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$11
    ld a, [hl]
    ld b, $00
    push bc
    push de
    ld e, a
    ld d, b
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$0f
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$10
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_73c0

jr_002_73be:
    ld e, $0f

jr_002_73c0:
    bit 2, e
    jr z, jr_002_73cb

    ld hl, $d99f
    ld [hl], $01
    jr jr_002_73d0

jr_002_73cb:
    ld hl, sp+$11
    inc [hl]
    jr jr_002_7367

Jump_002_73d0:
jr_002_73d0:
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $d9a3
    ld e, [hl]
    ld a, e
    rlca
    sbc a
    ld d, a
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_002_7e1d


Jump_002_73ec:
    ld hl, sp+$12
    ld a, [hl-]
    and $20
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_7524

    ld de, $0000
    ld hl, $d9a4
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$10
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$12
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_749c

    ld a, [$d9a0]
    ld hl, $d9ae
    sub [hl]
    ld hl, $d9a0
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9af
    sbc [hl]
    ld [$d9a1], a
    ld de, $0000
    ld hl, $d9aa
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$12
    ld [hl-], a
    ld [hl], e
    ld de, $d9a0
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_744f

    bit 7, d
    jr nz, jr_002_7454

    cp a
    jr jr_002_7454

jr_002_744f:
    bit 7, d
    jr z, jr_002_7454

    scf

jr_002_7454:
    jr c, jr_002_748d

    ld hl, sp+$0f
    ld e, l
    ld d, h
    ld hl, $d9a0
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7470

    bit 7, d
    jr nz, jr_002_7475

    cp a
    jr jr_002_7475

jr_002_7470:
    bit 7, d
    jr z, jr_002_7475

    scf

jr_002_7475:
    jr nc, jr_002_7481

    ld hl, sp+$0f
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    jr jr_002_748d

jr_002_7481:
    ld a, [$d9a0]
    ld hl, sp+$11
    ld [hl], a
    ld a, [$d9a1]
    ld hl, sp+$12
    ld [hl], a

jr_002_748d:
    ld hl, sp+$11
    ld a, [hl]
    ld [$d9a0], a
    ld hl, sp+$12
    ld a, [hl]
    ld [$d9a1], a
    jp Jump_002_7697


Jump_002_749c:
    ld a, [$d9a0]
    ld hl, $d9ac
    sub [hl]
    ld hl, $d9a0
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9ad
    sbc [hl]
    ld [$d9a1], a
    ld de, $0000
    ld hl, $d9a6
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$12
    ld [hl-], a
    ld [hl], e
    ld de, $d9a0
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_74d7

    bit 7, d
    jr nz, jr_002_74dc

    cp a
    jr jr_002_74dc

jr_002_74d7:
    bit 7, d
    jr z, jr_002_74dc

    scf

jr_002_74dc:
    jr c, jr_002_7515

    ld hl, sp+$0f
    ld e, l
    ld d, h
    ld hl, $d9a0
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_74f8

    bit 7, d
    jr nz, jr_002_74fd

    cp a
    jr jr_002_74fd

jr_002_74f8:
    bit 7, d
    jr z, jr_002_74fd

    scf

jr_002_74fd:
    jr nc, jr_002_7509

    ld hl, sp+$0f
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    jr jr_002_7515

jr_002_7509:
    ld a, [$d9a0]
    ld hl, sp+$11
    ld [hl], a
    ld a, [$d9a1]
    ld hl, sp+$12
    ld [hl], a

jr_002_7515:
    ld hl, sp+$11
    ld a, [hl]
    ld [$d9a0], a
    ld hl, sp+$12
    ld a, [hl]
    ld [$d9a1], a
    jp Jump_002_7697


Jump_002_7524:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_761a

    ld a, [$d9a4]
    ld hl, sp+$0f
    ld [hl], a
    ld a, [$d9a5]
    ld hl, sp+$10
    ld [hl+], a
    inc hl
    ld a, [hl-]
    or [hl]
    jr z, jr_002_75ad

    ld a, [$d9a0]
    ld hl, $d9ae
    add [hl]
    ld hl, $d9a0
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9af
    adc [hl]
    ld [$d9a1], a
    ld de, $d9a0
    ld hl, $d9a4
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7568

    bit 7, d
    jr nz, jr_002_756d

    cp a
    jr jr_002_756d

jr_002_7568:
    bit 7, d
    jr z, jr_002_756d

    scf

jr_002_756d:
    jr nc, jr_002_7576

    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    jr jr_002_75a4

jr_002_7576:
    ld de, $d9aa
    ld hl, $d9a0
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_758f

    bit 7, d
    jr nz, jr_002_7594

    cp a
    jr jr_002_7594

jr_002_758f:
    bit 7, d
    jr z, jr_002_7594

    scf

jr_002_7594:
    jr nc, jr_002_759e

    ld hl, $d9aa
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    jr jr_002_75a4

jr_002_759e:
    ld hl, $d9a0
    ld a, [hl+]
    ld e, a
    ld a, [hl]

jr_002_75a4:
    ld hl, $d9a0
    ld [hl], e
    inc hl
    ld [hl], a
    jp Jump_002_7697


jr_002_75ad:
    ld a, [$d9a0]
    ld hl, $d9ac
    add [hl]
    ld hl, $d9a0
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9ad
    adc [hl]
    ld [$d9a1], a
    ld de, $d9a0
    ld hl, $d9a4
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_75d9

    bit 7, d
    jr nz, jr_002_75de

    cp a
    jr jr_002_75de

jr_002_75d9:
    bit 7, d
    jr z, jr_002_75de

    scf

jr_002_75de:
    jr nc, jr_002_75e6

    ld hl, sp+$0f
    ld a, [hl+]
    ld b, [hl]
    jr jr_002_7612

jr_002_75e6:
    ld de, $d9a6
    ld hl, $d9a0
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_75ff

    bit 7, d
    jr nz, jr_002_7604

    cp a
    jr jr_002_7604

jr_002_75ff:
    bit 7, d
    jr z, jr_002_7604

    scf

jr_002_7604:
    jr nc, jr_002_760d

    ld hl, $d9a6
    ld a, [hl+]
    ld b, [hl]
    jr jr_002_7612

jr_002_760d:
    ld hl, $d9a0
    ld a, [hl+]
    ld b, [hl]

jr_002_7612:
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], b
    jp Jump_002_7697


Jump_002_761a:
    ld a, [$d99e]
    or a
    jr z, jr_002_7697

    ld hl, $d9a1
    bit 7, [hl]
    jr z, jr_002_765d

    dec hl
    ld a, [hl]
    ld hl, $d9b0
    add [hl]
    ld hl, $d9a0
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9b1
    adc [hl]
    ld hl, $d9a1
    ld [hl-], a
    xor a
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    ld a, $00
    ld d, a
    bit 7, [hl]
    jr z, jr_002_764e

    bit 7, d
    jr nz, jr_002_7653

    cp a
    jr jr_002_7653

jr_002_764e:
    bit 7, d
    jr z, jr_002_7653

    scf

jr_002_7653:
    jr nc, jr_002_7697

    xor a
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], a
    jr jr_002_7697

jr_002_765d:
    ld hl, $d9a0
    xor a
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    ld a, $00
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7674

    bit 7, d
    jr nz, jr_002_7679

    cp a
    jr jr_002_7679

jr_002_7674:
    bit 7, d
    jr z, jr_002_7679

    scf

jr_002_7679:
    jr nc, jr_002_7697

    ld a, [$d9a0]
    ld hl, $d9b0
    sub [hl]
    ld hl, $d9a0
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9b1
    sbc [hl]
    ld hl, $d9a1
    ld [hl], a
    bit 7, [hl]
    jr z, jr_002_7697

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a

Jump_002_7697:
jr_002_7697:
    ld hl, sp+$0a
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_7781

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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$12
    ld [hl], c
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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c
    ld hl, sp+$12
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_773d

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_773d

    ld b, $00
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    push bc
    call Call_000_3569
    add sp, $04
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld c, a
    ld a, d
    adc [hl]
    ld b, a
    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_773f

jr_002_773d:
    ld e, $0f

jr_002_773f:
    bit 4, e
    jp z, Jump_002_7868

    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld bc, $0004
    add hl, bc
    ld c, l
    ld b, h
    ld a, [$c0bf]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
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
    ld hl, $d99f
    ld [hl], $01
    xor a
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], a
    jp Jump_002_7868


Jump_002_7781:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jp z, Jump_002_7868

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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$12
    ld [hl], c
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
    ld a, [$c0c2]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c
    inc c
    ld hl, sp+$12
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_7828

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_7828

    ld b, $00
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    push bc
    call Call_000_3569
    add sp, $04
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld c, a
    ld a, d
    adc [hl]
    ld b, a
    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_782a

jr_002_7828:
    ld e, $0f

jr_002_782a:
    bit 4, e
    jr z, jr_002_7868

    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld bc, $0004
    add hl, bc
    ld c, l
    ld b, h
    ld a, [$c0bf]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
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
    ld hl, $d99f
    ld [hl], $01
    xor a
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], a

Jump_002_7868:
jr_002_7868:
    ld a, [_FRAME_JOY]
    bit 4, a
    jr z, jr_002_788a

    ld hl, $d9a3
    bit 7, [hl]
    jr z, jr_002_788a

    dec hl
    ld a, [hl]
    ld hl, $d9b6
    add [hl]
    ld hl, $d9a2
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9b7
    adc [hl]
    ld [$d9a3], a
    jr jr_002_789d

jr_002_788a:
    ld a, [$d9a2]
    ld hl, $d9b4
    add [hl]
    ld hl, $d9a2
    ld [hl+], a
    ld a, [hl]
    ld hl, $d9b5
    adc [hl]
    ld [$d9a3], a

jr_002_789d:
    ld bc, $c0ba
    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$11
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [$c0c1]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, [hl]
    ld hl, sp+$10
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$11
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$12
    ld a, e
    ld [hl-], a
    ld a, [$c0c2]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld a, e
    inc a
    ld hl, sp+$0b
    ld [hl], a
    ld hl, $d9a1
    ld e, [hl]
    ld a, e
    rlca
    sbc a
    ld d, a
    ld hl, sp+$10
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $d9a0
    xor a
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    ld a, $00
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7933

    bit 7, d
    jr nz, jr_002_7938

    cp a
    jr jr_002_7938

jr_002_7933:
    bit 7, d
    jr z, jr_002_7938

    scf

jr_002_7938:
    jp nc, Jump_002_7a78

    ld hl, $c0bb
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld a, h
    ld hl, sp+$0c
    ld [hl], e
    inc hl
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$10
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$11
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$0e
    ld [hl], e

Jump_002_798b:
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$12
    sub [hl]
    jp z, Jump_002_7a3e

    ld hl, sp+$0e
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_79e4

    ld hl, sp+$12
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_79e4

    ld a, [_COLLISION_BANK]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$12
    ld a, [hl-]
    dec hl
    ld [hl+], a
    xor a
    ld [hl-], a
    push bc
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$0e
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0f
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_79e6

jr_002_79e4:
    ld e, $0f

jr_002_79e6:
    bit 2, e
    jr z, jr_002_7a38

    ld hl, sp+$0e
    ld a, [hl-]
    ld e, $00
    add a
    rl e
    add a
    rl e
    add a
    rl e
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, [$c0c0]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$12
    ld [hl-], a
    ld [hl], e
    ld a, $04

jr_002_7a16:
    ld hl, sp+$11
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_002_7a16

    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$0d
    ld [hl-], a
    ld [hl], e
    xor a
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], a
    jr jr_002_7a3e

jr_002_7a38:
    ld hl, sp+$12
    inc [hl]
    jp Jump_002_798b


Jump_002_7a3e:
jr_002_7a3e:
    ld hl, $c534
    ld a, [hl+]
    add $f0
    ld e, a
    ld a, [hl]
    adc $ff
    ld d, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, sp+$0c
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr c, jr_002_7a67

    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_002_7a67:
    ld hl, sp+$11
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld de, $c0ba
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jp Jump_002_7bc1


Jump_002_7a78:
    ld a, [$d9a1]
    bit 7, a
    jp z, Jump_002_7bc1

    ld hl, $c0bb
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld a, h
    ld hl, sp+$10
    ld [hl], e
    inc hl
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$11
    ld a, [hl-]
    dec hl
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
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld a, [$c0bf]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld hl, sp+$12
    ld d, [hl]

Jump_002_7ace:
    ld hl, sp+$0b
    ld a, [hl]
    sub d
    jp z, Jump_002_7ba6

    ld a, e
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_7b4e

    ld a, d
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_7b4e

    ld a, [_COLLISION_BANK]
    ld hl, sp+$12
    ld [hl], a
    ld a, [_image_tile_width]
    ld hl, sp+$0c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld [hl], $00
    push bc
    push de
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_3569
    add sp, $04
    ld hl, sp+$12
    ld a, e
    ld [hl+], a
    ld [hl], d
    pop de
    pop bc
    push de
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $c530
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    pop de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    push de
    ld d, $00
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    pop de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    push de
    ld hl, sp+$14
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call _ReadBankedUWORD
    add sp, $03
    ld l, e
    pop de
    jr jr_002_7b50

jr_002_7b4e:
    ld l, $0f

jr_002_7b50:
    bit 3, l
    jr z, jr_002_7ba2

    ld d, $00
    inc de
    ld a, d
    sla e
    adc a
    sla e
    adc a
    sla e
    adc a
    ld hl, sp+$0d
    ld [hl], e
    inc hl
    ld [hl+], a
    ld a, [$c0bf]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$12
    ld [hl-], a
    ld a, e
    ld [hl+], a
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    inc de
    ld a, e
    ld [hl+], a
    ld [hl], d
    xor a
    ld hl, $d9a0
    ld [hl+], a
    ld [hl], a
    jr jr_002_7ba6

jr_002_7ba2:
    inc d
    jp Jump_002_7ace


Jump_002_7ba6:
jr_002_7ba6:
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_002_7bb0

    xor a
    ld e, a
    jr jr_002_7bb4

jr_002_7bb0:
    ld hl, sp+$10
    ld a, [hl+]
    ld e, [hl]

jr_002_7bb4:
    ld hl, sp+$11
    ld [hl+], a
    ld a, e
    ld [hl-], a
    ld de, $c0ba
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

Jump_002_7bc1:
    ld hl, $d99e
    ld [hl], $00
    ld l, c
    ld h, b
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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$12
    ld [hl], e
    ld a, [$c0c0]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    inc a
    ld hl, sp+$0e
    ld [hl], a
    ld hl, $d9a3
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    ld hl, sp+$10
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $d9a2
    xor a
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    ld a, $00
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7c31

    bit 7, d
    jr nz, jr_002_7c36

    cp a
    jr jr_002_7c36

jr_002_7c31:
    bit 7, d
    jr z, jr_002_7c36

    scf

jr_002_7c36:
    jp nc, Jump_002_7d12

    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$10
    ld [hl], c
    inc hl
    ld [hl-], a
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
    ld a, [$c0c2]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c

Jump_002_7c74:
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$12
    sub [hl]
    jp z, Jump_002_7d04

    ld hl, sp+$12
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_7cc5

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_7cc5

    ld a, [_COLLISION_BANK]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld l, c
    ld h, $00
    push bc
    push de
    push hl
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$12
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0f
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    jr jr_002_7cc7

jr_002_7cc5:
    ld a, $0f

jr_002_7cc7:
    rrca
    jr nc, jr_002_7cfe

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0c2]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld de, $0001
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld hl, sp+$11
    ld [hl-], a
    ld [hl], e
    ld hl, $d99e
    ld [hl], $01
    xor a
    ld hl, $d9a2
    ld [hl+], a
    ld [hl], a
    jr jr_002_7d04

jr_002_7cfe:
    ld hl, sp+$12
    inc [hl]
    jp Jump_002_7c74


Jump_002_7d04:
jr_002_7d04:
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_002_7dec


Jump_002_7d12:
    ld a, [$d9a3]
    bit 7, a
    jp z, Jump_002_7dec

    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$0f
    ld [hl], c
    inc hl
    ld [hl-], a
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
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$11
    ld a, c
    ld [hl+], a
    ld c, [hl]

Jump_002_7d5b:
    ld hl, sp+$0e
    ld a, [hl]
    sub c
    jp z, Jump_002_7de1

    ld a, c
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_002_7dab

    ld hl, sp+$11
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_002_7dab

    ld a, [_COLLISION_BANK]
    ld hl, sp+$12
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$11
    ld a, [hl]
    ld b, $00
    push bc
    push de
    ld e, a
    ld d, b
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld l, c
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$12
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_002_7dad

jr_002_7dab:
    ld e, $0f

jr_002_7dad:
    bit 1, e
    jr z, jr_002_7ddd

    ld hl, sp+$11
    ld l, [hl]
    inc l
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0c1]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    inc hl
    ld c, l
    ld b, h
    ld hl, sp+$0f
    ld a, c
    ld [hl+], a
    ld [hl], b
    xor a
    ld hl, $d9a2
    ld [hl+], a
    ld [hl], a
    jr jr_002_7de1

jr_002_7ddd:
    inc c
    jp Jump_002_7d5b


Jump_002_7de1:
jr_002_7de1:
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_002_7dec:
    ld de, $d9a2
    ld hl, $d9b8
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7e05

    bit 7, d
    jr nz, jr_002_7e0a

    cp a
    jr jr_002_7e0a

jr_002_7e05:
    bit 7, d
    jr z, jr_002_7e0a

    scf

jr_002_7e0a:
    jr nc, jr_002_7e13

    ld hl, $d9a2
    ld a, [hl+]
    ld b, [hl]
    jr jr_002_7e18

jr_002_7e13:
    ld hl, $d9b8
    ld a, [hl+]
    ld b, [hl]

jr_002_7e18:
    ld hl, $d9a2
    ld [hl+], a
    ld [hl], b

Jump_002_7e1d:
    ld a, [_FRAME_JOY]
    rrca
    rrca
    and $01
    jr z, jr_002_7e2f

    ld a, [_LAST_JOY]
    rrca
    rrca
    and $01
    jr z, jr_002_7e32

jr_002_7e2f:
    xor a
    jr jr_002_7e34

jr_002_7e32:
    ld a, $01

jr_002_7e34:
    push af
    inc sp
    ld de, $c0ba
    push de
    ld de, $c0bf
    push de
    ld e, $06
    ld hl, $4d2e
    call RST_08
    add sp, $05
    ld a, e
    or a
    jp nz, Jump_002_7ffd

    ld hl, sp+$12
    ld [hl], $01
    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_002_7e71

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_002_7e71

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_002_7ed6

jr_002_7e71:
    ld a, [_FRAME_JOY]
    ld h, $00
    push af
    and $10
    ld c, a
    ld b, $00
    pop af
    and c
    ld l, a
    ld a, h
    and b
    or l
    jr z, jr_002_7ed6

    ld a, [_LAST_JOY]
    ld l, $00
    and c
    ld c, a
    ld a, l
    and b
    or c
    jr nz, jr_002_7ed6

    ld a, d
    or e
    jr nz, jr_002_7ea1

    ld hl, $0108
    push hl
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl

jr_002_7ea1:
    ld a, d
    or e
    jr z, jr_002_7ed6

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_002_7ed6

    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_002_7ed6

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld de, $0000
    push de
    ld h, $01
    push hl
    inc sp
    ld de, $0000
    push de
    push bc
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    ld hl, sp+$12
    ld [hl], $00

jr_002_7ed6:
    ld hl, _FRAME_JOY
    ld e, [hl]
    ld d, $00
    ld a, e
    and $10
    ld c, a
    ld b, $00
    ld a, e
    and c
    ld e, a
    ld a, d
    and b
    or e
    jr z, jr_002_7f17

    ld a, [_LAST_JOY]
    ld e, $00
    and c
    ld c, a
    ld a, e
    and b
    or c
    jr nz, jr_002_7f17

    ld a, [$d99e]
    or a
    jr z, jr_002_7f17

    ld hl, sp+$12
    ld a, [hl]
    or a
    jr z, jr_002_7f17

    xor a
    ld hl, $d9b2
    sub [hl]
    ld [$d9a2], a
    sbc a
    ld hl, $d9b3
    sub [hl]
    ld [$d9a3], a
    ld hl, $d99e
    ld [hl], $00

jr_002_7f17:
    ld a, [$d99f]
    or a
    jr z, jr_002_7f53

    ld hl, $c0c9
    ld [hl], $06
    ld a, [$c0d8]
    inc a
    ld hl, $c0d7
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ld hl, $d9a3
    ld a, [hl-]
    or [hl]
    jp nz, Jump_002_7ffd

    ld bc, $c0c4
    ld a, [bc]
    ld [$c0c5], a
    ld a, [bc]
    inc a
    ld [$c0c6], a
    jp Jump_002_7ffd


jr_002_7f53:
    ld a, [$d99e]
    or a
    jr z, jr_002_7fb6

    ld a, [$d9a1]
    bit 7, a
    jr z, jr_002_7f75

    ld hl, $0103
    push hl
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_dir
    call RST_08
    add sp, $04
    jp Jump_002_7ffd


jr_002_7f75:
    ld hl, $d9a0
    xor a
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    ld a, $00
    ld d, a
    bit 7, [hl]
    jr z, jr_002_7f8c

    bit 7, d
    jr nz, jr_002_7f91

    cp a
    jr jr_002_7f91

jr_002_7f8c:
    bit 7, d
    jr z, jr_002_7f91

    scf

jr_002_7f91:
    jr nc, jr_002_7fa7

    ld hl, $0101
    push hl
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_dir
    call RST_08
    add sp, $04
    jr jr_002_7ffd

jr_002_7fa7:
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl
    jr jr_002_7ffd

jr_002_7fb6:
    ld a, [$c0be]
    sub $03
    jr nz, jr_002_7fde

    ld hl, $c0c9
    ld [hl], $00
    ld a, [$c0cc]
    inc a
    ld hl, $c0cb
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    jr jr_002_7ffd

jr_002_7fde:
    ld hl, $c0c9
    ld [hl], $02
    ld a, [$c0d0]
    inc a
    ld hl, $c0cf
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04

Jump_002_7ffd:
jr_002_7ffd:
    add sp, $13
    ret
