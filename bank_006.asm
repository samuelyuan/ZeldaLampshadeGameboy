SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

    ld e, $0a
    ld hl, $40b4
    call RST_08
    ld e, $0a
    ld hl, $4039
    call RST_08
    ld e, $03
    ld hl, $4000
    call RST_08
    ld e, $09
    ld hl, $4186
    call RST_08
    ld e, $0a
    ld hl, $4090
    call RST_08
    ld e, $05
    ld hl, $4080
    call RST_08
    ld e, $07
    ld hl, $442d
    call RST_08
    ld e, $0a
    ld hl, $400b
    call RST_08
    ld e, $01
    ld hl, $4000
    call RST_08
    ld e, $01
    ld hl, $563c
    call RST_08
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, $4000
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, $4040
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $09
    ld hl, $41dd
    call RST_08
    inc sp
    ret


Jump_006_4075:
    add sp, -$05

Jump_006_4077:
jr_006_4077:
    call Call_000_3307
    ld a, e
    or a
    jr z, jr_006_408d

    cp $01
    jr z, jr_006_408d

    cp $02
    jr z, jr_006_4077

    sub $03
    jp z, Jump_006_4136

    jr jr_006_4077

jr_006_408d:
    call Call_000_16dd
    ld a, [$c61b]
    sub $f0
    jr nz, jr_006_40c0

    ld a, $01
    push af
    inc sp
    ld e, $02
    ld hl, $6100
    call RST_08
    inc sp
    ld bc, $4000
    ld a, $0a
    ld h, $00
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
    add sp, $06
    jr jr_006_4077

jr_006_40c0:
    ld hl, $cb90
    ld a, [hl]
    sub $01
    ld a, $00
    rla
    xor $01
    jr nz, jr_006_40e6

    ld a, [$c61b]
    or a
    jr z, jr_006_40d6

    call Call_000_1583

jr_006_40d6:
    call Call_000_0280
    ld a, [$da1f]
    and $0f
    jr nz, jr_006_40e3

    call Call_000_1655

jr_006_40e3:
    call Call_000_19fc

jr_006_40e6:
    ld c, $c0
    ldh a, [$92]
    sub c
    jr nz, jr_006_40f4

    ld hl, $da35
    ld [hl], $df
    jr jr_006_40f9

jr_006_40f4:
    ld hl, $da35
    ld [hl], $c0

jr_006_40f9:
    ld hl, $c50e
    ld [hl], $00
    call Call_000_13f1
    ld e, $05
    ld hl, $40ca
    call RST_08
    call Call_000_0e73
    call Call_000_1b61
    call Call_000_24e0
    ld e, $01
    ld hl, $4d3f
    call RST_08
    ld hl, $da1f
    inc [hl]
    ld a, $28
    push af
    inc sp
    ld a, [$c50e]
    push af
    inc sp
    call Call_000_0ce4
    pop hl
    ld a, [$da35]
    ldh [$92], a
    call Call_000_0e35
    jp Jump_006_4077


Jump_006_4136:
    ld a, [$cb92]
    dec a
    jr z, jr_006_4156

    ld a, [$cb92]
    sub $02
    jr z, jr_006_419b

    ld a, [$cb92]
    sub $03
    jp z, Jump_006_4216

    ld a, [$cb92]
    sub $04
    jp z, Jump_006_4236

    jp Jump_006_4077


jr_006_4156:
    ld e, $0a
    ld hl, $405f
    call RST_08
    call Call_000_05a4
    xor a
    push af
    inc sp
    ld e, $02
    ld hl, $6100
    call RST_08
    inc sp
    ld hl, $059c
    ld b, [hl]
    ld hl, $059d
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld h, $01
    ld l, b
    push hl
    ld b, a
    push bc
    ld e, $03
    ld hl, $42ac
    call RST_08
    add sp, $04
    ld a, e
    sub $01
    ld a, $00
    rla
    ld hl, sp+$04
    ld [hl], a
    ld e, $03
    ld hl, $4b86
    call RST_08
    jp Jump_006_4288


jr_006_419b:
    ld e, $0a
    ld hl, $405f
    call RST_08
    xor a
    push af
    inc sp
    ld e, $02
    ld hl, $6100
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, $4040
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, $4000
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $09
    ld hl, $41dd
    call RST_08
    inc sp
    ld hl, $cb95
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$cb94]
    push af
    inc sp
    push de
    ld hl, sp+$06
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
    ld h, $01
    push hl
    inc sp
    push af
    inc sp
    push bc
    ld e, $03
    ld hl, $42ac
    call RST_08
    add sp, $04
    ld a, e
    sub $01
    ld a, $00
    rla
    ld hl, sp+$04
    ld [hl], a
    jr jr_006_4288

Jump_006_4216:
    ld a, [$cb94]
    ld hl, $cb95
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call Call_000_1307
    add sp, $03
    ld a, e
    push af
    inc sp
    ld e, $06
    ld hl, $48aa
    call RST_08
    inc sp
    jp Jump_006_4077


Jump_006_4236:
    ld e, $07
    ld hl, $4509
    call RST_08
    ld e, $0a
    ld hl, $405f
    call RST_08
    ld a, [$cb94]
    ld hl, $cb95
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call Call_000_1307
    add sp, $03
    ld a, e
    push af
    inc sp
    ld e, $06
    ld hl, $4990
    call RST_08
    inc sp
    ld hl, $cb91
    ld [hl], e
    ld hl, $c526
    ld c, [hl]
    ld hl, $c527
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld b, a

Call_006_4273:
    push bc
    push hl
    ld e, $03
    ld hl, $42ac
    call RST_08
    add sp, $04
    ld a, e
    sub $01
    ld a, $00
    rla
    ld hl, sp+$04
    ld [hl], a

Jump_006_4288:
jr_006_4288:
    di
    ld a, [$c53d]
    dec a
    jr z, jr_006_4298

    ld a, [$c53d]
    sub $02
    jr z, jr_006_42a2

    jr jr_006_42ac

jr_006_4298:
    ld de, $1b24
    push de
    call Call_000_3679
    pop hl
    jr jr_006_42b4

jr_006_42a2:
    ld de, $17f8
    push de
    call Call_000_3679
    pop hl
    jr jr_006_42b4

jr_006_42ac:
    ld de, $177c
    push de
    call Call_000_3679
    pop hl

jr_006_42b4:
    xor a
    ldh [rLYC], a
    ei
    ld a, [$da2e]
    or a
    jr nz, jr_006_42c4

    ldh a, [rLCDC]
    or $02
    ldh [rLCDC], a

jr_006_42c4:
    ld e, $01
    ld hl, $4055
    call RST_08
    call Call_000_027b
    ld c, $c0
    ldh a, [$92]
    sub c
    jr nz, jr_006_42dd

    ld hl, $da35
    ld [hl], $df
    jr jr_006_42e2

jr_006_42dd:
    ld hl, $da35
    ld [hl], $c0

jr_006_42e2:
    ld hl, $c50e
    ld [hl], $00
    call Call_000_13f1
    ld e, $05
    ld hl, $468f
    call RST_08
    call Call_000_0e73
    ld a, $28
    push af
    inc sp
    ld a, [$c50e]
    push af
    inc sp
    call Call_000_0ce4
    pop hl
    ld a, [$da35]
    ldh [$92], a
    ld hl, sp+$04
    ld a, [hl]
    or a
    jp z, Jump_006_4077

    ld e, $07
    ld hl, $44ef
    call RST_08
    jp Jump_006_4077


    add sp, $05
    ret


    ld hl, $c81f
    ld [hl], $00
    ld a, [$c0a0]
    sub $11
    jr nz, jr_006_432e

    ld a, [$0143]
    rlca
    jr c, jr_006_4331

jr_006_432e:
    xor a
    jr jr_006_4333

jr_006_4331:
    ld a, $01

jr_006_4333:
    ld [$c81e], a
    ld a, [$c0a1]
    or a
    jr z, jr_006_4342

    ld a, [$c81e]
    or a
    jr nz, jr_006_4345

jr_006_4342:
    xor a
    jr jr_006_4347

jr_006_4345:
    ld a, $01

jr_006_4347:
    ld [$c0a1], a
    xor a
    and a
    push af
    ld de, $0000
    push de
    ld de, $df00
    push de
    call Call_000_37b0
    add sp, $06
    ld e, $06
    ld hl, $47a3
    call RST_08
    call Call_000_0e45
    ld e, $0a
    ld hl, $4080
    call RST_08
    ld a, $67
    ldh [rLCDC], a
    ld a, $07
    ldh [rWX], a
    ld a, $90
    ldh [rWY], a
    ldh a, [rDIV]
    ld b, $00
    ld c, a
    push bc
    call Call_000_34af
    pop hl
    call Call_000_05a4
    ld a, $01
    push af
    inc sp
    ld e, $02
    ld hl, $6100
    call RST_08
    inc sp
    di
    ld hl, $c69d
    ld [hl], $8b
    inc hl
    ld [hl], $c6
    xor a
    ldh [rLYC], a
    ld de, $1824
    push de
    call Call_000_0e68
    pop hl
    ldh a, [rSTAT]
    or $40
    ldh [rSTAT], a
    ld hl, $c0a0
    ld a, [hl]
    sub $11
    jr nz, jr_006_43c1

    ld hl, $0143
    ld a, [hl]
    rlca
    jr nc, jr_006_43c1

    ld bc, $0080
    jr jr_006_43c4

jr_006_43c1:
    ld bc, $00c0

jr_006_43c4:
    ld a, c
    ldh [rTMA], a
    ld a, $07
    ldh [rTAC], a
    ldh a, [rIE]
    or $0e
    ldh [rIE], a
    ei
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a
    ld a, $0a
    ld h, $00
    push hl
    inc sp
    ld de, $0000
    push de
    ld de, $4000
    push de
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $06
    jp Jump_006_4075


Call_006_43f5:
    ld hl, sp+$02
    ld a, [hl]
    ldh [rSB], a
    ld a, $81
    ldh [rSC], a

jr_006_43fe:
    ldh a, [rSC]
    rlca
    jr c, jr_006_43fe

    ldh a, [rSB]
    ld e, a
    ret


    adc b
    inc sp
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    adc b
    inc sp
    rrca
    nop
    nop
    nop
    rrca
    nop
    nop
    nop
    adc b
    inc sp
    inc b
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    adc b
    inc sp
    ld [$0000], sp
    nop
    ld bc, $0000
    nop

Call_006_442f:
    ld hl, $c611
    ld b, [hl]
    ld c, $00
    push bc
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    call Call_006_43f5
    inc sp
    ld a, e
    pop bc
    ld d, $00
    or c
    ld e, a
    ld a, d
    or b
    ld hl, $c611
    ld [hl], e
    inc hl
    ld [hl], a
    ret


Call_006_444e:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, $00

jr_006_4455:
    ld a, e
    ld hl, sp+$04
    sub [hl]
    jr nc, jr_006_446a

    inc e
    ld a, [bc]
    inc bc
    push bc
    push de
    push af
    inc sp
    call Call_006_442f
    inc sp
    pop de
    pop bc
    jr jr_006_4455

jr_006_446a:
    ld hl, $c612
    ld a, [hl]
    sub $81
    jr nz, jr_006_4475

    dec hl
    ld e, [hl]
    ret


jr_006_4475:
    ld de, $00f0
    ret


Call_006_4479:
    dec sp
    ld a, [$c613]
    or a
    jr nz, jr_006_44a0

    ld bc, $450d
    ld e, $06

jr_006_4485:
    ld a, e
    or a
    jr z, jr_006_4498

    ld a, [bc]
    inc bc
    push bc
    push de
    push af
    inc sp
    call Call_006_43f5
    inc sp
    pop de
    pop bc
    dec e
    jr jr_006_4485

jr_006_4498:
    ld hl, $c614
    ld a, $86
    ld [hl+], a
    xor a
    ld [hl], a

jr_006_44a0:
    ld hl, sp+$00
    ld [hl], $10
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_006_44a9:
    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_44d1

    ld a, [de]
    ld c, a
    ld b, $00
    ld hl, $c614
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld [$c614], a
    ld a, h
    ld [$c615], a
    ld a, [de]
    push de
    push af
    inc sp
    call Call_006_43f5
    inc sp
    pop de
    ld hl, sp+$00
    dec [hl]
    inc de
    jr jr_006_44a9

jr_006_44d1:
    ld hl, $c613
    inc [hl]
    ld a, [hl]
    sub $28
    jr nz, jr_006_4509

    ld a, [$c614]
    push af
    inc sp
    call Call_006_43f5
    inc sp
    ld a, [$c615]
    push af
    inc sp
    call Call_006_43f5
    inc sp
    xor a
    push af
    inc sp
    call Call_006_43f5
    inc sp
    xor a
    push af
    inc sp
    call Call_006_43f5
    inc sp
    ld hl, $c613
    ld [hl], $00
    xor a
    ld hl, $c614
    ld [hl+], a
    ld [hl], a
    ld e, $01
    jr jr_006_450b

jr_006_4509:
    ld e, $00

jr_006_450b:
    inc sp
    ret


    adc b
    inc sp
    inc b
    nop
    add b
    ld [bc], a

Call_006_4513:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_006_4518:
    push bc
    ld a, $0a
    push af
    inc sp
    ld de, $4411
    push de
    call Call_006_444e
    add sp, $03
    ld a, e
    pop bc
    ld e, a
    ld hl, sp+$04
    and [hl]
    inc hl
    ld d, a
    ld a, [hl]
    sub d
    ret z

    ld a, c
    ld d, b
    dec bc
    or d
    jr nz, jr_006_453a

    ld e, $f0
    ret


jr_006_453a:
    ld a, e
    and $f0
    ret nz

    call Call_000_0e35
    jr jr_006_4518

    ld hl, $c613
    ld [hl], $00
    ld a, $0a
    push af
    inc sp
    ld de, $4407
    push de
    call Call_006_444e
    add sp, $03
    ld hl, sp+$06
    ld c, [hl]
    ld b, $00
    ld hl, $00ff
    push hl
    push bc
    call Call_006_4513
    add sp, $04
    ret


    add sp, -$1f
    ld hl, sp+$18
    ld [hl], $00
    ld hl, sp+$26
    ld a, [hl]
    srl a
    ld hl, sp+$1e
    ld [hl], a
    ld hl, sp+$17
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    or a
    jr nz, jr_006_4580

    ld e, a
    jp Jump_006_47a0


jr_006_4580:
    call Call_000_0265
    ld hl, sp+$1b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$25
    ld a, [hl]
    ld hl, sp+$1d
    ld [hl+], a
    ld [hl], $00
    ld a, $05

jr_006_4592:
    ld hl, sp+$1d
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_006_4592

    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$1b
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
    ld hl, $c613
    ld [hl], $00
    ld hl, sp+$17
    ld a, [hl]
    add a
    ld hl, sp+$1b
    ld [hl], a

Jump_006_45bc:
    ld hl, sp+$1b
    ld a, [hl]
    or a
    jp z, Jump_006_4710

    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$10
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$1c
    ld [hl], $00
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$1d
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$1e
    ld [hl], a

Jump_006_45e2:
    ld hl, sp+$1c
    ld a, [hl]
    sub $14
    jp z, Jump_006_46f7

    ld hl, sp+$1d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_0ca8
    pop hl
    ld hl, sp+$17
    ld [hl], e
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$17
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    push de
    ld a, $01
    push af
    inc sp
    ld a, [hl]
    push af
    inc sp
    call Call_000_34ba
    add sp, $04
    ld hl, sp+$12
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_006_4479
    pop hl
    ld a, e
    or a
    jr z, jr_006_4629

    ld hl, sp+$18
    inc [hl]

jr_006_4629:
    ld hl, sp+$18
    ld a, [hl]
    sub $09
    jp nz, Jump_006_46ea

    ld hl, sp+$18
    ld [hl], $00
    ld a, $0a
    push af
    inc sp
    ld de, $441b
    push de
    call Call_006_444e
    add sp, $03
    ld hl, sp+$26
    ld a, [hl]
    ld hl, sp+$16
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
    ld hl, sp+$15
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$16
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$14
    ld a, [hl+]
    inc hl
    sub [hl]
    jr nz, jr_006_4673

    dec hl
    ld a, [hl+]
    inc hl
    sub [hl]
    jr nz, jr_006_4673

    ld hl, sp+$27
    ld c, [hl]
    jr jr_006_4676

jr_006_4673:
    ld bc, $0000

jr_006_4676:
    ld hl, $da27
    ld [hl], c
    ld b, $00
    ld hl, $da28
    ld [hl], $e4
    ld hl, $da29
    ld [hl], $7f
    ld hl, $016a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $da2a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, $0e
    push af
    inc sp
    ld de, $da20
    push de
    call Call_006_444e
    add sp, $03
    ld hl, $0202
    push hl
    ld de, $0078
    push de
    call Call_006_4513
    add sp, $04
    ld a, e
    and $f0
    jp nz, Jump_006_47a0

    ld hl, $0002
    push hl
    ld de, $04b0
    push de
    call Call_006_4513
    add sp, $04
    ld a, e
    and $f0
    jp nz, Jump_006_47a0

    ld a, $0a
    push af
    inc sp
    ld de, $4407
    push de
    call Call_006_444e
    add sp, $03
    ld hl, $00ff
    push hl
    ld de, $000a
    push de
    call Call_006_4513
    add sp, $04
    ld a, e
    ld hl, sp+$17
    ld [hl], a
    or a
    jr z, jr_006_46ea

    ld e, [hl]
    jp Jump_006_47a0


Jump_006_46ea:
jr_006_46ea:
    ld hl, sp+$1c
    inc [hl]
    inc hl
    inc [hl]
    jp nz, Jump_006_45e2

    inc hl
    inc [hl]
    jp Jump_006_45e2


Jump_006_46f7:
    ld hl, sp+$1b
    dec [hl]
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0020
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1a
    ld [hl], a
    jp Jump_006_45bc


Jump_006_4710:
    ld hl, sp+$18
    ld a, [hl]
    or a
    jr z, jr_006_4790

    ld a, $0a
    push af
    inc sp
    ld de, $441b
    push de
    call Call_006_444e
    add sp, $03
    ld hl, sp+$27
    ld a, [hl]
    ld hl, sp+$1e
    ld [hl], a
    ld de, $da27
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, $da28
    ld [hl], $e4
    ld hl, $da29
    ld [hl], $7f
    ld hl, sp+$1b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $016a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1f
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1e
    ld [hl-], a
    ld de, $da2a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, $0e
    push af
    inc sp
    ld de, $da20
    push de
    call Call_006_444e
    add sp, $03
    ld hl, $0202
    push hl
    ld de, $0078
    push de
    call Call_006_4513
    add sp, $04
    ld a, e
    and $f0
    jr nz, jr_006_47a0

    ld hl, $0002
    push hl
    ld de, $04b0
    push de
    call Call_006_4513
    add sp, $04
    ld a, e
    and $f0
    jr nz, jr_006_47a0

jr_006_4790:
    ld a, $0a
    push af
    inc sp
    ld de, $4411
    push de
    call Call_006_444e
    add sp, $03
    ld hl, sp+$1e
    ld [hl], e

Jump_006_47a0:
jr_006_47a0:
    add sp, $1f
    ret


    dec sp
    dec sp
    ld hl, $0000
    ld [hl], $0a
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld [hl], a
    ld [$4000], a
    ld hl, $c621
    ld a, $04
    ld [hl+], a
    xor a
    ld [hl], a
    ld bc, $47ee

jr_006_47bf:
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld l, [hl]
    or l
    jr z, jr_006_47eb

    ld l, c
    ld h, b
    inc hl
    inc hl
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $c621
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h
    ld hl, $c621
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    inc bc
    inc bc
    jr jr_006_47bf

jr_006_47eb:
    inc sp
    inc sp
    ret


    sbc b
    rlc b
    ld c, $58
    jp z, $0130

    adc b
    rlc d
    nop
    adc d
    rlc d
    nop
    adc h
    rlc d
    nop
    adc [hl]
    rlc d
    nop
    sub b
    rlc c
    nop
    ret nz

    push bc
    jr z, jr_006_480e

jr_006_480e:
    add sp, -$3b
    ld [$f000], sp
    push bc
    inc d
    nop
    inc b
    add $08
    nop
    dec a
    add $01
    nop
    ld b, d
    add $02
    nop
    add hl, hl
    add $14
    nop
    ld h, $c5
    inc bc
    nop
    cp c
    ret nz

    ld b, h
    inc b
    db $fd
    call nz, Call_000_0002
    ld bc, $02c5
    nop
    rlca
    push bc
    ld bc, $0900
    push bc
    ld [bc], a
    nop
    cp a
    reti


    ld [bc], a
    nop
    nop
    nop
    nop
    nop

Call_006_4846:
    add sp, -$05
    ld bc, $0000
    xor a
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], a
    ld de, $0000
    ld hl, sp+$04
    ld [hl], $00

jr_006_4857:
    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nc, jr_006_4898

    ld a, c
    ld hl, $c621
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    xor a
    sub [hl]
    inc hl
    ld a, $20
    sbc [hl]
    jr nc, jr_006_4893

    inc de
    inc sp
    inc sp
    push de
    ld a, e
    sub $03
    ld a, d
    sbc $00
    jr c, jr_006_4890

    ld de, $0000
    jr jr_006_48a7

jr_006_4890:
    ld bc, $0000

jr_006_4893:
    ld hl, sp+$04
    inc [hl]
    jr jr_006_4857

jr_006_4898:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$00
    ld a, [hl]
    ld [de], a
    ld hl, $a000
    add hl, bc
    ld e, l
    ld d, h

jr_006_48a7:
    add sp, $05
    ret


    add sp, -$0d
    ld hl, sp+$00
    push hl
    ld hl, sp+$15
    ld a, [hl]
    push af
    inc sp
    call Call_006_4846
    add sp, $03
    ld hl, sp+$0b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [hl-]
    or [hl]
    jp z, Jump_006_498d

    ld hl, sp+$00
    ld c, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld b, a
    ld a, c
    and $0f
    or b
    ld [hl], a
    ld [$4000], a
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0593
    ld d, h
    ld e, l
    ld hl, sp+$07
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
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
    ld [hl+], a
    ld [hl], $ee
    inc hl
    ld [hl], $47

jr_006_490f:
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$01
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jr z, jr_006_498d

    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
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
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_376d
    add sp, $06
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$07
    ld [hl+], a
    inc de
    ld a, [de]
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
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0d
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0c
    ld [hl], a
    jr jr_006_490f

Jump_006_498d:
jr_006_498d:
    add sp, $0d
    ret


    add sp, -$0b
    ld hl, sp+$04
    push hl
    ld hl, sp+$13
    ld a, [hl]
    push af
    inc sp
    call Call_006_4846
    add sp, $03
    ld c, e
    ld b, d
    ld a, b
    or c
    jr nz, jr_006_49a9

    ld e, a
    jp Jump_006_4a9c


jr_006_49a9:
    ld hl, sp+$04
    ld d, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld e, a
    ld a, d
    and $0f
    or e
    ld [hl], a
    ld [$4000], a
    ld l, c
    ld h, b
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0593
    ld d, h
    ld e, l
    ld hl, sp+$07
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nz, jr_006_49fe

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$08
    sub [hl]
    jr nz, jr_006_49fe

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$09
    sub [hl]
    jr nz, jr_006_49fe

    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$0a
    sub [hl]
    jr z, jr_006_4a03

jr_006_49fe:
    ld e, $00
    jp Jump_006_4a9c


jr_006_4a03:
    inc bc
    inc bc
    inc bc
    inc bc
    ld hl, sp+$09
    ld [hl], $ee
    inc hl
    ld [hl], $47

jr_006_4a0e:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jr z, jr_006_4a6a

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
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
    ld e, c
    ld d, b
    push hl
    push de
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_376d
    add sp, $06
    ld hl, sp+$07
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
    ld hl, sp+$09
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
    jr jr_006_4a0e

jr_006_4a6a:
    ld a, [$c63d]
    inc a
    jr z, jr_006_4a7e

    ld a, [$c642]
    ld [$c640], a
    ld a, [$c643]
    ld [$c641], a
    jr jr_006_4a9a

jr_006_4a7e:
    xor a
    ldh [rNR42], a
    xor a
    ldh [rNR32], a
    xor a
    ldh [rNR22], a
    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR44], a
    ld a, $c0
    ldh [rNR24], a
    ld a, $c0
    ldh [rNR14], a
    ld a, $ff
    ldh [rNR51], a

jr_006_4a9a:
    ld e, $01

Jump_006_4a9c:
    add sp, $0b
    ret


    dec sp
    ld hl, sp+$00
    push hl
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    call Call_006_4846
    add sp, $03
    ld c, e
    ld a, d
    ld b, a
    or e
    jr z, jr_006_4ace

    ld hl, sp+$00
    ld e, [hl]
    ld a, [$c820]
    and $f0
    ld l, a
    ld a, e
    and $0f
    or l
    ld [$c820], a
    ld [$4000], a
    xor a
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a

jr_006_4ace:
    inc sp
    ret


    add sp, -$09
    ld hl, sp+$00
    push hl
    ld hl, sp+$11
    ld a, [hl]
    push af
    inc sp
    call Call_006_4846
    add sp, $03
    ld c, e
    ld b, d
    ld a, b
    or c
    jr nz, jr_006_4ae9

    ld e, a
    jp Jump_006_4b7b


jr_006_4ae9:
    ld hl, sp+$00
    ld d, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld e, a
    ld a, d
    and $0f
    or e
    ld [hl], a
    ld [$4000], a
    ld l, c
    ld h, b
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$01
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0593
    ld d, h
    ld e, l
    ld hl, sp+$05
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jr nz, jr_006_4b3e

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$06
    sub [hl]
    jr nz, jr_006_4b3e

    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nz, jr_006_4b3e

    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$08
    sub [hl]
    jr z, jr_006_4b42

jr_006_4b3e:
    ld e, $00
    jr jr_006_4b7b

jr_006_4b42:
    ld hl, sp+$13
    ld a, [hl-]
    or [hl]
    jr z, jr_006_4b79

    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$08
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    inc bc
    inc bc
    inc bc
    inc bc
    ld hl, sp+$10
    ld a, [hl+]
    ld e, [hl]
    add a
    rl e
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push bc
    push de
    call Call_000_376d
    add sp, $06

jr_006_4b79:
    ld e, $01

Jump_006_4b7b:
jr_006_4b7b:
    add sp, $09
    ret


    ld hl, $c919
    ld [hl], $00
    ld hl, $c91a
    ld [hl], $00
    ld hl, $c91b
    ld [hl], $ff
    ret


    ld bc, $c821
    ld hl, sp+$06
    ld e, [hl]
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    ld a, [hl]
    rrca
    ret nc

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0001
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $08
    ret


    ld hl, sp+$08
    ld a, [hl]
    or a
    jr nz, jr_006_4be8

    dec hl
    dec hl
    ld a, [hl]
    ld hl, $c919
    sub [hl]
    jr nz, jr_006_4be8

    ld hl, sp+$07
    ld a, [hl]
    ld hl, $c91a
    sub [hl]
    jr nz, jr_006_4be8

    ld e, a
    ret


jr_006_4be8:
    ld hl, sp+$07
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    ld e, $06
    ld hl, $4e70
    call RST_08
    pop hl
    ld b, e
    ld hl, sp+$06
    ld a, [hl]
    ld [$c919], a
    ld hl, sp+$07
    ld a, [hl]
    ld [$c91a], a
    ld a, b
    inc a
    jr z, jr_006_4c16

    push bc
    inc sp
    ld e, $06
    ld hl, $4b8e
    call RST_08
    inc sp
    ld e, $01
    ret


jr_006_4c16:
    ld e, $00
    ret


    add sp, -$09
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$08
    ld [hl-], a
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
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, de
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    push hl
    ld a, l
    ld hl, sp+$02
    ld [hl], a
    pop hl
    ld l, c
    ld h, b
    inc hl
    ld a, [hl]
    ld l, a
    rlca
    sbc a
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
    ld hl, sp+$01
    ld [hl], e
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
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
    ld l, c
    ld h, b
    inc hl
    inc hl
    ld a, [hl]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, de
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    ld l, a
    rlca
    sbc a
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
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld [hl], $00
    ld c, [hl]

jr_006_4ccd:
    ld a, [$da31]
    sub c
    jr z, jr_006_4d29

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    add $21
    ld e, a
    ld a, h
    adc $c8
    ld d, a
    ld a, [de]
    ld hl, sp+$05
    ld [hl], a
    ld l, e
    ld h, d
    inc hl
    push af
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld a, [hl+]
    ld [hl], a
    pop af
    ld l, e
    ld h, d
    inc hl
    inc hl
    ld l, [hl]
    add l
    dec a
    ld hl, sp+$08
    ld [hl-], a
    dec hl
    inc de
    inc de
    inc de
    ld a, [de]
    add [hl]
    inc hl
    inc hl
    ld b, a
    dec b
    ld a, [hl]
    ld hl, sp+$00
    sub [hl]
    jr c, jr_006_4d23

    inc hl
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jr c, jr_006_4d23

    ld a, b
    ld hl, sp+$02
    sub [hl]
    jr c, jr_006_4d23

    inc hl
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr c, jr_006_4d23

    ld hl, sp+$04
    ld e, [hl]
    jr jr_006_4d2b

jr_006_4d23:
    inc c
    ld hl, sp+$04
    ld [hl], c
    jr jr_006_4ccd

jr_006_4d29:
    ld e, $ff

jr_006_4d2b:
    add sp, $09
    ret


    add sp, -$04
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $06
    ld hl, $4c19
    call RST_08
    add sp, $04
    ld hl, sp+$00
    ld [hl], e
    ld c, $00
    ld a, [$c91b]
    ld hl, sp+$00
    sub [hl]
    ld a, $01
    jr z, jr_006_4d56

    xor a

jr_006_4d56:
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    or a
    jr nz, jr_006_4d6a

    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_006_4d6a

    ld e, $00
    jp Jump_006_4e6d


jr_006_4d6a:
    ld hl, sp+$00
    ld a, [hl]
    inc a
    ld a, $01
    jr z, jr_006_4d73

    xor a

jr_006_4d73:
    ld e, a
    ld hl, sp+$00
    ld a, [hl+]
    inc hl
    ld b, $00
    add a
    rl b
    add a
    rl b
    add a
    rl b
    ld [hl+], a
    ld [hl], b
    ld a, [$c91b]
    inc a
    jp z, Jump_006_4e22

    ld a, e
    or a
    jr nz, jr_006_4d97

    ld hl, sp+$01
    bit 0, [hl]
    jp nz, Jump_006_4e22

jr_006_4d97:
    bit 0, e
    jr nz, jr_006_4dd8

    ld de, $c821
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    ld a, [hl]
    rrca
    jr nc, jr_006_4dd8

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0001
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $08
    ld c, $01

jr_006_4dd8:
    ld de, $c821
    ld hl, $c91b
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    bit 1, [hl]
    jr z, jr_006_4e19

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0002
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $08
    ld c, $01

jr_006_4e19:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c91b], a
    ld e, c
    jr jr_006_4e6d

Jump_006_4e22:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c91b], a
    bit 0, e
    jr nz, jr_006_4e6b

    ld de, $c821
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    ld a, [hl]
    rrca
    jr nc, jr_006_4e6b

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0001
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $08
    ld e, $01
    jr jr_006_4e6d

jr_006_4e6b:
    ld e, $00

Jump_006_4e6d:
jr_006_4e6d:
    add sp, $04
    ret


    add sp, -$08
    ld hl, sp+$00
    ld [hl], $00
    ld c, [hl]

Jump_006_4e77:
    ld a, [$da31]
    sub c
    jp z, Jump_006_4efb

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    add $21
    ld e, a
    ld a, h
    adc $c8
    ld d, a
    ld a, [de]
    ld b, a
    ld l, e
    ld h, d
    inc hl
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld l, e
    ld h, d
    inc hl
    inc hl
    ld a, [hl]
    add b
    dec a
    ld hl, sp+$02
    ld [hl-], a
    inc de
    inc de
    inc de
    ld a, [de]
    add [hl]
    inc hl
    inc hl
    dec a
    ld [hl], a
    ld hl, sp+$0e
    ld e, [hl]
    ld d, $00
    inc de
    ld hl, sp+$04
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$04
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_006_4ed1

    bit 7, d
    jr nz, jr_006_4ed6

    cp a
    jr jr_006_4ed6

jr_006_4ed1:
    bit 7, d
    jr z, jr_006_4ed6

    scf

jr_006_4ed6:
    jr c, jr_006_4ef4

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr c, jr_006_4ef4

    inc hl
    ld a, [hl]
    ld hl, sp+$01
    sub [hl]
    jr c, jr_006_4ef4

    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$0f
    sub [hl]
    jr c, jr_006_4ef4

    ld hl, sp+$00
    ld e, [hl]
    jr jr_006_4efd

jr_006_4ef4:
    inc c
    ld hl, sp+$00
    ld [hl], c
    jp Jump_006_4e77


Jump_006_4efb:
    ld e, $ff

jr_006_4efd:
    add sp, $08
    ret


    ld hl, sp+$08
    ld a, [hl]
    ld [$da2e], a
    or a
    jr z, jr_006_4f10

    ldh a, [rLCDC]
    or $02
    ldh [rLCDC], a
    ret


jr_006_4f10:
    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a
    ret


    ld a, [$c61b]
    ld hl, $c61c
    sub [hl]
    jr z, jr_006_4f27

    ld a, [$c61b]
    ld hl, sp+$08
    and [hl]
    ret nz

jr_006_4f27:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    dec de
    dec de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld bc, $c5c0
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $07
    ld l, a
    ld h, $00
    ld e, l
    ld d, h
    add hl, hl
    add hl, hl
    add hl, de
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    inc de
    inc de
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    inc bc
    inc bc
    inc bc
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld bc, $c5e8
    ld hl, sp+$08
    ld e, [hl]

jr_006_4f71:
    ld a, e
    or a
    ret z

    bit 0, e
    jr z, jr_006_4f7c

    ld hl, sp+$09
    ld a, [hl]
    ld [bc], a

jr_006_4f7c:
    srl e
    inc bc
    jr jr_006_4f71

    ld bc, $c5e8
    ld hl, sp+$08
    ld e, [hl]

jr_006_4f87:
    ld a, e
    or a
    ret z

    bit 0, e
    jr z, jr_006_4f90

    xor a
    ld [bc], a

jr_006_4f90:
    srl e
    inc bc
    jr jr_006_4f87

    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_4fb1

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
    jr jr_006_4fb5

jr_006_4fb1:
    ld hl, $cb98
    add hl, bc

jr_006_4fb5:
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld e, [hl]
    ld hl, $c617
    ld d, $00
    add hl, de
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld hl, sp+$08
    ld b, [hl]
    ld a, b
    and $01
    ld c, $00
    bit 1, b
    jr z, jr_006_4fe8

    or c
    jr z, jr_006_4fe0

    ld e, $07
    ld hl, $44ef
    jp RST_08


jr_006_4fe0:
    ld e, $07
    ld hl, $4446
    jp RST_08


jr_006_4fe8:
    or c
    jr z, jr_006_4ff3

    ld e, $07
    ld hl, $4509
    jp RST_08


jr_006_4ff3:
    ld e, $07
    ld hl, $4467
    jp RST_08


    ld bc, $c5f0
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    ld e, l
    ld d, h
    add hl, hl
    add hl, hl
    add hl, de
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    inc de
    inc de
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    inc bc
    inc bc
    inc bc
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld bc, $c604
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$09
    ld a, [hl]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret


    ld bc, $c604
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    add hl, hl
    add hl, bc
    ld [hl], $00
    ret


    ld bc, $c604
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    inc bc
    ld a, [hl]
    ld [bc], a
    ret


    add sp, -$06
    ld hl, sp+$0c
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
    ld hl, sp+$0f
    bit 7, [hl]
    jr z, jr_006_5092

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_5096

jr_006_5092:
    ld hl, $cb98
    add hl, bc

jr_006_5096:
    ld a, l
    ld c, h
    ld hl, sp+$02
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_50b4

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_006_50b9

jr_006_50b4:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_006_50b9:
    ld b, h
    ld hl, sp+$04
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$12
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_50d6

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_50da

jr_006_50d6:
    ld hl, $cb98
    add hl, bc

jr_006_50da:
    ld a, [hl]
    push af
    inc sp
    ld a, [$c532]
    push af
    inc sp
    call Call_000_355d
    pop hl
    ld c, e
    ld b, d
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $00
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c529
    ld d, [hl]
    ld a, c
    ld hl, $c52a
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    push de
    inc sp
    push bc
    call Call_000_1307
    add sp, $03
    ld c, e
    ld b, $00
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $06
    ret


    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$11
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
    ld hl, sp+$12
    bit 7, [hl]
    jr z, jr_006_5149

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
    jr jr_006_514d

jr_006_5149:
    ld hl, $cb98
    add hl, bc

jr_006_514d:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_516e

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
    jr jr_006_5173

jr_006_516e:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_006_5173:
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0e
    ld h, [hl]
    push hl
    inc sp
    push bc
    ld hl, sp+$16
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_1270
    add sp, $09
    ret


    add sp, -$07
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0f
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
    inc sp
    inc sp
    push hl
    ld hl, sp+$10
    bit 7, [hl]
    jr z, jr_006_51da

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_51de

jr_006_51da:
    ld hl, $cb98
    add hl, bc

jr_006_51de:
    ld a, l
    ld c, h
    ld hl, sp+$04
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_51fc

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_006_5201

jr_006_51fc:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_006_5201:
    ld b, h
    ld hl, sp+$13
    ld e, [hl]
    bit 0, e
    jr z, jr_006_5229

    ld a, [$c61b]
    ld hl, $c61c
    sub [hl]
    jr z, jr_006_5229

    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $01
    ld [hl+], a
    ld [hl], $00
    ld hl, $c61b
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jr jr_006_5276

jr_006_5229:
    bit 1, e
    jr z, jr_006_5253

    push bc
    ld e, $09
    ld hl, $4219
    call RST_08
    ld a, e
    pop bc
    ld hl, sp+$06
    ld [hl], a
    or a
    jr z, jr_006_5253

    dec hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, $02
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$06
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jr jr_006_5276

jr_006_5253:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
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
    add $fa
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

jr_006_5276:
    add sp, $07
    ret


    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_5286

    ldh a, [rLCDC]
    or $04
    ldh [rLCDC], a
    ret


jr_006_5286:
    ldh a, [rLCDC]
    and $fb
    ldh [rLCDC], a
    ret


    add sp, -$03
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_52ab

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
    jr jr_006_52af

jr_006_52ab:
    ld hl, $cb98
    add hl, bc

jr_006_52af:
    ld c, [hl]
    push bc
    ld hl, sp+$0e
    ld a, [hl]
    push af
    inc sp
    ld a, [$c532]
    push af
    inc sp
    call Call_000_355d
    pop hl
    pop bc
    ld hl, sp+$0b
    ld a, [hl]
    ld b, $00
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    ld hl, $c529
    ld b, [hl]
    ld a, e
    ld hl, $c52a
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    push bc
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld b, e
    ld hl, sp+$00
    ld [hl], b
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, c
    ld h, $00
    inc de
    inc de
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld c, l
    ld e, h
    ld a, [$c53c]
    sub $05
    jr nz, jr_006_5355

    ld a, b
    sub $80
    jr nc, jr_006_532f

    ld a, $09
    ld hl, sp+$0c
    sub [hl]
    jr nc, jr_006_5310

    ld hl, sp+$01
    xor a
    ld [hl+], a
    ld [hl], $80
    jr jr_006_5316

jr_006_5310:
    ld hl, sp+$01
    xor a
    ld [hl+], a
    ld [hl], $90

jr_006_5316:
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    ld d, h
    push de
    ld e, a
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    pop de
    ld b, l
    ld a, h
    ld l, b
    jr jr_006_5340

jr_006_532f:
    ld a, b
    ld b, $00
    add $80
    ld l, a
    ld a, b
    adc $ff
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, h
    add $88

jr_006_5340:
    ld b, e
    ld e, l
    ld hl, sp+$0d
    ld h, [hl]
    push hl
    inc sp
    ld hl, $0010
    push hl
    push bc
    ld d, a
    push de
    call Call_000_133f
    add sp, $07
    jr jr_006_5368

jr_006_5355:
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    ld d, e
    ld e, c
    push de
    ld a, $01
    push af
    inc sp
    push bc
    inc sp
    call Call_000_1270
    add sp, $05

jr_006_5368:
    add sp, $03
    ret


    ld hl, $c820
    ld c, [hl]
    res 5, c
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_5382

    set 5, c
    ld hl, $c820
    ld [hl], c
    ld hl, $4000
    ld [hl], c
    ret


jr_006_5382:
    ld hl, $c820
    ld [hl], c
    ld hl, $4000
    ld [hl], c
    ret


    ld hl, sp+$0a
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call Call_000_1270
    add sp, $05
    ret


    add sp, -$09
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_53bf

    ld hl, sp+$0f
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
    jr jr_006_53c4

jr_006_53bf:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_006_53c4:
    ld b, h
    ld a, [bc]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$04
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$13
    ld a, [hl]
    push af
    inc sp
    push bc
    push de
    call Call_000_12e0
    add sp, $05
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld hl, sp+$06
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$08
    ld [hl], a
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$06
    ld a, [hl+]
    inc hl
    ld h, [hl]
    push hl
    inc sp
    push bc
    push af
    inc sp
    ld hl, sp+$07
    ld a, [hl]
    push af
    inc sp
    call Call_000_1270
    add sp, $0e
    ret


    ld hl, $da32
    ld [hl], $0f
    ld hl, sp+$08
    ld a, [hl]
    ld hl, $c7f5
    ld [hl], a
    sub $02
    jp z, Jump_000_021d

    ret


    ret


    add sp, -$15
    ld a, [$c7f5]
    or a
    jr nz, jr_006_5456

    ld hl, $da32
    ld [hl], $0f
    jp Jump_006_579c


jr_006_5456:
    ld a, [$da32]
    sub $0f
    jr nz, jr_006_5462

    ld hl, $da32
    ld [hl], $00

jr_006_5462:
    ld a, [$da32]
    ld hl, sp+$14
    ld [hl], a
    ld a, $20
    ld hl, sp+$21
    sub [hl]
    ld a, $00
    rla
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    rlca
    and $01
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$1c
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$1d
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    ld hl, sp+$05
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld a, [$da32]
    or $02
    ld hl, sp+$06
    ld [hl], a
    ld a, [$da32]
    or $04
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$20
    ld a, [hl]
    rlca
    and $01
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$1f
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$20
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$14
    ld a, [hl]
    and $01
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0f
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    and $02
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$14
    ld a, [hl]
    and $04
    ld hl, sp+$11
    ld [hl+], a
    xor a
    ld [hl+], a
    inc hl
    ld a, [hl-]
    and $08
    ld [hl+], a
    ld [hl], $00
    ld a, [$c7f5]
    dec a
    jr z, jr_006_550c

    ld a, [$c7f5]
    sub $02
    jp z, Jump_006_5606

    jp Jump_006_575b


jr_006_550c:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_558a

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_551c

    ld hl, sp+$21
    ld [hl], $20

jr_006_551c:
    ld hl, $c819
    ld [hl], $00
    ld hl, $c81d
    ld [hl], $00
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_006_5540

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_006_554b

jr_006_5540:
    ld bc, $cb98
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h

jr_006_554b:
    ld hl, sp+$21
    ld e, [hl]
    ld d, $00
    push de
    push bc
    ld de, $c7f6
    push de
    call Call_000_376d
    add sp, $06
    ld hl, $c81b
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    ld hl, sp+$21
    ld a, [hl]
    ld [$c81a], a
    ld hl, $c61f
    ld [hl], $00
    push af
    inc sp
    call Call_000_020a
    inc sp
    ld a, [$c81a]
    or a
    ld a, $01
    jr z, jr_006_557d

    xor a

jr_006_557d:
    ld [$c81d], a
    ld hl, $da32
    ld a, [hl]
    or $01
    ld [hl], a
    jp Jump_006_575b


jr_006_558a:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_55a0

    ld a, [$c81d]
    or a
    jp z, Jump_006_575b

    ld hl, sp+$06
    ld a, [hl]
    ld [$da32], a
    jp Jump_006_575b


jr_006_55a0:
    ld hl, sp+$12
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_55b6

    ld a, [$c819]
    or a
    jp z, Jump_006_575b

    ld hl, sp+$07
    ld a, [hl]
    ld [$da32], a
    jp Jump_006_575b


jr_006_55b6:
    ld hl, sp+$14
    ld a, [hl-]
    or [hl]
    jp nz, Jump_006_575b

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_55c7

    ld hl, sp+$21
    ld [hl], $20

jr_006_55c7:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_55e1

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_006_55ec

jr_006_55e1:
    ld bc, $cb98
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h

jr_006_55ec:
    ld hl, sp+$21
    ld e, [hl]
    ld d, $00
    push de
    ld de, $c7f6
    push de
    push bc
    call Call_000_376d
    add sp, $06
    ld hl, $da32
    ld a, [hl]
    or $08
    ld [hl], a
    jp Jump_006_575b


Jump_006_5606:
    ld hl, sp+$12
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_561f

    ld hl, $c819
    ld [hl], $00
    ld hl, $c81d
    ld [hl], $00
    ld hl, sp+$07
    ld a, [hl]
    ld [$da32], a
    jp Jump_006_575b


jr_006_561f:
    ld hl, sp+$14
    ld a, [hl-]
    or [hl]
    jp nz, Jump_006_56a5

    ld a, [$c819]
    or a
    jp z, Jump_006_575b

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_5637

    ld hl, sp+$21
    ld [hl], $20

jr_006_5637:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_565e

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$13
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$13
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$12
    ld [hl], a
    jr jr_006_5679

jr_006_565e:
    ld de, $cb98
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl-]
    dec hl
    ld [hl], a

jr_006_5679:
    ld hl, sp+$11
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$11
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld de, $c7f6
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_376d
    add sp, $06
    ld hl, $da32
    ld a, [hl]
    or $08
    ld [hl], a
    jp Jump_006_575b


Jump_006_56a5:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jp nz, Jump_006_5749

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_56b6

    ld hl, sp+$21
    ld [hl], $20

jr_006_56b6:
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_006_56dd

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$13
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$13
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$12
    ld [hl], a
    jr jr_006_56f8

jr_006_56dd:
    ld de, $cb98
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl-]
    dec hl
    ld [hl], a

jr_006_56f8:
    ld hl, sp+$11
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$11
    ld [hl+], a
    ld [hl], $00
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld de, $c7f6
    push de
    call Call_000_376d
    add sp, $06
    ld hl, $c81b
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    ld hl, sp+$21
    ld a, [hl]
    ld [$c81a], a
    ld hl, $c61f
    ld [hl], $00
    push af
    inc sp
    call Call_000_020a
    inc sp
    ld a, [$c81a]
    or a
    ld a, $01
    jr z, jr_006_573d

    xor a

jr_006_573d:
    ld [$c81d], a
    ld hl, $da32
    ld a, [hl]
    or $01
    ld [hl], a
    jr jr_006_575b

Jump_006_5749:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_575b

    ld a, [$c81d]
    or a
    jr z, jr_006_575b

    ld hl, sp+$06
    ld a, [hl]
    ld [$da32], a

Jump_006_575b:
jr_006_575b:
    ld a, [$da32]
    sub $0f
    jr z, jr_006_579c

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld de, $0006
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld hl, sp+$14
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$13
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01

Jump_006_579c:
jr_006_579c:
    add sp, $15
    ret


    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld d, a
    xor [hl]
    nop
    ld bc, $0000
    ld [bc], a
    add hl, bc
    ld e, b
    ld c, a
    ld b, b
    nop
    ld c, b
    ld h, l
    ld a, c
    jr nz, jr_006_57fe

    daa
    ld l, l
    jr nz, jr_006_57fd

    ld l, c
    ld l, l
    jr nz, jr_006_582c

    ld h, [hl]
    jr nz, jr_006_5834

    ld l, b
    ld h, l
    ld a, [bc]
    ld d, e
    ld [hl], l
    ld [hl], b
    ld h, l
    ld [hl], d
    jr nz, jr_006_5810

    ld l, h
    ld h, c
    ld [hl], e
    ld l, b
    jr nz, jr_006_5812

    ld [hl], d
    ld l, a
    ld [hl], e
    ld l, $00
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
    ld c, c
    jr nz, @+$79

    ld l, a
    ld l, [hl]
    ld h, h
    ld h, l
    ld [hl], d
    jr nz, jr_006_5869

    ld l, b
    ld h, l
    ld l, [hl]
    ld a, [bc]
    ld d, d
    ld h, c
    ld l, [hl]
    ld h, h
    ld a, c
    jr nz, @+$79

jr_006_57fd:
    ld l, c

jr_006_57fe:
    ld l, h
    ld l, h
    jr nz, jr_006_5864

    ld [hl], d
    ld l, c
    ld l, [hl]
    ld h, a
    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c
    rst $38

jr_006_5810:
    nop
    ld b, h

jr_006_5812:
    rlca
    ld bc, $0040
    ld l, l
    ld h, l
    jr nz, jr_006_588e

    ld l, b
    ld h, l
    jr nz, jr_006_588a

    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], e
    ld [hl], h
    ld a, [bc]
    ld h, c
    ld h, h
    db $76
    ld h, l
    ld [hl], d
    ld [hl], h
    ld l, c
    ld [hl], e

jr_006_582c:
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]
    ld [hl], b
    ld h, c
    ld a, c
    ld l, l

jr_006_5834:
    ld h, l
    ld l, [hl]
    ld [hl], h
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld e, b
    ld e, e
    nop
    ld [bc], a
    nop
    nop
    dec b
    add hl, bc
    ld e, b
    pop bc
    ld b, b
    nop
    ld c, b
    ld h, c
    db $76
    ld h, l
    jr nz, jr_006_58dc

    ld l, a

jr_006_5864:
    ld [hl], l
    jr nz, jr_006_58dc

    ld [hl], e
    ld h, l

jr_006_5869:
    ld h, h
    jr nz, jr_006_58e0

    ld l, b
    ld h, l
    ld a, [bc]
    ld l, b
    ld h, c
    ld l, c
    ld [hl], d
    jr nz, @+$72

    ld [hl], d
    ld l, a
    ld h, h
    ld [hl], l
    ld h, e
    ld [hl], h
    ld [hl], e
    ccf
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

jr_006_588a:
    rst $38
    nop
    ld b, h
    rlca

jr_006_588e:
    ld bc, $0040
    ld e, c
    ld l, a
    ld [hl], l
    ld [hl], d
    jr nz, jr_006_58ff

    ld h, c
    ld l, c
    ld [hl], d
    jr nz, jr_006_5908

    ld l, a
    ld l, a
    ld l, e
    ld [hl], e
    ld a, [bc]
    ld [hl], e
    ld l, a
    jr nz, jr_006_5918

    ld l, b
    ld l, c
    ld l, [hl]
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
    ld bc, $001a
    ld e, b
    call Boot
    nop
    nop
    ld bc, $5909
    xor $40
    nop
    ld e, c
    ld l, a
    ld [hl], l
    daa
    db $76
    ld h, l
    jr nz, jr_006_593e

    ld l, a
    ld [hl], h
    jr nz, jr_006_5948

    ld a, c

jr_006_58dc:
    jr nz, jr_006_5940

    ld l, c
    ld h, a

jr_006_58e0:
    ld a, [bc]
    ld h, d
    ld h, c
    ld h, a
    jr nz, jr_006_5955

    ld h, [hl]
    jr nz, jr_006_5956

    ld l, a
    ld l, [hl]
    ld h, l
    ld a, c
    ccf
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

jr_006_58ff:
    ld bc, $0040
    ld d, h
    ld l, b
    ld h, c
    ld l, [hl]
    ld l, e
    ld [hl], e

jr_006_5908:
    jr nz, jr_006_5937

    jr nz, jr_006_597a

    ld l, a
    ld [hl], a
    jr nz, jr_006_5959

    jr nz, jr_006_5975

    ld h, c
    ld l, [hl]
    ld a, [bc]
    ld h, d
    ld [hl], l
    ld a, c

jr_006_5918:
    jr nz, jr_006_597b

    jr nz, jr_006_596e

    ld h, l
    db $76
    ld l, a
    ld l, h
    ld [hl], l
    ld [hl], h
    ld l, c
    ld l, a
    ld l, [hl]
    ld hl, $4700
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
    ld d, b

jr_006_5937:
    ld l, h
    ld h, l
    ld h, c
    ld [hl], e
    ld h, l
    jr nz, @+$76

jr_006_593e:
    ld h, c
    ld l, e

jr_006_5940:
    ld h, l
    jr nz, jr_006_59b7

    ld l, b
    ld l, c
    ld [hl], e
    ld a, [bc]
    ld [hl], e

jr_006_5948:
    ld [hl], b
    ld [hl], d
    ld h, c
    ld a, c
    jr nz, jr_006_59b0

    ld l, a
    ld [hl], h
    ld [hl], h
    ld l, h
    ld h, l
    jr nz, jr_006_59b6

jr_006_5955:
    ld [hl], e

jr_006_5956:
    jr nz, @+$63

    ld a, [bc]

jr_006_5959:
    ld h, a
    ld l, c
    ld h, [hl]
    ld [hl], h
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
    ld bc, $fe45

jr_006_596e:
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $0014

jr_006_5975:
    ld [bc], a
    nop
    nop
    inc d
    nop

jr_006_597a:
    inc bc

jr_006_597b:
    rst $38
    db $fc
    inc d
    nop
    ld [bc], a
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_006_59f3

    ld l, a
    ld [hl], h
    jr nz, jr_006_5a04

    ld l, b
    ld h, l
    jr nz, jr_006_59db

    ld l, c
    ld [hl], d
    ld l, h
    ld a, c
    ld a, [bc]
    ld c, b
    ld h, c
    ld l, c
    ld [hl], d
    jr nz, @+$52

    ld [hl], d
    ld l, a
    ld h, h
    ld [hl], l
    ld h, e
    ld [hl], h
    ld [hl], e
    ld hl, $4700
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, l

jr_006_59b0:
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop

jr_006_59b6:
    ld b, h

jr_006_59b7:
    rlca
    ld bc, $0040
    ld d, b
    ld h, l
    ld [hl], d
    ld h, [hl]
    ld h, l
    ld h, e
    ld [hl], h
    jr nz, jr_006_5a2a

    ld l, a
    ld [hl], d
    ld a, [bc]
    ld h, [hl]
    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_006_5a39

    ld h, c
    ld [hl], h
    jr nz, jr_006_5a3d

    ld h, c
    ld l, c
    ld [hl], d
    ld hl, $4700

jr_006_59db:
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

jr_006_59e9:
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld b, b
    nop
    ld e, c

jr_006_59f3:
    ld l, c
    ld l, e
    ld h, l
    ld [hl], e
    ld hl, $2121
    nop
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, l
    rst $38

jr_006_5a04:
    ld c, $00
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
    ld bc, $6c00
    nop
    rst $38
    rst $38
    sbc $e1
    add e
    ld a, h
    ld hl, sp+$07
    cp $01
    cp $01
    cp $01
    cp $01
    ret nz

    add b
    ldh a, [$e0]

jr_006_5a2a:
    ret nc

    jr c, jr_006_59e9

    ld a, h
    db $76
    adc [hl]
    ld a, e
    add [hl]
    ld a, a
    add e
    dec a
    jp $403f


    ld e, a

jr_006_5a39:
    jr nz, jr_006_5a6a

    db $10
    rrca

jr_006_5a3d:
    db $10
    rrca
    db $10
    cpl
    db $10
    ld e, a
    jr nz, @+$41

    ld b, b
    ei
    nop
    pop af
    ld b, $52
    inc l
    ld h, $99
    and h
    ld e, e
    sub c
    ld l, [hl]
    push de
    ld a, [hl+]
    rst $18
    jr nz, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $db
    nop
    cp l
    nop

jr_006_5a6a:
    ld a, [hl]
    nop
    rst $38
    nop
    inc a
    add c
    sbc c
    ld b, d
    jp $e724


    jr @+$01

    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $fc
    inc bc
    ld [hl], b
    adc a
    nop
    rst $38
    dec de
    db $e4
    ccf
    ret nz

    ei
    inc b
    ld sp, hl
    ld b, $b0
    ld c, a
    dec a
    jp $8779


    ld sp, hl
    rlca
    db $db
    daa
    db $d3
    cpl
    adc d
    ld a, a
    adc a
    ld a, a
    dec c
    rst $38
    rst $18
    nop
    adc a
    ld h, b
    ld c, d
    inc [hl]
    ld h, h
    sbc c
    dec h
    jp c, Jump_006_7689

    xor e
    ld d, h
    ei
    inc b
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, @+$47

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    add b
    ld a, a
    ld [bc], a
    rst $38
    ld b, d
    rst $38
    rst $20
    rst $38
    cp h
    rst $38
    nop
    rst $38
    inc b
    rst $38
    adc a
    rst $38
    ld e, c
    rst $38
    ld [hl], c
    rst $38
    jp $8bff


    cp $0f
    rst $38
    rra
    db $fd
    ccf
    pop af
    rst $38
    di
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_006_5b67

jr_006_5b67:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    ld a, b
    rst $38
    ld bc, $44fe
    ccf
    ld c, a
    ccf
    ret


    ccf
    sbc b
    ld a, a
    ld [hl], b
    rst $38
    jp $d2fc


    ccf
    xor l
    ld e, $d7
    inc c
    ld a, l
    add [hl]
    pop de
    xor $7a
    db $fc
    db $fc
    nop
    nop
    nop
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rra
    rra
    ld a, [hl+]
    inc [hl]
    ld a, l
    ld b, b
    db $db
    and b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    rst $38
    cp a
    ret nz

    ldh a, [$80]
    ldh a, [$9f]
    ldh a, [$9f]
    rst $38
    sbc a
    rst $38
    sbc a
    rst $38
    sbc a
    cp $ff
    db $fd
    inc bc
    rrca
    ld bc, $f90f
    rrca
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    ld hl, sp-$08
    ld d, h
    inc l
    cp [hl]
    ld [bc], a
    db $db
    dec b
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_006_5c48:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_006_5c48

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $28
    sbc a
    cp a
    add b
    add b
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    cp a
    rst $38
    ldh [rIE], a
    rst $38
    ld a, a
    rst $30
    ld sp, hl
    db $fd
    ld bc, $0301
    inc bc
    rst $38
    rst $38
    rst $38
    db $fd
    rst $38
    rlca
    rst $38
    rst $38
    cp $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    call $ceb0
    or b
    rst $18
    and b
    sbc $a1
    cp $81
    cp h
    jp $e7d8


    rst $28
    ldh a, [rIE]
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    or e
    dec c
    ld [hl], e
    dec c
    ei
    dec b
    ld a, e
    add l
    ld a, a
    add c
    dec a
    jp $e71b


    rst $30
    rrca
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_006_5d6d

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    rst $38
    rst $38
    add b
    rst $38
    rst $08
    or b
    cp c

jr_006_5d6d:
    add $ff
    rst $38
    sbc a
    rst $30
    rst $38
    sub a
    rst $38
    sub a
    rst $38
    rst $38
    ld bc, $f3ff
    dec c
    sbc l
    ld h, e
    rst $38
    rst $38
    ld sp, hl
    rst $28
    rst $38
    jp hl


    rst $38
    jp hl


    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    ccf
    rst $18
    ccf
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    db $fc
    rst $38
    ei
    db $fc
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_006_5dba:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_006_5dba

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr jr_006_5df1

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $38
    sub a
    ld hl, sp-$70
    rst $28
    sbc a
    rst $38
    add b
    rst $38
    rst $38
    adc b

jr_006_5df1:
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    jp hl


    rra
    add hl, bc
    rst $30
    ld sp, hl
    rst $38
    ld bc, $ffff
    ld de, $ffff
    rst $38
    rst $38
    nop
    rst $18
    ccf
    ld e, a
    cp a
    ld e, a
    cp a
    rst $18
    ccf
    sbc a
    ld a, a
    sbc a
    ld a, a
    ret nc

    ccf
    rst $28
    ldh a, [$fb]
    db $fc
    ld a, [$fafd]
    db $fd
    ei
    db $fc
    ld sp, hl
    cp $f9
    cp $0b
    db $fc
    rst $30
    rrca
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    jp $a53c


    ld b, d
    ld b, d
    add c
    nop
    nop
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    ld bc, $0700
    inc bc
    dec c
    ld b, $0e
    rra
    scf
    jr c, jr_006_5faf

    ld [hl], c
    ld e, [hl]
    ld h, c
    ld e, [hl]
    pop hl
    rst $38
    rst $38
    cp l
    jp Jump_000_1ee1


    adc a
    ld [hl], b
    rra
    ldh [$3f], a
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop

jr_006_5faf:
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    sbc [hl]
    pop hl
    sbc a
    ldh [$8f], a
    ldh a, [$cf]
    ldh a, [$c5]
    ld a, [$fe51]
    ldh a, [rIE]
    or d
    rst $38
    inc e
    db $e3
    nop
    rst $38
    nop
    rst $38
    and $19
    rst $38
    nop
    rst $38
    nop
    cp e
    ld b, h
    inc de
    db $ec
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    add c
    cp $f0
    rst $38
    ret nc

    ccf
    cp h
    ld a, a
    ld [hl], a
    adc a
    ld a, d
    add a
    ld a, a
    add e
    dec a
    jp Jump_006_7f80


    inc bc
    rst $38
    ld b, l
    cp $ee
    rst $38
    or a
    ld hl, sp+$2e
    pop af
    ld e, [hl]
    pop hl
    sbc $e1
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38

jr_006_60d4:
    rst $38
    rst $38
    ld l, l
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ei
    nop
    pop af
    ld b, $52
    inc l
    ld h, $99
    and h
    ld e, e
    sub c
    ld l, [hl]
    push de
    ld a, [hl+]
    rst $18
    jr nz, jr_006_60d4

    nop
    cp l
    nop
    ld a, [hl]
    nop
    rst $38
    nop
    inc a
    add c
    sbc c
    ld b, d
    jp $e724


    jr @+$01

    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $18
    nop
    adc a
    ld h, b
    ld c, d
    inc [hl]
    ld h, h
    sbc c
    dec h
    jp c, Jump_006_7689

    xor e
    ld d, h
    ei
    inc b
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_006_61b0

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $38
    rst $38
    rst $38
    add b
    add b
    rst $38
    rst $38
    rst $38
    ld [hl], b
    ld a, a
    ld e, a
    ld [hl], l
    ld e, a
    ld [hl], l
    ld e, a
    ld [hl], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38

jr_006_61b0:
    nop
    rst $38
    rst $38
    add hl, bc
    rst $38
    ld c, c
    rst $38
    ld l, l
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    add a
    rst $38
    dec [hl]
    rst $38
    or l
    rst $38
    rst $38
    rst $38
    ld bc, $ff01
    rst $38
    rst $38
    ld c, $fe
    ld a, [$fa0e]
    ld c, [hl]
    ld a, [$c06e]
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_006_61f9

jr_006_61f9:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e

jr_006_6212:
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    ld e, a
    ld [hl], b
    rst $38
    rst $38
    rst $38
    add b
    rst $38
    rst $38
    inc b
    rlca
    dec b
    ld b, $05
    ld b, $03
    inc bc
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    jr nz, jr_006_6212

jr_006_6232:
    and b
    ld h, b
    and b
    ld h, b
    ret nz

    ret nz

    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    inc b
    rlca
    dec b
    ld b, $05
    ld b, $03
    inc bc
    ld a, [$ff0e]
    rst $38
    rst $38
    ld bc, $ffff
    jr nz, jr_006_6232

    and b
    ld h, b
    and b
    ld h, b
    ret nz

    ret nz

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    add b
    rst $38
    rst $38
    rst $38
    ld [hl], b
    ld a, a
    ld e, a
    db $76
    ld e, a
    ld [hl], b
    ld e, a
    ld [hl], l
    rst $38
    rst $38
    rst $38
    ld bc, $ff01
    rst $38
    rst $38
    ld c, $fe
    ld a, [$fa6e]
    ld c, $fa
    xor [hl]
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_006_62ca:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_006_62ca

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_006_637f

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_006_637f:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_006_638c:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_006_638c

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    rst $38
    nop
    db $fd
    inc bc
    rst $38
    ld b, $f8
    inc c
    ld hl, sp+$10
    di
    ld hl, $63a6
    db $ec
    ld b, a
    ld a, a
    rst $38
    ret nz

    add b
    nop
    nop
    cpl
    rra
    ldh a, [$7f]
    add b
    rst $38
    nop
    rst $38
    rrca
    rst $38
    cp $ff
    inc bc
    ld bc, $0000
    db $f4
    ld hl, sp+$0f
    cp $01
    rst $38
    nop
    rst $38
    ldh a, [rIE]
    rst $38
    nop
    cp a
    ret nz

    rst $38
    ld h, b
    rra
    jr nc, jr_006_6450

    ld [$84cf], sp
    ld h, l
    add $37
    ld [c], a
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_006_6450:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    add h
    rst $08
    ret z

    adc a
    adc c
    adc a
    adc e
    adc a
    adc e
    adc a
    adc a
    adc a
    adc a
    adc a
    adc a
    adc a
    ccf
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld hl, $13f3
    pop af
    sub c
    pop af
    pop de
    pop af
    pop de
    pop af
    pop af
    pop af
    pop af
    pop af
    pop af
    pop af
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei

jr_006_64f2:
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    adc a
    adc a
    rst $00
    rst $20
    jp $e1a3


    jr nc, jr_006_64f2

    db $fc
    ld l, b
    cp l
    ld l, [hl]
    rst $28
    dec sp
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    cpl
    rra
    nop
    nop
    ld b, b
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $f4
    ld hl, sp+$00
    nop
    ld [bc], a
    ld bc, $f1e3
    pop af
    db $e3
    rst $20
    jp $87c5


    inc c
    rrca
    ccf
    ld d, $bd
    db $76
    rst $30
    call c, $dfc0
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    jp $a53c


    ld b, d
    ld b, d
    add c
    nop
    nop
    rst $38
    ld a, [de]
    rst $38
    ld c, $ff
    rrca
    rst $38
    rrca
    db $f4
    rrca
    cp $07
    ei
    rlca
    rst $38
    nop
    ccf
    rst $38
    ei
    ld b, h
    ld a, e
    call nz, $ffff
    rst $38
    rst $38
    nop
    rst $38
    add b
    rst $38
    rst $38
    ld a, a
    db $fc
    rst $38
    rst $18
    ld [hl+], a
    sbc $23
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    ld bc, $ffff
    cp $ff
    ld e, b
    rst $38
    ld [hl], b
    rst $38
    ldh a, [rIE]
    ldh a, [$2f]
    ldh a, [$7f]
    ldh [$df], a
    ldh [rIE], a
    nop
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc

jr_006_65fb:
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    ld bc, $0700
    inc bc
    dec c
    ld b, $0e
    rra
    scf
    jr c, jr_006_6641

    ld [hl], c
    ld e, [hl]
    ld h, c
    ld e, [hl]
    pop hl
    rst $38
    rst $38
    cp l
    jp Jump_000_1ee1


    adc a
    ld [hl], b
    rra
    ldh [$3f], a
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    rst $38
    rst $38
    sbc $e1
    add e
    ld a, h
    ld hl, sp+$07
    cp $01
    cp $01
    cp $01
    cp $01
    ret nz

    add b
    ldh a, [$e0]
    ret nc

    jr c, jr_006_65fb

    ld a, h
    db $76

jr_006_6641:
    adc [hl]
    ld a, e
    add [hl]
    ld a, a
    add e
    dec a
    jp $ffff


    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    sbc [hl]
    pop hl
    sbc a
    ldh [$8f], a
    ldh a, [$cf]
    ldh a, [$c5]
    ld a, [$fe51]
    ldh a, [rIE]
    or d
    rst $38
    inc e
    db $e3
    nop
    rst $38
    nop
    rst $38
    and $19
    rst $38
    nop
    rst $38
    nop
    cp e
    ld b, h
    inc de
    db $ec
    db $fc
    inc bc
    ld [hl], b
    adc a
    nop
    rst $38
    dec de
    db $e4
    ccf
    ret nz

    ei
    inc b
    ld sp, hl
    ld b, $b0
    ld c, a
    dec a
    jp $8779


    ld sp, hl
    rlca
    db $db
    daa
    db $d3
    cpl
    adc d
    ld a, a
    adc a
    ld a, a
    dec c
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    add c
    cp $f0
    rst $38
    ret nc

    ccf
    cp h
    ld a, a
    ld [hl], a
    adc a
    ld a, d
    add a
    ld a, a
    add e
    dec a
    jp Jump_006_7f80


    inc bc
    rst $38
    ld b, l
    cp $ee
    rst $38
    or a
    ld hl, sp+$2e
    pop af
    ld e, [hl]
    pop hl
    sbc $e1
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e

jr_006_679d:
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld [hl], b
    nop
    ld bc, $0700
    inc bc
    dec c
    ld b, $0e
    rra
    scf
    jr c, jr_006_67e3

    ld [hl], c
    ld e, [hl]
    ld h, c
    ld e, [hl]
    pop hl
    rst $38
    rst $38
    cp l
    jp Jump_000_1ee1


    adc a
    ld [hl], b
    rra
    ldh [$3f], a
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    rst $38
    rst $38
    sbc $e1
    add e
    ld a, h
    ld hl, sp+$07
    cp $01
    cp $01
    cp $01
    cp $01
    ret nz

    add b
    ldh a, [$e0]
    ret nc

    jr c, jr_006_679d

    ld a, h
    db $76

jr_006_67e3:
    adc [hl]
    ld a, e
    add [hl]
    ld a, a
    add e
    dec a
    jp Jump_000_1f1f


    ld a, [hl+]
    inc [hl]
    ld a, l
    ld b, b
    db $db
    and b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    rst $38
    cp a
    ret nz

    ldh a, [$80]
    ldh a, [$9f]
    ldh a, [$9f]
    rst $38
    sbc a
    rst $38
    sbc a
    rst $38
    sbc a
    cp $ff
    db $fd
    inc bc
    rrca
    ld bc, $f90f
    rrca
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    ld hl, sp-$08
    ld d, h
    inc l
    cp [hl]
    ld [bc], a
    db $db
    dec b
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    sbc [hl]
    pop hl
    sbc a
    ldh [$8f], a
    ldh a, [$cf]
    ldh a, [$c5]
    ld a, [$fe51]
    ldh a, [rIE]
    or d
    rst $38
    inc e
    db $e3
    nop
    rst $38
    nop
    rst $38
    and $19
    rst $38
    nop
    rst $38
    nop
    cp e
    ld b, h
    inc de
    db $ec
    db $fc
    inc bc
    ld [hl], b
    adc a
    nop
    rst $38
    dec de
    db $e4
    ccf
    ret nz

    ei
    inc b
    ld sp, hl
    ld b, $b0
    ld c, a
    dec a
    jp $8779


    ld sp, hl
    rlca
    db $db
    daa
    db $d3
    cpl
    adc d
    ld a, a
    adc a
    ld a, a
    dec c
    rst $38
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    sbc a
    cp a
    add b
    add b
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    cp a
    rst $38
    ldh [rIE], a
    rst $38
    ld a, a
    rst $30
    ld sp, hl
    db $fd
    ld bc, $0301
    inc bc
    rst $38
    rst $38
    rst $38
    db $fd
    rst $38
    rlca
    rst $38
    rst $38
    cp $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_006_6962

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    add c
    cp $f0
    rst $38
    ret nc

    ccf
    cp h
    ld a, a
    ld [hl], a
    adc a
    ld a, d
    add a
    ld a, a
    add e
    dec a
    jp Jump_006_7f80


    ld [bc], a
    rst $38
    ld b, d
    rst $38
    rst $20
    rst $38

jr_006_6962:
    cp h
    rst $38
    nop
    rst $38
    inc b
    rst $38
    adc a
    rst $38
    ld e, c
    rst $38
    ld [hl], c
    rst $38
    jp $8bff


    cp $0f
    rst $38
    rra
    db $fd
    ccf
    pop af
    rst $38
    di
    sbc d
    rst $38
    adc [hl]
    rst $38
    jp $d1ff


    ld a, a
    ldh a, [rIE]
    ld hl, sp-$41
    db $fc
    adc a
    rst $38
    rst $08
    ld bc, $10fe
    rst $38
    db $10
    rst $38
    ld hl, sp-$01
    rrca
    rst $38
    nop
    rst $38
    add b
    rst $38
    db $e3
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_006_69bb

jr_006_69bb:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    ld a, b
    rst $38
    ld bc, $44fe
    ccf
    ld c, a
    ccf
    ret


    ccf
    sbc b
    ld a, a
    ld [hl], b
    rst $38
    jp $d2fc


    ccf
    xor l
    ld e, $d7
    inc c
    ld a, l
    add [hl]
    pop de
    xor $7a
    db $fc
    db $fc
    nop
    nop
    nop
    db $ed
    ld a, b
    ret c

    jr nc, jr_006_6a60

    jr nc, jr_006_6a77

    ld hl, $372b
    inc a
    rra
    inc bc
    nop
    nop
    nop
    adc a
    ld a, a
    db $fc
    inc bc
    xor b
    ld [hl], b
    ldh a, [$f8]
    sub h
    ld hl, sp+$0b
    db $fc
    rst $30
    ld c, $7b
    rlca
    call $ceb0
    or b
    rst $18
    and b
    sbc $a1
    cp $81
    cp h
    jp $e7d8


    rst $28
    ldh a, [rIE]
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    or e
    dec c
    ld [hl], e
    dec c
    ei
    dec b
    ld a, e
    add l
    ld a, a
    add c
    dec a
    jp $e71b


    rst $30
    rrca
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38

jr_006_6a60:
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38

jr_006_6a77:
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    ld [bc], a
    ld bc, $0e11
    cpl
    db $10
    rra
    jr nz, jr_006_6ab4

    jr nz, jr_006_6af6

    jr nz, jr_006_6ad8

    ld b, b
    nop
    nop
    ld b, d
    add c
    and l
    ld b, d
    jp $ff3c


    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    add b
    rst $38
    rst $08
    or b
    cp c
    add $ff
    rst $38

jr_006_6ab4:
    sbc a
    rst $30
    rst $38
    sub a
    rst $38
    sub a
    rst $38
    rst $38
    ld bc, $f3ff
    dec c
    sbc l
    ld h, e
    rst $38
    rst $38
    ld sp, hl
    rst $28
    rst $38
    jp hl


    rst $38
    jp hl


    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    ccf

jr_006_6ad8:
    rst $18
    ccf
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    db $fc
    rst $38
    ei
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00

jr_006_6af6:
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_006_6afc:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_006_6afc

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_006_6b33

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    ccf
    ld b, b
    ld e, a
    jr nz, jr_006_6b5e

    db $10
    rrca
    db $10
    rrca

jr_006_6b33:
    db $10
    cpl
    db $10
    ld e, a
    jr nz, jr_006_6b78

    ld b, b
    rst $18
    nop
    adc a
    ld h, b
    ld c, d
    inc [hl]
    ld h, h
    sbc c
    dec h
    jp c, Jump_006_7689

    xor e
    ld d, h
    ei
    inc b
    rst $38
    sub a
    ld hl, sp-$70
    rst $28
    sbc a
    rst $38
    add b
    rst $38
    rst $38
    adc b
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    jp hl


    rra
    add hl, bc

jr_006_6b5e:
    rst $30
    ld sp, hl
    rst $38
    ld bc, $ffff
    ld de, $ffff
    rst $38
    rst $38
    nop
    rst $18
    ccf
    ld e, a
    cp a
    ld e, a
    cp a
    rst $18
    ccf
    sbc a
    ld a, a
    sbc a
    ld a, a
    ret nc

    ccf

jr_006_6b78:
    rst $28
    ldh a, [$fb]
    db $fc
    ld a, [$fafd]
    db $fd
    ei
    db $fc
    ld sp, hl
    cp $f9
    cp $0b
    db $fc
    rst $30
    rrca
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

jr_006_6b96:
    rst $10
    ret nc

    rst $10
    ret nc

    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de

jr_006_6ba2:
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    ei
    nop
    pop af
    ld b, $52
    inc l
    ld h, $99
    and h
    ld e, e
    sub c
    ld l, [hl]
    push de
    ld a, [hl+]
    rst $18
    jr nz, jr_006_6b96

    nop
    cp l
    nop
    ld a, [hl]
    nop
    rst $38
    nop
    inc a
    add c
    sbc c
    ld b, d
    jp $e724


    jr jr_006_6ba2

    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_006_6c31

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_006_6c31:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_006_6c3e:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_006_6c3e

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld c, [hl]
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_006_6f54

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff

jr_006_6f54:
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_006_6f5d

jr_006_6f5d:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_006_6fce:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_006_6fce

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_006_7093

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_006_7093:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_006_70a0:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_006_70a0

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $38
    rst $38
    rst $38
    rst $38
    ei
    db $fc
    rst $28
    ldh a, [$ef]
    ldh a, [$db]
    db $fc
    rst $00
    rst $38
    sbc $e1
    rst $38
    rst $38
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $18
    ccf
    rst $30
    rrca
    rst $30
    rrca
    db $db
    ccf
    db $e3
    rst $38
    ld a, e
    add a
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    rst $38
    ldh a, [$cf]
    rst $38
    or b
    rst $38
    xor a
    rst $18
    adc $f1
    di
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rra
    ldh [rIE], a
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    rst $38
    rst $38
    rrca
    di
    rst $38
    dec c
    rst $38
    push af
    ei
    ld [hl], e
    adc a
    rst $08
    ccf
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop

jr_006_7365:
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld l, a
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    jr nz, jr_006_7365

    rra
    ret z

    rra
    rst $00
    rra
    push bc
    ld e, $c6
    dec e
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $30
    ld [$08f7], sp
    db $fc
    ld bc, $02f8
    ld bc, $0b04
    ld hl, sp+$13
    ld hl, sp-$1d
    ld hl, sp-$5d
    ld a, b
    ld h, e
    cp b
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    add b
    rst $38
    ld b, b
    rst $38
    ld a, a
    rst $38
    ccf
    ldh a, [$38]
    rst $28
    scf
    rst $28
    scf
    xor $37
    db $ed
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38

jr_006_7434:
    rst $38
    nop

jr_006_7436:
    nop
    rst $38

jr_006_7438:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_006_743e:
    ld bc, $02ff
    rst $38
    cp $ff
    db $fc
    rrca
    inc e
    rst $30
    db $ec
    rst $30
    db $ec
    ld [hl], a
    db $ec
    or a
    db $e3
    jr c, jr_006_7434

    jr c, jr_006_7436

    jr c, jr_006_7438

    jr c, jr_006_747a

    ld hl, sp-$1d
    jr c, jr_006_743e

    jr c, @-$1b

    jr c, jr_006_7436

    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_006_74b6

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_006_747a:
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    dec [hl]
    rst $28
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed

jr_006_74b6:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    rst $38
    ccf
    jp nz, $cc7d

    ld [hl], e
    pop de
    ld l, [hl]
    ret nc

    ld l, a
    call z, Call_006_4273
    ld a, l
    ld [hl], c
    adc $ff
    rst $38
    ld b, b
    cp a
    adc h
    ld [hl], e
    ld b, $f9
    pop hl
    ld e, $10
    rst $28
    ld c, $f1
    pop bc
    ld a, $ff
    rst $38
    add b
    ld a, a
    inc c
    di
    ld b, $f9
    pop bc
    ld a, $20
    rst $18
    inc e
    db $e3
    add e
    ld a, h
    rst $38
    db $fc
    inc bc
    cp $1b
    and $0f
    ld a, [c]
    jp Jump_000_233e


    sbc $1e
    ld [c], a
    ld [bc], a
    rst $38
    xor h
    rst $30
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_006_754f

jr_006_754f:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc

jr_006_755f:
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    ret z

    ld [hl], a
    db $e4

jr_006_7571:
    ld e, e
    db $dd
    ld h, b
    ret nz

    ld a, a
    cp a
    ld a, a
    sbc [hl]
    ld a, a
    ld e, $7f
    nop
    rst $38
    jr nz, jr_006_755f

    db $10
    rst $28
    rst $30
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld b, b
    cp a
    jr nz, jr_006_7571

    rst $28
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add e
    ld a, [hl]
    ld b, a
    cp d
    db $db
    ld b, $03
    cp $fd
    cp $79
    cp $78
    cp $00
    rst $38
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $00
    jr c, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ld bc, $ff00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    rst $38
    nop
    rst $38
    nop
    nop
    ret nz

    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_006_7620:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_006_7620

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_006_7657

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    rst $38
    nop
    rst $38
    nop
    sbc a
    ld h, b
    rst $38
    nop
    rst $38

jr_006_7657:
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rIE], a
    nop
    nop
    nop
    nop
    rst $38
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

Jump_006_7689:
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_006_7705

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_006_7705:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_006_7712:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_006_7712

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc

jr_006_78f5:
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    scf
    db $ed
    scf
    xor $37
    rst $28
    jr c, jr_006_78f5

    ccf
    ldh a, [$7f]
    rst $38
    ld b, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    cp $ff
    db $dd
    db $e3
    xor l
    pop de
    and l
    reti


    add l
    ld sp, hl
    xor c
    pop de
    adc a
    pop af
    sub l
    jp hl


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_006_7941:
    nop
    ld sp, hl
    ld b, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    cp e
    rst $00
    or l
    adc e

jr_006_7954:
    and l
    sbc e

jr_006_7956:
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a

jr_006_795c:
    xor c
    sub a

jr_006_795e:
    db $ec
    or a

jr_006_7960:
    db $ec
    ld [hl], a
    db $ec
    rst $30
    inc e
    rst $30
    db $fc
    rrca
    cp $ff
    ld [bc], a
    rst $38
    ld bc, $e3ff
    jr c, jr_006_7954

    jr c, jr_006_7956

    jr c, jr_006_7998

    ld hl, sp-$1d
    jr c, jr_006_795c

    jr c, jr_006_795e

    jr c, jr_006_7960

    jr c, jr_006_7941

    db $dd
    jp $c3dc


    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_006_7998:
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    add $1d
    push bc
    ld e, $c7
    rra
    ret z

    rra
    ret nc

    rra
    add b
    jr nz, jr_006_79ea

    ld b, b
    ccf
    add b
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    add l
    ld sp, hl
    add c
    ld sp, hl
    sub l
    jp hl


    sub l
    jp hl


    add l
    ld sp, hl
    add e
    pop bc

jr_006_79ea:
    dec h
    sbc c
    ld e, d
    and l
    ld a, [$d500]
    nop
    xor d
    nop
    ld d, l
    nop
    and b
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    cp a
    nop
    ld d, a
    nop
    xor e
    nop
    ld d, l
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld bc, $a100
    sbc a
    add c
    sbc a
    xor c
    sub a
    xor c
    sub a
    and c
    sbc a
    pop bc
    add e
    and h
    sbc c
    ld e, d
    and l
    rst $30
    ld [$08f7], sp
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, e
    cp b
    and e
    ld a, b
    db $e3
    ld hl, sp+$13
    ld hl, sp+$0b
    ld hl, sp+$01
    inc b
    ld hl, sp+$02
    db $fc
    ld bc, $d5ca
    adc $d1
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld e, b
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_006_7b28

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff

jr_006_7b28:
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_006_7b31

jr_006_7b31:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_006_7ba2:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_006_7ba2

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld hl, sp-$01
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    db $f4
    ld hl, sp-$1c
    ei
    ret nz

    db $ec
    ret nz

    db $eb
    ret nz

    rst $28
    ret c

    rst $20
    ldh [$f2], a
    add sp, -$0e
    rst $18
    ccf
    rst $20
    rra
    inc hl
    rla
    inc bc
    rst $10
    inc bc
    rst $30
    dec de
    rst $20
    rlca
    ld c, a
    rla
    ld c, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_006_7ca7

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    call nc, $90e8
    rst $08
    add a
    ret c

    ret z

jr_006_7ca7:
    ldh a, [$e3]
    db $fc
    call nz, $c0e3
    rst $38
    rst $38
    rst $38
    dec hl
    rla
    add hl, bc
    di
    pop hl
    dec de
    inc de
    rrca
    rst $00
    ccf
    inc hl
    rst $00
    inc bc
    rst $38
    rst $38
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_006_7cd4:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_006_7cd4

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    db $fc
    ldh a, [$f0]
    ldh [$e0], a
    ret nz

    ret nz

    add b
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    ld a, a
    ld a, $3e
    inc e
    inc e
    inc c
    inc c
    inc b
    inc b
    cp $fe
    ld hl, sp-$08
    ldh a, [$f0]
    pop af
    pop af
    di
    di
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    ld h, e
    rra
    rra
    rrca
    rrca
    adc [hl]
    adc [hl]
    call z, $cccc
    call z, $dede
    rst $38
    rst $38
    cp $fe
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, $3e
    jr jr_006_7e20

    jr c, jr_006_7e42

    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp Jump_000_01c3


    ld bc, $3131
    ld a, b
    ld a, b
    ld a, b
    ld a, b

jr_006_7e20:
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_006_7e42:
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    nop
    nop
    add b
    add b
    jp $efc3


    rst $28
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
    add b
    add b
    ret nz

    ret nz

    pop hl
    pop hl
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld h, c
    ld h, c
    ldh [$e0], a
    ret nz

    ret nz

    jp $c3c3


    jp $c7c7


    rst $00
    rst $00
    rst $20
    rst $20
    db $fc
    db $fc
    inc a
    inc a
    inc a
    inc a
    db $fc
    db $fc
    db $fc
    db $fc
    ld hl, sp-$08
    cp $fe
    rst $38
    rst $38
    ld hl, sp-$08
    ld a, b
    ld a, b
    ld a, b
    ld a, b
    ld a, b
    ld a, b
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ldh a, [$f0]
    pop af
    pop af
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    ld hl, sp-$08
    ld hl, sp-$08
    ld hl, sp-$08
    ld sp, hl
    ld sp, hl
    rst $38
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e

Jump_006_7f80:
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
