SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

    add sp, -$0c
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$01
    ld [hl+], a
    pop bc
    push bc
    inc bc
    inc bc
    ld a, [bc]
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld a, [hl]
    and $01
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    and $02
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    and $04
    ld hl, sp+$05
    ld [hl], a
    pop de
    push de
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_008_4053

    ld de, $dfa0
    ld hl, sp+$0a
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_008_405b

jr_008_4053:
    ld de, $c64b
    ld hl, sp+$0a
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_008_405b:
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$08
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$09
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], $00

Jump_008_4072:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jp z, Jump_008_414c

    push hl
    bit 0, [hl]
    pop hl
    jp z, Jump_008_413a

    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld a, [$c81e]
    or a
    jr nz, jr_008_4099

    ld a, $01
    ld hl, sp+$0b
    sub [hl]
    jr nc, jr_008_40b4

jr_008_4099:
    ld e, c
    ld d, b
    push bc
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    ld hl, $0008
    push hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call Call_000_1323
    add sp, $07
    pop bc
    jr jr_008_4127

jr_008_40b4:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0b
    ld a, [hl]
    or a
    jr z, jr_008_40c7

    ld hl, sp+$0b
    ld a, [hl]
    dec a
    jr z, jr_008_4109

    jr jr_008_4127

jr_008_40c7:
    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld hl, sp+$06
    ld [hl], e
    ld a, [hl+]
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_008_40ef

    inc hl
    inc hl
    ld de, $c648
    ld a, [hl]
    ld [de], a
    ld hl, sp+$03
    ld a, [hl]
    or a
    jr z, jr_008_40ef

    ld hl, sp+$06
    ld a, [hl]
    ldh [rBGP], a

jr_008_40ef:
    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_008_4127

    inc hl
    inc hl
    ld de, $c649
    ld a, [hl]
    ld [de], a
    ld hl, sp+$03
    ld a, [hl]
    or a
    jr z, jr_008_4127

    ld hl, sp+$07
    ld a, [hl]
    ldh [rOBP0], a
    jr jr_008_4127

jr_008_4109:
    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_008_4127

    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld hl, $c64a
    ld [hl], e
    ld hl, sp+$03
    ld a, [hl]
    or a
    jr z, jr_008_4127

    ld a, e
    ldh [rOBP1], a

jr_008_4127:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl], a

Jump_008_413a:
    ld hl, $0008
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0b
    inc [hl]
    ld hl, sp+$08
    ld a, [hl]
    srl a
    ld [hl], a
    jp Jump_008_4072


Jump_008_414c:
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $0c
    ret


    nop
    ld bc, $0101
    ld [bc], a
    inc bc
    ld bc, $0101
    ld bc, $0101
    ld bc, $0401
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    inc c
    dec c
    ld c, $0c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    rrca
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_008_419f

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1b
    inc e
    dec e
    ld e, $1f
    db $10
    jr nz, jr_008_41b4

    ld [hl+], a
    inc hl
    dec d
    ld d, $24
    dec h
    ld a, [de]
    add hl, de
    ld h, $27
    jr z, jr_008_41c8

jr_008_419f:
    ld h, $27
    jr z, jr_008_41cc

    rra
    db $10
    ld a, [hl+]
    dec hl
    inc l
    dec l
    dec d
    ld d, $2e
    cpl
    add hl, de
    ld a, [de]
    jr nc, jr_008_41e2

    ld [hl-], a
    inc sp
    ld [hl-], a

jr_008_41b4:
    inc sp
    ld [hl-], a
    inc sp
    rra
    db $10
    inc [hl]
    dec [hl]
    ld [hl], $37
    dec d
    ld d, $38
    add hl, sp
    ld a, [de]
    add hl, de
    ld a, [hl-]
    dec sp
    inc a
    dec a
    inc a

jr_008_41c8:
    dec a
    inc a
    dec a
    rra

jr_008_41cc:
    db $10
    ld a, $3f
    ccf
    ld b, b
    dec d
    ld d, $41
    ld b, d
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    rra
    db $10
    ld b, e

jr_008_41e2:
    ccf
    ccf
    ld b, h
    dec d
    ld d, $45
    ld b, [hl]
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    rra
    db $10
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    dec d
    ld d, $41
    ld b, d
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    rra
    db $10
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    dec d
    ld d, $45
    ld b, [hl]
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    rra
    db $10
    ld c, a
    ld d, b
    ld d, c
    ld d, d
    dec d
    ld d, $32
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld d, e
    ld d, h
    ld d, e
    ld d, h
    ld [hl-], a
    inc sp
    rra
    db $10
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    dec d
    ld d, $3c
    dec a
    inc a
    dec a
    inc a
    dec a
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    inc a
    dec a
    rra
    db $10
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    dec d
    ld d, $17
    jr jr_008_4267

    ld a, [de]
    ld b, c
    ld b, d
    ld e, e
    ld e, h
    ld e, e
    ld e, h
    ld [hl-], a
    inc sp
    rra
    db $10
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    dec d
    ld d, $24
    dec h
    ld a, [de]
    add hl, de
    ld b, l
    ld b, [hl]
    inc a
    dec a

jr_008_4267:
    inc a
    dec a
    inc a
    dec a
    rra
    db $10
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    dec d
    ld d, $2e
    cpl
    add hl, de
    ld a, [de]
    ld b, c
    ld b, d
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    ld [hl-], a
    inc sp
    rra
    db $10
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    dec d
    ld d, $38
    add hl, sp
    ld a, [de]
    add hl, de
    ld b, l
    ld b, [hl]
    inc a
    dec a
    inc a
    dec a
    inc a
    dec a
    rra
    db $10
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    dec d
    ld [hl], c
    ld [hl], d
    ld [hl], d
    ld [hl], d
    ld [hl], d
    ld [hl], d
    ld [hl], d
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], d
    ld [hl], d
    ld [hl], a
    ld a, b
    ld a, c
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, a
    or a
    cp b
    cp c
    ld a, [hl]
    ld a, [hl]
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp a
    nop
    ld bc, $0302
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    dec b
    dec b
    inc b
    inc bc
    inc b
    inc bc
    ld b, $07
    ld [$0a09], sp
    dec bc
    ld [bc], a
    inc b
    inc c
    inc b
    inc c
    inc b
    inc c
    inc b
    dec b
    dec b
    inc c
    inc b
    inc c
    inc b
    dec c
    ld c, $0f
    db $10
    ld de, $0212
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    dec b
    dec b
    inc b
    inc bc
    inc b
    inc bc
    inc de
    inc d
    dec d
    ld d, $17
    jr jr_008_4302

    inc b
    inc c

jr_008_4302:
    inc b
    inc c
    inc b
    inc c
    inc b
    dec b
    dec b
    inc c
    inc b
    inc c
    inc b
    add hl, de
    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_4334

    ld e, $1f
    jr nz, jr_008_4338

    ld hl, $0505
    inc b
    inc bc
    inc b
    inc bc
    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $04
    daa
    jr z, jr_008_432e

    inc b
    daa
    jr z, jr_008_4332

jr_008_432e:
    add hl, hl
    dec b
    dec b
    inc c

jr_008_4332:
    inc b
    inc c

jr_008_4334:
    inc b
    ld a, [hl+]
    inc b
    inc b

jr_008_4338:
    dec hl
    ld h, $04
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    add hl, hl
    dec b
    dec b
    inc b
    inc bc
    inc b
    inc bc
    inc l
    inc b
    inc b
    dec l
    ld l, $2f
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    jr nc, jr_008_435d

    dec b
    inc c
    inc b
    inc c
    inc b

jr_008_435d:
    ld sp, $3332
    inc [hl]
    dec [hl]
    ld [hl], $35
    ld [hl], $37
    jr c, jr_008_439d

    ld [hl], $35
    ld [hl], $05
    dec b
    inc b
    inc bc
    inc b
    inc bc
    add hl, sp
    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3d
    ld a, $3f
    ld b, b
    dec a
    ld a, $3d
    ld a, $05
    dec b
    inc c
    inc b
    inc c
    inc b
    ld b, c
    ld b, d
    ld b, e
    ld b, h
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b

jr_008_439d:
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    nop
    ld bc, $5756
    nop
    ld bc, $5756
    nop
    ld bc, $5756
    nop
    ld bc, $5958
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    nop
    ld h, d
    ld h, e
    ld d, a
    nop
    ld h, d
    ld h, e
    ld d, a
    nop
    ld h, d
    ld h, e
    ld d, a
    nop
    ld h, d
    ld h, e
    ld d, a
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld a, [bc]
    dec bc
    ld e, h
    ld e, l
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    nop
    ld bc, $0100
    nop
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $0403
    dec b
    ld b, $07
    nop
    rlca
    nop
    rlca
    nop
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld [$0a09], sp
    dec bc
    nop
    ld bc, $0100
    nop
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    nop
    inc c
    dec c
    ld c, $0f
    ld bc, $1110
    ld [de], a
    inc de
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    rlca
    inc d
    dec d
    ld d, $17
    nop
    jr jr_008_4490

    ld a, [de]
    dec de
    nop
    ld bc, $1d1c
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $1f1e
    jr nz, @+$23

    rlca
    nop
    inc d

jr_008_4490:
    rla
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld [hl+], a
    nop
    nop
    inc hl
    nop
    ld bc, $0100
    nop
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $0024
    nop
    dec h
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld h, $27
    jr z, jr_008_44f2

    nop
    ld bc, $0100
    nop
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0100
    nop
    ld bc, $2b2a
    inc l
    dec l
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    rlca
    nop
    rlca
    nop
    rlca
    nop
    ld l, $2f
    jr nc, jr_008_4522

    ld [bc], a

jr_008_44f2:
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [hl], $37
    jr c, jr_008_453e

    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld a, $3f
    ld b, b
    ld b, c
    nop
    ld bc, $0100
    nop
    ld bc, $4342
    ld b, h

jr_008_4522:
    ld b, l
    nop
    ld bc, $0100
    nop
    ld bc, $4746
    ld c, b
    ld c, c
    ld c, d
    ld c, d
    ld c, d
    ld c, d
    ld c, d
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, d
    ld c, d
    ld c, d
    ld c, d
    ld c, d
    ld c, d
    ld c, a

jr_008_453e:
    ld d, b
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    ld d, l
    ld h, e
    ld h, h
    ld d, h
    ld d, l
    ld h, e
    ld h, h
    ld d, h
    ld d, l
    ld h, e
    ld h, h
    ld d, h
    ld d, l
    ld h, e
    ld h, h
    ld d, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, e
    ld e, h
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0302
    ld bc, $0401
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0e
    ld c, $0e
    ld c, $0e
    rrca
    db $10
    ld c, $0e
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_008_45d3

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_45e3

    ld [hl+], a
    rra
    jr nz, jr_008_45e5

    jr nz, @+$25

    inc d
    inc h
    dec h
    ld h, $27
    add hl, de
    ld a, [de]
    jr z, jr_008_45fa

    ld a, [hl+]
    dec hl

jr_008_45d3:
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc hl
    inc d
    ld l, $2f
    jr nc, jr_008_4612

    add hl, de
    ld a, [de]

jr_008_45e3:
    ld [hl-], a
    inc sp

jr_008_45e5:
    rra
    jr nz, jr_008_4607

    jr nz, jr_008_4609

    jr nz, jr_008_460b

    jr nz, jr_008_460d

    jr nz, @+$25

    inc d
    inc [hl]
    dec [hl]
    ld [hl], $37
    add hl, de
    ld a, [de]
    jr c, jr_008_4632

    inc l

jr_008_45fa:
    dec l
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc hl
    inc d
    ld a, [hl-]
    dec sp

jr_008_4607:
    dec sp
    inc a

jr_008_4609:
    add hl, de
    ld a, [de]

jr_008_460b:
    ld [bc], a
    inc bc

jr_008_460d:
    rra
    jr nz, jr_008_464d

    ld a, $3d

jr_008_4612:
    ld a, $3d
    ld a, $1f
    jr nz, @+$25

    inc d
    ccf
    dec sp
    dec sp
    ld b, b
    add hl, de
    ld a, [de]
    rrca
    db $10
    inc l
    dec l
    ld a, $3d
    ld a, $3d
    ld a, $3d
    inc l
    dec l
    inc hl
    inc d
    ld b, c
    ld b, d
    ld b, e
    ld b, h
    add hl, de

jr_008_4632:
    ld a, [de]
    ld hl, $1f22
    jr nz, jr_008_4675

    ld a, $3d
    ld a, $3d
    ld a, $1f
    jr nz, @+$25

    inc d
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    add hl, de
    ld a, [de]
    inc l
    dec l
    inc l
    dec l
    ld a, $3d

jr_008_464d:
    ld a, $3d
    ld a, $3d
    inc l
    dec l
    inc hl
    inc d
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    add hl, de
    ld a, [de]
    rra
    jr nz, jr_008_467d

    jr nz, jr_008_469d

    ld a, $3d
    ld a, $3d
    ld a, $1f
    jr nz, @+$25

    inc d
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    add hl, de
    ld a, [de]
    inc l
    dec l
    inc l
    dec l
    ld a, $3d

jr_008_4675:
    ld a, $3d
    ld a, $3d
    inc l
    dec l
    inc hl
    inc d

jr_008_467d:
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    add hl, de
    ld a, [de]
    ld d, l
    ld d, [hl]
    rra
    jr nz, jr_008_46a7

    jr nz, jr_008_46a9

    jr nz, jr_008_46ab

    jr nz, jr_008_46ad

    jr nz, @+$25

    inc d
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    add hl, de
    ld a, [de]
    ld e, e
    ld e, h
    inc l
    dec l
    inc l
    dec l

jr_008_469d:
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc hl
    inc d
    ld e, l
    ld e, [hl]

jr_008_46a7:
    ld e, a
    ld h, b

jr_008_46a9:
    add hl, de
    ld a, [de]

jr_008_46ab:
    ld d, l
    ld d, [hl]

jr_008_46ad:
    rra
    jr nz, jr_008_46cf

    jr nz, jr_008_46d1

    jr nz, jr_008_46d3

    jr nz, jr_008_46d5

    jr nz, jr_008_46db

    inc d
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    add hl, de
    ld a, [de]
    ld e, e
    ld e, h
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc l
    dec l
    inc hl
    inc d
    ld h, l
    ld h, [hl]

jr_008_46cf:
    ld h, a
    ld l, b

jr_008_46d1:
    add hl, de
    ld l, c

jr_008_46d3:
    ld l, d
    ld l, d

jr_008_46d5:
    ld l, d
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]

jr_008_46db:
    ld l, d
    ld l, d
    ld l, d
    ld l, d
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    db $76
    db $76
    db $76
    db $76
    ld [hl], a
    ld a, b
    ld a, c
    ld a, d
    db $76
    db $76
    db $76
    db $76
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    cp a
    nop
    ld bc, $0100
    nop
    ld bc, $0202
    nop
    inc bc
    inc b
    dec b
    ld b, $07
    ld [$0905], sp
    ld a, [bc]
    dec bc
    inc c
    dec c
    nop
    dec c
    nop
    dec c
    nop
    ld [bc], a
    ld [bc], a
    dec c
    inc bc
    ld c, $0f
    db $10
    ld de, $0f0e
    ld [de], a
    inc de
    inc d
    dec d
    nop
    ld bc, $0100
    nop
    ld bc, $0202
    nop
    inc bc
    ld d, $17
    jr jr_008_4748

    ld d, $17
    ld a, [de]
    dec de
    inc e
    dec e
    dec c
    nop
    ld e, $1e
    ld e, $1e
    ld [bc], a
    ld [bc], a
    dec c
    inc bc
    rra
    jr nz, @+$23

    ld [hl+], a
    rra
    jr nz, jr_008_4769

    inc h
    dec h

jr_008_4748:
    ld h, $00
    inc bc
    daa
    jr z, jr_008_4777

    daa
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $2b2a
    inc l
    dec l
    dec hl
    ld l, $2f
    jr nc, jr_008_478d

    ld [hl-], a
    dec c
    inc bc
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $02
    ld [bc], a
    dec c
    nop
    scf
    nop

jr_008_4769:
    jr c, @+$3b

    nop
    ld a, [hl-]
    dec sp
    nop
    nop
    inc a
    nop
    inc bc
    dec a
    ld a, $3f
    ld b, b

jr_008_4777:
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0037
    nop
    nop
    nop
    ld a, [hl-]
    ld b, c
    nop
    nop
    ld b, d
    dec c
    inc bc
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld [bc], a
    ld [bc], a

jr_008_478d:
    dec c
    nop
    ld b, a
    ld c, b
    ld c, b
    ld c, b
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    nop
    nop
    ld c, [hl]
    ld c, [hl]
    ld c, [hl]
    ld c, [hl]
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $504f
    ld d, c
    ld d, d
    ld c, a
    ld d, b
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    dec c
    nop
    dec c
    nop
    dec c
    nop
    ld [bc], a
    ld [bc], a
    dec c
    nop
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld d, a
    ld e, b
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld e, a
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    ld h, e
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld h, h
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0504
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld c, $0f
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    inc b
    dec b
    ld b, $71
    inc b
    dec b
    ld b, $71
    inc b
    dec b
    ld b, $71
    inc b
    dec b
    ld b, $07
    ld [hl], d
    ld [hl], e
    ld [hl], h
    ld [hl], l
    ld c, $0f
    db $10
    ld de, $0f0e
    db $10
    ld de, $0f0e
    db $10
    ld de, $0f0e
    db $10
    ld de, $7776
    ld a, b
    ld a, c
    ld b, $07
    ld [$0605], sp
    rlca
    ld [$0605], sp
    rlca
    ld [$0605], sp
    rlca
    ld [$7a05], sp
    ld a, e
    ld a, h
    ld a, l
    db $10
    ld de, $0f0e
    db $10
    ld de, $0f0e
    db $10
    ld de, $0f0e
    db $10
    ld de, $0f0e
    ld a, [hl]
    ld a, a
    cp [hl]
    cp a
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_48a5

    add hl, de
    ld a, [de]
    dec de
    inc e
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_48a5:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_48b9

    dec e
    ld e, $1f
    jr nz, @+$13

    ld [de], a
    inc de
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_48b9:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_48cd

    ld hl, $2322
    inc h
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_48cd:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_48e1

    dec h
    ld h, $26
    daa
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_48e1:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_48f5

    jr z, jr_008_4911

    ld h, $29
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_48f5:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_4909

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_4909:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_491d

jr_008_4911:
    ld l, $2f
    jr nc, @+$33

    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_491d:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_4931

    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_4931:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_4945

    ld [hl], $37
    jr c, jr_008_4976

    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_4945:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_4959

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_4959:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_496d

    ld a, $3f
    ld b, b
    ld b, c
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_496d:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_4981

    ld b, d

jr_008_4976:
    ld b, e
    ld b, h
    ld b, l
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_4981:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_4995

    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld de, $1312
    inc de
    inc de
    inc de
    inc d
    dec d

jr_008_4995:
    ld d, $17
    inc de
    inc de
    inc de
    inc de
    jr jr_008_49a9

    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld de, $4f4e
    ld c, a
    ld c, a
    ld c, a
    ld d, b
    ld d, c

jr_008_49a9:
    ld d, d
    ld d, e
    ld c, a
    ld c, a
    ld c, a
    ld c, a
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, e
    ld e, e
    ld e, e
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld e, e
    ld e, e
    ld e, e
    ld e, e
    ld h, b
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ld h, l
    nop
    ld bc, $0302
    nop
    ld bc, $0504
    ld b, $07
    dec b
    ld [$0302], sp
    nop
    ld bc, $0a09
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    dec c
    ld c, $11
    ld [de], a
    inc de
    inc d
    ld [de], a
    dec d
    rrca
    db $10
    dec c
    ld c, $16
    rla
    jr jr_008_4a0a

    ld [bc], a
    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $11
    ld [de], a
    ld [de], a
    ld [de], a
    ld [de], a
    dec d
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_4a25

    ld [hl+], a
    rrca
    db $10
    inc hl
    inc h
    dec h

jr_008_4a0a:
    ld h, $27
    jr z, jr_008_4a36

    jr z, jr_008_4a38

    add hl, hl
    inc hl
    inc h
    dec h
    ld h, $2a
    dec hl
    inc l
    dec l
    dec de
    inc e
    ld l, $2f
    cpl
    cpl
    jr nc, jr_008_4a52

    ld [hl-], a
    inc sp
    jr nc, jr_008_4a56

jr_008_4a25:
    cpl
    cpl
    cpl
    cpl
    inc [hl]
    dec [hl]
    ld [hl], $37
    inc hl
    inc h
    jr c, jr_008_4a43

    add hl, sp
    ld [de], a
    ld a, [hl-]
    dec sp
    inc a

jr_008_4a36:
    dec a
    ld a, [hl-]

jr_008_4a38:
    dec sp
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld a, $12
    ld [de], a
    ccf
    ld [bc], a
    inc bc

jr_008_4a43:
    jr c, jr_008_4a85

    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, c
    ld b, c
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, d

jr_008_4a52:
    ld [de], a
    ld [de], a
    ld b, e
    rrca

jr_008_4a56:
    db $10
    jr c, jr_008_4a6b

    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld b, c
    ld b, c
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    dec de
    inc e

jr_008_4a6b:
    jr c, jr_008_4aad

    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, c
    ld b, c
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    inc hl
    inc h
    jr c, jr_008_4a93

    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a

jr_008_4a85:
    ld b, c
    ld b, c
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld [bc], a
    inc bc

jr_008_4a93:
    jr c, jr_008_4ad5

    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld d, b
    ld d, c
    ld d, d
    ld d, e
    rrca
    db $10
    jr c, jr_008_4abb

    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a

jr_008_4aad:
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld b, c
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    dec de
    inc e

jr_008_4abb:
    jr c, jr_008_4afd

    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, c
    ld b, c
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    inc hl
    inc h
    jr c, jr_008_4ae3

    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a

jr_008_4ad5:
    add hl, sp
    ld [de], a
    ld b, c
    ld b, c
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld [bc], a
    inc bc

jr_008_4ae3:
    jr c, jr_008_4b25

    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, c
    ld b, c
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld h, b
    ld h, c
    ld h, d
    ld h, e
    rrca
    db $10
    jr c, jr_008_4b0b

    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a

jr_008_4afd:
    add hl, sp
    ld [de], a
    ld b, c
    ld b, c
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    dec de
    inc e

jr_008_4b0b:
    jr c, jr_008_4b4d

    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld b, c
    ld b, c
    ld [de], a
    ld b, b
    ld [de], a
    ld b, b
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    inc hl
    inc h
    jr c, @+$14

    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a

jr_008_4b25:
    add hl, sp
    ld [de], a
    ld b, c
    ld b, c
    add hl, sp
    ld [de], a
    add hl, sp
    ld [de], a
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]

jr_008_4b4d:
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    inc de
    inc d
    inc de
    inc d
    dec d
    ld d, $13
    inc d
    inc de
    inc d
    rla
    inc c
    jr jr_008_4b84

    ld a, [de]
    dec de
    ld de, $1c12
    dec e
    inc e
    dec e
    inc e
    dec e
    ld e, $1f
    inc e
    dec e
    inc e
    dec e
    rla
    inc c
    jr nz, jr_008_4ba0

    ld [hl+], a
    inc hl
    ld de, $2412

jr_008_4b84:
    dec h
    inc de
    inc d
    inc h
    dec h
    ld h, $27
    daa
    daa
    daa
    jr z, jr_008_4ba7

    inc c
    add hl, hl
    ld a, [hl+]
    dec hl
    inc l
    ld de, $2d12
    ld l, $1c
    dec e
    dec l
    ld l, $2f
    jr nc, jr_008_4bd1

jr_008_4ba0:
    ld sp, $3230
    rla
    inc c
    inc sp
    inc [hl]

jr_008_4ba7:
    inc [hl]
    dec [hl]
    ld de, $2412
    dec h
    inc de
    inc d
    inc h
    dec h
    ld [hl], $37
    inc de
    inc d
    inc de
    inc d
    rla
    inc c
    jr c, jr_008_4bef

    inc [hl]
    add hl, sp
    ld de, $2d12
    ld l, $1c
    dec e
    dec l
    ld l, $3a
    dec sp
    inc e
    dec e
    inc e
    dec e
    rla
    inc c
    inc a
    dec a
    ld a, $3f

jr_008_4bd1:
    ld de, $2412
    dec h
    inc de
    inc d
    ld b, b
    ld b, c
    inc de
    inc d
    inc de
    inc d
    inc h
    dec h
    rla
    inc c
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    ld de, $2d12
    ld l, $1c
    dec e
    inc e
    dec e
    inc e
    dec e

jr_008_4bef:
    inc e
    dec e
    dec l
    ld l, $17
    inc c
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld de, $4012
    ld b, c
    inc de
    inc d
    inc h
    dec h
    inc de
    inc d
    inc de
    inc d
    ld b, b
    ld b, c
    rla
    inc c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld de, $1c12
    dec e
    inc e
    dec e
    dec l
    ld l, $1c
    dec e
    inc e
    dec e
    inc e
    dec e
    rla
    inc c
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld de, $1312
    inc d
    inc de
    inc d
    ld b, b
    ld b, c
    inc de
    inc d
    inc de
    inc d
    inc h
    dec h
    rla
    inc c
    ld d, d
    ld d, e
    ld d, h
    ld d, l
    ld de, $1c12
    dec e
    inc e
    dec e
    inc e
    dec e
    inc e
    dec e
    inc e
    dec e
    dec l
    ld l, $17
    inc c
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld de, $1312
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    ld b, b
    ld b, c
    rla
    inc c
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    ld de, $1c12
    dec e
    inc e
    dec e
    inc e
    dec e
    inc e
    dec e
    inc e
    dec e
    inc e
    dec e
    rla
    inc c
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld de, $6362
    ld h, e
    ld h, e
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld a, b
    ld a, c
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    inc bc
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_008_4cdd

    jr jr_008_4cdf

    jr jr_008_4ce3

    ld a, [de]
    rla
    jr jr_008_4ce5

    jr @+$1d

    db $10
    inc e
    dec e
    ld e, $1f
    dec d
    ld d, $20
    ld hl, $2120
    jr nz, jr_008_4cfe

jr_008_4cdd:
    ld [hl+], a
    inc hl

jr_008_4cdf:
    jr nz, @+$23

    jr nz, @+$23

jr_008_4ce3:
    dec de
    db $10

jr_008_4ce5:
    inc h
    dec h
    ld h, $27
    dec d
    ld d, $28
    add hl, hl
    rla
    jr jr_008_4d07

    jr jr_008_4d1c

    dec hl
    dec hl
    dec hl
    dec hl
    inc l
    dec de
    db $10
    dec l
    ld l, $2f
    jr nc, @+$17

jr_008_4cfe:
    ld d, $31
    ld [hl-], a
    jr nz, jr_008_4d24

    jr nz, jr_008_4d26

    inc sp
    inc [hl]

jr_008_4d07:
    dec [hl]
    dec [hl]
    inc [hl]
    ld [hl], $1b
    db $10
    scf
    jr c, jr_008_4d48

    add hl, sp
    dec d
    ld d, $3a
    dec sp
    rla
    jr jr_008_4d2f

    jr jr_008_4d31

    jr jr_008_4d33

jr_008_4d1c:
    jr jr_008_4d35

    jr @+$1d

    db $10
    inc a
    jr c, jr_008_4d5c

jr_008_4d24:
    dec a
    dec d

jr_008_4d26:
    ld d, $3e
    ccf
    jr nz, jr_008_4d4c

    jr nz, jr_008_4d4e

    jr nz, jr_008_4d50

jr_008_4d2f:
    jr nz, @+$23

jr_008_4d31:
    jr nz, @+$23

jr_008_4d33:
    dec de
    db $10

jr_008_4d35:
    ld b, b
    ld b, c
    ld b, d
    ld b, e
    dec d
    ld d, $17
    jr jr_008_4d55

    jr @+$3c

    dec sp
    rla
    jr jr_008_4d5b

    jr jr_008_4d5d

    jr @+$1d

jr_008_4d48:
    db $10
    ld b, h
    ld b, l
    ld b, [hl]

jr_008_4d4c:
    ld b, a
    dec d

jr_008_4d4e:
    ld d, $20

jr_008_4d50:
    ld hl, $2120
    ld a, $3f

jr_008_4d55:
    jr nz, jr_008_4d78

    jr nz, @+$23

    jr nz, @+$23

jr_008_4d5b:
    dec de

jr_008_4d5c:
    db $10

jr_008_4d5d:
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    dec d
    ld d, $17
    jr jr_008_4da0

    dec sp
    jr z, jr_008_4d92

    ld a, [hl-]
    dec sp
    rla
    jr jr_008_4d85

    jr @+$1d

    db $10
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    dec d
    ld d, $20

jr_008_4d78:
    ld hl, $3f3e
    ld sp, $3e32
    ccf
    jr nz, @+$23

    jr nz, @+$23

    dec de
    db $10

jr_008_4d85:
    ld d, b
    ld d, c
    ld d, d
    ld d, e
    dec d
    ld d, $17
    jr jr_008_4da5

    jr @+$3c

    dec sp
    rla

jr_008_4d92:
    jr jr_008_4dab

    jr jr_008_4dad

    jr @+$1d

    db $10
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    dec d
    ld d, $20

jr_008_4da0:
    ld hl, $2120
    ld a, $3f

jr_008_4da5:
    jr nz, jr_008_4dc8

    jr nz, @+$23

    jr nz, @+$23

jr_008_4dab:
    dec de
    db $10

jr_008_4dad:
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    dec d
    ld d, $17
    jr jr_008_4dcd

    jr jr_008_4dcf

    jr jr_008_4dd1

    jr jr_008_4e18

    ld e, l
    ld e, [hl]
    ld e, a
    dec de
    db $10
    ld h, b
    ld h, c
    ld h, d
    ld h, e
    dec d
    ld d, $20

jr_008_4dc8:
    ld hl, $2120
    jr nz, jr_008_4dee

jr_008_4dcd:
    jr nz, jr_008_4df0

jr_008_4dcf:
    ld h, h
    ld h, l

jr_008_4dd1:
    ld h, [hl]
    ld h, a
    dec de
    db $10
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    dec d
    ld l, h
    ld l, l
    ld l, l
    ld l, l
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld l, l
    ld l, l
    ld l, l
    ld l, l
    ld [hl], d
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld a, b

jr_008_4dee:
    ld a, c
    ld a, c

jr_008_4df0:
    ld a, c
    ld a, c
    ld a, c
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, c
    ld a, c
    ld a, c
    ld a, c
    ld a, [hl]
    ld a, a
    cp h
    cp l
    cp [hl]
    cp a
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $06
    ld b, $06
    rlca
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312

jr_008_4e18:
    inc d
    inc b
    rlca
    ld b, $06
    ld b, $06
    dec d
    ld [$1716], sp
    jr jr_008_4e3e

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_4e4e

    rra
    ld [hl+], a
    ld b, $06
    ld b, $06
    ld e, $1f
    jr nz, @+$23

    rra
    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27

jr_008_4e3e:
    rlca
    jr z, jr_008_4e6a

    rlca
    ld a, [hl+]
    ld b, $06
    ld b, $06
    daa
    rlca
    jr z, jr_008_4e74

    rlca
    ld a, [hl+]
    dec hl

jr_008_4e4e:
    inc l
    dec l
    ld l, $27
    rlca
    rlca
    rlca
    rlca
    ld a, [hl+]
    ld b, $06
    ld b, $06
    daa
    rlca
    rlca
    rlca
    rlca
    ld a, [hl+]
    cpl
    jr nc, jr_008_4e95

    ld [hl-], a
    inc sp
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]

jr_008_4e6a:
    dec [hl]
    ld b, $06
    ld b, $06
    inc sp
    inc [hl]
    inc [hl]
    inc [hl]
    inc [hl]

jr_008_4e74:
    dec [hl]
    ld [hl], $07
    rlca
    scf
    jr c, jr_008_4eb4

    ld a, [hl-]
    dec sp
    jr c, @+$3b

    ld b, $06
    ld b, $06
    jr c, @+$3b

    ld a, [hl-]
    dec sp
    jr c, @+$3b

    inc a
    rlca
    rlca
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld a, $3f
    ld b, $06

jr_008_4e95:
    ld b, $06
    ld a, $3f
    ld b, b
    ld b, c
    ld a, $3f
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    rlca
    dec b
    ld b, $06
    ld b, [hl]
    ld b, a
    ld b, $06
    ld b, $06
    rlca
    dec b
    ld b, $06
    rlca
    dec b
    ld c, b
    ld c, c
    ld c, d

jr_008_4eb4:
    ld c, e
    dec d
    rlca
    ld b, $06
    ld c, h
    ld c, l
    ld b, $06
    ld b, $06
    dec d
    rlca
    ld b, $06
    dec d
    rlca
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld d, d
    ld d, e
    ld d, h
    ld d, l
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld b, $06
    ld b, $06
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    dec d
    rlca
    dec d
    rlca
    dec d
    rlca
    ld b, $06
    ld b, $06
    dec d
    rlca
    dec d
    rlca
    dec d
    rlca
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld b, $06
    ld b, $06
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld h, d
    ld h, e
    ld h, h
    ld h, l
    dec d
    rlca
    dec d
    rlca
    dec d
    rlca
    ld b, $06
    ld b, $06
    dec d
    rlca
    dec d
    rlca
    dec d
    rlca
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld b, $06
    ld b, $06
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    dec d
    rlca
    dec d
    rlca
    dec d
    rlca
    ld b, $06
    ld b, $06
    dec d
    rlca
    dec d
    rlca
    dec d
    rlca
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    inc de
    inc d
    dec d
    ld d, $17
    jr jr_008_4faf

    inc d
    inc de
    inc d
    add hl, de
    inc c
    ld a, [de]
    dec de
    inc e
    dec e
    ld de, $1e12
    rra
    ld e, $1f
    jr nz, @+$23

    ld [hl+], a
    inc hl

jr_008_4faf:
    ld e, $1f
    ld e, $1f
    add hl, de
    inc c
    inc h
    dec h
    ld h, $27
    ld de, $2812
    add hl, hl
    inc de
    inc d
    ld a, [hl+]
    dec hl
    ld a, [hl+]
    dec hl
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    inc l
    dec l
    ld l, $2f
    ld de, $3012
    ld sp, $1f1e
    dec hl
    ld a, [hl+]
    dec hl
    ld a, [hl+]
    ld e, $1f
    ld e, $1f
    add hl, de
    inc c
    ld [hl-], a
    inc sp
    inc sp
    inc [hl]
    ld de, $3635
    ld [hl], $36
    ld [hl], $36
    ld [hl], $36
    ld [hl], $13
    inc d
    ld [hl], $36
    scf
    jr c, jr_008_502b

    inc sp
    inc sp
    ld a, [hl-]
    dec sp
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    inc a
    ld e, $1f
    inc a
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d
    nop
    ld bc, $4443
    ld b, l
    ld b, [hl]
    ld b, l
    ld b, [hl]
    ld b, l
    ld b, [hl]
    inc de
    inc d
    ld bc, $0201
    inc bc
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld [$4b09], sp
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, l
    ld c, [hl]
    ld c, l
    ld c, [hl]
    ld e, $1f
    ld a, [bc]
    ld a, [bc]

jr_008_502b:
    dec bc
    inc c
    ld c, a
    ld d, b
    ld d, c
    ld d, d
    ld de, $1312
    inc d
    ld c, l
    ld c, [hl]
    ld c, l
    ld c, [hl]
    ld c, l
    ld c, [hl]
    inc de
    inc d
    ld b, l
    ld b, [hl]
    add hl, de
    inc c
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld de, $1e12
    rra
    ld e, $1f
    ld e, $1f
    ld e, $1f
    ld e, $1f
    ld d, a
    ld e, b
    add hl, de
    inc c
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ld de, $1312
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    ld e, l
    ld e, [hl]
    add hl, de
    inc c
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    ld de, $1e12
    rra
    ld e, $1f
    ld e, $1f
    ld e, $1f
    ld e, $1f
    ld e, $1f
    add hl, de
    inc c
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld de, $1312
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld de, $1e12
    rra
    ld e, $1f
    ld e, $1f
    ld e, $1f
    ld e, $1f
    ld e, $1f
    add hl, de
    inc c
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld de, $3635
    ld [hl], $36
    ld [hl], $6f
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], $36
    ld [hl], $36
    scf
    jr c, jr_008_512d

    ld [hl], h
    ld [hl], l
    db $76
    dec sp
    inc a
    inc a
    inc a
    inc a
    inc a
    ld [hl], a
    ld a, b
    ld a, c
    ld a, d
    inc a
    inc a
    inc a
    inc a
    dec a
    ld a, $7b
    ld a, h
    ld a, l
    ld a, [hl]
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    dec b
    ld [$0a09], sp
    dec bc
    inc c
    nop
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_008_5106

    rla
    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $12
    inc de
    rra
    jr nz, jr_008_5119

    ld [hl+], a
    ld [bc], a
    inc bc
    inc hl
    inc hl
    ld d, $17
    rla
    rla
    rla
    ld a, [de]
    inc hl
    inc hl
    add hl, bc

jr_008_5106:
    ld a, [bc]
    dec bc
    inc c
    inc h
    dec h
    ld h, $27
    inc d
    dec d
    jr z, jr_008_5139

    add hl, hl
    ld a, [hl+]
    ld a, [hl+]
    ld a, [hl+]
    ld a, [hl+]
    dec hl
    jr z, jr_008_5141

jr_008_5119:
    dec de
    inc e
    dec e
    ld e, $2c
    dec l
    ld l, $2f
    jr nc, jr_008_5153

    jr nc, jr_008_5155

    ld sp, $3332
    inc [hl]
    ld sp, $3032
    dec [hl]

jr_008_512d:
    ld [hl], $0c
    nop
    ld bc, $3837
    add hl, sp
    ld a, [hl-]
    dec sp
    rla
    dec sp
    rla

jr_008_5139:
    inc a
    dec a
    ld a, $3f
    inc a
    dec a
    dec sp
    ld b, b

jr_008_5141:
    dec e
    ld e, $12
    inc de
    ld b, c
    rla
    rla
    ld b, d
    rla
    ld b, e
    rla
    ld b, e
    rla
    ld b, e
    ld b, h
    ld b, h
    rla
    ld b, e

jr_008_5153:
    rla
    ld b, b

jr_008_5155:
    add hl, bc
    ld a, [bc]
    dec bc
    inc c
    ld b, l
    rla
    rla
    ld b, [hl]
    dec sp
    rla
    dec sp
    rla
    dec sp
    rla
    ld b, h
    ld b, h
    dec sp
    rla
    dec sp
    ld b, b
    dec de
    inc e
    dec e
    ld e, $47
    ld c, b
    ld c, c
    ld c, d
    rla
    ld b, e
    rla
    ld b, e
    ld c, e
    ld c, h
    ld c, e
    ld c, h
    ld c, e
    ld c, h
    rla
    ld b, b
    ld [hl], $0c
    nop
    ld bc, $4e4d
    ld c, a
    ld d, b
    dec sp
    rla
    dec sp
    rla
    ld d, c
    ld d, d
    ld d, e
    ld d, e
    ld d, h
    ld c, e
    dec sp
    ld b, b
    dec e
    ld e, $12
    inc de
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld b, h
    ld b, h
    ld b, h
    ld b, h
    ld c, e
    ld e, c
    ld e, d
    ld e, d
    ld e, e
    ld c, h
    rla
    ld b, b
    add hl, bc
    ld a, [bc]
    dec bc
    inc c
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld b, h
    ld b, h
    ld b, h
    ld b, h
    ld d, c
    ld e, c
    ld e, d
    ld e, d
    ld e, e
    ld c, e
    dec sp
    ld b, b
    dec de
    inc e
    dec e
    ld e, $60
    ld h, c
    ld h, d
    ld h, e
    rla
    ld b, e
    rla
    ld b, e
    ld c, e
    ld h, h
    ld h, l
    ld h, l
    ld h, [hl]
    ld c, h
    rla
    ld b, b
    ld [hl], $0c
    nop
    ld bc, $6867
    ld l, c
    ld l, d
    dec sp
    rla
    dec sp
    rla
    ld d, c
    ld c, e
    ld d, c
    ld c, e
    ld d, c
    ld c, e
    ld l, e
    ld l, h
    dec e
    ld e, $12
    inc de
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    rla
    ld b, e
    rla
    ld b, e
    rla
    ld b, e
    ld b, h
    ld b, h
    rla
    ld b, b
    ld [hl], $0c
    nop
    ld bc, $0c0b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], h
    dec sp
    rla
    dec sp
    rla
    dec sp
    rla
    ld b, h
    ld b, h
    dec sp
    ld b, b
    dec e
    ld e, $12
    inc de
    dec e
    ld e, $75
    db $76
    ld [hl], a
    ld a, b
    rla
    ld b, e
    rla
    ld b, e
    rla
    ld b, e
    ld b, h
    ld b, h
    rla
    ld b, b
    add hl, bc
    ld a, [bc]
    dec bc
    inc c
    nop
    ld bc, $7a79
    ld a, e
    ld a, h
    dec sp
    rla
    dec sp
    rla
    dec sp
    rla
    ld b, h
    ld b, h
    dec sp
    ld b, b
    dec de
    inc e
    dec e
    ld e, $12
    inc de
    ld a, l
    ld a, [hl]
    ld a, a
    cp a
    nop
    ld bc, $0100
    nop
    ld bc, $0302
    inc b
    dec b
    nop
    ld bc, $0100
    nop
    ld bc, $0706
    ld [$0109], sp
    nop
    ld bc, $0100
    nop
    ld [bc], a
    inc bc
    inc b
    dec b
    ld bc, $0100
    nop
    ld bc, $0a00
    dec bc
    inc c
    dec c
    ld c, $0e
    ld c, $0e
    ld c, $0e
    ld [bc], a
    inc bc
    inc b
    dec b
    ld c, $0e
    ld c, $0e
    ld c, $0e
    rrca
    db $10
    ld de, $0e12
    ld c, $0e
    ld c, $0e
    ld c, $02
    inc bc
    inc b
    dec b
    ld c, $0e
    ld c, $0e
    ld c, $0e
    inc de
    inc d
    dec d
    ld d, $0e
    ld c, $0e
    ld c, $0e
    ld c, $02
    inc bc
    inc b
    dec b
    ld c, $0e
    ld c, $0e
    ld c, $0e
    rla
    jr jr_008_52b5

    ld a, [de]
    ld c, $0e
    ld c, $0e
    ld c, $0e
    ld [bc], a
    inc bc
    inc b
    dec b
    ld c, $0e
    ld c, $0e
    ld c, $0e
    dec de
    inc e
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_52d5

jr_008_52b5:
    rra
    ld hl, $0302
    inc b
    dec b
    ld [hl+], a
    rra
    jr nz, jr_008_52df

    jr nz, jr_008_52e4

    inc h
    inc e
    inc e
    dec h
    ld h, $27
    ld bc, $0100
    jr z, jr_008_52ce

    inc bc
    inc b

jr_008_52ce:
    dec b
    add hl, hl
    nop
    ld bc, $2a00
    dec hl

jr_008_52d5:
    inc l
    dec l
    ld l, $2f
    ld h, $30
    nop
    ld bc, $3100

jr_008_52df:
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    inc sp

jr_008_52e4:
    ld bc, $0100
    inc [hl]
    dec hl
    dec [hl]
    ld [hl], $37
    jr c, jr_008_5314

    jr nc, jr_008_52f1

    nop

jr_008_52f1:
    ld bc, $3239
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld a, [hl-]
    nop
    ld bc, $3400
    dec hl
    dec sp
    inc a
    dec a
    ld a, $26
    jr nc, jr_008_5343

    ld b, b
    ld b, b
    ld b, b
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld b, b
    ld b, b
    ld b, b
    ld b, c
    inc [hl]
    ld b, d
    ld b, e
    ld b, h
    ld b, l

jr_008_5314:
    ld b, [hl]
    ld h, $30
    ld b, a
    inc e
    ld c, b
    inc e
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld c, b
    inc e
    ld c, b
    ld c, c
    inc sp
    nop
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    jr nc, jr_008_5373

    ld c, a
    inc e
    ld c, a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld d, b
    ld d, c
    inc e
    ld c, c
    inc sp
    ld bc, $5352
    ld d, h
    ld d, l
    ld d, [hl]
    ld sp, $1c47
    ld c, b
    inc e

jr_008_5343:
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld d, a
    ld e, b
    ld c, b
    ld c, c
    ld a, [hl-]
    nop
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    nop
    ld sp, $4f47
    inc e
    ld c, a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    inc e
    ld c, a
    inc e
    ld c, c
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    ld bc, $6339
    ld h, h
    ld c, b
    inc e
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld c, b
    inc e
    ld h, h
    ld h, l

jr_008_5373:
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    ld e, l
    ld e, [hl]
    ld l, h
    ld l, l
    ld b, a
    ld c, a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    inc e
    ld c, c
    ld e, l
    ld e, [hl]
    ld l, h
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld h, [hl]
    ld h, a
    ld [hl], e
    ld [hl], h
    ld b, a
    inc e
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld c, b
    ld c, c
    ld h, [hl]
    ld h, a
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld a, b
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
    ld bc, $0302
    inc b
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
    dec b
    ld b, $07
    ld [$0000], sp
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
    add hl, bc
    ld a, [bc]
    dec bc
    inc c
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
    dec c
    ld c, $0f
    stop
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
    ld de, $1312
    inc d
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
    dec d
    ld d, $16
    rla
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
    jr jr_008_5441

    ld d, $19
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
    ld a, [de]
    dec de
    inc e
    dec e

jr_008_5441:
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
    ld e, $1f
    jr nz, jr_008_5476

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
    ld [hl+], a
    inc hl
    inc h
    dec h
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

jr_008_5476:
    nop
    nop
    nop
    ld h, $27
    jr z, jr_008_54a6

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
    ld a, [hl+]
    dec hl
    inc l
    dec l
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, $2f
    jr nc, jr_008_54cc

    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl-], a
    inc sp
    inc [hl]
    dec [hl]
    nop

jr_008_54a6:
    nop
    nop
    nop
    nop
    nop
    ld [hl], $37
    jr c, jr_008_54e8

    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl-]
    dec sp
    inc a
    dec a
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
    ld a, $3f
    ld b, b

jr_008_54cc:
    ld b, c
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
    ld b, d
    ld b, e
    ld b, h
    ld b, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_008_54e8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
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
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    nop
    ld bc, $0101
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld bc, $0101
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1210
    inc de
    db $10
    inc d
    dec d
    ld d, $10
    db $10
    db $10
    rla
    jr jr_008_5547

    ld a, [de]
    dec de
    inc e
    ld c, $1d
    ld e, $1f
    jr nz, @+$23

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $1e
    ld e, $1e
    daa
    jr jr_008_556a

    add hl, hl
    ld a, [hl+]
    dec hl
    ld c, $1d

jr_008_5547:
    ld e, $2c
    dec l
    ld l, $2f
    jr nc, jr_008_557f

    ld [hl-], a
    inc sp
    ld e, $1e
    ld e, $27
    jr jr_008_558a

    dec [hl]
    ld [hl], $37
    ld c, $1d
    ld e, $38
    add hl, sp
    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld e, $1e
    daa
    jr jr_008_55ab

jr_008_556a:
    ld b, d
    ld b, e
    ld b, h
    ld c, $1d
    ld e, $45
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld e, $1e
    daa
    jr jr_008_55cc

    ld c, e

jr_008_557f:
    ld c, e
    ld c, a
    ld c, $1d
    ld e, $1e
    ld e, $1e
    ld d, b
    ld d, c
    ld d, d

jr_008_558a:
    ld d, e
    ld d, h
    ld d, l
    ld e, $1e
    daa
    jr @+$58

    ld c, e
    ld c, e
    ld d, a
    ld c, $1d
    ld e, $1e
    ld e, $1e
    ld e, b
    ld e, c
    ld e, d
    ld e, d
    ld e, e
    ld e, h
    ld e, $1e
    daa
    jr jr_008_5603

    ld e, [hl]
    ld e, a
    ld h, b
    ld c, $1d

jr_008_55ab:
    ld e, $1e
    ld e, $1e
    ld h, c
    ld h, d
    ld c, e
    ld c, e
    ld h, e
    ld h, h
    ld e, $1e
    daa
    jr jr_008_561f

    ld h, [hl]
    ld h, a
    ld l, b
    ld c, $1d
    ld e, $1e
    ld e, $1e
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld e, $1e
    daa

jr_008_55cc:
    jr jr_008_563d

    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld c, $1d
    ld e, $1e

jr_008_55d5:
    ld e, $1e
    ld e, $73
    ld [hl], h
    ld [hl], l
    db $76
    ld e, $1e
    ld e, $27
    jr jr_008_5659

    ld a, b
    ld a, c
    ld a, d
    ld c, $1d
    ld e, $1e
    ld e, $1e
    ld e, $7b

jr_008_55ed:
    ld a, h
    ld a, l
    ld e, $1e
    ld e, $1e
    daa
    jr @+$80

    ld a, a
    add [hl]
    add a
    ld c, $1d
    ld e, $1e
    ld e, $1e
    adc b
    adc c
    adc d
    adc e

jr_008_5603:
    ld e, $8c
    adc l
    adc [hl]
    adc a
    sub b
    sub c
    sub d
    sub e
    sub h
    ld c, $1d
    ld e, $1e
    ld e, $1e
    sub l
    sub [hl]
    sub a
    sbc b
    sbc c
    sbc d
    sbc e
    sbc h
    sbc l
    sbc [hl]
    sbc a
    and b

jr_008_561f:
    and c
    and d
    ld c, $1d
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    ld e, $1e
    daa
    jr jr_008_55d5

    and h
    and l
    and [hl]
    ld c, $1d
    ld e, $1e
    ld e, $1e
    ld e, $1e

jr_008_563d:
    ld e, $1e
    ld e, $1e
    ld e, $1e
    daa
    jr jr_008_55ed

    xor b
    xor c
    xor d
    xor e
    xor h
    xor l
    xor l
    xor l
    xor l
    xor [hl]
    xor a
    xor l
    xor l
    xor l
    xor l
    xor l
    xor l
    or b
    or c

jr_008_5659:
    or d
    or e
    or h
    or l
    or [hl]
    or a
    or a
    or a
    or a
    or a
    cp b
    cp c
    or a
    or a
    or a
    or a
    or a
    or a
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp a
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $06
    ld [bc], a
    inc bc
    ld b, $06
    ld b, $06
    rlca
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $0612
    ld b, $0f
    db $10
    ld b, $06
    ld b, $06
    inc de
    inc d
    dec d
    ld d, $17
    jr jr_008_56b3

    ld a, [de]
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
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_56cf

    ld [hl+], a
    inc hl
    ld [hl+], a
    inc hl
    ld [hl+], a

jr_008_56b3:
    inc hl
    ld [hl+], a
    inc hl
    ld [hl+], a
    inc hl
    ld [hl+], a
    inc hl
    ld [hl+], a
    inc h
    dec h
    ld h, $27
    jr z, jr_008_56ea

    ld hl, $2223
    inc hl
    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    ld [hl+], a
    inc hl
    ld [hl+], a
    inc hl

jr_008_56cf:
    ld [hl+], a
    dec h
    jr nc, jr_008_5704

    ld [hl-], a
    inc sp
    inc [hl]
    ld [hl+], a
    inc hl
    ld [hl+], a
    dec [hl]
    ld [hl], $37
    jr c, jr_008_5717

    ld a, [hl-]
    inc hl
    ld [hl+], a
    inc hl
    ld [hl+], a
    inc hl
    dec sp
    inc a
    dec a
    dec a
    ld a, $3f

jr_008_56ea:
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ld b, c
    dec a
    dec a
    ld b, d
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e

jr_008_5704:
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b

jr_008_5717:
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ld c, c
    ld c, d
    ccf
    ld b, b
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld c, a
    ld d, b
    ld b, e
    ld b, h
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    ccf
    ld b, b
    ld c, c
    ld c, d
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld b, e
    ld b, h
    ld c, a
    ld d, b
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ccf
    ld b, b
    ccf
    ld b, b
    ld c, c
    ld c, d
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld c, a
    ld d, b
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld b, e
    ld b, h
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], h
    nop
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    inc de
    inc d
    dec d
    ld d, $17
    jr jr_008_581f

    inc d
    inc de
    inc d
    add hl, de
    inc c
    ld a, [de]
    dec de
    inc e
    dec e
    ld de, $1412
    inc de
    inc d
    inc de
    ld e, $1f
    jr nz, jr_008_5840

jr_008_581f:
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c
    ld [hl+], a
    inc hl
    inc h
    dec h
    ld de, $1312
    inc d
    inc de
    inc d
    ld h, $27
    ld h, $27
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    jr z, jr_008_5864

    ld a, [hl+]
    dec hl
    ld de, $1412

jr_008_5840:
    inc de
    inc d
    inc de
    inc l
    dec l
    inc l
    dec l
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c
    ld l, $2f
    cpl
    jr nc, @+$13

    ld [de], a
    inc de
    inc d
    inc de
    inc d
    ld h, $27
    ld h, $27
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    ld sp, $2f2f

jr_008_5864:
    ld [hl-], a
    ld de, $1412
    inc de
    inc d
    inc de
    inc l
    dec l
    inc l
    dec l
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $11
    ld [de], a
    inc de
    inc d
    inc de
    inc d
    ld h, $27
    ld h, $27
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    scf
    jr c, jr_008_58c5

    ld a, [hl-]
    ld de, $1412
    inc de
    inc d
    inc de
    inc l
    dec l
    inc l
    dec l
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c
    dec sp
    inc a
    dec a
    ld a, $11
    ld [de], a
    inc de
    inc d
    inc de
    inc d
    ld h, $27
    ld h, $27
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    ccf
    ld b, b
    ld b, c
    ld b, d
    ld de, $1412
    inc de
    inc d
    inc de
    inc l
    dec l
    inc l
    dec l
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c

jr_008_58c5:
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld de, $1312
    inc d
    inc de
    inc d
    ld h, $27
    ld h, $27
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld de, $1412
    inc de
    inc d
    inc de
    inc l
    dec l
    inc l
    dec l
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld de, $1312
    inc d
    inc de
    inc d
    ld h, $27
    ld h, $27
    inc de
    inc d
    inc de
    inc d
    add hl, de
    inc c
    ld c, a
    ld d, b
    ld d, c
    ld d, d
    ld de, $1412
    inc de
    inc d
    inc de
    inc l
    dec l
    inc l
    dec l
    inc d
    inc de
    inc d
    inc de
    add hl, de
    inc c
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld de, $5857
    ld e, b
    ld e, b
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ld e, b
    ld e, b
    ld e, b
    ld e, b
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ld h, h
    ld h, h
    ld h, h
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    ld h, h
    ld h, h
    ld h, h
    ld h, h
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    nop
    nop
    ld bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0002
    nop
    inc bc
    inc b
    dec b
    ld b, $00
    nop
    ld bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0002
    nop
    rlca
    ld [$0a09], sp
    nop
    nop
    ld bc, $0002
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0002
    nop
    dec bc
    inc c
    dec c
    ld c, $00
    nop
    ld bc, $0002
    rrca
    db $10
    ld de, $1110
    ld [de], a
    nop
    ld bc, $0002
    nop
    inc de
    inc d
    dec d
    ld d, $00
    nop
    ld bc, $0002
    rla
    jr jr_008_59b2

    ld a, [de]
    dec de
    inc e
    nop
    ld bc, $0002
    nop
    dec e
    ld e, $1f
    jr nz, @+$23

    ld hl, $2322
    ld hl, $2524
    ld h, $26
    daa
    jr z, jr_008_59d2

    ld [hl+], a

jr_008_59b2:
    inc hl
    ld hl, $2921
    ld a, [hl+]
    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld a, [hl+]
    ld l, $2a
    ld l, $2f
    jr nc, jr_008_59f3

    ld [hl-], a
    ld a, [hl+]
    ld l, $2a
    ld l, $33
    inc [hl]
    dec [hl]
    ld a, [hl+]
    ld a, [hl+]
    ld [hl], $2c
    dec l
    scf
    ld a, [hl+]
    scf

jr_008_59d2:
    ld a, [hl+]
    cpl
    jr nc, jr_008_5a07

    ld [hl-], a
    scf
    ld a, [hl+]
    scf
    ld a, [hl+]
    inc sp
    inc [hl]
    jr c, jr_008_5a18

    ld a, [hl-]
    dec sp
    inc l
    dec l
    ld a, [hl+]
    ld l, $2a
    ld l, $2f
    jr nc, jr_008_5a1b

    ld [hl-], a
    ld a, [hl+]
    ld l, $2a
    ld l, $33
    inc [hl]
    inc a
    dec a

jr_008_59f3:
    ld a, $3f
    inc l
    dec l
    scf
    ld a, [hl+]
    scf
    ld a, [hl+]
    cpl
    jr nc, jr_008_5a2f

    ld [hl-], a
    scf
    ld a, [hl+]
    scf
    ld a, [hl+]
    inc sp
    inc [hl]
    ld b, b
    ld b, c

jr_008_5a07:
    ld b, d
    ld b, e
    inc l
    ld b, h
    ld b, l
    ld b, l
    ld b, [hl]
    ld b, a
    cpl
    jr nc, jr_008_5a43

    ld [hl-], a
    ld c, b
    ld b, [hl]
    ld b, l
    ld b, l
    ld c, c

jr_008_5a18:
    inc [hl]
    ld c, d
    ld c, e

jr_008_5a1b:
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld c, a
    ld d, b
    ld d, c
    cpl
    jr nc, jr_008_5a57

    ld [hl-], a
    ld d, d
    ld c, a
    ld d, b
    ld c, a
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]

jr_008_5a2f:
    ld d, a
    ld e, b
    ld c, [hl]
    ld d, b
    ld c, a
    ld d, b
    ld c, a
    ld d, h
    cpl
    jr nc, jr_008_5a6b

    ld [hl-], a
    ld c, [hl]
    ld d, b
    ld c, a
    ld d, b
    ld c, a
    ld d, h
    ld e, c
    ld e, d

jr_008_5a43:
    ld e, e
    ld e, h
    ld e, l
    ld c, a
    ld d, b
    ld c, a
    ld d, b
    ld e, [hl]
    cpl
    jr nc, jr_008_5a7f

    ld [hl-], a
    ld e, l
    ld c, a
    ld d, b
    ld c, a
    ld d, b
    ld e, [hl]
    ld e, a
    ld h, b

jr_008_5a57:
    ld h, c
    ld h, d
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    cpl
    jr nc, jr_008_5a93

    ld [hl-], a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, h
    ld h, l

jr_008_5a6b:
    ld h, [hl]
    ld h, a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    cpl
    jr nc, jr_008_5aa7

    ld [hl-], a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld l, b
    ld l, c

jr_008_5a7f:
    ld l, d
    ld l, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    cpl
    jr nc, @+$33

    ld [hl-], a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld l, h
    ld l, l

jr_008_5a93:
    ld l, [hl]
    ld l, a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    cpl
    jr nc, @+$33

    ld [hl-], a
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld [hl], b
    ld [hl], c

jr_008_5aa7:
    ld [hl], d
    ld [hl], e
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
    ld bc, $0302
    inc b
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
    dec b
    ld b, $07
    ld [$0000], sp
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
    add hl, bc
    ld a, [bc]
    dec bc
    inc c
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
    dec c
    ld c, $0f
    stop
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
    ld de, $1312
    inc d
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
    dec d
    ld d, $16
    rla
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_008_5b43

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [de]
    ld d, $16
    dec de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc e
    dec e
    nop
    nop
    nop
    nop
    nop

jr_008_5b43:
    nop
    nop
    ld e, $1f
    jr nz, jr_008_5b6a

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl+], a
    inc hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc h
    dec h
    ld h, $27
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

jr_008_5b6a:
    nop
    nop
    nop
    jr z, jr_008_5b98

    ld a, [hl+]
    dec hl
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
    inc l
    dec l
    ld l, $2f
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
    jr nc, jr_008_5bc8

    ld [hl-], a

jr_008_5b98:
    inc sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_008_5be0

    nop
    nop
    ld a, [hl-]
    dec sp
    inc a
    dec a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d
    ld b, e
    nop
    nop
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_008_5bc8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, b
    ld c, c
    ld c, d
    ld c, e
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

jr_008_5be0:
    nop
    nop
    nop
    nop
    nop
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
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
    ld d, b
    ld d, c
    ld d, d
    ld d, e
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
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_008_5c44

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_5c54

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_008_5c64

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_008_5c74

    ld [hl-], a

jr_008_5c44:
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_008_5c84

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d

jr_008_5c54:
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, d

jr_008_5c64:
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d

jr_008_5c74:
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d

jr_008_5c84:
    ld [hl], e
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld a, b
    ld a, c
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    add b
    add c
    add d
    add e
    add h
    add l
    add [hl]
    add a
    adc b
    adc c
    adc d
    adc e
    adc h
    adc l
    adc [hl]
    adc a
    sub b
    sub c
    sub d
    sub e
    sub h
    sub l
    sub [hl]
    sub a
    sbc b
    sbc c
    sbc d
    sbc e
    sbc h
    sbc l
    sbc [hl]
    sbc a
    and b
    and c
    and d
    and e
    and h
    and l
    and [hl]
    and a
    xor b
    xor c
    xor d
    xor e
    xor h
    xor l
    xor [hl]
    xor a
    or b
    or c
    or d
    or e
    or h
    or l
    or [hl]
    or a
    cp b
    cp c
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp a
    ret nz

    pop bc
    jp nz, $c4c3

    push bc
    add $c7
    ret z

    ret


    jp z, $cccb

    call $cfce
    ret nc

    pop de
    jp nc, $d4d3

    push de
    sub $d7
    ret c

    reti


    jp c, $dcdb

    db $dd
    sbc $df
    ldh [$e1], a
    ld [c], a
    db $e3
    db $e4
    push hl
    and $e7
    add sp, -$17
    ld [$eceb], a
    db $ed
    xor $ef
    ldh a, [$f1]
    ld a, [c]
    di
    db $f4
    push af
    or $f7
    ld hl, sp-$07
    ld a, [$fcfb]
    db $fd
    cp $ff
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    dec c
    ld c, $0f
    db $10
    ld de, $1312
    inc d
    dec d
    ld d, $17
    jr jr_008_5d44

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_008_5d54

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_008_5d64

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_008_5d74

    ld [hl-], a

jr_008_5d44:
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_008_5d84

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d

jr_008_5d54:
    ld b, e
    ld b, h
    ld b, l
    ld b, [hl]
    ld b, a
    ld c, b
    ld c, c
    ld c, d
    ld c, e
    ld c, h
    ld c, l
    ld c, [hl]
    ld c, a
    ld d, b
    ld d, c
    ld d, d

jr_008_5d64:
    ld d, e
    ld d, h
    ld d, l
    ld d, [hl]
    ld d, a
    ld e, b
    ld e, c
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    ld e, [hl]
    ld e, a
    ld h, b
    ld h, c
    ld h, d

jr_008_5d74:
    ld h, e
    ld h, h
    ld h, l
    ld h, [hl]
    ld h, a
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca

jr_008_5d84:
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca

Jump_008_6643:
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    add hl, bc
    sub h
    ld [hl], b
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop

Jump_008_7373:
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
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
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
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
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
    inc b
    nop
    nop
    ld [$0000], sp
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
    inc b
    nop
    nop
    ld [$0000], sp
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
    inc b
    nop
    nop
    ld [$0000], sp
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
    inc b
    nop
    nop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc b
    nop
    nop
    ld [$0f0f], sp
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
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
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    nop
    nop
    nop
    nop
    ld d, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$e0], a
    ldh [rNR41], a
    ret nz

    ret nz

    ret nz

    ret nz

    ld b, b
    ret nz

    ret nz

    ld b, b
    ldh a, [rSVBK]
    ld [hl], b
    ret nc

    ldh a, [$90]
    ldh a, [$50]
    ldh [$e0], a
    ldh a, [$90]
    ld a, b
    ld a, b
    db $fc
    add h
    cp $7a
    rst $38
    adc l
    rst $38
    xor [hl]
    rst $38
    rst $18
    rst $38
    rst $38
    cp $01
    db $fd
    adc $ff
    adc $b7
    adc $ff
    jr nz, @-$01

    inc bc
    rst $38
    xor e
    rst $38
    ld a, h
    rst $38
    add e
    nop
    nop
    nop
    nop
    ld bc, $0301
    ld [bc], a
    rrca
    ld c, $0f
    add hl, bc
    rlca
    rlca
    ld [bc], a
    inc bc
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    rlca
    ld b, $0e
    dec bc
    rrca
    add hl, bc
    rlca
    ld b, $0f
    add hl, bc
    ccf
    add hl, sp
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
    ldh a, [$90]
    ldh a, [$f0]
    ldh [$e0], a
    add b
    add b
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
    rrca
    rrca
    rst $38
    ld hl, sp+$7f
    rst $38
    rst $38
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    db $fc
    rst $38
    rst $38
    ccf
    ldh [$e0], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, a
    ld b, a
    ld sp, hl
    cp c
    pop af
    or c
    ei
    jp z, Jump_008_7373

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
    add b
    add b
    ldh [$e0], a
    ldh [rNR41], a
    ret nz

    ret nz

    add b
    add b
    add b
    add b
    add b
    add b
    ret nz

    ret nz

    ldh [$a0], a
    ldh [rNR41], a
    ret nz

    ret nz

    ldh [rNR41], a
    ldh [rNR41], a
    inc a
    inc a
    ld a, [hl]
    ld b, d
    rst $38
    cp l
    rst $38
    ld h, d
    rst $38
    ld [$f7ff], a
    rst $38
    rst $38
    cp $01
    ld a, a
    and $ff
    and $db
    and $fe
    add hl, bc
    ld a, a
    add c
    rst $38
    xor d
    rst $38
    ld a, l
    rst $38
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0f01
    ld c, $0f
    add hl, bc
    rlca
    rlca
    ld b, $07
    dec b

jr_008_7c1a:
    ld b, $07
    inc b
    rra
    inc e
    dec e
    ld d, $1f
    inc de
    rra
    dec d
    rrca
    ld c, $1f
    inc de
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
    ret nz

    ret nz

    nop
    nop
    nop
    nop
    add b
    add b
    add b
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    dec sp
    ld a, a
    ld b, a
    cp $bf
    di
    or e
    ld hl, sp-$38
    ld [hl], b
    ld [hl], b
    nop
    nop
    nop
    nop
    add b
    nop
    nop
    nop
    nop

jr_008_7c6e:
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0004], sp
    nop
    ld hl, sp+$06
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0008], sp
    nop
    ld hl, sp+$0a
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$000c], sp
    nop
    ld hl, sp+$0c
    jr nz, jr_008_7c1a

    nop
    nop
    nop
    nop
    ld [$000e], sp
    nop
    ld hl, sp+$10
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0012], sp
    nop
    ld hl, sp+$14
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0016], sp
    nop
    ld hl, sp+$18
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$001a], sp
    nop
    ld hl, sp+$1c
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$001e], sp
    nop
    ld hl, sp+$20
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0022], sp
    nop
    ld hl, sp+$24
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0026], sp
    nop
    ld hl, sp+$26
    jr nz, jr_008_7c6e

    nop
    nop
    nop
    nop
    ld [$0028], sp
    nop
    ld hl, sp+$2a
    nop
    add b
    nop
    nop
    nop
    ld l, c
    ld a, h
    ld l, l
    ld a, h
    ld a, c
    ld a, h
    add l
    ld a, h
    sub c
    ld a, h
    sbc l
    ld a, h
    xor c
    ld a, h
    or l
    ld a, h
    pop bc
    ld a, h
    call $d97c
    ld a, h
    push hl
    ld a, h
    pop af
    ld a, h
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    nop
    dec c
    nop
    ldh a, [$fd]
    ld a, h
    rla
    ld a, l
    daa
    ld a, l
    nop
    rrca
    ld hl, sp+$07
    rlca
    add hl, de
    ld [hl], a
    nop
    nop
    nop
    ld d, $00
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    add b
    add b
    add b
    nop
    nop
    ret nz

    ret nz

    ret nz

    ld b, b
    add b
    add b
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
    db $db
    dec l
    ei
    db $fd
    ei
    dec c
    ei
    db $fd
    ei
    ld e, l
    ei
    ld e, l
    ei
    dec a
    rst $38
    cpl
    rst $38
    sub b
    rst $38
    rra
    rst $28
    add hl, sp
    rst $08
    ld sp, hl
    ld b, $fe
    db $fc
    inc c
    cp $fe
    ld hl, sp-$08
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
    ld [$3408], sp
    inc a
    ld d, h
    ld l, h
    or h
    call c, $fca4
    xor b
    ld hl, sp+$70
    ld [hl], b
    ldh a, [$90]
    cp [hl]
    ld c, [hl]
    db $eb
    dec e
    ld a, e
    adc l
    ld [bc], a
    inc bc
    rrca
    rrca
    rra
    db $10
    ccf
    daa
    ccf
    dec l
    rra
    dec d
    rra
    inc d
    rla
    jr @+$81

    ld a, l
    rst $38
    sub d
    rst $00
    cp d
    rst $38
    add e
    rst $00
    cp d
    rst $00
    cp e
    ld a, [hl]
    ld b, l
    ccf
    ccf
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
    ld bc, $0101
    ld bc, $0203
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    ldh [$e0], a
    ldh [$a0], a
    ret nz

    ld b, b
    add b
    add b
    add b
    add b
    add b
    add b
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
    nop
    nop
    nop
    nop
    add b
    add b
    add b
    add b
    add b
    add b
    sub $35
    cp $fd
    cp $05
    cp $fd
    cp $ad
    cp $bd
    rst $38
    rla
    rst $38
    ld [$6fff], sp
    rst $38
    inc c
    rst $30
    inc e
    rst $20
    rst $38
    inc a
    call nz, Call_000_3cfc
    sbc $e2
    db $fc
    db $fc
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
    add b
    add b
    ld b, b
    ret nz

    ld b, b
    ret nz

    ld b, b
    ret nz

    add b
    add b
    jp Jump_008_6643


    and l
    and $25
    or [hl]
    ld d, l
    ld a, [bc]
    dec c
    rrca
    rrca
    ccf
    jr nc, jr_008_7ec4

    ld h, a
    ld a, a
    ld e, [hl]
    ccf
    ld a, $1f
    ld [de], a
    rra
    db $10
    ccf
    ld a, $7f
    ld c, c
    ld h, e
    ld e, l
    ld a, a
    ld b, c
    ld h, e
    ld e, l
    ld h, e
    ld e, l
    ccf
    inc hl
    rra
    rra
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
    inc b
    inc b
    dec bc
    rrca
    ld a, [bc]
    dec c
    dec bc
    ld c, $09
    rrca
    dec b
    rlca
    inc bc
    inc bc
    inc bc
    ld [bc], a
    rlca
    inc b
    dec b
    ld b, $0f
    ld [$0016], sp
    call z, $f0cc
    ldh a, [$fe]
    ld c, $fc
    inc b
    db $fc
    inc b
    db $fc
    call c, $26da
    ld [c], a
    cp $92
    ld a, [hl]
    call z, $8c3c
    ld [hl], h
    and $1a
    add $3a
    ld c, $f2
    ld a, [$fc06]
    db $fc
    ccf
    ccf
    ld c, c
    ld a, a

jr_008_7ec4:
    sub e
    rst $38
    and a
    db $fc
    rst $18
    db $fc
    ld a, a
    ld h, h
    ccf
    ld h, $2f
    ccf
    add hl, de
    ld e, $10
    rra
    inc sp
    inc l
    ld h, a
    ld e, b
    ld h, e
    ld e, h
    ld [hl], b
    ld c, a
    ld e, a
    ld h, b
    ccf
    ccf
    nop
    nop
    call z, $f0cc
    ldh a, [$fe]
    ld c, $fc
    inc b
    db $fc
    inc b
    db $fc
    call c, $26da
    ld a, [$cefe]
    ld a, $e6
    ld a, [de]
    add e
    ld a, l
    di
    dec c
    rlca
    ld sp, hl
    db $fd
    inc bc
    cp $fe
    nop
    nop
    ccf
    ccf
    ld c, c
    ld a, a
    sub e
    rst $38
    and a
    db $fc
    rst $18
    db $fc
    ld a, a
    ld h, h
    ccf
    ld h, $2f
    ccf
    inc sp
    inc a
    ld h, b
    ld e, a
    jp $cfbc


    or b
    ldh [$9f], a
    cp a
    ret nz

    ld a, a
    ld a, a
    ret nc

    ldh a, [$f0]
    ldh a, [$f8]
    sbc b
    db $fc
    ld c, h
    cp $4e
    rst $38
    ret


    cp a
    ld l, c
    dec a
    rst $38
    ld sp, hl
    rst $38
    ld a, [$74fe]
    call c, $b8f8
    rst $38
    ld a, a
    or a
    ld sp, hl
    cpl
    di
    cp $fe

jr_008_7f40:
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
    ret nz

    ret nz

    db $e3
    inc hl
    rst $20
    dec h
    adc $4a
    adc h
    adc h
    adc b
    adc b
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    jr nz, jr_008_7f40

    rla
    rra
    jr jr_008_7f83

    rla
    rra
    ccf
    add hl, sp
    ld a, a
    ld d, d
    ld a, a
    ld d, e
    ld a, l
    db $76
    db $fc
    sbc a
    rst $38
    sbc a
    cp a
    rst $38
    ld e, h
    ld [hl], a
    ld a, a
    ld a, e
    ld a, a
    ld c, h
    ld e, a
    ld h, a
    inc l
    scf
    rra
    rra
    nop
    nop
    nop

jr_008_7f83:
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
    ld bc, $3101
    ld sp, $4979
    ld a, c
    ld c, c
    inc a
    inc h
    inc e
    inc e
    nop
    nop
    rlca
    rlca
    ld [$e80f], sp
    ld hl, sp+$18
    ld hl, sp-$18
    ld hl, sp-$04
    sbc h
    cp $4a
    cp $ca
    cp [hl]
    ld l, [hl]
    ccf
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    rst $38
    ld a, $ee
    cp $de
    cp $32
    ld a, [$f4e6]
    db $ec
    ld hl, sp-$08
    dec bc
    rrca
    rrca
    rrca
    rra
    add hl, de
    ccf
    ld [hl-], a
    ld a, a
    ld [hl], d
    rst $38
    sub e
    db $fd
    sub [hl]
    cp h
    rst $38
    sbc a
    rst $38
    ld e, a
    ld a, a
    ld l, $3b
    rra
    dec e
    rst $38
    cp $ef
    sbc a
    rst $30
    rst $08
    ld a, a
    ld a, a
    nop
    nop
    ldh a, [$f0]
    sbc b
    ld l, b
    db $ec
    ld [hl], h
    db $fc
    ld [hl], h
    cp h
    ld [hl], h
    ld a, h

jr_008_7fed:
    adc h
    db $fc
    ld h, h
    ld h, h
    db $fc
    ld hl, sp-$08
    ret nc

    ldh a, [$e8]
    ld hl, sp-$48
    add sp, -$08
    jr jr_008_7fed

    ldh a, [rP1]
    nop
