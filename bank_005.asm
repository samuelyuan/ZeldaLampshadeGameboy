SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_005_401d

    ld c, $00

jr_005_4008:
    ld a, c
    sub $08
    ret nc

    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, $c5c0
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    inc c
    jr jr_005_4008

jr_005_401d:
    ld de, $0008
    push de
    ld de, $0000
    push de
    ld de, $c5e8
    push de
    call Call_000_37b0
    add sp, $06
    ld de, $0028
    push de
    ld de, $0000
    push de
    ld de, $c5c0
    push de
    call Call_000_37b0
    add sp, $06
    ret


    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_005_405d

    ld c, $00

jr_005_4048:
    ld a, c
    sub $04
    ret z

    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, $c5f0
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    inc c
    jr jr_005_4048

jr_005_405d:
    ld de, $0008
    push de
    ld de, $0000
    push de
    ld de, $c604
    push de
    call Call_000_37b0
    add sp, $06
    ld de, $0014
    push de
    ld de, $0000
    push de
    ld de, $c5f0
    push de
    call Call_000_37b0
    add sp, $06
    ret


    xor a
    ld hl, $c7d8
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c7da
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c7dc
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c7de
    ld [hl+], a
    ld [hl], a
    ld hl, $c7e0
    ld [hl], $00
    ld hl, $c7e1
    ld [hl], $00
    ld e, $05
    ld hl, $40aa
    jp RST_08


    ld hl, $c7e7
    ld [hl], $00
    ld hl, $c7e4
    ld [hl], $00
    ld hl, $c7d4
    ld a, $ff
    ld [hl+], a
    ld [hl], $7f
    ld hl, $c7d6
    ld a, $ff
    ld [hl+], a
    ld [hl], $7f
    ld hl, $da1f
    ld [hl], $00
    ret


    dec sp
    dec sp
    ld hl, $c51a
    ld a, [hl+]
    add $b0
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    ld hl, $c51c
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
    ld de, $c7dc
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    pop de
    jr nc, jr_005_4103

    ld hl, $c7dc
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
    ld de, $c7de
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    pop de
    jr nc, jr_005_4124

    ld hl, $c7de
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_005_4124:
    ld a, [$c7d4]
    ld [$c7ec], a
    ld a, [$c7d5]
    ld hl, $c7ed
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
    ld a, [$c7d6]
    ld [$c7e8], a
    ld a, [$c7d7]
    ld hl, $c7e9
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
    ld hl, $c7ee
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
    ld hl, $c7ea
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
    ld hl, $c7d4
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c7d6
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [$c7e0]
    ld hl, sp+$00
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    pop hl
    push hl
    add hl, bc
    ld a, l
    ld [$c7d8], a
    ld a, h
    ld [$c7d9], a
    ld a, [$c7e1]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, c
    add e
    ld hl, $c7da
    ld [hl+], a
    ld a, b
    adc d
    ld [hl], a
    ld de, $c68b
    push de
    call Call_005_41e1
    pop hl
    ld a, e
    or a
    jr nz, jr_005_41de

    ld de, $c691
    push de
    call Call_005_41e1
    pop hl
    ld a, e
    or a
    jr nz, jr_005_41de

    ld de, $c697
    push de
    call Call_005_41e1
    pop hl

jr_005_41de:
    inc sp
    inc sp
    ret


Call_005_41e1:
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
    ld hl, $c7d8
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
    ld hl, $c7d8
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
    ld hl, $c7ee
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
    ld hl, $c7ec
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
    ld hl, $c7ee
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
    ld a, [$c7ec]
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
    ld a, [$c7ec]
    ld hl, $c7ee
    sub [hl]
    jr nz, jr_005_433b

    ld a, [$c7ed]
    ld hl, $c7ef
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
    call Call_005_469f
    add sp, $06

Jump_005_4358:
jr_005_4358:
    ld e, $00
    jp Jump_005_468c


Jump_005_435d:
    ld hl, $c7d8
    ld c, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld hl, $c7ee
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
    ld a, [$c7ee]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, $c7ea
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
    ld a, [$c7ea]
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
    ld a, [$c7ec]
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
    call Call_005_474c
    pop hl
    inc sp
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, $4411
    call RST_08
    pop hl
    jp Jump_005_4559


Jump_005_4453:
    ld hl, $c7ee
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, $c7ec
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
    call Call_005_474c
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
    ld a, [$c7ec]
    ld hl, $c7ee
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
    ld hl, $c7da
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, $c7d8
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_005_469f
    add sp, $06
    ld e, $01
    jp Jump_005_468c


Jump_005_4559:
jr_005_4559:
    ld hl, $c7ea
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
    ld hl, $c7ee
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    dec bc
    ld e, [hl]
    ld a, [$c7ea]
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
    call Call_005_4727
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
    ld hl, $c7ea
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
    call Call_005_4727
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
    ld a, [$c7e8]
    ld hl, $c7ea
    sub [hl]
    jr nz, jr_005_4647

    ld a, [$c7e9]
    ld hl, $c7eb
    sub [hl]
    jr z, jr_005_4672

jr_005_4647:
    ld hl, $c53d
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
    ld hl, $c7da
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, $c7d8
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_005_469f
    add sp, $06
    ld e, $01
    jr jr_005_468c

Jump_005_4672:
jr_005_4672:
    ld a, [$da1f]
    rrca
    jr c, jr_005_468a

    ld a, [$c7e4]
    or a
    jr z, jr_005_4681

    call Call_000_223f

jr_005_4681:
    ld a, [$c7e7]
    or a
    jr z, jr_005_468a

    call Call_000_2173

jr_005_468a:
    ld e, $01

Jump_005_468c:
jr_005_468c:
    add sp, $0d
    ret


    ld e, $05
    ld hl, $40aa
    call RST_08
    ld e, $05
    ld hl, $40ca
    jp RST_08


Call_005_469f:
    dec sp
    ld hl, $c7e7
    ld [hl], $00
    ld hl, $c7e4
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

    ld a, [$c533]
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
    ld hl, $431a
    call RST_08
    pop hl
    pop bc
    inc c
    inc b
    jr jr_005_46f6

jr_005_4725:
    inc sp
    ret


Call_005_4727:
jr_005_4727:
    ld a, [$c7e7]
    or a
    jr z, jr_005_4732

    call Call_000_2173
    jr jr_005_4727

jr_005_4732:
    ld hl, sp+$03
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    ret nc

    ld hl, sp+$02
    ld a, [hl]
    ld [$c7e5], a
    ld hl, sp+$03
    ld a, [hl]
    ld [$c7e6], a
    ld hl, $c7e7
    ld [hl], $17
    ret


Call_005_474c:
jr_005_474c:
    ld a, [$c7e4]
    or a
    jr z, jr_005_4757

    call Call_000_223f
    jr jr_005_474c

jr_005_4757:
    ld hl, sp+$02
    ld a, [hl]
    ld [$c7e2], a
    ld hl, sp+$03
    ld c, [hl]
    ld hl, $c7e3
    ld [hl], c
    ld a, [$c533]
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
    ld a, [$c533]
    sub c

jr_005_4794:
    ld [$c7e4], a
    ret


    ld a, [$c61b]
    ld [$c61c], a
    ld hl, sp+$08
    ld a, [hl]
    ld [$c924], a
    ld hl, $c929
    ld [hl], $00
    ld hl, $c923
    ld [hl], $00
    ld hl, $c921
    ld [hl], $00
    ld hl, sp+$09
    ld a, [hl]
    cp $34
    ret nc

    add $cc
    ld h, $00
    push hl
    inc sp
    push af
    inc sp
    ld e, $01
    ld hl, $57ff
    call RST_08
    pop hl
    ret


    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_005_47db

    call Call_000_0265
    ld hl, $ca43
    ld a, e
    ld [hl+], a
    ld [hl], d
    ret


jr_005_47db:
    call Call_000_026d
    ld hl, $ca43
    ld a, e
    ld [hl+], a
    ld [hl], d
    ret


    ld hl, sp+$09
    ld a, [hl-]
    add a
    add a
    add a
    ld c, a
    ld a, [hl]
    add a
    add a
    add a
    ld hl, $c91f
    ld [hl], c
    ld hl, $c91e
    ld [hl], c
    ld [$c91d], a
    ld [$c91c], a
    ret


    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_005_4813

    inc hl
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, $60de
    call RST_08
    inc sp
    ret


jr_005_4813:
    ld c, $00
    ld hl, sp+$09
    ld b, [hl]
    bit 0, b
    jr z, jr_005_4830

    ld a, [$c91c]
    ld hl, $c91d
    sub [hl]
    jr nz, jr_005_482e

    ld a, [$c91e]
    ld hl, $c91f
    sub [hl]
    jr z, jr_005_4830

jr_005_482e:
    ld c, $01

jr_005_4830:
    bit 1, b
    jr z, jr_005_483c

    ld a, [$c921]
    or a
    jr nz, jr_005_483c

    ld c, $01

jr_005_483c:
    ld a, [$c61b]
    ld hl, $c61c
    ld e, [hl]
    bit 2, b
    jr z, jr_005_4851

    bit 4, a
    jr z, jr_005_484f

    bit 4, e
    jr z, jr_005_4851

jr_005_484f:
    ld c, $01

jr_005_4851:
    bit 3, b
    jr z, jr_005_485f

    bit 5, a
    jr z, jr_005_485d

    bit 5, e
    jr z, jr_005_485f

jr_005_485d:
    ld c, $01

jr_005_485f:
    bit 4, b
    jr z, jr_005_4871

    ld a, [$c61b]
    or a
    jr z, jr_005_486f

    ld a, [$c61c]
    or a
    jr z, jr_005_4871

jr_005_486f:
    ld c, $01

jr_005_4871:
    ld a, c
    or a
    ret z

    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    add $fd
    ld e, a
    ld a, h
    adc $ff
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld hl, sp+$0a
    ld a, [hl]
    inc a
    jr nz, jr_005_489e

    ld a, [$c925]
    ld hl, sp+$0a
    ld [hl], a
    jr jr_005_48ab

jr_005_489e:
    ld hl, sp+$0a
    ld a, [hl]
    sub $fe
    jr nz, jr_005_48ab

    ld a, [$c926]
    ld hl, sp+$0a
    ld [hl], a

jr_005_48ab:
    ld hl, sp+$0a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    add a
    add a
    add a
    ld b, a
    ld a, [hl]
    add a
    add a
    add a
    ld e, a
    ld hl, $c91f
    ld [hl], b
    ld hl, $c91d
    ld [hl], e
    ld a, c
    sub $fd
    jr nz, jr_005_48cf

    ld hl, $c91e
    ld [hl], b
    ld hl, $c91c
    ld [hl], e
    ret


jr_005_48cf:
    ld hl, $c920
    ld [hl], c
    ret


    call Call_000_0265
    ld hl, sp+$09
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $ca45
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0a
    ld a, [hl]
    ld [$ca47], a
    ld hl, sp+$0b
    ld a, [hl]
    ld [$ca48], a
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_4909

    ld bc, $00c9
    jr jr_005_490c

jr_005_4909:
    ld bc, $00ca

jr_005_490c:
    ld hl, $ca49
    ld [hl], c
    ret


    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_491b

    xor a
    ld l, a
    jr jr_005_491f

jr_005_491b:
    ld a, $ff
    ld l, $00

jr_005_491f:
    ld [$c92a], a
    ld hl, sp+$0d
    ld a, [hl]
    push af
    and $02
    ld c, a
    ld b, $00
    pop af
    rrca
    jr nc, jr_005_4976

    push bc
    ld hl, sp+$0d
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    ld e, $01
    ld hl, $575c
    call RST_08
    add sp, $04
    pop bc
    ld a, b
    or c
    ret z

    ld hl, sp+$0b
    ld a, [hl-]
    ld d, a
    dec d
    dec d
    ld a, [hl-]
    ld c, a
    dec c
    dec c
    ld a, [hl-]
    inc a
    ld b, [hl]
    inc b
    ld hl, sp+$0c
    ld h, [hl]
    push hl
    inc sp
    push de
    inc sp
    ld h, c
    push hl
    inc sp
    push af
    inc sp
    push bc
    inc sp
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $05
    ld hl, $48d4
    call RST_08
    add sp, $07
    ret


jr_005_4976:
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_4981

    ld de, $00c9
    jr jr_005_4984

jr_005_4981:
    ld de, $00ca

jr_005_4984:
    ld a, e
    push af
    inc sp
    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call Call_000_3472
    add sp, $05
    ld a, b
    or c
    ret z

    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    dec hl
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $05
    ld hl, $48d4
    call RST_08
    add sp, $07
    ret


    ld hl, sp+$08
    ld a, [hl]
    sub $14
    jr nc, jr_005_49ed

    inc hl
    ld a, [hl]
    sub $12
    jr nc, jr_005_49ed

    ld a, $12
    sub [hl]
    dec hl
    ld b, a
    ld a, $14
    sub [hl]
    ld hl, sp+$0b
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$0b
    ld h, [hl]
    ld l, b
    push hl
    push af
    inc sp
    xor a
    rrca
    push af
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $05
    ld hl, $4911
    call RST_08
    add sp, $08

jr_005_49ed:
    ld hl, sp+$09
    ld a, [hl-]
    add a
    add a
    add a
    ld c, a
    ld a, [hl]
    add a
    add a
    add a
    ld hl, $c91f
    ld [hl], c
    ld hl, $c91e
    ld [hl], c
    ld [$c91d], a
    ld [$c91c], a
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
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_005_4a3d

    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$09
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$08
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
    jr jr_005_4a41

jr_005_4a3d:
    ld hl, $cb98
    add hl, bc

jr_005_4a41:
    ld a, l
    ld c, h
    ld hl, sp+$07
    ld [hl+], a
    ld a, c
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    or a
    jp z, Jump_005_4af2

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$07
    ld e, l
    ld d, h
    ld hl, sp+$04
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_005_4a86

    bit 7, d
    jr nz, jr_005_4a8b

    cp a
    jr jr_005_4a8b

jr_005_4a86:
    bit 7, d
    jr z, jr_005_4a8b

    scf

jr_005_4a8b:
    ld a, $00
    rla
    ld hl, sp+$06
    ld [hl], a
    or a
    jr z, jr_005_4a9a

    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    jr jr_005_4a9f

jr_005_4a9a:
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_005_4a9f:
    ld a, c
    sub $01
    ld a, b
    rla
    ccf
    rra
    sbc $80
    jr nc, jr_005_4ab3

    ld hl, sp+$07
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl], a
    jr jr_005_4ac4

jr_005_4ab3:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr nz, jr_005_4ac4

    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$07
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a

jr_005_4ac4:
    ld hl, sp+$07
    ld c, [hl]
    pop de
    push de
    inc de
    inc de
    ld a, [de]
    ld b, a
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    ld d, a
    ld a, c
    push af
    inc sp
    ld hl, sp+$15
    ld a, [hl-]
    push af
    inc sp
    ld a, [hl]
    push af
    inc sp
    push bc
    inc sp
    push de
    ld e, $01
    ld hl, $5e85
    call RST_08
    add sp, $06
    ld c, e
    ld b, $00
    jr jr_005_4af5

Jump_005_4af2:
    ld bc, $0000

jr_005_4af5:
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
    ld hl, sp+$07
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$14
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $09
    ret


    ld hl, sp+$08
    ld c, [hl]
    ld hl, $ca42
    ld [hl], c
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    ld bc, $05a1
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld [$ca41], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [$ca41]
    push af
    inc sp
    ld de, $0008
    push de
    push bc
    ld de, $ca39
    push de
    call Call_000_1323
    add sp, $07
    ret


    call Call_000_0265
    ld hl, sp+$09
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_4b76

    ld de, $00c9
    jr jr_005_4b79

jr_005_4b76:
    ld de, $00ca

jr_005_4b79:
    ld a, e
    push af
    inc sp
    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    push bc
    ld e, $09
    ld hl, $4268
    call RST_08
    add sp, $05
    ret


    ld a, [$c532]
    push af
    inc sp
    ld hl, sp+$0e
    ld a, [hl]
    push af
    inc sp
    call Call_000_355d
    pop hl
    ld hl, sp+$0c
    ld a, [hl]
    ld b, $00
    add e
    ld c, a
    ld a, b
    adc d
    ld b, a
    ld a, c
    ld hl, $c52a
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, sp+$0b
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    ld a, [$c532]
    ld h, a
    ld a, [$c529]
    ld l, a
    push hl
    push bc
    call Call_000_22da
    add sp, $08
    ret


    add sp, -$03
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_005_4be9

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
    jr jr_005_4bed

jr_005_4be9:
    ld hl, $cb98
    add hl, bc

jr_005_4bed:
    ld c, l
    ld b, h
    ld hl, $000a
    add hl, bc
    ld a, [hl]
    push bc
    ld hl, $c532
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_355d
    pop hl
    pop bc
    ld hl, $0008
    add hl, bc
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0006
    add hl, bc
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, $0004
    add hl, bc
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld l, c
    ld h, b
    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld a, [bc]
    ld c, a
    ld hl, $c52a
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a
    ld hl, sp+$00
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    push af
    inc sp
    ld b, [hl]
    push bc
    ld a, [$c532]
    ld h, a
    ld a, [$c529]
    ld l, a
    push hl
    push de
    call Call_000_22da
    add sp, $0b
    ret


    add sp, -$0c
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$16
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$17
    bit 7, [hl]
    jr z, jr_005_4c7a

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_005_4c7e

jr_005_4c7a:
    ld hl, $cb98
    add hl, bc

jr_005_4c7e:
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$18
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_005_4c9c

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_005_4ca0

jr_005_4c9c:
    ld hl, $cb98
    add hl, bc

jr_005_4ca0:
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld hl, sp+$05
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld hl, sp+$06
    ld a, e
    ld [hl-], a
    ld e, c
    ld d, b
    inc de
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld hl, sp+$07
    ld [hl], e
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$09
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$15
    bit 7, [hl]
    jr z, jr_005_4cfe

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    jr jr_005_4d09

jr_005_4cfe:
    ld de, $cb98
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h

jr_005_4d09:
    ld a, [de]
    ld [$da36], a
    ld hl, $0008
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$05
    ld a, [hl]
    push af
    inc sp
    push de
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_12e0
    add sp, $05
    ld a, [bc]
    ld l, c
    ld h, b
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    ld hl, sp+$0a
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    dec hl
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call Call_000_12c4
    add sp, $07
    ld hl, $da36
    ld [hl], $00
    add sp, $0c
    ret


    ld hl, sp+$08
    ld a, [hl]
    ld [$ca4b], a
    ld hl, sp+$09
    ld a, [hl]
    ld [$ca4c], a
    ld hl, sp+$0a
    ld a, [hl]
    ld [$ca4d], a
    ld hl, sp+$0b
    ld a, [hl]
    ld [$ca4a], a
    ret


    db $72, $00

    INCBIN "gfx/image_005_4d6b.2bpp"

    db $79, $00

    INCBIN "gfx/image_005_548d.2bpp"

    db $75, $00

    INCBIN "gfx/image_005_5c1f.2bpp"

    db $74, $00

    INCBIN "gfx/image_005_6371.2bpp"

    ld hl, $c51e
    ld [hl], $00
    ld hl, $c51f
    ld [hl], $00
    ld hl, $c520
    ld [hl], $08
    ld hl, $c521
    ld [hl], $08
    ret


    add sp, -$11
    ld hl, sp+$04
    xor a
    ld [hl+], a
    ld [hl], $04
    ld hl, $c507
    ld [hl], $00
    ld hl, $c61d
    ld e, [hl]
    ld hl, $c61b
    ld d, [hl]
    ld a, d
    and $02
    ld c, a
    ld b, $00
    ld a, d
    and $01
    ld hl, sp+$0b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    and $04
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    and $08
    ld [hl+], a
    ld [hl], $00
    bit 1, e
    jr nz, jr_005_6b03

    ld a, [$c61d]
    or a
    jr nz, jr_005_6b09

    ld a, b
    or c
    jr z, jr_005_6b09

jr_005_6b03:
    ld hl, sp+$05
    ld [hl], $03
    jr jr_005_6b49

jr_005_6b09:
    bit 0, e
    jr nz, jr_005_6b19

    ld a, [$c61d]
    or a
    jr nz, jr_005_6b1f

    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b1f

jr_005_6b19:
    ld hl, sp+$05
    ld [hl], $01
    jr jr_005_6b49

jr_005_6b1f:
    bit 2, e
    jr nz, jr_005_6b2f

    ld a, [$c61d]
    or a
    jr nz, jr_005_6b35

    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b35

jr_005_6b2f:
    ld hl, sp+$05
    ld [hl], $02
    jr jr_005_6b49

jr_005_6b35:
    bit 3, e
    jr nz, jr_005_6b45

    ld a, [$c61d]
    or a
    jr nz, jr_005_6b49

    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b49

jr_005_6b45:
    ld hl, sp+$05
    ld [hl], $00

jr_005_6b49:
    ld a, b
    or c
    jr z, jr_005_6b70

    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b5e

    ld hl, sp+$04
    ld [hl], $e0
    jr jr_005_6bb9

jr_005_6b5e:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b6a

    ld hl, sp+$04
    ld [hl], $a0
    jr jr_005_6bb9

jr_005_6b6a:
    ld hl, sp+$04
    ld [hl], $c0
    jr jr_005_6bb9

jr_005_6b70:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b99

    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b87

    ld hl, sp+$04
    ld [hl], $20
    jr jr_005_6bb9

jr_005_6b87:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b93

    ld hl, sp+$04
    ld [hl], $60
    jr jr_005_6bb9

jr_005_6b93:
    ld hl, sp+$04
    ld [hl], $40
    jr jr_005_6bb9

jr_005_6b99:
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6baa

    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$04
    ld [hl], $00
    jr jr_005_6bb9

jr_005_6baa:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6bb9

    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$04
    ld [hl], $80

jr_005_6bb9:
    ld a, [$c507]
    or a
    jp z, Jump_005_7115

    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], d
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$06
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$c0c8]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$10
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $18c4
    ld hl, sp+$04
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$0a
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0e
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
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$11
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$10
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0d
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl]
    add $40
    ld c, a
    ld hl, $18c4
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld hl, sp+$0a
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    ld hl, sp+$0b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0c
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
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld c, e
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
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
    ld hl, sp+$0f
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld hl, sp+$0a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl-]
    dec hl
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$11
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$10
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
    ld [hl], c
    ld a, [$c0c2]
    ld hl, sp+$0f
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, c
    inc a
    ld [hl], a
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
    ld hl, sp+$0c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$04
    ld a, [hl]
    sub $80
    jp nc, Jump_005_6e99

    ld a, [$c0c0]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$0c
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
    ld hl, sp+$0f
    ld [hl], c

Jump_005_6dc6:
    ld hl, sp+$0e
    ld a, [hl+]
    inc hl
    sub [hl]
    jp z, Jump_005_6e50

    ld hl, sp+$0f
    ld a, [hl]
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_6e16

    ld hl, sp+$10
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_6e16

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$10
    ld a, [hl]
    ld c, $00
    push bc
    push de
    ld e, a
    ld d, c
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
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_6e18

jr_005_6e16:
    ld e, $0f

jr_005_6e18:
    bit 2, e
    jr z, jr_005_6e4a

    ld hl, sp+$0f
    ld a, [hl]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, $c0c0
    ld l, [hl]
    push af
    ld a, l
    rlca
    sbc a
    ld h, a
    pop af
    sub l
    ld l, a
    ld a, c
    sbc h
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_6e50

jr_005_6e4a:
    ld hl, sp+$10
    inc [hl]
    jp Jump_005_6dc6


Jump_005_6e50:
jr_005_6e50:
    ld bc, $c0ba
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
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr c, jr_005_6e91

    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_005_6e91:
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jp Jump_005_6f51


Jump_005_6e99:
    ld a, [$c0bf]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$0c
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
    ld hl, sp+$10
    ld b, [hl]

jr_005_6eb7:
    ld hl, sp+$0e
    ld a, [hl]
    sub b
    jr z, jr_005_6f30

    ld a, c
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_6f00

    ld a, b
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_6f00

    ld a, [$c52f]
    ld hl, sp+$10
    ld [hl], a
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld l, b
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
    ld l, c
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
    jr jr_005_6f02

jr_005_6f00:
    ld e, $0f

jr_005_6f02:
    bit 3, e
    jr z, jr_005_6f2d

    ld l, c
    ld h, $00
    inc hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0bf]
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
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_6f30

jr_005_6f2d:
    inc b
    jr jr_005_6eb7

jr_005_6f30:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld hl, sp+$0f
    ld [hl], c
    inc hl
    ld [hl], a
    bit 7, [hl]
    jr z, jr_005_6f46

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a

jr_005_6f46:
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_6f51:
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
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$10
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
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$08
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
    ld a, $40
    ld hl, sp+$04
    sub [hl]
    jp nc, Jump_005_7076

    ld a, [hl]
    sub $c0
    jp nc, Jump_005_7076

    ld a, [$c0c2]
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
    ld hl, sp+$0e
    ld [hl], c

Jump_005_6fda:
    ld hl, sp+$0f
    ld a, [hl+]
    sub [hl]
    jp z, Jump_005_7063

    ld hl, sp+$10
    ld a, [hl]
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_702a

    ld hl, sp+$0e
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_702a

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$0e
    ld a, [hl]
    ld c, $00
    push bc
    push de
    ld e, a
    ld d, c
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
    ld hl, sp+$10
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld a, e
    jr jr_005_702c

jr_005_702a:
    ld a, $0f

jr_005_702c:
    rrca
    jr nc, jr_005_705d

    ld hl, sp+$0e
    ld a, [hl]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, $c0c2
    ld l, [hl]
    push af
    ld a, l
    rlca
    sbc a
    ld h, a
    pop af
    sub l
    ld l, a
    ld a, c
    sbc h
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7063

jr_005_705d:
    ld hl, sp+$10
    inc [hl]
    jp Jump_005_6fda


Jump_005_7063:
jr_005_7063:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_005_7115


Jump_005_7076:
    ld a, [$c0c1]
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
    ld c, l

jr_005_708b:
    ld hl, sp+$0f
    ld a, [hl+]
    sub [hl]
    jr z, jr_005_7105

    ld hl, sp+$10
    ld a, [hl]
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_70d3

    ld a, c
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_70d3

    ld hl, $c52f
    ld b, [hl]
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
    ld hl, sp+$10
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_70d5

jr_005_70d3:
    ld e, $0f

jr_005_70d5:
    bit 1, e
    jr z, jr_005_7100

    inc c
    ld l, c
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
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7105

jr_005_7100:
    ld hl, sp+$10
    inc [hl]
    jr jr_005_708b

jr_005_7105:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_7115:
    ld hl, sp+$05
    ld a, [hl]
    sub $04
    jr z, jr_005_7136

    ld a, [$c507]
    push af
    inc sp
    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04
    jr jr_005_7143

jr_005_7136:
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl

jr_005_7143:
    ld de, $0000
    ld a, [$da1f]
    and $01
    ld b, a
    ld c, $00
    ld a, b
    dec a
    or c
    jr nz, jr_005_718a

    xor a
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
    jr nz, jr_005_71da

    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_005_718a

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_718a

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_005_718a:
    ld a, [$c61b]
    bit 4, a
    jr z, jr_005_71da

    ld a, [$c61c]
    bit 4, a
    jr nz, jr_005_71da

    ld a, d
    or e
    jr nz, jr_005_71a9

    ld hl, $0108
    push hl
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl

jr_005_71a9:
    ld a, d
    or e
    jr z, jr_005_71da

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_005_71da

    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_71da

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

jr_005_71da:
    add sp, $11
    ret


    ld hl, $c51e
    ld [hl], $00
    ld hl, $c51f
    ld [hl], $00
    ld hl, $c520
    ld [hl], $00
    ld hl, $c521
    ld [hl], $00
    ld a, [$c0be]
    ld [$d9bd], a
    sub $03
    jr nz, jr_005_7209

    ld hl, $c51e
    ld [hl], $30
    ld hl, $d9bb
    xor a
    ld [hl+], a
    ld [hl], $08
    jr jr_005_7273

jr_005_7209:
    ld a, [$d9bd]
    dec a
    jr nz, jr_005_7237

    ld hl, $c51e
    ld [hl], $c0
    ld hl, $c534
    ld a, [hl+]
    add $70
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $d9bb
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7273

jr_005_7237:
    ld a, [$d9bd]
    sub $02
    jr nz, jr_005_724d

    ld hl, $c51f
    ld [hl], $30
    ld hl, $d9bb
    ld a, $80
    ld [hl+], a
    ld [hl], $07
    jr jr_005_7273

jr_005_724d:
    ld hl, $c51f
    ld [hl], $d0
    ld hl, $c536
    ld a, [hl+]
    add $88
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $d9bb
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_005_7273:
    ld hl, $d9ba
    ld [hl], $00
    ret


    add sp, -$0d
    ld hl, $c507
    ld [hl], $00
    ld hl, $d9bd
    ld b, [hl]
    ld a, [$c61b]
    bit 0, b
    jr z, jr_005_72a5

    bit 2, a
    jr z, jr_005_7298

    ld hl, $c507
    ld [hl], $01
    ld b, $02
    jr jr_005_72bb

jr_005_7298:
    bit 3, a
    jr z, jr_005_72bb

    ld hl, $c507
    ld [hl], $01
    ld b, $00
    jr jr_005_72bb

jr_005_72a5:
    bit 1, a
    jr z, jr_005_72b2

    ld hl, $c507
    ld [hl], $01
    ld b, $03
    jr jr_005_72bb

jr_005_72b2:
    rrca
    jr nc, jr_005_72bb

    ld hl, $c507
    ld [hl], $01
    ld b, [hl]

jr_005_72bb:
    ld a, [$c0be]
    sub b
    jr z, jr_005_72d6

    ld a, [$c507]
    push af
    inc sp
    push bc
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04

jr_005_72d6:
    ld a, [$c507]
    or a
    jp z, Jump_005_7764

    ld hl, sp+$04
    ld a, l
    ld d, h
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], d
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$04
    ld a, l
    ld d, h
    ld hl, sp+$02
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$c0c8]
    ld hl, sp+$0a
    ld [hl], a
    ld a, [$c0be]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$01
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld hl, $19c4
    add hl, de
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    push bc
    ld hl, sp+$0c
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld hl, sp+$0b
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
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    pop de
    push de
    inc de
    ld a, [de]
    push bc
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld hl, sp+$0b
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
    ld hl, $d9bd
    ld c, [hl]
    ld a, [$c0be]
    ld hl, sp+$0b
    ld [hl], a
    bit 0, c
    jp z, Jump_005_756b

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
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$0c
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
    ld hl, sp+$0a
    ld [hl-], a
    dec hl
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
    ld hl, sp+$02
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0b
    ld a, [hl]
    or a
    jp nz, Jump_005_74c1

    ld a, [$c0c2]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$02
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
    ld hl, sp+$0b
    ld [hl], c

Jump_005_7424:
    ld hl, sp+$0a
    ld a, [hl+]
    inc hl
    sub [hl]
    jp z, Jump_005_74ae

    ld hl, sp+$0c
    ld a, [hl]
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7475

    ld hl, sp+$0b
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7475

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$0b
    ld a, [hl]
    ld c, $00
    push bc
    push de
    ld e, a
    ld d, c
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
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld a, e
    jr jr_005_7477

jr_005_7475:
    ld a, $0f

jr_005_7477:
    rrca
    jr nc, jr_005_74a8

    ld hl, sp+$0b
    ld a, [hl]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, $c0c2
    ld l, [hl]
    push af
    ld a, l
    rlca
    sbc a
    ld h, a
    pop af
    sub l
    ld l, a
    ld a, c
    sbc h
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_74ae

jr_005_74a8:
    ld hl, sp+$0c
    inc [hl]
    jp Jump_005_7424


Jump_005_74ae:
jr_005_74ae:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_005_7764


Jump_005_74c1:
    ld a, [$c0c1]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$02
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
    ld hl, sp+$0c
    ld b, [hl]

jr_005_74df:
    ld hl, sp+$0a
    ld a, [hl]
    sub b
    jr z, jr_005_7558

    ld a, b
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7528

    ld a, c
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7528

    ld a, [$c52f]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, $c532
    ld l, [hl]
    ld h, $00
    ld e, c
    ld d, $00
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
    ld l, b
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_752a

jr_005_7528:
    ld e, $0f

jr_005_752a:
    bit 1, e
    jr z, jr_005_7555

    inc c
    ld l, c
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
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7558

jr_005_7555:
    inc b
    jr jr_005_74df

jr_005_7558:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_005_7764


Jump_005_756b:
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
    ld hl, sp+$0a
    ld [hl], e
    ld a, [$c0c2]
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
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$02
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
    ld hl, sp+$0b
    ld a, [hl]
    dec a
    jp nz, Jump_005_76b6

    ld a, [$c0c0]
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
    ld hl, sp+$0a
    ld b, [hl]

jr_005_75ec:
    ld hl, sp+$0c
    ld a, [hl]
    sub b
    jr z, jr_005_7664

    ld a, c
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7635

    ld a, b
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7635

    ld a, [$c52f]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, $c532
    ld l, [hl]
    ld h, $00
    ld e, b
    ld d, $00
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
    ld l, c
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_7637

jr_005_7635:
    ld e, $0f

jr_005_7637:
    bit 2, e
    jr z, jr_005_7661

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0c0]
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
    dec bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7664

jr_005_7661:
    inc b
    jr jr_005_75ec

jr_005_7664:
    ld hl, $c534
    ld a, [hl+]
    add $f0
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_005_76a9

    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a

jr_005_76a9:
    ld de, $c0ba
    ld hl, sp+$0b
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jp Jump_005_7764


Jump_005_76b6:
    ld a, [$c0bf]
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
    ld hl, sp+$0a
    ld b, [hl]

jr_005_76ce:
    ld hl, sp+$0c
    ld a, [hl]
    sub b
    jr z, jr_005_7747

    ld a, c
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7717

    ld a, b
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7717

    ld a, [$c52f]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld l, b
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
    ld l, c
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_7719

jr_005_7717:
    ld e, $0f

jr_005_7719:
    bit 3, e
    jr z, jr_005_7744

    ld h, $00
    ld l, c
    inc hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0bf]
    ld l, a
    rlca
    sbc a
    ld e, a
    ld a, c
    sub l
    ld l, a
    ld a, b
    sbc e
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    inc hl
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7747

jr_005_7744:
    inc b
    jr jr_005_76ce

jr_005_7747:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    bit 7, b
    jr z, jr_005_775a

    ld de, $0000
    jr jr_005_775c

jr_005_775a:
    ld e, c
    ld d, b

jr_005_775c:
    ld c, e
    ld b, d
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_7764:
    ld a, [$d9ba]
    or a
    jp nz, Jump_005_785e

    ld hl, $da34
    ld b, [hl]
    ld hl, $d9bd
    ld c, [hl]
    ld hl, sp+$09
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld de, $c0ba
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld l, c
    ld h, $00
    add hl, hl
    ld de, $19c4
    add hl, de
    ld a, [hl]
    push bc
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0a
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
    ld hl, sp+$0b
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $d9bb
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [$d9bd]
    dec a
    jr nz, jr_005_77f6

    ld hl, $c0bb
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_005_77f6

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_785e

jr_005_77f6:
    ld a, [$d9bd]
    sub $03
    jr nz, jr_005_781a

    ld hl, $c0bb
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr nc, jr_005_781a

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_785e

jr_005_781a:
    ld a, [$d9bd]
    or a
    jr nz, jr_005_783c

    ld hl, $c0bd
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_005_783c

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_785e

jr_005_783c:
    ld a, [$d9bd]
    sub $02
    jr nz, jr_005_785e

    ld hl, $c0bd
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr nc, jr_005_785e

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_785e:
jr_005_785e:
    ld a, [$da1f]
    and $01
    ld b, a
    ld c, $00
    ld a, b
    dec a
    or c
    jp nz, Jump_005_78f5

    xor a
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
    jr nz, jr_005_78f5

    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_005_78a5

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_78a5

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_005_78f5

jr_005_78a5:
    ld a, [$c61b]
    bit 4, a
    jr z, jr_005_78f5

    ld a, [$c61c]
    bit 4, a
    jr nz, jr_005_78f5

    ld a, d
    or e
    jr nz, jr_005_78c4

    ld hl, $0108
    push hl
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl

jr_005_78c4:
    ld a, d
    or e
    jr z, jr_005_78f5

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_005_78f5

    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_78f5

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

Jump_005_78f5:
jr_005_78f5:
    add sp, $0d
    ret


    ld hl, $c51e
    ld [hl], $00
    ld hl, $c51f
    ld [hl], $00
    ld hl, $c520
    ld [hl], $00
    ld hl, $c521
    ld [hl], $00
    ld a, [$d9be]
    sub $10
    jr nz, jr_005_7932

    ld hl, $c0ba
    ld a, [hl+]
    ld b, [hl]
    xor a
    ld hl, $c0ba
    ld [hl+], a
    ld [hl], b
    ld hl, $c0bc
    ld a, [hl+]
    ld b, [hl]
    ld c, $00
    ld hl, $0080
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ret


jr_005_7932:
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
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    xor a
    rr b
    ld b, c
    rr b
    rra
    ld hl, $c0ba
    ld [hl+], a
    ld [hl], b
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
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    xor a
    rr b
    ld b, c
    rr b
    rra
    ld hl, $c0bc
    ld [hl+], a
    ld [hl], b
    ret


    add sp, -$05
    ld hl, sp+$00
    ld [hl], $04
    ld a, [$d9be]
    sub $10
    jr nz, jr_005_79d9

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
    ld a, c
    and $0f
    jr nz, jr_005_79d9

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
    ld a, c
    and $0f
    ld c, a
    ld b, $00
    ld a, c
    sub $08
    or b
    jr z, jr_005_7a19

jr_005_79d9:
    ld a, [$d9be]
    sub $08
    jp nz, Jump_005_7f8c

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
    ld a, c
    and $07
    jp nz, Jump_005_7f8c

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
    ld a, c
    and $07
    jp nz, Jump_005_7f8c

jr_005_7a19:
    ld hl, $c507
    ld [hl], $00
    xor a
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
    jp nz, Jump_005_7ffc

    ld a, [$c61d]
    ld hl, sp+$04
    ld [hl], a
    push hl
    bit 1, [hl]
    pop hl
    jr nz, jr_005_7a55

    ld hl, $c61b
    ld c, [hl]
    ld hl, $c61d
    ld a, [hl]
    or a
    jp nz, Jump_005_7b4a

    bit 1, c
    jp z, Jump_005_7b4a

jr_005_7a55:
    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$00
    ld [hl], $03
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
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0c2]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$02
    ld [hl+], a
    ld de, $c0ba
    ld a, [de]
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
    ld a, [$c0bf]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
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
    ld hl, sp+$03
    ld [hl], e

jr_005_7aee:
    ld hl, sp+$02
    ld a, [hl]
    sub c
    jp z, Jump_005_7e7b

    ld hl, sp+$03
    ld a, [hl+]
    dec a
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7b39

    ld a, c
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7b39

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld l, [hl]
    ld h, $00
    ld e, c
    ld d, $00
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
    ld hl, sp+$04
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_7b3b

jr_005_7b39:
    ld e, $0f

jr_005_7b3b:
    bit 3, e
    jr z, jr_005_7b47

    ld hl, $c507
    ld [hl], $00
    jp Jump_005_7e7b


jr_005_7b47:
    inc c
    jr jr_005_7aee

Jump_005_7b4a:
    push hl
    ld hl, sp+$06
    bit 0, [hl]
    pop hl
    jr nz, jr_005_7b5f

    ld hl, $c61d
    ld a, [hl]
    or a
    jp nz, Jump_005_7c54

    bit 0, c
    jp z, Jump_005_7c54

jr_005_7b5f:
    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$00
    ld [hl], $01
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
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0c2]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$02
    ld [hl+], a
    ld de, $c0ba
    ld a, [de]
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
    ld a, [$c0c0]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
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
    ld hl, sp+$03
    ld [hl], e

jr_005_7bf8:
    ld hl, sp+$02
    ld a, [hl]
    sub c
    jp z, Jump_005_7e7b

    ld hl, sp+$03
    ld a, [hl+]
    inc a
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7c43

    ld a, c
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7c43

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld l, [hl]
    ld h, $00
    ld e, c
    ld d, $00
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
    ld hl, sp+$04
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_7c45

jr_005_7c43:
    ld e, $0f

jr_005_7c45:
    bit 2, e
    jr z, jr_005_7c51

    ld hl, $c507
    ld [hl], $00
    jp Jump_005_7e7b


jr_005_7c51:
    inc c
    jr jr_005_7bf8

Jump_005_7c54:
    push hl
    ld hl, sp+$06
    bit 2, [hl]
    pop hl
    jr nz, jr_005_7c69

    ld hl, $c61d
    ld a, [hl]
    or a
    jp nz, Jump_005_7d69

    bit 2, c
    jp z, Jump_005_7d69

jr_005_7c69:
    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$00
    ld [hl], $02
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
    ld e, a
    rlca
    sbc a
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$01
    ld [hl+], a
    inc hl
    ld de, $c0bc
    ld a, [de]
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
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$02
    ld [hl], e

jr_005_7d03:
    ld hl, sp+$01
    ld a, [hl]
    sub c
    jp z, Jump_005_7e7b

    ld hl, sp+$02
    ld a, [hl+]
    dec a
    ld [hl], a
    ld a, c
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7d58

    ld hl, sp+$03
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7d58

    ld a, [$c52f]
    ld hl, sp+$04
    ld [hl], a
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$03
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
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    jr jr_005_7d5a

jr_005_7d58:
    ld e, $0f

jr_005_7d5a:
    bit 1, e
    jr z, jr_005_7d66

    ld hl, $c507
    ld [hl], $00
    jp Jump_005_7e7b


jr_005_7d66:
    inc c
    jr jr_005_7d03

Jump_005_7d69:
    push hl
    ld hl, sp+$06
    bit 3, [hl]
    pop hl
    jr nz, jr_005_7d7d

    ld a, [$c61d]
    or a
    jp nz, Jump_005_7e7b

    bit 3, c
    jp z, Jump_005_7e7b

jr_005_7d7d:
    ld hl, $c507
    ld [hl], $01
    ld hl, sp+$00
    ld [hl], $00
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
    ld e, a
    rlca
    sbc a
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$01
    ld [hl+], a
    inc hl
    ld de, $c0bc
    ld a, [de]
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
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$02
    ld [hl], e

jr_005_7e17:
    ld hl, sp+$01
    ld a, [hl]
    sub c
    jr z, jr_005_7e7b

    ld hl, sp+$02
    ld a, [hl+]
    inc a
    ld [hl], a
    ld a, c
    ld hl, $c532
    sub [hl]
    jr nc, jr_005_7e6c

    ld hl, sp+$03
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_005_7e6c

    ld a, [$c52f]
    ld hl, sp+$04
    ld [hl], a
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$03
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
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld a, e
    jr jr_005_7e6e

jr_005_7e6c:
    ld a, $0f

jr_005_7e6e:
    rrca
    jr nc, jr_005_7e78

    ld hl, $c507
    ld [hl], $00
    jr jr_005_7e7b

jr_005_7e78:
    inc c
    jr jr_005_7e17

Jump_005_7e7b:
jr_005_7e7b:
    ld hl, sp+$00
    ld a, [hl]
    sub $04
    jr z, jr_005_7e9c

    ld a, [$c507]
    push af
    inc sp
    ld hl, sp+$01
    ld a, [hl]
    push af
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04
    jr jr_005_7ea9

jr_005_7e9c:
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl

jr_005_7ea9:
    ld a, [$da1f]
    and $01
    ld b, a
    ld c, $00
    ld a, b
    dec a
    or c
    jr nz, jr_005_7ed4

    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_005_7ed4

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_7ed4

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_005_7ed4:
    ld a, [$c507]
    or a
    jr z, jr_005_7f08

    xor a
    push af
    inc sp
    ld a, [$d9be]
    push af
    inc sp
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl
    ld a, d
    or e
    jr z, jr_005_7f08

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld bc, $c0c5
    ld de, $c0c4
    ld a, [de]
    ld [bc], a
    ld bc, $c0c6
    ld a, [de]
    inc a
    ld [bc], a
    ld hl, $c507
    ld [hl], $00

jr_005_7f08:
    ld a, [$c61b]
    ld c, $00
    push af
    and $10
    ld e, a
    ld d, $00
    pop af
    and e
    ld l, a
    ld a, c
    and d
    or l
    jr z, jr_005_7f8c

    ld hl, $c61c
    ld c, [hl]
    ld b, $00
    ld a, c
    and e
    ld c, a
    ld a, b
    and d
    or c
    jr nz, jr_005_7f8c

    ld a, $01
    push af
    inc sp
    ld a, [$d9be]
    push af
    inc sp
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl
    ld a, d
    or e
    jr z, jr_005_7f8c

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_005_7f8c

    ld bc, $c0be
    ld a, [bc]
    add $02
    and $03
    push de
    ld h, $00
    push hl
    inc sp
    push af
    inc sp
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04
    pop de
    ld hl, $c507
    ld [hl], $00
    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_7f8c

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

Jump_005_7f8c:
jr_005_7f8c:
    ld a, [$c507]
    or a
    jr z, jr_005_7ffc

    ld a, [$c0c8]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c0be]
    ld hl, sp+$04
    ld [hl], a
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$04
    ld a, [hl]
    ld d, $00
    add a
    rl d
    ld e, a
    ld hl, $19c4
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [de]
    push bc
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    inc de
    ld a, [de]
    push bc
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_7ffc:
jr_005_7ffc:
    add sp, $05
    ret


    rst $38
