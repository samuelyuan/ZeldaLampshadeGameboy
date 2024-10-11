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


    db $98, $cb, $00, $0e, $58, $ca, $30, $01, $88, $cb, $02, $00, $8a, $cb, $02, $00
    db $8c, $cb, $02, $00, $8e, $cb, $02, $00, $90, $cb, $01, $00, $c0, $c5, $28, $00
    db $e8, $c5, $08, $00, $f0, $c5, $14, $00, $04, $c6, $08, $00, $3d, $c6, $01, $00
    db $42, $c6, $02, $00, $29, $c6, $14, $00, $26, $c5, $03, $00, $b9, $c0, $44, $04
    db $fd, $c4, $02, $00, $01, $c5, $02, $00, $07, $c5, $01, $00, $09, $c5, $02, $00
    db $bf, $d9, $02, $00, $00, $00

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


    db $25, $12, $04, $1a, $00, $57, $ae, $00, $01, $00, $00, $02, $09, $58, $4f

    ld b, b
    nop

    db "Hey I'm Dim of the\n"
    db "Super Flash Bros."
   
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
    
    db "I wonder when\n"
    db "Randy will bring"

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
    
    db "me the latest\n"
    db "advertising\n"
    db "payment..."

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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    db $01

    db $1a, $00, $58, $5b, $00, $02, $00, $00, $05, $09, $58, $c1

    ld b, b
    nop

    db "Have you used the\n"
    db "hair products?"

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
    
    db "Your hair looks\n"
    db "so shiny..."

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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    db $01

    db $1a, $00, $58, $cd, $00, $01, $00, $00, $01

    add hl, bc
    ld e, c
    db $ee

    db $40, $00
    
    db "You've got my big\n"
    db "bag of money?"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00
    db $44, $07, $01, $40, $00
    
    db "Thanks - now I can\n"
    db "buy a Revolution!"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "Please take this\n"
    db "spray bottle as a\n"
    db "gift."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45
    db $fe, $12, $00, $44, $03, $01, $14, $00, $02, $00, $00, $14, $00, $03, $ff, $fc
    db $14, $00, $02, $ff, $fd, $75, $ff, $fc, $40, $00
    
    db "You got the Girly\n"
    db "Hair Products!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "Perfect for\n"
    db "fighting hat hair!"

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00

    dec h
    ld b, b
    nop
    ld e, c
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
    db $01
    nop

    db $6c, $00

    INCBIN "gfx/image_006_5a16.2bpp"

    db $6d, $00

    INCBIN "gfx/image_006_60d8.2bpp"

    db $70, $00

    INCBIN "gfx/image_006_67aa.2bpp"

    db $4e, $00

    INCBIN "gfx/image_006_6eac.2bpp"

    db $6f, $00

    INCBIN "gfx/image_006_738e.2bpp"

    db $58, $00

    INCBIN "gfx/image_006_7a80.2bpp"
