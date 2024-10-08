SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

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
    ld hl, $cb98
    add hl, bc

jr_002_4046:
    ld a, l
    ld c, h
    ld hl, sp+$19
    ld [hl+], a
    ld a, c
    ld [hl-], a
    ld bc, $c0b9
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
    ld hl, $4634
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
    ld hl, $4dca
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
    ld hl, $4dca
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
    ld hl, $4dca
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
    ld hl, $4dca
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
    call Call_000_3541
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
    call Call_000_3541
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
    ld hl, $4b20
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
    call Call_000_3541
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
    call Call_000_3541
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
    ld hl, $4606
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
    ld hl, $4665
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
    call Call_000_3541
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
    call Call_000_3541
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
    ld hl, $4b20
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
    call Call_000_3541
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
    call Call_000_3541
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
    ld hl, $4606
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
    ld hl, $4665
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
    ld hl, $4606
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
    ld hl, $cb98
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
    ld de, $c0b9
    add hl, de
    set 6, [hl]
    ret


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
    ld hl, $cb98
    add hl, bc

jr_002_49f3:
    ld e, l
    ld d, h
    ld bc, $c0b9
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
    ld hl, $41db
    call RST_08
    pop hl
    ret


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
    ld hl, $cb98
    add hl, bc

jr_002_4a45:
    ld e, l
    ld d, h
    ld bc, $c0b9
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
    ld hl, $406a
    call RST_08
    pop hl
    ret


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
    ld hl, $cb98
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
    ld de, $c0b9
    add hl, de
    ld bc, $002b
    add hl, bc
    ld a, [hl+]
    bit 7, [hl]
    ret nz

    push af
    inc sp
    ld e, $02
    ld hl, $6301
    call RST_08
    inc sp
    ret


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
    ld hl, $cb98
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
    ld de, $c0b9
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
    ld hl, $4665
    call RST_08
    add sp, $04
    ret


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
    ld hl, $cb98
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
    ld hl, $cb98
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
    ld de, $c0b9
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
    ld hl, $4562
    call RST_08
    add sp, $08
    ret


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
    ld hl, $cb98
    add hl, bc

jr_002_4bb5:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld bc, $c0b9
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
    ld hl, $cb98
    add hl, bc

jr_002_4c2f:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld bc, $c0b9
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
    ld hl, $cb98
    add hl, bc

jr_002_4ca6:
    ld e, l
    ld d, h
    ld bc, $c0b9
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
    ld hl, $cb98
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
    ld hl, $cb98
    add hl, bc

jr_002_4d20:
    ld e, l
    ld d, h
    ld bc, $c0b9
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
    ld hl, $cb98
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
    ld hl, $19cc
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
    ld de, $cb98
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
    ld de, $c0b9
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
    ld hl, $4bd2
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
    ld hl, $cb98
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
    ld de, $c0b9
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
    ld hl, $cb98
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
    ld de, $c0b9
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
    ld hl, $41ae
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
    ld hl, $420c
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
    ld hl, $4562
    call RST_08
    add sp, $06
    ret


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
    ld hl, $cb98
    add hl, bc

jr_002_4f8a:
    ld e, l
    ld d, h
    ld bc, $c0b9
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
    call Call_000_128c
    add sp, $07
    ret


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
    ld hl, $cb98
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
    ld de, $c0b9
    add hl, de
    ld bc, $000e
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld a, [hl]
    ld [bc], a
    ret


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
    ld hl, $cb98
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
    ld de, $c0b9
    add hl, de
    ld bc, $000f
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld a, [hl]
    ld [bc], a
    ret


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
    ld hl, $cb98
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
    ld de, $c0b9
    add hl, de
    inc bc
    inc bc
    ld a, [bc]
    push af
    inc sp
    push hl
    ld e, $01
    ld hl, $45b6
    call RST_08
    add sp, $03
    ret


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
    ld hl, $cb98
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
    ld de, $c0b9
    add hl, de
    inc bc
    inc bc
    push bc
    push hl
    ld e, $01
    ld hl, $45f3
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
    ld hl, $cb98
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
    ld de, $c0b9
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
    ld hl, $4562
    call RST_08
    add sp, $07
    ret


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
    ld hl, $cb98
    add hl, bc

jr_002_5192:
    ld e, l
    ld d, h
    ld bc, $c0b9
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
    ld hl, $cb98
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
    ld hl, $41ae
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
    ld hl, $420c
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
    ld hl, $4562
    call RST_08
    add sp, $09
    ret


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
    ld hl, $cb98
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


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc de
    inc de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld hl, sp+$0c
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    add sp, $04
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    dec bc
    dec bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_002_53c2

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_53c2:
    add sp, $04
    ret


    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $0002
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    inc bc
    inc bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop bc
    push bc
    inc bc
    inc bc
    ld a, [bc]
    ld hl, sp+$04
    ld [hl+], a
    xor a
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    pop de
    push de
    ld hl, sp+$0f
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    dec hl
    ld [de], a
    ld a, [hl]
    ld [bc], a
    add sp, $06
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    dec bc
    dec bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    inc de
    inc de
    ld a, [bc]
    ld [de], a
    dec bc
    dec bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_002_54ae

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_54ae:
    add sp, $04
    ret


    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld b, [hl]
    add $08
    ld c, a
    jr nc, jr_002_54bd

    inc b

jr_002_54bd:
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    push de
    inc de
    inc de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    pop de
    push de
    ld hl, sp+$0a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc sp
    inc sp
    ret


    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    inc sp
    inc sp
    push hl
    ld hl, sp+$0a
    ld a, [hl]
    or a
    jr z, jr_002_5507

    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld e, [hl]
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5507:
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    inc sp
    inc sp
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5552

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_555a

jr_002_5552:
    ld hl, $cb98
    add hl, bc
    ld e, l
    ld d, h
    ld c, e
    ld b, d

jr_002_555a:
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld l, [hl]
    or l
    jr z, jr_002_5579

    pop de
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    dec de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jr jr_002_55a0

jr_002_5579:
    ld hl, sp+$10
    ld a, [hl]
    or a
    jr z, jr_002_55a0

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$10
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_55a0:
    add sp, $04
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret


    add sp, -$06
    ld hl, sp+$0e
    ld a, [hl]
    or a
    jr z, jr_002_55ce

    dec hl
    dec hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0a3
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a

jr_002_55ce:
    ld a, [$c0a3]
    ld hl, sp+$00
    ld [hl], a
    ld a, [$c0a4]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld c, a
    ld h, [hl]
    ld l, c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop de
    push de
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld hl, sp+$05
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_002_5621

    dec hl
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld e, $00
    jr jr_002_5623

jr_002_5621:
    ld e, $01

jr_002_5623:
    add sp, $06
    ret


    add sp, -$0d
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$1a
    bit 7, [hl]
    jr z, jr_002_5665

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    jr jr_002_566b

jr_002_5665:
    ld hl, $cb98
    add hl, bc
    ld a, h
    ld c, l

jr_002_566b:
    ld hl, sp+$06
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0007
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$00
    ld a, [hl]
    sub c
    jr nz, jr_002_56c0

    inc hl
    ld a, [hl]
    sub b
    jr nz, jr_002_56c0

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$0c
    sub [hl]
    jr z, jr_002_56d5

jr_002_56c0:
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$15
    ld a, [hl]
    ld [de], a
    ld d, $01
    jr jr_002_56d7

jr_002_56d5:
    ld d, $00

jr_002_56d7:
    ld hl, $da07
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$15
    ld a, [hl]
    ld [$da09], a
    ld bc, $3623
    ld hl, sp+$13
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    push af
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    push hl
    push de
    inc sp
    ld d, a
    push de
    ld l, c
    ld h, b
    call Call_000_376c
    add sp, $05
    ld a, e
    or a
    jr z, jr_002_5737

    ld hl, sp+$18
    ld a, [hl]
    or a
    jr z, jr_002_5726

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$18
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5726:
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld [hl+], a
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    jr jr_002_574f

jr_002_5737:
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
    add $f9
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

jr_002_574f:
    add sp, $0d
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5786

    ld hl, $0008
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    jr jr_002_578c

jr_002_5786:
    ld de, $cb98
    pop hl
    push hl
    add hl, de

jr_002_578c:
    ld a, [hl+]
    ld h, [hl]
    xor a
    or h
    jr nz, jr_002_57a8

    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    add $fd
    ld e, a
    ld a, h
    adc $ff
    ld d, a
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $0010
    add hl, bc
    ld [hl], $01

jr_002_57a8:
    add sp, $04
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_57c7

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
    jr jr_002_57cb

jr_002_57c7:
    ld hl, $cb98
    add hl, bc

jr_002_57cb:
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, $6301
    call RST_08
    inc sp
    ret


    add sp, -$09
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$13
    bit 7, [hl]
    jr z, jr_002_581b

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_002_5828

jr_002_581b:
    ld hl, $cb98
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_002_5828:
    ld hl, sp+$14
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5845

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    jr jr_002_584c

jr_002_5845:
    ld hl, $cb98
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_584c:
    ld hl, sp+$06
    ld [hl], $00
    ld a, $06
    ld hl, sp+$11
    sub [hl]
    jp c, Jump_002_58e6

    ld hl, sp+$04
    ld a, [hl]
    sub c
    jr nz, jr_002_5865

    inc hl
    ld a, [hl]
    sub b
    ld a, $01
    jr z, jr_002_5866

jr_002_5865:
    xor a

jr_002_5866:
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_002_587c

    bit 7, d
    jr nz, jr_002_5881

    cp a
    jr jr_002_5881

jr_002_587c:
    bit 7, d
    jr z, jr_002_5881

    scf

jr_002_5881:
    ld a, $00
    rla
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$04
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_002_589b

    bit 7, d
    jr nz, jr_002_58a0

    cp a
    jr jr_002_58a0

jr_002_589b:
    bit 7, d
    jr z, jr_002_58a0

    scf

jr_002_58a0:
    ld a, $00
    rla
    ld c, a
    ld hl, sp+$11
    ld e, [hl]
    ld d, $00
    ld hl, $58af
    add hl, de
    add hl, de
    jp hl


    jr jr_002_58e6

    jr jr_002_58bd

    jr jr_002_58c3

    jr jr_002_58ca

    jr jr_002_58d2

    jr jr_002_58d7

    jr jr_002_58e0

jr_002_58bd:
    ld hl, sp+$07
    ld a, [hl-]
    ld [hl], a
    jr jr_002_58e6

jr_002_58c3:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    ld [hl], a
    jr jr_002_58e6

jr_002_58ca:
    ld a, c
    xor $01
    ld hl, sp+$06
    ld [hl], a
    jr jr_002_58e6

jr_002_58d2:
    ld hl, sp+$06
    ld [hl], c
    jr jr_002_58e6

jr_002_58d7:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    xor $01
    ld [hl], a
    jr jr_002_58e6

jr_002_58e0:
    ld hl, sp+$07
    ld a, [hl-]
    xor $01
    ld [hl], a

Jump_002_58e6:
jr_002_58e6:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_002_58f5

    pop de
    push de
    ld hl, sp+$16
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_58f5:
    ld hl, sp+$18
    ld a, [hl]
    or a
    jr z, jr_002_5919

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$18
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5919:
    add sp, $09
    ret


    add sp, -$07
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_002_5959

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    jr jr_002_5960

jr_002_5959:
    ld hl, $cb98
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_5960:
    ld hl, sp+$04
    ld [hl], $00
    ld a, $06
    ld hl, sp+$0f
    sub [hl]
    jp c, Jump_002_59fa

    ld hl, sp+$12
    ld a, [hl]
    sub c
    jr nz, jr_002_5979

    inc hl
    ld a, [hl]
    sub b
    ld a, $01
    jr z, jr_002_597a

jr_002_5979:
    xor a

jr_002_597a:
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$12
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_002_5991

    bit 7, d
    jr nz, jr_002_5996

    cp a
    jr jr_002_5996

jr_002_5991:
    bit 7, d
    jr z, jr_002_5996

    scf

jr_002_5996:
    ld a, $00
    rla
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_002_59af

    bit 7, d
    jr nz, jr_002_59b4

    cp a
    jr jr_002_59b4

jr_002_59af:
    bit 7, d
    jr z, jr_002_59b4

    scf

jr_002_59b4:
    ld a, $00
    rla
    ld c, a
    ld hl, sp+$0f
    ld e, [hl]
    ld d, $00
    ld hl, $59c3
    add hl, de
    add hl, de
    jp hl


    jr jr_002_59fa

    jr jr_002_59d1

    jr jr_002_59d7

    jr jr_002_59de

    jr jr_002_59e6

    jr jr_002_59eb

    jr jr_002_59f4

jr_002_59d1:
    ld hl, sp+$05
    ld a, [hl-]
    ld [hl], a
    jr jr_002_59fa

jr_002_59d7:
    ld hl, sp+$06
    ld a, [hl-]
    dec hl
    ld [hl], a
    jr jr_002_59fa

jr_002_59de:
    ld a, c
    xor $01
    ld hl, sp+$04
    ld [hl], a
    jr jr_002_59fa

jr_002_59e6:
    ld hl, sp+$04
    ld [hl], c
    jr jr_002_59fa

jr_002_59eb:
    ld hl, sp+$06
    ld a, [hl-]
    dec hl
    xor $01
    ld [hl], a
    jr jr_002_59fa

jr_002_59f4:
    ld hl, sp+$05
    ld a, [hl-]
    xor $01
    ld [hl], a

Jump_002_59fa:
jr_002_59fa:
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_002_5a09

    pop de
    push de
    ld hl, sp+$14
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_5a09:
    ld hl, sp+$16
    ld a, [hl]
    or a
    jr z, jr_002_5a2d

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$16
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5a2d:
    add sp, $07
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5a5e

    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_5a64

jr_002_5a5e:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5a64:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


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
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5ab1

    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_5ab7

jr_002_5ab1:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5ab7:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0c
    ld a, c
    ld [hl+], a
    ld [hl], b
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5ad3

    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_5ad9

jr_002_5ad3:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5ad9:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5b30

    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, c
    sub $98
    ld c, a
    ld a, b
    sbc $cb
    ld b, a
    srl b
    rr c
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, [hl]
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    jr jr_002_5b35

jr_002_5b30:
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_5b35:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld b, [hl]
    add $08
    ld c, a
    jr nc, jr_002_5b5a

    inc b

jr_002_5b5a:
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl]
    ld e, a
    rlca
    sbc a
    ld d, a
    sla e
    rl d
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    inc sp
    inc sp
    ret


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
    jr z, jr_002_5ba8

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5bb3

jr_002_5ba8:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5bb3:
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5bca

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5bce

jr_002_5bca:
    ld hl, $cb98
    add hl, bc

jr_002_5bce:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5bfa

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
    ld c, l
    ld b, h
    jr jr_002_5c00

jr_002_5bfa:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5c00:
    ld hl, sp+$0a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret


    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$0f
    bit 7, [hl]
    jr z, jr_002_5c49

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5c54

jr_002_5c49:
    ld hl, $cb98
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_002_5c54:
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5c6e

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5c87

jr_002_5c6e:
    pop de
    push de
    ld hl, $000a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
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

jr_002_5c87:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $06
    ret


    ld hl, sp+$08
    ld a, [hl]
    rrca
    jr nc, jr_002_5c9e

    call Call_000_0e35

jr_002_5c9e:
    ld b, b
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5cca

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
    ld c, l
    ld b, h
    jr jr_002_5cd0

jr_002_5cca:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5cd0:
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5cfd

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
    ld c, l
    ld b, h
    jr jr_002_5d03

jr_002_5cfd:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5d03:
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5d38

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    add c
    ld c, a
    ld a, l
    adc b
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5d43

jr_002_5d38:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5d43:
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    inc sp
    inc sp
    ret


    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5d73

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
    ld c, l
    ld b, h
    jr jr_002_5d79

jr_002_5d73:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5d79:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [bc]
    ld [de], a
    ret


    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5d9f

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
    ld c, l
    ld b, h
    jr jr_002_5da5

jr_002_5d9f:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5da5:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [bc]
    ld [de], a
    ret


    dec sp
    dec sp
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5dcd

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
    ld c, l
    ld b, h
    jr jr_002_5dd3

jr_002_5dcd:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld b, h

jr_002_5dd3:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    inc sp
    inc sp
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld [bc], a
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5e1e

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
    ld c, l
    jr jr_002_5e23

jr_002_5e1e:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_002_5e23:
    ld l, c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_34af
    pop hl
    ret


    add sp, -$04
    call Call_000_3484
    ld a, e
    ld hl, sp+$12
    and [hl]
    inc hl
    ld c, a
    ld a, d
    and [hl]
    ld b, a
    ld hl, sp+$10
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_002_5e50

    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld b, a
    ld c, e

jr_002_5e50:
    ld hl, sp+$10
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_002_5e65

    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld b, a
    ld c, e

jr_002_5e65:
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5e9a

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h
    jr jr_002_5ea2

jr_002_5e9a:
    ld de, $cb98
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h

jr_002_5ea2:
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    add sp, $04
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0011
    add hl, bc
    inc [hl]
    ld hl, $cb90
    inc [hl]
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0011
    add hl, bc
    ld a, [hl]
    or a
    ret z

    dec a
    ld [hl], a
    ld hl, $cb90
    dec [hl]
    ret


    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl]
    ld [$cb92], a
    ld hl, sp+$0b
    ld a, [hl]
    ld [$cb93], a
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    inc de
    inc de
    ld a, [de]
    ld [$cb94], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $cb95
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    push de
    ld hl, sp+$0b
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    inc sp
    inc sp
    ret


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
    jr z, jr_002_5f3c

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5f40

jr_002_5f3c:
    ld hl, $cb98
    add hl, bc

jr_002_5f40:
    ld a, [hl+]
    ld h, [hl]
    ld c, a
    ld b, h
    sla c
    rl b
    bit 7, h
    jr z, jr_002_5f5d

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5f68

jr_002_5f5d:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5f68:
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5f7f

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5f83

jr_002_5f7f:
    ld hl, $cb98
    add hl, bc

jr_002_5f83:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


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
    jr z, jr_002_5fbe

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5fc9

jr_002_5fbe:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5fc9:
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5fe0

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5fe4

jr_002_5fe0:
    ld hl, $cb98
    add hl, bc

jr_002_5fe4:
    ld a, [hl+]
    ld h, [hl]
    ld c, a
    ld b, h
    sla c
    rl b
    bit 7, h
    jr z, jr_002_5ffa

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5ffe

jr_002_5ffa:
    ld hl, $cb98
    add hl, bc

jr_002_5ffe:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_6028

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
    jr jr_002_602c

jr_002_6028:
    ld hl, $cb98
    add hl, bc

jr_002_602c:
    push hl
    ld a, [$cb91]
    pop hl
    ld c, $00
    ld [hl+], a
    ld [hl], c
    ld hl, $cb91
    ld [hl], $00
    ret


    dec sp
    dec sp
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_606a

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
    jr jr_002_606e

jr_002_606a:
    ld hl, $cb98
    add hl, bc

jr_002_606e:
    ld c, l
    ld b, h
    pop de
    push de
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    push bc
    call Call_000_37b0
    add sp, $08
    ret


    add sp, -$06
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_002_60c4

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    jr jr_002_60ca

jr_002_60c4:
    ld hl, $cb98
    add hl, bc
    ld a, h
    ld c, l

jr_002_60ca:
    ld hl, sp+$04
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
    jr z, jr_002_60ea

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_002_60ef

jr_002_60ea:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_002_60ef:
    ld b, h
    pop de
    push de
    push de
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    push bc
    call Call_000_376d
    add sp, $0c
    ret


    add sp, -$05
    ld hl, sp+$0b
    ld a, [hl]
    or a
    jr z, jr_002_612a

    ld de, $0e00
    push de
    ld de, $0000
    push de
    ld de, $cb98
    push de
    call Call_000_37b0
    add sp, $06
    ld de, $0130
    push de
    ld de, $0000
    push de
    ld de, $ca58
    push de
    call Call_000_37b0
    add sp, $06

jr_002_612a:
    ld bc, $d198
    ld hl, $cb8a
    ld a, $58
    ld [hl+], a
    ld [hl], $ca
    xor a
    ld hl, $cb88
    ld [hl+], a
    ld [hl], a
    ld de, $0000
    ld hl, sp+$02
    ld a, $75
    ld [hl+], a
    ld a, $cb
    ld [hl+], a
    ld [hl], $10

jr_002_6148:
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_002_619d

    dec hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    inc hl
    inc hl
    inc hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000a
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$04
    ld a, [hl]
    ld [de], a
    ld hl, $0080
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl-]
    dec hl
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0013
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$03
    ld [hl-], a
    ld a, e
    ld [hl+], a
    inc hl
    pop de
    push de
    dec [hl]
    jr jr_002_6148

jr_002_619d:
    ld hl, $cb90
    ld [hl], $00
    ld hl, $cb91
    ld [hl], $00
    xor a
    ld hl, $cb8c
    ld [hl+], a
    ld [hl], a
    ld a, [$cb88]
    ld [$cb8e], a
    ld a, [$cb89]
    ld [$cb8f], a
    add sp, $05
    ret


    add sp, -$09
    ld hl, $cb8b
    ld a, [hl-]
    or [hl]
    jr nz, jr_002_61cb

    ld de, $0000
    jp Jump_002_62fe


jr_002_61cb:
    ld hl, $cb8a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc sp
    inc sp
    push bc
    ld hl, $0003
    add hl, bc
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
    ld hl, $cb8a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld e, c
    ld d, b
    ld hl, sp+$10
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    dec hl
    ld [de], a
    ld e, c
    ld d, b
    inc de
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $0008
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, $000a
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$07
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$07
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $000d
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$12
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    or [hl]
    jr z, jr_002_6247

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, bc
    ld a, [hl]
    ld hl, sp+$07
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_6247:
    ld hl, $000f
    add hl, bc
    ld [hl], $00
    ld hl, $0011
    add hl, bc
    ld [hl], $00
    ld hl, $0012
    add hl, bc
    ld [hl], $00
    ld hl, $0007
    add hl, bc
    ld [hl], $00
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld [hl+], a
    ld [hl], a
    ld hl, $cb89
    ld a, [hl-]
    or [hl]
    jr z, jr_002_6293

    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_6271:
    inc bc
    inc bc
    inc bc
    ld hl, sp+$07
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    or c
    jr nz, jr_002_6271

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$00
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jr jr_002_6299

jr_002_6293:
    ld hl, $cb88
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_6299:
    ld hl, sp+$14
    ld a, [hl]
    or a
    jr z, jr_002_62fc

    ld hl, sp+$14
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld a, d
    ld [hl-], a
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
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a

jr_002_62be:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_002_62fc

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    inc bc
    inc bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    dec bc
    dec bc
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    dec [hl]
    jr jr_002_62be

jr_002_62fc:
    pop de
    push de

Jump_002_62fe:
    add sp, $09
    ret


    ld a, [$cb88]
    ld [$d998], a
    ld a, [$cb89]
    ld [$d999], a

jr_002_630d:
    ld hl, $d999
    ld a, [hl-]
    or [hl]
    jr z, jr_002_6364

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    ld e, [hl]
    ld hl, sp+$06
    ld a, [hl]
    sub e
    jr nz, jr_002_6355

    ld hl, $000d
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, b
    or c
    jr z, jr_002_6347

    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    set 7, d
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, $d998
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000d
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], a

jr_002_6347:
    ld hl, $d998
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000f
    add hl, bc
    ld [hl], $01
    ld e, [hl]
    ret


jr_002_6355:
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $d998
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_002_630d

jr_002_6364:
    ld e, $00
    ret


    ld a, [$cb88]
    ld [$d99a], a
    ld a, [$cb89]
    ld [$d99b], a

jr_002_6373:
    ld hl, $d99b
    ld a, [hl-]
    or [hl]
    jr z, jr_002_63a1

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    ld e, [hl]
    ld hl, sp+$06
    ld a, [hl]
    sub e
    jr nz, jr_002_6392

    ld hl, $000d
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], a
    ld e, $01
    ret


jr_002_6392:
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $d99a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_002_6373

jr_002_63a1:
    ld e, $00
    ret


    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld h, e
    or e
    nop
    inc b
    nop
    nop
    ld [bc], a
    add hl, bc
    ld h, h
    ld c, d
    ld b, b
    nop
    ld c, c
    daa
    ld l, l
    jr nz, @+$76

    ld [hl], d
    ld a, c
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_002_6435

    ld l, a
    jr nz, @+$69

    ld h, l
    ld [hl], h
    ld a, [bc]
    ld [hl], e
    ld l, a
    ld l, l
    ld h, l
    jr nz, @+$79

    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_002_6442

    ld [hl], l
    ld [hl], h
    jr nz, jr_002_6446

    ld h, [hl]
    ld a, [bc]
    ld [hl], h
    ld l, b
    ld h, l
    jr nz, jr_002_6455

    ld h, l
    ld l, h
    ld l, h
    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, l
    rst $38
    dec c
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld [hl], h
    ld l, a
    jr nz, jr_002_6470

    ld h, c
    ld l, e
    ld h, l
    jr nz, @+$77

    ld [hl], b
    jr nz, @+$4c

    ld d, h
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld h, d
    ld [hl], l
    ld [hl], h
    jr nz, jr_002_648e

    ld l, b
    ld h, l
    ld [hl], d
    ld h, l
    daa
    ld [hl], e
    jr nz, jr_002_6490

    ld l, a
    ld a, [bc]
    ld h, d
    ld [hl], l
    ld h, e
    ld l, e
    ld h, l
    ld [hl], h
    jr nz, jr_002_64a0

    ld l, a
    jr nz, jr_002_6497

    ld l, a
    ld l, h
    ld h, h
    jr nz, jr_002_649d

    ld [hl], h

jr_002_6435:
    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca

jr_002_6442:
    ld bc, $fe45
    ld [de], a

jr_002_6446:
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld h, h
    ld d, [hl]
    nop
    inc b
    nop
    nop
    ld bc, $6509

jr_002_6455:
    cp a
    ld b, b
    nop
    ld d, h
    ld l, b
    ld h, c
    ld [hl], h
    jr nz, jr_002_64d4

    ld h, c
    ld [hl], e
    ld h, l
    jr nz, jr_002_64da

    ld l, c
    ld l, h
    ld l, h
    ld a, [bc]
    ld [hl], a
    ld l, a
    ld [hl], d
    ld l, e
    jr nz, jr_002_64d6

    ld l, [hl]
    jr nz, jr_002_64e4

jr_002_6470:
    ld l, b
    ld h, l
    jr nz, jr_002_64eb

    ld h, l
    ld l, h
    ld l, h
    ld hl, $4700
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, l
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $fe45
    ld [de], a
    nop

jr_002_648e:
    ld b, h
    inc bc

jr_002_6490:
    ld bc, $0014
    ld e, $ff
    db $fc
    dec c

jr_002_6497:
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a

jr_002_649d:
    ld b, b
    nop
    ld d, h

jr_002_64a0:
    ld l, b
    ld h, l
    ld [hl], d
    ld h, l
    jr nz, jr_002_651d

    ld h, c
    ld [hl], e
    jr nz, jr_002_650b

    jr nz, @+$68

    ld [hl], d
    ld l, a
    ld h, a
    ld a, [bc]
    ld l, c
    ld l, [hl]
    jr nz, jr_002_6528

    ld l, b
    ld h, l
    jr nz, jr_002_652f

    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], d
    inc l
    nop
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, l
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld a, c
    ld l, a
    ld [hl], l

jr_002_64d4:
    jr nz, jr_002_6539

jr_002_64d6:
    ld h, c
    ld l, [hl]
    jr nz, jr_002_6542

jr_002_64da:
    ld h, c
    db $76
    ld h, l
    jr nz, jr_002_6548

    ld [hl], h
    ld l, $00
    ld b, a
    inc bc

jr_002_64e4:
    ld bc, $1404
    nop
    nop
    ld b, c
    rst $38

jr_002_64eb:
    nop
    ld b, h
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $0014
    dec b
    nop
    nop
    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld b, b
    nop
    ld e, c

jr_002_650b:
    ld l, a
    ld [hl], l
    jr nz, jr_002_6576

    ld l, a
    ld [hl], h
    jr nz, jr_002_6587

    ld l, b
    ld h, l
    ld a, [bc]
    ld b, [hl]
    ld [hl], d
    ld l, a
    ld h, a
    jr nz, @+$71

    ld h, [hl]

jr_002_651d:
    jr nz, @+$4e

    ld h, l
    ld h, a
    ld h, l
    ld l, [hl]
    ld h, h
    ld hl, $4700
    inc bc

jr_002_6528:
    ld bc, $1404
    nop
    nop
    ld b, l
    rst $38

jr_002_652f:
    ld c, $00
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040

jr_002_6539:
    ld d, h
    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_002_65a5

    ld [hl], d
    ld l, a
    ld h, a

jr_002_6542:
    jr nz, jr_002_65ac

    ld h, c
    ld [hl], e
    jr nz, jr_002_65a9

jr_002_6548:
    ld a, [bc]
    ld [hl], a
    ld l, a
    ld [hl], d
    ld l, h
    ld h, h
    dec l
    ld [hl], a
    ld l, c
    ld h, h
    ld h, l
    jr nz, jr_002_65bb

    ld h, c
    ld l, [hl]
    ld h, d
    ld h, c
    ld [hl], e
    ld h, l
    inc l
    nop
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld h, c
    ld [hl], e
    jr nz, jr_002_65e7

    ld h, l
    ld l, h
    ld l, h
    jr nz, jr_002_65d6

    ld [hl], e

jr_002_6576:
    jr nz, jr_002_65da

    ld h, l
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]
    ld [hl], c
    ld [hl], l
    ld l, c
    ld [hl], h
    ld h, l
    jr nz, jr_002_65f8

    ld h, c
    ld [hl], e
    ld [hl], h

jr_002_6587:
    ld a, c
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $0014
    inc b
    rst $38
    db $fc

jr_002_65a5:
    inc d
    nop
    nop
    rst $38

jr_002_65a9:
    db $fd
    inc d
    inc b

jr_002_65ac:
    add b
    rst $38
    cp $14
    nop
    ld bc, $ffff
    jr nc, @+$01

    db $fc
    inc d
    nop
    inc b
    rst $38

jr_002_65bb:
    db $fc
    inc sp
    rst $38
    db $fc
    nop
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de

jr_002_65d6:
    ret nc

    add hl, de
    ret nc

    add hl, de

jr_002_65da:
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ld [$102d], sp
    nop
    ld e, d
    nop
    nop

jr_002_65e7:
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop

jr_002_65f8:
    nop
    dec hl
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    ld a, [hl+]
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    dec hl
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    dec hl
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop
    add hl, hl
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop
    jr z, jr_002_6683

    nop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop

jr_002_6683:
    dec e
    stop
    ld e, d
    nop
    nop
    add hl, hl
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_66a4

jr_002_66a4:
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_66aa

jr_002_66aa:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_66b6

jr_002_66b6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_66e0

jr_002_66e0:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    jr jr_002_670b

    nop
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_66f2

jr_002_66f2:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    inc c
    jr nz, jr_002_66fe

jr_002_66fe:
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_002_6704

jr_002_6704:
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_002_670a

jr_002_670a:
    ld e, d

jr_002_670b:
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_6716

jr_002_6716:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_6740

jr_002_6740:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    jr jr_002_676b

    nop
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_6752

jr_002_6752:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    inc c
    jr nz, jr_002_675e

jr_002_675e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d

jr_002_676b:
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, hl
    stop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    inc e
    stop
    ld e, d
    nop
    nop
    jr z, jr_002_684b

    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop

jr_002_684b:
    inc e
    stop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    inc e
    stop
    ld e, d
    nop
    nop
    jr z, jr_002_687b

    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop

jr_002_687b:
    inc e
    stop
    ld e, d
    nop
    nop
    jr z, jr_002_6893

    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop

jr_002_6893:
    ld a, [de]
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop
    ld a, [de]
    stop
    ld e, d
    nop
    nop
    dec h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop
    ld a, [de]
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec e
    stop
    ld e, d
    nop
    nop
    ld a, [de]
    stop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_002_68e4

jr_002_68e4:
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_002_68ea

jr_002_68ea:
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_68f0

jr_002_68f0:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_691a

jr_002_691a:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_6926

jr_002_6926:
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_692c

jr_002_692c:
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_6932

jr_002_6932:
    ld e, d
    nop
    nop
    inc c
    jr nz, jr_002_6938

jr_002_6938:
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_002_693e

jr_002_693e:
    ld e, d
    nop
    nop
    dec b
    jr nz, jr_002_6944

jr_002_6944:
    ld e, d
    nop
    nop
    dec b
    jr nz, jr_002_694a

jr_002_694a:
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_002_6950

jr_002_6950:
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec c
    jr nz, jr_002_697a

jr_002_697a:
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    dec c
    jr nz, jr_002_6986

jr_002_6986:
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_698c

jr_002_698c:
    ld e, d
    nop
    nop
    dec c
    jr nz, jr_002_6992

jr_002_6992:
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_6998

jr_002_6998:
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_002_699e

jr_002_699e:
    ld e, d
    nop
    nop
    dec l
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    dec hl
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    ld a, [hl+]
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    dec hl
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    ld l, $10
    nop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec l
    stop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    inc l
    stop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    dec l
    stop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_6a64

jr_002_6a64:
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_6a6a

jr_002_6a6a:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_6a76

jr_002_6a76:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_6aa0

jr_002_6aa0:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    jr jr_002_6acb

    nop
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_6ab2

jr_002_6ab2:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    inc c
    jr nz, jr_002_6abe

jr_002_6abe:
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_002_6ac4

jr_002_6ac4:
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_002_6aca

jr_002_6aca:
    ld e, d

jr_002_6acb:
    nop
    nop
    inc c
    jr nz, jr_002_6ad0

jr_002_6ad0:
    ld e, d
    nop
    nop
    jr jr_002_6af5

    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d

jr_002_6af5:
    nop
    nop
    dec d
    jr nz, jr_002_6afa

jr_002_6afa:
    ld e, d
    nop
    nop
    jr jr_002_6b1f

    nop
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_6b06

jr_002_6b06:
    ld e, d
    nop
    nop
    dec de
    jr nz, jr_002_6b0c

jr_002_6b0c:
    ld e, d
    nop
    nop
    ld a, [de]
    jr nz, jr_002_6b12

jr_002_6b12:
    ld e, d
    nop
    nop
    jr jr_002_6b37

    nop
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_6b1e

jr_002_6b1e:
    ld e, d

jr_002_6b1f:
    nop
    nop
    jr nc, jr_002_6b33

    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop

jr_002_6b33:
    rra
    stop
    ld e, d

jr_002_6b37:
    nop
    nop
    ld l, $10
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    dec l
    stop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    ld l, $10
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    dec l
    stop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    inc e
    stop
    ld e, d
    nop
    nop
    dec hl
    stop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    inc e
    stop
    ld e, d
    nop
    nop
    add hl, hl
    stop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    inc e
    stop
    ld e, d
    nop
    nop
    jr z, jr_002_6bdb

    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop

jr_002_6bdb:
    inc e
    stop
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_6be4

jr_002_6be4:
    ld e, d
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_6bea

jr_002_6bea:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    ld d, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_6c1a

jr_002_6c1a:
    ld e, d
    nop
    nop
    ld d, $20
    nop
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_002_6c26

jr_002_6c26:
    ld e, d
    nop
    nop
    jr jr_002_6c4b

    nop
    ld e, d
    nop
    nop
    ld d, $20
    nop
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_6c38

jr_002_6c38:
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_6c3e

jr_002_6c3e:
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_002_6c44

jr_002_6c44:
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_002_6c4a

jr_002_6c4a:
    ld e, d

jr_002_6c4b:
    nop
    nop
    ld a, [bc]
    jr nz, jr_002_6c50

jr_002_6c50:
    ld e, d
    nop
    nop
    ld de, $0020
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_6c7a

jr_002_6c7a:
    ld e, d
    nop
    nop
    ld de, $0020

jr_002_6c80:
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_6c86

jr_002_6c86:
    ld e, d
    nop
    nop
    inc de
    jr nz, jr_002_6c8c

jr_002_6c8c:
    ld e, d
    nop
    nop
    db $10
    jr nz, jr_002_6c92

jr_002_6c92:
    ld e, d
    nop
    nop
    inc c
    jr nz, jr_002_6c98

jr_002_6c98:
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_002_6c9e

jr_002_6c9e:
    ld e, d
    nop
    nop
    pop hl
    ld h, l
    ld hl, $a168
    ld l, c
    ld hl, $a16b
    ld h, [hl]
    pop hl
    ld l, b
    ld h, c
    ld l, d
    pop hl
    ld l, e
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    ld h, c
    ld h, a
    nop
    add b
    or l
    add b
    nop
    add b
    sub l
    add b
    nop
    nop
    add hl, bc
    ret nz

    nop
    jr nc, jr_002_6c80

    ret nz

    nop
    ld [hl], b
    or b
    ret nz

    nop
    or b
    or b
    ret nz

    nop
    nop
    or b
    add b
    nop
    ld b, b
    or b
    add b
    nop
    add b
    or b
    add b
    nop
    ret nz

    or b
    add b
    inc e
    add b
    or d
    ret nz

    add hl, de
    add b
    or l
    add b
    ld b, a
    nop
    or a
    add b
    dec d
    ld h, b
    or a
    ret nz

    nop
    add b
    nop
    add b
    add b
    jr nz, jr_002_6d01

    ret nz

jr_002_6d01:
    add b
    jr nz, jr_002_6d06

    ret nz

    add b

jr_002_6d06:
    jr nz, @+$05

    ret nz

    add b
    jr nz, jr_002_6d10

    ret nz

    add b
    jr nz, jr_002_6d15

jr_002_6d10:
    ret nz

    add b
    jr nz, jr_002_6d1a

    ret nz

jr_002_6d15:
    nop
    jr nz, @+$09

    add b
    nop

jr_002_6d1a:
    jr nz, jr_002_6d24

    add b
    nop
    jr nz, jr_002_6d29

    add b
    nop
    jr nz, jr_002_6d2e

jr_002_6d24:
    add b
    nop
    jr nz, @+$0d

    add b

jr_002_6d29:
    nop
    jr nz, jr_002_6d38

    add b
    nop

jr_002_6d2e:
    jr nz, jr_002_6d3d

    add b
    nop
    jr nz, jr_002_6d42

    add b
    nop
    jr nz, jr_002_6d47

jr_002_6d38:
    add b
    sub c
    ld [hl], b
    jr nz, jr_002_6d5d

jr_002_6d3d:
    jr nz, jr_002_6d5f

    jr nz, jr_002_6d61

    sub c

jr_002_6d42:
    ld h, b
    rra
    rra
    rra
    rra

jr_002_6d47:
    rra
    rra
    sub c
    nop
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    sub d
    nop
    jr nz, jr_002_6d75

    jr nz, jr_002_6d77

    jr nz, jr_002_6d79

    sub h
    nop
    jr jr_002_6d75

jr_002_6d5d:
    jr jr_002_6d77

jr_002_6d5f:
    jr jr_002_6d79

jr_002_6d61:
    sub h
    nop
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    or c
    nop
    jr jr_002_6d85

    jr jr_002_6d87

    jr jr_002_6d89

    or c
    add b
    jr jr_002_6d8d

jr_002_6d75:
    jr jr_002_6d8f

jr_002_6d77:
    jr jr_002_6d91

jr_002_6d79:
    or c
    add b
    db $10
    rrca
    rrca
    rrca
    rrca
    rrca
    sub c
    add b
    jr nz, @+$22

jr_002_6d85:
    jr nz, jr_002_6da7

jr_002_6d87:
    jr nz, jr_002_6da9

jr_002_6d89:
    or d
    ld b, b
    db $10
    rrca

jr_002_6d8d:
    rrca
    rrca

jr_002_6d8f:
    rrca
    rrca

jr_002_6d91:
    or c
    ld d, [hl]
    dec de
    ld c, $11
    cp $00
    nop
    or a
    nop
    dec c
    dec bc
    add hl, bc
    rlca
    rlca
    rlca
    or a
    add b
    ld [$0607], sp
    dec b

jr_002_6da7:
    inc b
    inc b

jr_002_6da9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, $cccc
    call z, $cccc
    call z, $33cc
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    rst $38
    rst $38
    call z, $ffcc
    rst $38
    call z, Call_000_00cc
    nop
    inc sp
    inc sp
    nop
    nop
    inc sp
    inc sp
    cp $dc
    cp d
    sbc b
    db $76
    ld d, h
    ld [hl-], a
    db $10
    ld bc, $4523
    ld h, a
    adc c
    xor e
    call $ffef
    rst $38
    cp d
    sbc b
    xor c
    add a
    ld [hl-], a
    db $10
    inc [hl]
    ld d, [hl]
    ld b, l
    ld h, a
    cp h
    sbc $cd
    rst $28
    rst $38
    xor $dd
    call z, $aabb
    sbc c
    adc b
    ld [hl], a
    ld h, [hl]
    ld d, l
    ld b, h
    inc sp
    ld [hl+], a
    ld de, $ff00
    cp $fd
    db $fc
    ei
    ld a, [$f8f9]
    rst $20
    sub $c5
    or h
    and e
    sub d
    add c
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $e0
    ld h, l
    and c
    ld l, h
    xor c
    ld l, h
    or c
    ld l, h
    cp c
    ld l, h
    pop bc
    ld l, h
    db $fd
    ld l, h
    add hl, sp
    ld l, l
    ret nz

    ld h, l
    or c
    ld l, l
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

    ld bc, $c0b9
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_6f8b

    ld a, e
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_6f8b

    ld a, [$c52f]
    ld hl, sp+$06
    ld [hl], a
    ld hl, $c532
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
    call Call_000_1307
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl

jr_002_7061:
    ld hl, $c51e
    ld [hl], $00
    ld hl, $c51f
    ld [hl], $00
    ld hl, $c520
    ld [hl], $04
    ld hl, $c521
    ld [hl], $10
    ld hl, $da1f
    ld [hl], $00
    add sp, $07
    ret


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
    ld a, [$c61b]
    ld hl, sp+$12
    ld [hl], a
    ld a, [$c52f]
    ld hl, sp+$04
    ld [hl], a
    ld a, [$c532]
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
    ld hl, $c532
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
    ld hl, $c533
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
    call Call_000_1307
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
    ld hl, $c533
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_7303

    ld hl, sp+$11
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_7303

    ld a, [$c52f]
    ld hl, sp+$10
    ld [hl], a
    ld hl, $c532
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_73be

    ld hl, sp+$11
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_73be

    ld a, [$c52f]
    ld hl, sp+$10
    ld [hl], a
    ld hl, $c532
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_773d

    ld a, c
    ld hl, $c533
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_7828

    ld a, c
    ld hl, $c533
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
    call Call_000_1307
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
    ld a, [$c61b]
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_79e4

    ld hl, sp+$12
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_79e4

    ld a, [$c52f]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, $c532
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_7b4e

    ld a, d
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_7b4e

    ld a, [$c52f]
    ld hl, sp+$12
    ld [hl], a
    ld a, [$c532]
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_7cc5

    ld a, c
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_7cc5

    ld a, [$c52f]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, $c532
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
    call Call_000_1307
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
    ld hl, $c532
    sub [hl]
    jr nc, jr_002_7dab

    ld hl, sp+$11
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_002_7dab

    ld a, [$c52f]
    ld hl, sp+$12
    ld [hl], a
    ld hl, $c532
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
    call Call_000_1307
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
    ld a, [$c61b]
    rrca
    rrca
    and $01
    jr z, jr_002_7e2f

    ld a, [$c61c]
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
    ld a, [$c61b]
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

    ld a, [$c61c]
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
    ld hl, $61bc
    call RST_08
    add sp, $08
    ld hl, sp+$12
    ld [hl], $00

jr_002_7ed6:
    ld hl, $c61b
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

    ld a, [$c61c]
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04
    jr jr_002_7ffd

jr_002_7fa7:
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4606
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
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
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
    call RST_08
    add sp, $04

Jump_002_7ffd:
jr_002_7ffd:
    add sp, $13
    ret

