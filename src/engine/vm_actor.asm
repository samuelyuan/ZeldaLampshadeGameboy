; Loaded in bank 2 0x4000

_vm_actor_move_to:
    add sp, -$1b
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$22
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld hl, sp+$23
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4042

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_4046

jr_002_4042:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4046:
    ld a, l
    ld c, h
    ld hl, sp+$19
    ld [hl+], a
    ld a, c
    ld [hl-], a
    ld bc, _ACTORS
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$04
    ld [hl], c
    inc hl
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0006
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0006
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$12
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$11
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$14
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$13
    ld [hl], a
    ld a, c
    or a
    jp nz, Jump_002_442a

    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld c, [hl]
    ld l, b
    ld h, c
    res 6, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_anim_moving
    call RST_08
    pop hl
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    and $f0
    ld c, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    and $f0
    ld c, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    bit 2, a
    jr z, jr_002_414e

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    or $03
    ld c, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld [hl], c

jr_002_414e:
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld e, [hl]
    inc hl
    ld d, [hl]
    push af
    ld a, [de]
    ld hl, sp+$1c
    ld [hl], a
    pop af
    rrca
    jr nc, jr_002_416f

    ld hl, sp+$1a
    ld c, [hl]
    set 0, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    jr jr_002_417a

jr_002_416f:
    ld hl, sp+$1a
    ld c, [hl]
    set 1, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c

jr_002_417a:
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    bit 1, c
    jp z, Jump_002_4343

    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld hl, sp+$00
    ld [hl], b
    inc hl
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$15
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$16
    ld [hl], a
    bit 0, c
    jp z, Jump_002_4272

    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld e, c
    ld d, b
    ld hl, sp+$00
    ld a, [hl]
    sub e
    jr nz, jr_002_41c8

    inc hl
    ld a, [hl]
    sub d
    jr z, jr_002_4203

jr_002_41c8:
    ld hl, sp+$00
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr nc, jr_002_41d6

    ld de, $0001
    jr jr_002_41d9

jr_002_41d6:
    ld de, $0002

jr_002_41d9:
    ld a, e
    push af
    inc sp
    push bc
    ld hl, sp+$11
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$1a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _check_collision_in_direction
    call RST_08
    add sp, $09
    ld c, e
    ld b, d
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_4203:
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$17
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$17
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    sub c
    jr nz, jr_002_422d

    inc hl
    ld a, [hl]
    sub b
    jp z, Jump_002_4343

jr_002_422d:
    ld hl, sp+$19
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr nc, jr_002_423a

    ld b, $03
    jr jr_002_423c

jr_002_423a:
    ld b, $04

jr_002_423c:
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    push bc
    inc sp
    ld hl, sp+$18
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld hl, sp+$11
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld hl, sp+$1e
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld b, a
    push bc
    ld e, $01
    ld hl, _check_collision_in_direction
    call RST_08
    add sp, $09
    ld c, e
    ld b, d
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_002_4343


Jump_002_4272:
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$17
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$19
    sub [hl]
    jr nz, jr_002_4294

    ld hl, sp+$16
    ld a, [hl]
    ld hl, sp+$1a
    sub [hl]
    jr z, jr_002_42d6

jr_002_4294:
    ld hl, sp+$19
    ld e, l
    ld d, h
    ld hl, sp+$15
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_002_42a6

    ld a, $03
    jr jr_002_42a8

jr_002_42a6:
    ld a, $04

jr_002_42a8:
    push af
    inc sp
    ld hl, sp+$18
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$11
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$1a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _check_collision_in_direction
    call RST_08
    add sp, $09
    ld c, e
    ld b, d
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_42d6:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$17
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$17
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    sub c
    jr nz, jr_002_42fe

    inc hl
    ld a, [hl]
    sub b
    jr z, jr_002_4343

jr_002_42fe:
    ld hl, sp+$19
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr nc, jr_002_430c

    ld bc, $0001
    jr jr_002_430f

jr_002_430c:
    ld bc, $0002

jr_002_430f:
    ld b, c
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    push bc
    inc sp
    ld hl, sp+$18
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld hl, sp+$11
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld b, a
    push bc
    ld hl, sp+$20
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _check_collision_in_direction
    call RST_08
    add sp, $09
    ld c, e
    ld b, d
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_002_4343:
jr_002_4343:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$15
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$18
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$19
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$1a
    ld [hl-], a
    dec hl
    ld a, [hl]
    sub c
    jr nz, jr_002_4377

    inc hl
    ld a, [hl]
    sub b
    jr z, jr_002_4384

jr_002_4377:
    ld hl, sp+$1a
    ld c, [hl]
    set 6, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    jr jr_002_438f

jr_002_4384:
    ld hl, sp+$1a
    ld c, [hl]
    set 1, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c

jr_002_438f:
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    inc hl
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$18
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$19
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$1a
    ld [hl-], a
    dec hl
    ld a, [hl]
    sub c
    jr nz, jr_002_43c3

    inc hl
    ld a, [hl]
    sub b
    jr z, jr_002_43d0

jr_002_43c3:
    ld hl, sp+$1a
    ld c, [hl]
    set 7, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    jr jr_002_43db

jr_002_43d0:
    ld hl, sp+$1a
    ld c, [hl]
    set 0, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c

jr_002_43db:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, l
    sub c
    ld a, h
    sbc b
    jr nc, jr_002_4402

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    set 2, c
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld [hl], c

jr_002_4402:
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, l
    sub c
    ld a, h
    sbc b
    jr nc, jr_002_442a

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    set 3, c
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld [hl], c

Jump_002_442a:
jr_002_442a:
    ld hl, sp+$04
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    rlca
    rlca
    jp nc, Jump_002_44dd

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$17
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld hl, sp+$17
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld b, a
    ld a, e
    and $80
    ld [hl+], a
    ld [hl], d
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_002_4479

    ld hl, sp+$17
    ld a, [hl]
    and $7f
    jr z, jr_002_4479

    ld hl, sp+$19
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0080
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_002_4485

jr_002_4479:
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$19
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_4485:
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$17
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld hl, sp+$17
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld b, a
    ld a, e
    and $80
    ld [hl+], a
    ld [hl], d
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_002_44c8

    ld hl, sp+$17
    ld a, [hl]
    and $7f
    jr z, jr_002_44c8

    ld hl, sp+$19
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0080
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_002_44d4

jr_002_44c8:
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$19
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_44d4:
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld c, [hl]
    ld l, b
    ld h, c
    res 6, [hl]

Jump_002_44dd:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$1a
    ld [hl], a
    and $41
    ld c, a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000f
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$16
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$15
    ld [hl], a
    ld a, c
    sub $41
    jp nz, Jump_002_46dc

    push hl
    ld hl, sp+$1c
    bit 2, [hl]
    pop hl
    ld a, $03
    jr nz, jr_002_450e

    ld a, $01

jr_002_450e:
    ld [$ca53], a
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl], a
    ld a, [$ca53]
    ld hl, sp+$17
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$17
    ld a, [hl+]
    ld [hl+], a
    ld e, c
    ld d, b
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$17
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld de, $19c4
    add hl, de
    ld a, [hl]
    push bc
    ld hl, sp+$18
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$19
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$19
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld de, _dir_lookup
    add hl, de
    inc hl
    ld a, [hl]
    push bc
    ld hl, sp+$18
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$19
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    bit 1, a
    jp z, Jump_002_4649

    xor a
    push af
    inc sp
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$13
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_overlapping_bb
    call RST_08
    add sp, $07
    ld a, d
    or e
    jp z, Jump_002_4649

    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$1a
    ld [hl], a
    ld a, [$ca53]
    add $02
    and $03
    ld hl, sp+$19
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$16
    ld [hl+], a
    ld e, c
    ld d, b
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld de, $19c4
    add hl, de
    ld a, [hl]
    push bc
    ld hl, sp+$1c
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$17
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$18
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$16
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld hl, $19c5
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    push bc
    ld hl, sp+$1c
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$18
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl
    jp Jump_002_499a


Jump_002_4649:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    bit 4, a
    jr nz, jr_002_4675

    ld c, a
    set 4, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld a, $01
    push af
    inc sp
    ld a, [$ca53]
    push af
    inc sp
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_dir
    call RST_08
    add sp, $04

jr_002_4675:
    ld a, [$ca53]
    sub $03
    jr nz, jr_002_4698

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, l
    ld d, h
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_002_46ba

jr_002_4698:
    ld a, [$ca53]
    dec a
    jr nz, jr_002_46dc

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, l
    ld d, h
    ld a, c
    sub e
    ld a, b
    sbc d
    jr c, jr_002_46dc

jr_002_46ba:
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    set 1, a
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    ld [hl], a
    and $be
    ld c, a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c

Jump_002_46dc:
jr_002_46dc:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    and $82
    sub $82
    jp nz, Jump_002_4960

    bit 3, c
    jr z, jr_002_46f3

    ld de, $0002
    jr jr_002_46f6

jr_002_46f3:
    ld de, $0000

jr_002_46f6:
    ld hl, $ca53
    ld [hl], e
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl], a
    ld a, [$ca53]
    ld hl, sp+$17
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$17
    ld a, [hl+]
    ld [hl+], a
    ld e, c
    ld d, b
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$17
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld de, $19c4
    add hl, de
    ld a, [hl]
    push bc
    ld hl, sp+$18
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$19
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$19
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld de, $19c4
    add hl, de
    inc hl
    ld a, [hl]
    push bc
    ld hl, sp+$18
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$19
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    bit 1, a
    jp z, Jump_002_48cb

    xor a
    push af
    inc sp
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$13
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_overlapping_bb
    call RST_08
    add sp, $07
    ld a, d
    or e
    jp z, Jump_002_48cb

    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$1a
    ld [hl], a
    ld a, [$ca53]
    add $02
    and $03
    ld c, a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$18
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$19
    ld [hl], a
    ld hl, sp+$11
    ld [hl], c
    ld hl, sp+$18
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$12
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$16
    ld a, c
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$17
    ld a, [hl-]
    dec hl
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $19c4
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$18
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$17
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$18
    ld a, [hl]
    push af
    inc sp
    call _muluschar
    pop hl
    ld hl, sp+$16
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$16
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$17
    ld a, [hl-]
    dec hl
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$12
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$18
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$17
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$16
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$18
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$17
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$14
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$18
    ld [hl+], a
    xor a
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $19c4
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$14
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$13
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$1a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$19
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl+], a
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call _muluschar
    pop hl
    ld hl, sp+$19
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$12
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$13
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1a
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    inc hl
    ld d, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl
    jp Jump_002_499a


Jump_002_48cb:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    bit 5, a
    jr nz, jr_002_48f7

    ld c, a
    set 5, c
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld a, $01
    push af
    inc sp
    ld a, [$ca53]
    push af
    inc sp
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_dir
    call RST_08
    add sp, $04

jr_002_48f7:
    ld a, [$ca53]
    sub $02
    jr nz, jr_002_491b

    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, l
    ld d, h
    ld a, e
    sub c
    ld a, d
    sbc b
    jr nc, jr_002_493e

jr_002_491b:
    ld a, [$ca53]
    or a
    jr nz, jr_002_4960

    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, l
    ld d, h
    ld a, c
    sub e
    ld a, b
    sbc d
    jr c, jr_002_4960

jr_002_493e:
    ld c, l
    ld b, h
    ld hl, sp+$12
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    set 0, a
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    ld [hl], a
    and $7d
    ld c, a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c

Jump_002_4960:
jr_002_4960:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    and $c0
    jr nz, jr_002_4982

    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl
    jr jr_002_499a

jr_002_4982:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    add $fd
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_002_499a:
jr_002_499a:
    add sp, $1b
    ret

_vm_actor_move_cancel:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_49b9

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_49bd

jr_002_49b9:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_49bd:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    set 6, [hl]
    ret

_vm_actor_activate:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_49ef

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_49f3

jr_002_49ef:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_49f3:
    ld e, l
    ld d, h
    ld bc, _ACTORS
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld e, l
    ld d, h
    ld a, c
    sub e
    jr nz, jr_002_4a16

    ld a, b
    sub d
    jr nz, jr_002_4a16

    ld a, e
    ld h, d
    ld l, a
    res 2, [hl]
    ret


jr_002_4a16:
    ld l, e
    ld h, d
    res 3, [hl]
    push de
    ld e, $01
    ld hl, _activate_actor
    call RST_08
    pop hl
    ret

_vm_actor_deactivate:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4a41

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4a45

jr_002_4a41:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4a45:
    ld e, l
    ld d, h
    ld bc, _ACTORS
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld e, l
    ld d, h
    ld a, c
    sub e
    jr nz, jr_002_4a67

    ld a, b
    sub d
    jr nz, jr_002_4a67

    ld a, [de]
    or $04
    ld [de], a
    ret


jr_002_4a67:
    ld l, e
    ld h, d
    set 3, [hl]
    push de
    ld e, $01
    ld hl, _deactivate_actor
    call RST_08
    pop hl
    ret

_vm_actor_terminate_update:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4a92

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4a96

jr_002_4a92:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4a96:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld bc, $002b
    add hl, bc
    ld a, [hl+]
    bit 7, [hl]
    ret nz

    push af
    inc sp
    ld e, $02
    ld hl, _script_terminate
    call RST_08
    inc sp
    ret

_vm_actor_set_dir:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4ad9

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4add

jr_002_4ad9:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4add:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld c, l
    ld b, h
    xor a
    push af
    inc sp
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_dir
    call RST_08
    add sp, $04
    ret

_vm_actor_set_anim:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_4b2c

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_4b30

jr_002_4b2c:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4b30:
    ld a, l
    ld c, h
    ld hl, sp+$02
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4b4e

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_002_4b53

jr_002_4b4e:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_002_4b53:
    ld l, c
    ld c, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0010
    add hl, de
    ld [hl], c
    ld hl, $0012
    add hl, de
    ld b, l
    sla c
    ld l, b
    ld b, $00
    add hl, bc
    ld c, l
    ld b, h
    inc bc
    ld a, [bc]
    inc a
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $08
    ret

_vm_actor_set_pos:
    add sp, -$06
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4bb1

    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4bb5

jr_002_4bb1:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4bb5:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld bc, _ACTORS
    pop de
    push de
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    pop hl
    push hl
    inc hl
    inc hl
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    pop de
    push de
    ld hl, $0004
    add hl, de
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $06
    ret

_vm_actor_get_pos:
    add sp, -$04
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4c2b

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4c2f

jr_002_4c2b:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4c2f:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld bc, _ACTORS
    pop de
    push de
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    pop bc
    push bc
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    inc hl
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    pop de
    push de
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    add sp, $04
    ret

_vm_actor_get_dir:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_4ca2

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_4ca6

jr_002_4ca2:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4ca6:
    ld e, l
    ld d, h
    ld bc, _ACTORS
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4cd9

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_4cdf

jr_002_4cd9:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_4cdf:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld e, a
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    add sp, $04
    ret

_vm_actor_get_angle:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_4d1c

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_4d20

jr_002_4d1c:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4d20:
    ld e, l
    ld d, h
    ld bc, _ACTORS
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4d53

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_4d59

jr_002_4d53:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_4d59:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld e, a
    ld hl, _dir_angle_lookup
    ld d, $00
    add hl, de
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    add sp, $04
    ret

_vm_actor_emote:
    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0012
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    or a
    jp nz, Jump_002_4e0b

    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0f
    bit 7, [hl]
    jr z, jr_002_4dbf

    ld hl, $0008
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld a, h
    jr jr_002_4dca

jr_002_4dbf:
    ld de, _SCRIPT_MEMORY
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld a, h

jr_002_4dca:
    ld hl, sp+$04
    ld [hl], e
    inc hl
    ld [hl], a
    pop hl
    push hl
    ld [hl], $01
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld e, l
    ld d, h
    ld hl, $c50b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $c50d
    ld [hl], $01
    push bc
    ld hl, sp+$12
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $03
    ld hl, _load_emote
    call RST_08
    add sp, $03
    pop bc

Jump_002_4e0b:
    ld a, [$c50d]
    sub $3c
    jr nz, jr_002_4e1e

    pop hl
    push hl
    ld [hl], $00
    xor a
    ld hl, $c50b
    ld [hl+], a
    ld [hl], a
    jr jr_002_4e38

jr_002_4e1e:
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ld hl, $c50d
    inc [hl]
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    add $fa
    ld e, a
    ld a, h
    adc $ff
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a

jr_002_4e38:
    add sp, $06
    ret

_vm_actor_set_bounds:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4e57

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4e5b

jr_002_4e57:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4e5b:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0006
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$0a
    ld a, [hl]
    ld [de], a
    ld hl, $0007
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [hl]
    ld [de], a
    ld hl, $0008
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$0c
    ld a, [hl]
    ld [de], a
    ld hl, $0009
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0d
    ld a, [hl]
    ld [bc], a
    ret

_vm_actor_set_spritesheet:
    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4eb7

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4ebb

jr_002_4eb7:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4ebb:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld c, l
    ld b, h
    ld hl, $000a
    add hl, bc
    ld a, [hl]
    push bc
    ld hl, sp+$0e
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$10
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    push af
    inc sp
    ld e, $03
    ld hl, _load_sprite
    call RST_08
    add sp, $04
    pop bc
    ld hl, $0022
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$0c
    ld a, [hl]
    ld [de], a
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $0012
    add hl, bc
    push bc
    push hl
    ld de, $0000
    push de
    ld hl, sp+$12
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_1524
    add sp, $07
    pop bc
    ld hl, $0006
    add hl, bc
    push bc
    push hl
    ld hl, sp+$10
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $03
    ld hl, _load_bounds
    call RST_08
    add sp, $05
    pop bc
    ld hl, $0012
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $0010
    add hl, bc
    ld a, [hl]
    add a
    ld l, a
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    inc de
    ld a, [de]
    inc a
    ld d, [hl]
    push af
    inc sp
    push de
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $06
    ret

_vm_actor_replace_tile:
    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4f86

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4f8a

jr_002_4f86:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4f8a:
    ld e, l
    ld d, h
    ld bc, _ACTORS
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    inc sp
    inc sp
    push bc
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    inc bc
    inc bc
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    pop de
    push de
    ld hl, $000a
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$0c
    add [hl]
    inc hl
    ld h, [hl]
    push hl
    inc sp
    push bc
    ld hl, sp+$14
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _SetBankedSpriteData
    add sp, $07
    ret

_vm_actor_set_anim_tick:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_4fee

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_4ff2

jr_002_4fee:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_4ff2:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld bc, $000e
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld a, [hl]
    ld [bc], a
    ret

_vm_actor_set_move_speed:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_502c

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_5030

jr_002_502c:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5030:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld bc, $000f
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld a, [hl]
    ld [bc], a
    ret

_vm_actor_set_anim_frame:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_506a

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_506e

jr_002_506a:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_506e:
    ld c, l
    ld b, h
    ld a, [bc]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    inc bc
    inc bc
    ld a, [bc]
    push af
    inc sp
    push hl
    ld e, $01
    ld hl, _actor_set_frame_offset
    call RST_08
    add sp, $03
    ret

_vm_actor_get_anim_frame:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_50ae

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_50b2

jr_002_50ae:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_50b2:
    ld c, l
    ld b, h
    ld a, [bc]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    inc bc
    inc bc
    push bc
    push hl
    ld e, $01
    ld hl, _actor_get_frame_offset
    call RST_08
    pop hl
    pop bc
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_actor_set_anim_set:
    add sp, -$03
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_50f9

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_50fd

jr_002_50f9:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_50fd:
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld de, _ACTORS
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0012
    add hl, bc
    inc sp
    inc sp
    push hl
    ld hl, $0022
    add hl, bc
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, $0023
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    push bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1524
    add sp, $07
    pop bc
    ld hl, $0012
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $0010
    add hl, bc
    ld a, [hl]
    add a
    ld l, a
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    inc de
    ld a, [de]
    inc a
    ld d, [hl]
    push af
    inc sp
    push de
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $07
    ret

_vm_actor_set_spritesheet_by_ref:
    add sp, -$05
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$0e
    bit 7, [hl]
    jr z, jr_002_518e

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5192

jr_002_518e:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5192:
    ld e, l
    ld d, h
    ld bc, _ACTORS
    ld a, [de]
    ld e, a
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_51c3

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_51c7

jr_002_51c3:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_51c7:
    ld a, [hl]
    push hl
    ld hl, sp+$06
    ld [hl], a
    pop hl
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000a
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    push bc
    ld hl, sp+$06
    ld h, [hl]
    push hl
    inc sp
    push bc
    push af
    inc sp
    ld e, $03
    ld hl, _load_sprite
    call RST_08
    add sp, $04
    pop bc
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0022
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$04
    ld a, [hl]
    ld [de], a
    ld l, e
    ld h, d
    inc hl
    ld a, c
    ld e, b
    ld [hl+], a
    ld [hl], e
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    ld e, l
    ld d, h
    push bc
    push de
    ld de, $0000
    push de
    ld hl, sp+$0a
    ld a, [hl]
    push af
    inc sp
    push bc
    call Call_000_1524
    add sp, $07
    pop bc
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0006
    add hl, de
    push hl
    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    push bc
    ld e, $03
    ld hl, _load_bounds
    call RST_08
    add sp, $05
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    add a
    ld l, a
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    inc bc
    ld a, [bc]
    inc a
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $09
    ret

_vm_actor_set_flags:
    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5294

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_5298

jr_002_5294:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5298:
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    ld a, l
    add $b9
    ld c, a
    ld a, h
    adc $c0
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0d
    ld c, [hl]
    bit 0, c
    jr z, jr_002_52c7

    pop de
    push de
    ld hl, sp+$0c
    ld a, [hl]
    and $01
    rlca
    and $02
    ld l, a
    ld a, [de]
    and $fd
    or l
    ld [de], a

jr_002_52c7:
    bit 1, c
    jr z, jr_002_52dd

    pop de
    push de
    ld hl, sp+$0c
    ld a, [hl]
    rrca
    and $01
    rlca
    rlca
    and $04
    ld l, a
    ld a, [de]
    and $fb
    or l
    ld [de], a

jr_002_52dd:
    bit 2, c
    jr z, jr_002_52f2

    pop de
    push de
    ld hl, sp+$0c
    ld a, [hl]
    rrca
    rrca
    swap a
    and $10
    ld l, a
    ld a, [de]
    and $ef
    or l
    ld [de], a

jr_002_52f2:
    bit 3, c
    jr z, jr_002_530b

    pop de
    push de
    ld hl, sp+$0c
    ld a, [hl]
    rrca
    rrca
    rrca
    and $01
    swap a
    rlca
    and $20
    ld l, a
    ld a, [de]
    and $df
    or l
    ld [de], a

jr_002_530b:
    bit 4, c
    jr z, jr_002_5321

    pop bc
    push bc
    ld hl, sp+$0c
    ld a, [hl]
    swap a
    and $01
    rrca
    and $80
    ld l, a
    ld a, [bc]
    and $7f
    or l
    ld [bc], a

jr_002_5321:
    inc sp
    inc sp
    ret