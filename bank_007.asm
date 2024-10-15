SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

    ld [$c523], a
    ldh a, [rIE]
    ld [$c524], a
    ldh a, [rLCDC]
    ld [$c525], a
    ld a, $80
    ldh [rLCDC], a
    ld a, $01
    ld [$00ff], a
    ld a, $00
    ld [$000f], a
    halt
    ld a, $00
    ldh [rLCDC], a
    ld [$9d9e], sp
    ld sp, $9d9e
    push hl
    push de
    push bc
    ld a, [$c523]
    push af
    ldh a, [rVBK]
    ld e, a
    bit 0, a
    jr z, jr_007_4046

    ld hl, $9d96
    ld c, $0a

jr_007_403a:
    ld b, [hl]
    xor a
    ldh [rVBK], a
    ld [hl], b
    inc l
    inc a
    ldh [rVBK], a
    dec c
    jr nz, jr_007_403a

jr_007_4046:
    xor a
    ldh [rNR52], a
    ldh [rVBK], a
    ld a, e
    ld [$9dbb], a
    ld a, $01
    ldh [rVBK], a
    ld hl, $9dcb
    ld b, $12

jr_007_4058:
    xor a
    ld c, $15
    rst $28
    ld a, l
    add $0b
    ld l, a
    dec b
    jr nz, jr_007_4058

    xor a
    ldh [rVBK], a
    ld a, $03
    ldh [rBGP], a
    ld a, $80
    ldh [rBCPS], a
    xor a
    ld c, $69
    ld [c], a
    ld [c], a
    dec a
    ld [c], a
    ld [c], a
    ld [c], a
    ld [c], a
    ld [c], a
    ld [c], a
    ld a, $70
    ldh [rSCY], a
    ld a, $5c
    ldh [rSCX], a
    call Call_007_4189
    ld hl, $9db7
    ld de, $9d9c
    ld c, $04
    rst $30
    ld hl, $9dcb
    ld de, $42ea
    ld b, $03

jr_007_4096:
    ld a, $20
    ld [hl+], a
    ld c, $13
    rst $30
    ld a, $20
    ld [hl+], a
    ld a, l
    add $0b
    ld l, a
    dec b
    jr nz, jr_007_4096

    ld a, $20
    ld c, $15
    rst $28
    ld l, $6b
    ld c, $04
    rst $30
    pop bc
    call Call_007_413a
    ld c, $08
    rst $30
    ld a, [$c0a0]
    call Call_007_413e
    ld a, $20
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld l, $8b
    ld c, $04
    rst $30
    pop bc
    call Call_007_413a
    ld c, $06
    rst $30
    pop bc
    call Call_007_413a
    ld a, $20
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a

jr_007_40d7:
    ld a, l
    add $0b
    ld l, a
    ld c, $04
    rst $30
    pop bc
    push bc
    call Call_007_413a
    ld de, $433d
    ld c, $07
    rst $30
    pop de
    call Call_007_415a
    ld de, $4344
    bit 7, l
    jr z, jr_007_40d7

    ld de, $4348
    ld l, $ab
    ld c, $06
    rst $30
    ld a, [$c525]
    call Call_007_413e
    ld c, $04
    rst $30
    ldh a, [rKEY1]
    call Call_007_413e
    ld c, $04
    rst $30
    ld a, [$c524]
    call Call_007_413e
    ld [hl], $20
    ld l, $cb
    ld c, $07
    rst $30

jr_007_411a:
    ld a, $20
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    cp $20
    jr z, jr_007_4130

    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    inc de
    ld b, a
    ld a, [bc]
    call Call_007_413e
    jr jr_007_411a

jr_007_4130:
    ld a, $89
    ldh [rLCDC], a

jr_007_4134:
    xor a
    ldh [rIF], a
    db $76
    jr jr_007_4134

Call_007_413a:
    call Call_007_413f
    ld a, c

Call_007_413e:
    ld b, a

Call_007_413f:
    ld a, b
    and $f0
    swap a
    add $30
    cp $3a
    jr c, jr_007_414c

    add $07

jr_007_414c:
    ld [hl+], a
    ld a, b
    and $0f
    add $30
    cp $3a
    jr c, jr_007_4158

    add $07

jr_007_4158:
    ld [hl+], a
    ret


Call_007_415a:
    ld b, d
    ld c, e
    call Call_007_413a
    ld a, $20
    ld [hl+], a
    ld [hl+], a
    ld a, e
    sub $08
    ld e, a
    ld a, d
    sbc $00
    ld d, a

jr_007_416b:
    ld a, l
    add $0b
    ld l, a
    ld a, $20
    ld [hl+], a

jr_007_4172:
    ld a, [de]
    inc de
    call Call_007_413e
    ld a, [de]
    inc de
    call Call_007_413e
    ld a, $20
    ld [hl+], a
    bit 4, l
    jr nz, jr_007_4172

    ld a, l
    and $7f
    jr nz, jr_007_416b

    ret


Call_007_4189:
    ld hl, $41b0

jr_007_418c:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    or e
    ret z

jr_007_4192:
    ld c, [hl]
    inc hl
    bit 7, c
    jr z, jr_007_41a2

    ld a, [hl+]

jr_007_4199:
    ld [de], a
    inc de
    ld [de], a
    inc de
    inc c
    jr nz, jr_007_4199

    jr jr_007_4192

jr_007_41a2:
    inc c
    dec c
    jr z, jr_007_418c

jr_007_41a6:
    ld a, [hl+]
    ld [de], a
    inc de
    ld [de], a
    inc de
    dec c
    jr nz, jr_007_41a6

    jr jr_007_4192

    nop
    sub b
    ld hl, sp-$01
    nop
    nop
    sub d
    ld hl, sp-$01
    nop
    ret nc

    sub d
    ld [$ffff], sp
    rst $38
    rst $38
    jp $ffff


    rst $38
    nop
    nop
    sub e
    ld d, b
    rst $38
    rst $08
    and a
    inc sp
    inc sp
    inc sp
    sub a
    rst $08
    rst $38
    rst $08
    adc a
    rrca
    rst $08
    rst $08
    rst $08
    inc bc
    rst $38
    add a
    inc sp
    rst $20
    rst $08
    sbc a
    ccf
    inc bc
    rst $38
    add a
    ld [hl], e
    di
    rst $00
    di
    ld [hl], e
    add a
    rst $38
    rst $00
    and a
    ld h, a
    inc bc
    rst $20
    rst $20
    rst $20
    rst $38
    inc bc
    ccf
    ccf
    add a
    di
    inc sp
    add a
    rst $38
    add a
    inc sp
    ccf
    rlca
    inc sp
    inc sp
    add a
    rst $38
    inc bc
    di
    di
    rst $20
    rst $20
    rst $08
    rst $08
    rst $38
    add a
    inc sp
    inc sp
    add a
    inc sp
    inc sp
    add a
    rst $38
    add a
    inc sp
    inc sp
    add e
    di
    inc sp
    add a
    nop
    and b
    sub e
    ld [$ffff], sp
    sbc a
    sbc a
    rst $38
    sbc a
    sbc a
    rst $38
    nop
    db $10
    sub h
    ld b, d
    rst $38
    rst $08
    or a
    ld a, e
    ld a, e
    inc bc
    ld a, e
    ld a, e
    rst $38
    rlca
    ld a, e
    ld a, e
    rlca
    ld a, e
    ld a, e
    rlca
    rst $38
    jp Jump_007_7fbf


    ld a, a
    ld a, a
    cp a
    jp $0fff


    ld [hl], a
    ld a, e
    ld a, e
    ld a, e
    ld [hl], a
    rrca
    rst $38
    inc bc
    ld a, a
    ld a, a
    inc bc
    ld a, a
    ld a, a
    inc bc
    rst $38
    inc bc
    ld a, a
    ld a, a
    inc bc
    ld a, a
    ld a, a
    ld a, a
    rst $38
    add e
    ld a, a
    ld a, a
    ld b, e
    ld a, e
    ld a, e
    add a
    rst $38
    ld a, e
    ld a, e
    ld a, e
    inc bc
    ld a, e
    ld a, e
    ld a, e
    rst $38
    add e
    ei
    rst $28
    ld [bc], a
    add e
    rst $38
    ld a, [$0afb]
    rlca
    rst $38
    ld a, e
    ld [hl], a
    ld l, a
    ld e, a
    rra
    ld l, a
    ld [hl], e
    rst $38
    ld a, [$137f]
    inc bc
    rst $38
    ld a, e
    inc sp
    ld c, e
    ld a, e
    ld a, e
    ld a, e
    ld a, e
    rst $38
    ld a, e
    dec sp
    ld e, e
    ld l, e
    ld [hl], e
    ld a, e
    ld a, e
    rst $38
    add a
    ei
    ld a, e
    inc hl
    add a
    rst $38
    rlca
    ld a, e
    ld a, e
    rlca
    ld a, a
    ld a, a
    ld a, a
    rst $38
    add a
    ld a, e
    ld a, e
    ld a, e
    ld e, e
    ld h, a
    sub e
    rst $38
    rlca
    ld a, e
    ld a, e
    rlca
    ld l, a
    ld [hl], a
    ld a, e
    rst $38
    add e
    ld a, a
    ld a, a
    add a
    ei
    ld a, e
    add a
    rst $38
    ld bc, $effa
    ld bc, $faff
    ld a, e
    ld [bc], a
    add a
    rst $38
    ei
    ld a, e
    ld [hl+], a
    or a
    rst $08
    rst $38
    ld a, e
    ld a, e
    ld a, e
    ld a, e
    ld c, e
    inc sp
    ld a, e
    rst $38
    ld a, e
    ld a, e
    or a
    rst $08
    or a
    ld a, e
    ld a, e
    rst $38
    cp e
    cp e
    cp e
    rst $10
    rst $28
    rst $28
    rst $28
    rst $38
    inc bc
    ei
    rst $30
    rst $28
    rst $18
    cp a
    inc bc
    nop
    nop
    nop
    ld c, e
    ld b, l
    ld d, d
    ld c, [hl]
    ld b, l
    ld c, h
    jr nz, jr_007_4342

    ld b, c
    ld c, [hl]
    ld c, c
    ld b, e
    jr nz, jr_007_4348

    ld c, h
    ld b, l
    ld b, c
    ld d, e
    ld b, l
    ld d, e
    ld b, l
    ld c, [hl]
    ld b, h
    jr nz, jr_007_4344

    jr nz, jr_007_4348

    ld c, h
    ld b, l
    ld b, c
    ld d, d
    jr nz, jr_007_435b

    ld c, c
    ld b, e
    jr nz, jr_007_435e

    ld b, [hl]
    ld d, h
    ld c, b
    ld c, c
    ld d, e
    jr nz, jr_007_4369

    ld b, e
    ld d, d
    ld b, l
    ld b, l
    ld c, [hl]
    jr nz, jr_007_4371

    ld c, a
    jr nz, jr_007_4364

    ld b, l
    ld d, [hl]
    ld d, e
    jr nz, jr_007_4366

    ld b, [hl]
    ld a, [hl-]
    jr nz, @+$22

    ld c, l
    ld c, a
    ld b, h
    ld b, l
    ld c, h
    ld a, [hl-]
    jr nz, jr_007_4373

    ld b, e
    ld a, [hl-]
    jr nz, jr_007_4355

    jr nz, @+$46

    ld b, l
    ld a, [hl-]
    jr nz, jr_007_4383

    ld c, h
    ld a, [hl-]
    jr nz, jr_007_435f

    ld d, [hl]
    ld c, c
    ld b, l

jr_007_4342:
    ld d, a
    ld a, [hl-]

jr_007_4344:
    jr nz, @+$55

    ld d, b
    ld a, [hl-]

jr_007_4348:
    jr nz, jr_007_4396

    ld b, e
    ld b, h
    ld b, e
    ld a, [hl-]
    jr nz, jr_007_439b

    ld sp, $203a
    ld c, c
    ld b, l

jr_007_4355:
    ld a, [hl-]
    jr nz, jr_007_4378

    ld b, d
    ld b, c
    ld c, [hl]

jr_007_435b:
    ld c, e
    ld a, [hl-]
    ld d, d

jr_007_435e:
    sub b

jr_007_435f:
    rst $38

jr_007_4360:
    ld d, [hl]
    cp e
    sbc l
    ld d, a

jr_007_4364:
    ld [hl], b
    rst $38

jr_007_4366:
    db $20

Call_007_4367:
    ld hl, sp+$03

jr_007_4369:
    ld a, [hl-]
    ld e, [hl]
    or a
    ret z

    ld d, a

jr_007_436e:
    ld h, $04

jr_007_4370:
    ld a, e

jr_007_4371:
    and $03

jr_007_4373:
    jr z, jr_007_4376

    dec a

jr_007_4376:
    srl a

jr_007_4378:
    rr l
    srl a
    rr l
    srl e
    srl e
    dec h

jr_007_4383:
    jr nz, jr_007_4370

    ld e, l
    dec d
    jr nz, jr_007_436e

    ret


Call_007_438a:
    ld hl, sp+$03
    ld a, [hl-]
    ld e, [hl]
    or a
    ret z

    ld d, a

jr_007_4391:
    ld h, $04

jr_007_4393:
    ld a, e
    and $03

jr_007_4396:
    cp $03
    jr z, jr_007_439b

    inc a

jr_007_439b:
    srl a
    rr l
    srl a
    rr l
    srl e
    srl e
    dec h
    jr nz, jr_007_4393

    ld e, l
    dec d
    jr nz, jr_007_4391

    ret


Call_007_43af:
    ld a, $04
    ld hl, sp+$02
    sub [hl]
    jr nc, jr_007_43b8

    ld [hl], $04

jr_007_43b8:
    ld a, [$da1e]
    or a
    jr nz, jr_007_43f2

    ld a, [$c648]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_007_4367
    pop hl
    ld a, e
    ldh [rBGP], a
    ld a, [$c649]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_007_4367
    pop hl
    ld a, e
    ldh [rOBP0], a
    ld a, [$c64a]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_007_4367
    pop hl
    ld a, e
    ldh [rOBP1], a
    ret


jr_007_43f2:
    ld a, [$c648]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_007_438a
    pop hl
    ld a, e
    ldh [rBGP], a
    ld a, [$c649]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_007_438a
    pop hl
    ld a, e
    ldh [rOBP0], a
    ld a, [$c64a]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_007_438a
    pop hl
    ld a, e
    ldh [rOBP1], a
    ret


    nop
    db $01

    db $03

    rlca
    rrca
    rra
    ccf

    ld a, [$4428]
    ld [$c60d], a
    ld hl, $c60e
    ld [hl], $05
    ld hl, $c60c
    ld [hl], $00
    ld a, $05
    push af
    inc sp
    call Call_007_43af
    inc sp
    ret


    ld a, [$c60e]
    or a
    ret z

    ld hl, $c60f
    ld [hl], $00
    ld hl, $c610
    ld [hl], $00
    ld hl, $c60c
    ld [hl], $01
    ld hl, $c60e
    ld a, $05
    ld [hl], a
    push af
    inc sp
    call Call_007_43af
    inc sp
    ret


    ld a, [$c60e]
    sub $05
    ret z

    jr jr_007_446f

jr_007_446f:
    ld hl, $c60f
    ld [hl], $00
    ld hl, $c610
    ld [hl], $01
    ld hl, $c60c
    ld [hl], $01
    ld hl, $c60e
    ld [hl], $00
    xor a
    push af
    inc sp
    call Call_007_43af
    inc sp
    ret


    ld a, [$c60c]
    or a
    ret z

    ld hl, $c60f
    ld c, [hl]
    inc [hl]
    ld a, c
    ld hl, $c60d
    and [hl]
    ret nz

    ld a, [$c610]
    or a
    jr nz, jr_007_44b6

    ld hl, $c60e
    ld a, [hl]
    or a
    jr z, jr_007_44a9

    dec [hl]

jr_007_44a9:
    ld a, [$c60e]
    or a
    jr nz, jr_007_44cb

    ld hl, $c60c
    ld [hl], $00
    jr jr_007_44cb

jr_007_44b6:
    ld hl, $c60e
    ld a, [hl]
    sub $05
    jr nc, jr_007_44bf

    inc [hl]

jr_007_44bf:
    ld a, [$c60e]
    sub $05
    jr nz, jr_007_44cb

    ld hl, $c60c
    ld [hl], $00

jr_007_44cb:
    ld a, [$c60e]
    push af
    inc sp
    call Call_007_43af
    inc sp
    ret


    ld a, [$c60e]
    push af
    inc sp
    call Call_007_43af
    inc sp
    ret


    ld bc, $4426
    ld hl, sp+$06
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld [$c60d], a
    ret


    ld e, $07
    ld hl, $4446
    call RST_08

jr_007_44f7:
    ld a, [$c60c]
    or a
    ret z

    call Call_000_0e35
    ld e, $07
    ld hl, $448b
    call RST_08
    jr jr_007_44f7

    ld e, $07
    ld hl, $4467
    call RST_08

jr_007_4511:
    ld a, [$c60c]
    or a
    ret z

    call Call_000_0e35
    ld e, $07
    ld hl, $448b
    call RST_08
    jr jr_007_4511

    add sp, -$1f
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld hl, $0014
    push hl
    ld l, h
    push hl
    push de
    call Call_000_37b0
    add sp, $06
    ld a, $b9
    ld [bc], a
    ld l, c
    ld h, b
    inc hl
    push hl
    ld a, l
    ld hl, sp+$16
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$15
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    push bc
    call Call_000_0d5c
    pop hl
    ld a, $e4
    ldh [rOBP1], a
    ld a, $e4
    ldh [rOBP0], a
    ld a, $e4
    ldh [rBGP], a
    xor a
    ldh [rSCY], a
    xor a
    ldh [rSCX], a
    ldh a, [rLCDC]
    ld hl, sp+$16
    ld [hl+], a
    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a
    ldh a, [rLCDC]
    and $df
    ldh [rLCDC], a
    ldh a, [rLCDC]
    or $01
    ldh [rLCDC], a
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a
    ld e, $00
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld [hl], $00

jr_007_458c:
    ld hl, sp+$1b
    ld a, [hl]
    sub $0e
    jr z, jr_007_45d9

    ld hl, sp+$17
    ld a, [hl]
    ld hl, sp+$1c
    ld [hl], a
    ld hl, sp+$18
    ld a, [hl]
    ld hl, sp+$1d
    ld [hl+], a
    ld [hl], e
    xor a

jr_007_45a1:
    cp $14
    jr z, jr_007_45ba

    ld hl, sp+$1c
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push af
    ld a, [hl]
    ld [de], a
    pop af
    inc [hl]
    dec hl
    dec hl
    inc [hl]
    jr nz, jr_007_45b7

    inc hl
    inc [hl]

jr_007_45b7:
    inc a
    jr jr_007_45a1

jr_007_45ba:
    ld hl, sp+$1e
    ld e, [hl]
    ld hl, sp+$19
    ld a, [hl+]
    ld d, [hl]
    push de
    ld e, a
    push de
    ld hl, $0114
    push hl
    ld hl, sp+$21
    ld h, [hl]
    ld l, $00
    push hl
    call Call_000_3964
    add sp, $06
    pop de
    ld hl, sp+$1b
    inc [hl]
    jr jr_007_458c

jr_007_45d9:
    ld e, c
    ld d, b
    ld hl, $0014
    push hl
    ld l, h
    push hl
    push de
    call Call_000_37b0
    add sp, $06
    ld hl, sp+$27
    xor a
    sub [hl]
    inc hl
    ld a, $20
    sbc [hl]
    jr nc, jr_007_45f6

    ld de, $0000
    jr jr_007_460f

jr_007_45f6:
    ld hl, sp+$27
    ld a, [hl+]
    ld e, a
    ld d, [hl]
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

jr_007_460f:
    ld hl, sp+$1e
    ld [hl], e
    ld a, [hl]
    or a
    jr z, jr_007_461b

    ld a, $80
    sub [hl]
    jr nc, jr_007_4687

jr_007_461b:
    push bc
    ld hl, sp+$2b
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$28
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    xor a
    rrca
    push af
    call Call_000_1270
    add sp, $05
    pop bc
    ld a, $99
    ld [bc], a
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
    call Call_000_0d5c
    pop hl
    ld hl, sp+$1e
    ld a, [hl]
    or a
    jr z, jr_007_4649

    ld a, [hl]
    add $80
    ld [hl], a

jr_007_4649:
    ld hl, sp+$25
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $1000
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$27
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$26
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    add a
    push bc
    ld hl, sp+$2b
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$28
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld h, a
    ld l, $00
    push hl
    call Call_000_1270
    add sp, $05
    pop bc
    ld a, $99
    ld [bc], a
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    push bc
    call Call_000_0d5c
    pop hl
    jr jr_007_46b0

jr_007_4687:
    ld hl, sp+$1e
    ld a, [hl]
    add a
    push bc
    ld hl, sp+$2b
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$28
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld h, a
    ld l, $00
    push hl
    call Call_000_1270
    add sp, $05
    pop bc
    ld a, $99
    ld [bc], a
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
    call Call_000_0d5c
    pop hl

jr_007_46b0:
    ld hl, sp+$2c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld a, e
    push bc
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$2d
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld h, a
    ld l, $00
    push hl
    call Call_000_1270
    add sp, $05
    pop bc
    ld hl, sp+$31
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld a, e
    push bc
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$32
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld h, a
    ld l, $80
    push hl
    call Call_000_1270
    add sp, $05
    pop bc
    ld a, $a1
    ld [bc], a
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
    call Call_000_0d5c
    pop hl
    ld hl, sp+$16
    ld a, [hl]
    ldh [rLCDC], a
    ld e, c
    ld d, b
    ld hl, $0010
    push hl
    ld l, h
    push hl
    push de
    call Call_000_37b0
    add sp, $06
    push bc
    xor a
    inc a
    push af
    call Call_000_35b7
    add sp, $04
    xor a
    ld h, a
    ld l, $12
    push hl
    ld a, $14
    push af
    inc sp
    xor a
    rrca
    push af
    call Call_000_3718
    add sp, $05
    ld a, $b9
    ld [bc], a
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
    call Call_000_0d5c
    pop hl
    add sp, $1f
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
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_007_4792

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
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_007_4796

jr_007_4792:
    ld hl, $cb98
    add hl, bc

jr_007_4796:
    ld c, l
    ld b, h
    ld hl, $c522
    ld a, [hl]
    and $fc
    ld [hl], a
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld a, [$c51a]
    ld hl, sp+$02
    sub [hl]
    jr nz, jr_007_47e1

    ld a, [$c51b]
    ld hl, sp+$03
    sub [hl]
    jr nz, jr_007_47e1

    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [$c51c]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_007_47e1

    ld a, [$c51d]
    ld hl, sp+$05
    sub [hl]
    jr nz, jr_007_47e1

    ld hl, sp+$11
    ld a, [hl]
    and $03
    ld hl, $c522
    ld c, [hl]
    or c
    ld [hl], a
    jp Jump_007_48a4


jr_007_47e1:
    ld a, [$da1f]
    ld hl, sp+$10
    and [hl]
    jp nz, Jump_007_4890

    ld hl, sp+$02
    ld e, l
    ld d, h
    ld hl, $c51a
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4804

    bit 7, d
    jr nz, jr_007_4809

    cp a
    jr jr_007_4809

jr_007_4804:
    bit 7, d
    jr z, jr_007_4809

    scf

jr_007_4809:
    jr nc, jr_007_4818

    ld hl, $c51a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_007_483f

jr_007_4818:
    ld de, $c51a
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
    jr z, jr_007_4830

    bit 7, d
    jr nz, jr_007_4835

    cp a
    jr jr_007_4835

jr_007_4830:
    bit 7, d
    jr z, jr_007_4835

    scf

jr_007_4835:
    jr nc, jr_007_483f

    ld hl, $c51a
    inc [hl]
    jr nz, jr_007_483f

    inc hl
    inc [hl]

jr_007_483f:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c51c
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4859

    bit 7, d
    jr nz, jr_007_485e

    cp a
    jr jr_007_485e

jr_007_4859:
    bit 7, d
    jr z, jr_007_485e

    scf

jr_007_485e:
    jr nc, jr_007_486d

    ld hl, $c51c
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_007_4890

jr_007_486d:
    ld hl, $c51c
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_007_4881

    bit 7, d
    jr nz, jr_007_4886

    cp a
    jr jr_007_4886

jr_007_4881:
    bit 7, d
    jr z, jr_007_4886

    scf

jr_007_4886:
    jr nc, jr_007_4890

    ld hl, $c51c
    inc [hl]
    jr nz, jr_007_4890

    inc hl
    inc [hl]

Jump_007_4890:
jr_007_4890:
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    add $fb
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_007_48a4:
    add sp, $06
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_007_48c3

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
    jr jr_007_48c7

jr_007_48c3:
    ld hl, $cb98
    add hl, bc

jr_007_48c7:
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $c51a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $c51c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $c522
    ld a, [hl]
    and $fc
    ld [hl], a
    ld e, $05
    ld hl, $40ca
    jp RST_08


    add sp, -$07
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr z, jr_007_490d

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

jr_007_490d:
    ld a, [$c0a3]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c0a4]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$05
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
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_007_49d7

    inc bc
    inc bc
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    bit 0, [hl]
    jr z, jr_007_4997

    push bc
    call Call_000_3484
    ld a, e
    pop bc
    and $0f
    ld hl, sp+$06
    ld [hl], a
    ld e, [hl]
    ld a, $0a
    ld d, a
    sub [hl]
    bit 7, e
    jr z, jr_007_4982

    bit 7, d
    jr nz, jr_007_4987

    cp a
    jr jr_007_4987

jr_007_4982:
    bit 7, d
    jr z, jr_007_4987

    scf

jr_007_4987:
    jr nc, jr_007_498f

    ld hl, sp+$06
    ld a, [hl]
    add $f6
    ld [hl], a

jr_007_498f:
    ld hl, sp+$06
    ld a, [hl]
    add $fb
    ld [$c7e0], a

jr_007_4997:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    bit 1, c
    jr z, jr_007_49c8

    call Call_000_3484
    ld a, e
    and $0f
    ld c, a
    ld e, c
    ld a, $0a
    ld d, a
    sub c
    bit 7, e
    jr z, jr_007_49b7

    bit 7, d
    jr nz, jr_007_49bc

    cp a
    jr jr_007_49bc

jr_007_49b7:
    bit 7, d
    jr z, jr_007_49bc

    scf

jr_007_49bc:
    jr nc, jr_007_49c2

    ld a, c
    add $f6
    ld c, a

jr_007_49c2:
    ld a, c
    add $fb
    ld [$c7e1], a

jr_007_49c8:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld e, $00
    jr jr_007_49e3

jr_007_49d7:
    ld hl, $c7e1
    ld [hl], $00
    ld hl, $c7e0
    ld [hl], $00
    ld e, $01

jr_007_49e3:
    add sp, $07
    ret


    db $25, $12, $04, $1a, $00, $49, $f5, $00, $06, $00, $00, $02, $09, $4a, $61, $40
    db $00
    
    db "I'm going on a\n" ; 0x49f7
    db "jungle mission\n"
    db "soon,"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "need to practice\n" ; 0x4a2e
    db "my stealth..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $4a, $6d, $00, $07, $00, $00, $05, $09, $4a
    db $ad, $40, $00

    db "ROAR!" ; 0x4a6e

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    db "Man, I'm good..."

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $4a, $b9, $00, $06, $00, $00, $01, $09, $4b
    db $a3, $40, $00
    
    db "Woohoo! These face\n" ; 0x4abb
    db "paints are cool!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Here, take this.\n" ; 0x4af2
    db "I've got 20."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $07, $00, $00, $14, $00, $04, $ff, $fc, $14
    db $00, $07, $ff, $fd, $75, $ff, $fc, $40, $00

    db "You got the Taser!" ; 0x4b38

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Caution: Keep away\n"
    db "from water and\n"
    db "small puppies."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $25, $12, $04, $1a, $00, $4b, $b3, $00, $09, $00
    db $00, $02, $09, $4c, $5f, $40, $00
    
    db "Life as a grave\n"
    db "digger sure is\n"
    db "boring."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "I miss my handguns\n"
    db "too - the shovel"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "just doesn't cut\n"
    db "it when fighting\n"
    db "demons"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $4c, $6b, $00, $0a, $00, $00, $05, $09, $4c
    db $bf, $40, $00
    
    db "Hey wait..."

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "This gun is made\n"
    db "of plastic..."

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $4c, $cb, $00, $09, $00, $00, $01, $09, $4d
    db $eb, $40, $00
    
    db "Thanks for the\n"
    db "handgun!"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "You can take this\n"
    db "shovel if you\n"
    db "want..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "It doesn't have a\n"
    db "DT mode though."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $0a, $00, $00, $14, $00, $06, $ff, $fc, $14
    db $00, $09, $ff, $fd, $75, $ff, $fc, $40, $00
    
    db "You got the Shovel!"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Tool of choice for\n"
    db "xombies and grave-\n"
    db "diggers alike..."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $25, $12, $04, $1a, $00, $4d, $fb, $00, $03, $00
    db $00, $02, $09, $4e, $b6, $40, $00
    
    db "I just want to die!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Namco just won't\n"
    db "kill me off..."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "I'm dug my own\n"
    db "grave,"

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "with flowers and a\n"
    db "vase and\n"
    db "everything..."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $4e, $c2, $00, $03, $00, $00, $01, $09, $50
    db $04, $40, $00
    
    db "What's this little\n"
    db "iron?"

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Maybe I should\n"
    db "chew on  it..."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "URGH!"

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00

    db "Make sure no-one\n"
    db "steals my vase..."

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $03, $ff, $fc, $14, $01, $00, $ff, $fd, $14
    db $05, $00, $ff, $fe, $14, $00, $01, $ff, $ff, $30, $ff, $fc, $14, $00, $03, $ff
    db $fc, $33, $ff, $fc, $14, $00, $04, $00, $00, $14, $00, $06, $ff, $fc, $14, $00
    db $04, $ff, $fd, $75, $ff, $fc, $40, $00
    
    db "You got the Vase!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00 

    db "There's a little\n"
    db "water left at\n"
    db "the bottom...  "
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $25, $12, $04, $1a, $00, $50, $14, $00, $05, $00
    db $00, $02, $09, $50, $bc, $40, $00

    db "I'm waiting to get\n"
    db "Tom Fulp's\n"
    db "autograph!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "But I'm getting\n"
    db "peckish -"

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "I only like\n"
    db "helpless animals\n"
    db "to eat, though."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $50, $c8, $00, $06, $00, $00, $05, $09, $51
    db $72, $40, $00

    db "If I collect all\n"
    db "of these frogs I\n"
    db "get the stealth\n"
    db "camo..."

    db $00, $47, $03, $01, $06, $14, $00, $00, $45, $ff, $0c, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "or I could do a no-\n"
    db "alert playthrough."

    db $00, $47, $03, $01, $06, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "Which is easier?"

    db $00, $47, $03, $01, $06, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $51, $7e, $00, $05, $00, $00, $01, $09, $52
    db $d1, $40, $00
    
    db "You brought me a\n"
    db "frog to eat?"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Thanks!"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "Here, take this\n" ; 0x51c8
    db "tiger face paint."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "It's not lowering\n"
    db "my camo index\n"
    db "enough..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $06, $00, $00, $14, $00, $03, $ff, $fc, $14
    db $00, $06, $ff, $fd, $75, $ff, $fc, $40, $00
    
    db "You got the\n"
    db "Tiger Face Paints!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Great for stealth\n"
    db "missions..."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "and kids' parties."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $25, $12, $05, $1a, $00, $52, $e1, $00, $0c, $00
    db $00, $02, $09, $53, $54, $1a, $00, $52, $ed, $00, $01, $00, $00, $05, $09, $53
    db $54, $40, $00
    
    db "Get me some food,\n"
    db "could you?"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "I'll have a burger\n"
    db "and a sprite."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $53, $60, $00, $00, $00, $00, $01, $09, $54
    db $b8, $40, $00
    
    db "I'm guarding the\n"
    db "temple!"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "I missed lunch\n"
    db "and I'm starving..."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "Take this money\n"
    db "and get me some\n"
    db "lunch, could you?"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "I'll have a burger\n"
    db "and a sprite."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $01, $00, $00, $14, $00, $04, $ff, $fc, $14
    db $00, $01, $ff, $fd, $75, $ff, $fc, $40, $00

    db "You got the\n"
    db "Big Bag of Money!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "It looks like\n"
    db "Randy's advertising\n"
    db "money."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45
    db $fe, $12, $00, $44, $03, $01, $1a, $00, $54, $c4, $00, $0c, $00, $00, $01, $09
    db $55, $d2, $40, $00
    
    db "Hey you finally\n"
    db "got some food!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "What took you so\n"
    db "long?"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00

    db "Thanks anyway."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $1e, $ff, $fb, $0d, $ff, $fb, $00, $55, $af
    db $02, $40, $00
    
    db "uurghh......"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "stomach........."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "pain......"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $02, $ff, $fc, $14, $03, $80, $ff, $fd, $14
    db $08, $80, $ff, $fe, $14, $00, $01, $ff, $ff, $30, $ff, $fc, $14, $00, $02, $ff
    db $fc, $33, $ff, $fc, $14, $00, $0d, $00, $00, $00, $25, $12, $04, $40, $00
    
    db "Poor JT..."

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "Oh well, I get his\n"
    db "stuff!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $40, $00
    
    db "You can have his\n"
    db "light gun though."
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $56, $62, $00, $08, $00, $00, $01, $09, $56
    db $df, $14, $00, $09, $00, $00, $14, $00, $05, $ff, $fc, $14, $00, $08, $ff, $fd
    db $75, $ff, $fc, $40, $00
    
    db "You got the\n"
    db "Light Gun!"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "It's so well made,\n"
    db "it almost looks\n"
    db "real..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $25, $12, $04, $1a, $00, $56, $ef, $00, $02, $00
    db $00, $02, $09, $57, $64, $40, $00
    
    db "All this greasy\n"
    db "food is doing\n"
    db "nothing for my\n"
    db "hair!"
    
    db $00, $47, $03, $01, $06, $14, $00, $00, $45, $ff, $0c, $00, $41, $ff, $00
    db $44, $07, $01, $40, $00
    
    db "I need to sort\n"
    db "it out..."
    
    db $00, $47, $03, $01, $06, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $1a, $00, $57, $70, $00, $03, $00, $00, $05, $09, $57
    db $e5, $40, $00

    db "Now I can always\n"
    db "look my best when"

    db $00, $47, $03, $01, $05, $14, $00, $00,
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

    db "I'm fighting those\n"
    db "creepy space\n"
    db "pirates!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01
    db $45, $fe, $12, $00, $44, $03, $01
    db $1a, $00, $57, $f1, $00, $02, $00, $00, $01, $09, $58, $e9, $40, $00
    
    db "Can I take those\n"
    db "hair products?"
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00
    
    db "You can have this\n"
    db "free toy I got with\n"
    db "my Happy Meal..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $03, $00, $00, $14, $00, $04, $ff, $fc, $14
    db $00, $03, $ff, $fd, $75, $ff, $fc, $40, $00
    
    db "You got the Tiny\n"
    db "Extreme Iron!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "Warning: Deadly\n" ; 0x58b7
    db "if swallowed!"
    
    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00

GraveyardTilemap:: ; 0x58ea
    db $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $04, $05, $06, $07
    db $08, $09, $0a, $0b, $08, $09, $0a, $0b, $08, $09, $0a, $0b, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $17, $1a, $10, $11, $12, $13, $1b, $1c, $1d, $1e
    db $1f, $20, $08, $21, $22, $23, $24, $25, $26, $27, $25, $28, $1f, $20, $08, $21, $29, $2a, $2b, $2c
    db $12, $13, $14, $15, $2d, $2e, $24, $25, $25, $25, $25, $28, $2f, $30, $14, $15, $31, $32, $33, $34
    db $08, $21, $22, $23, $35, $36, $37, $38, $38, $38, $38, $39, $3a, $3b, $22, $23, $3c, $25, $25, $3d
    db $14, $15, $2d, $2e, $2d, $2e, $3e, $3f, $40, $41, $3e, $3f, $02, $03, $00, $01, $42, $25, $25, $43
    db $22, $23, $35, $36, $35, $36, $44, $45, $46, $47, $44, $45, $0a, $0b, $08, $09, $48, $49, $4a, $4b
    db $2d, $2e, $4c, $4d, $2d, $2e, $4e, $4f, $4f, $4f, $4f, $50, $2f, $30, $14, $15, $51, $52, $53, $54
    db $35, $36, $55, $56, $35, $36, $57, $25, $58, $25, $58, $59, $3a, $3b, $22, $23, $5a, $5b, $5c, $5d
    db $2d, $2e, $5e, $5f, $2d, $2e, $57, $60, $25, $60, $25, $60, $4f, $4f, $61, $61, $62, $63, $64, $65
    db $35, $36, $66, $67, $35, $36, $57, $25, $58, $25, $58, $25, $58, $25, $61, $61, $68, $69, $6a, $6b
    db $6c, $6d, $2d, $2e, $2d, $2e, $57, $60, $25, $60, $4c, $4d, $25, $60, $25, $60, $6e, $6f, $70, $71
    db $72, $73, $35, $36, $35, $36, $57, $25, $58, $25, $55, $56, $58, $25, $58, $25, $74, $75, $76, $77
    db $4c, $4d, $4f, $4f, $4f, $4f, $4c, $4d, $25, $60, $5e, $5f, $25, $60, $4c, $4d, $78, $79, $7a, $7b
    db $55, $56, $58, $25, $58, $25, $55, $56, $58, $25, $66, $67, $58, $25, $55, $56, $7c, $7d, $7e, $7f
    db $25, $60, $4c, $4d, $6c, $6d, $25, $60, $6c, $6d, $6c, $6d, $6c, $6d, $b4, $b5, $b6, $b7, $b8, $b9
    db $58, $25, $55, $56, $72, $73, $58, $25, $72, $73, $72, $73, $72, $73, $ba, $bb, $bc, $bd, $be, $bf
    
    db $25, $12, $04, $1a, $00, $5a, $61, $00, $04, $00, $00, $05, $09, $5a, $69, $14
    db $00, $03, $ff, $fc, $33, $ff, $fc, $14, $00, $04, $ff, $fc, $3f, $08, $00, $ff
    db $fc, $1a, $00, $5a, $7f, $00, $0b, $00, $00, $05, $09, $5a, $87

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc

    db $14, $00, $05, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc, $1a, $00, $5a
    db $a0, $00, $00, $00, $00, $01, $09, $5a, $ad

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5a, $b9, $00, $01, $00, $00, $01, $09, $5a, $c6, $14, $00, $06, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $5a, $d2, $00, $02, $00
    db $00, $01, $09, $5a, $df

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld [bc], a
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5a, $eb, $00, $03, $00, $00, $01, $09, $5a, $f8, $14, $00, $06, $ff
    db $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc, $1a, $00, $5b, $04, $00, $04, $00
    db $00, $01, $09, $5b, $11

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $1d, $00, $05, $00, $00, $01, $09, $5b, $2a

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

    db $1a, $00, $5b, $36, $00, $06, $00, $00, $01, $09, $5b, $43

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $4f, $00, $07, $00, $00, $01, $09, $5b, $5c

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $68, $00, $08, $00, $00, $01, $09, $5b, $75

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $81, $00, $09, $00, $00, $01, $09, $5b, $8e, $14, $00, $06, $ff
    db $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc, $1a, $00, $5b, $9a, $00, $0a, $00
    db $00, $01, $09, $5b, $a7

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $b3, $00, $0b, $00, $00, $01, $09, $5b, $c0

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $cc, $00, $0c, $00, $00, $01, $09, $5b, $d9

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5b, $e5, $00, $0d, $00, $00, $05, $09, $5b, $f2

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $09, $0e, $6f, $0a, $9b, $45, $09, $fc, $73, $09, $a9, $72, $08
    db $29, $7d, $25, $12, $04, $14, $00, $04, $ff, $fc, $14, $00, $0c, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $5c, $30, $00, $00, $00, $00, $01, $09, $5c, $3d

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5c, $49, $00, $01, $00, $00, $01, $09, $5c, $56

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5c, $62, $00, $02, $00, $00, $01, $09, $5c, $6f

    inc d
    nop
    dec b
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

    db $1a, $00, $5c, $7b, $00, $03, $00, $00, $01, $09, $5c, $88

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5c, $94, $00, $04, $00, $00, $01, $09, $5c, $a1

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5c, $ad, $00, $05, $00, $00, $01, $09, $5c, $ba

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5c, $c6, $00, $06, $00, $00, $01

    add hl, bc
    ld e, h
    db $d3

    db $14, $00, $05, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc, $1a, $00, $5c
    db $df, $00, $07, $00, $00, $01, $09, $5c, $ec

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5c, $f8, $00, $08, $00, $00, $01, $09, $5d, $05

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5d, $11, $00, $09, $00, $00, $01, $09, $5d, $1e

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5d, $2a, $00, $0a, $00, $00, $01, $09, $5d, $37

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5d, $43, $00, $0b, $00, $00, $01, $09, $5d, $50

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5d, $5c, $00, $0c, $00, $00, $01, $09, $5d, $69

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5d, $75, $00, $0d, $00, $00, $05, $09, $5d, $82

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $5d, $b1, $00, $00, $00, $00, $01, $09, $5d, $be

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5d, $ca, $00, $01, $00, $00, $01, $09, $5d, $d7, $14, $00, $04, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $5d, $e3, $00, $02, $00
    db $00, $01, $09, $5d, $f0, $14, $00, $04, $ff, $fc, $14, $00, $02, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $5d, $fc, $00, $03, $00, $00, $01, $09, $5e, $09

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $15, $00, $04, $00, $00, $01, $09, $5e, $22

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $2e, $00, $05, $00, $00, $01, $09, $5e, $3b

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $47, $00, $06, $00, $00, $01, $09, $5e, $54

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $60, $00, $07, $00, $00, $01, $09, $5e, $6d

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $79, $00, $08, $00, $00, $01, $09, $5e, $86

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $92, $00, $09, $00, $00, $01, $09, $5e, $9f

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $ab, $00, $0a, $00, $00, $01, $09, $5e, $b8

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $c4, $00, $0b, $00, $00, $01, $09, $5e, $d1, $14, $00, $04, $ff
    db $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc, $1a, $00, $5e, $dd, $00, $0c, $00
    db $00, $01, $09, $5e, $ea

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5e, $f6, $00, $0d, $00, $00, $05, $09, $5f, $03

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $5f, $32, $00, $00, $00, $00, $01, $09, $5f, $3f

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5f, $4b, $00, $01, $00, $00, $01, $09, $5f, $58, $14, $00, $04, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $5f, $64, $00, $02, $00
    db $00, $01, $09, $5f, $71

    inc d
    nop
    inc b
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

    db $1a, $00, $5f, $7d, $00, $03, $00, $00, $01, $09, $5f, $8a

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5f, $96, $00, $04, $00, $00, $01, $09, $5f, $a3

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5f, $af, $00, $05, $00, $00, $01, $09, $5f, $bc

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5f, $c8, $00, $06, $00, $00, $01, $09, $5f, $d5, $14, $00, $04, $ff
    db $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc, $1a, $00, $5f, $e1, $00, $07, $00
    db $00, $01, $09, $5f, $ee

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $5f, $fa, $00, $08, $00, $00, $01, $09, $60, $07

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $13, $00, $09, $00, $00, $01, $09, $60, $20

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $2c, $00, $0a, $00, $00, $01, $09, $60, $39

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $45, $00, $0b, $00, $00, $01, $09, $60, $52

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $5e, $00, $0c, $00, $00, $01, $09, $60, $6b

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $77, $00, $0d, $00, $00, $05, $09, $60, $84

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $04, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $60, $b3, $00, $00, $00, $00, $01, $09, $60, $c0

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $cc, $00, $01, $00, $00, $01, $09, $60, $d9

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $60, $e5, $00, $02, $00, $00, $01, $09, $60, $f2

    inc d
    nop
    dec b
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

    db $1a, $00, $60, $fe, $00, $03, $00, $00, $01, $09, $61, $0b

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $17, $00, $04, $00, $00, $01, $09, $61, $24

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $30, $00, $05, $00, $00, $01, $09, $61, $3d

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $49, $00, $06, $00, $00, $01, $09, $61, $56

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $62, $00, $07, $00, $00, $01, $09, $61, $6f

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $7b, $00, $08, $00, $00, $01

    add hl, bc
    ld h, c
    adc b

    db $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc, $1a, $00, $61
    db $94, $00, $09, $00, $00, $01, $09, $61, $a1

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $ad, $00, $0a, $00, $00, $01, $09, $61, $ba

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $c6, $00, $0b, $00, $00, $01, $09, $61, $d3

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $df, $00, $0c, $00, $00, $01, $09, $61, $ec

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $61, $f8, $00, $0d, $00, $00, $05, $09, $62, $05

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $62, $34, $00, $00, $00, $00, $01, $09, $62, $41

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $62, $4d, $00, $01, $00, $00, $01

    add hl, bc
    ld h, d
    ld e, d

    db $14, $00, $03, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $62
    db $66, $00, $02, $00, $00, $01, $09, $62, $73

    inc d
    nop
    inc bc
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

    db $1a, $00, $62, $7f, $00, $03, $00, $00, $01, $09, $62, $8c

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $62, $98, $00, $04, $00, $00, $01, $09, $62, $a5

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $62, $b1, $00, $05, $00, $00, $01, $09, $62, $be

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $62, $ca, $00, $06, $00, $00, $01, $09, $62, $d7

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $62, $e3, $00, $07, $00, $00, $01, $09, $62, $f0

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $62, $fc, $00, $08, $00, $00, $01, $09, $63, $09

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $15, $00, $09, $00, $00, $01, $09, $63, $22

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $2e, $00, $0a, $00, $00, $01, $09, $63, $3b

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $47, $00, $0b, $00, $00, $01, $09, $63, $54

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $60, $00, $0c, $00, $00, $01, $09, $63, $6d

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $79, $00, $0d, $00, $00, $05, $09, $63, $86

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $01, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $63, $b5, $00, $00, $00, $00, $01, $09, $63, $c2

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $ce, $00, $01, $00, $00, $01, $09, $63, $db

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $63, $e7, $00, $02, $00, $00, $01, $09, $63, $f4

    inc d
    nop
    ld [bc], a
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

    db $1a, $00, $64, $00, $00, $03, $00, $00, $01, $09, $64, $0d

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $19, $00, $04, $00, $00, $01, $09, $64, $26

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $32, $00, $05, $00, $00, $01, $09, $64, $3f

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $4b, $00, $06, $00, $00, $01, $09, $64, $58

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $64, $00, $07, $00, $00, $01, $09, $64, $71

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $7d, $00, $08, $00, $00, $01, $09, $64, $8a

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $96, $00, $09, $00, $00, $01, $09, $64, $a3

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $af, $00, $0a, $00, $00, $01, $09, $64, $bc

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $c8, $00, $0b, $00, $00, $01, $09, $64, $d5

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $e1, $00, $0c, $00, $00, $01, $09, $64, $ee

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $64, $fa, $00, $0d, $00, $00, $05

    add hl, bc
    ld h, l
    rlca

    db $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc, $14, $00, $01
    db $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $00
    db $25, $12, $04, $1a, $00, $65, $29, $00, $08, $00, $00, $05, $09, $65, $45, $14
    db $00, $01, $ff, $fc, $14, $01, $00, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff
    db $fc, $14, $00, $01, $ff, $fc, $84, $00, $03, $ff, $fc, $1a, $00, $65, $51, $00
    db $05, $00, $00, $02, $09, $65, $59, $14, $00, $02, $ff, $fc, $33, $ff, $fc, $1a
    db $00, $65, $65, $00, $08, $00, $00, $05, $09, $65, $6d, $14, $00, $02, $ff, $fc
    db $33, $ff, $fc, $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $65, $86, $00, $00, $00, $00, $01, $09, $65, $93

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $65, $9f, $00, $01, $00, $00, $01, $09, $65, $ac, $14, $00, $04, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $65, $b8, $00, $02, $00
    db $00, $01, $09, $65, $c5

    inc d
    nop
    inc b
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

    db $1a, $00, $65, $d1, $00, $03, $00, $00, $01, $09, $65, $de, $14, $00, $04, $ff
    db $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc, $1a, $00, $65, $ea, $00, $04, $00
    db $00, $01, $09, $65, $f7, $14, $00, $04, $ff, $fc, $14, $00, $04, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $66, $03, $00, $05, $00, $00, $01, $09, $66, $10, $14, $00
    db $04, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc, $1a, $00, $66, $1c, $00
    db $06, $00, $00, $01, $09, $66, $29

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $66, $35, $00, $07, $00, $00, $01, $09, $66, $42, $14, $00, $04, $ff
    db $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc, $1a, $00, $66, $4e, $00, $08, $00
    db $00, $01, $09, $66, $5b

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $66, $67, $00, $09, $00, $00, $01, $09, $66, $74, $14, $00, $04, $ff
    db $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc, $1a, $00, $66, $80, $00, $0a, $00
    db $00, $01, $09, $66, $8d

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $66, $99, $00, $0b, $00, $00, $01, $09, $66, $a6, $14, $00, $04, $ff
    db $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc, $1a, $00, $66, $b2, $00, $0c, $00
    db $00, $01, $09, $66, $bf

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $66, $cb, $00, $0d, $00, $00, $05, $09, $66, $d8

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $1a, $00, $66, $fa, $00, $01, $00, $00, $02, $09
    db $67, $02, $14, $00, $04, $ff, $fc, $33, $ff, $fc, $1a, $00, $67, $0e, $00, $05
    db $00, $00, $05, $09, $67, $16, $14, $00, $04, $ff, $fc, $33, $ff, $fc, $14, $00
    db $05, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc, $1a, $00, $67, $2f, $00
    db $00, $00, $00, $01, $09, $67, $3c, $14, $00, $06, $ff, $fc, $14, $00, $00, $ff
    db $fd, $75, $ff, $fc, $1a, $00, $67, $48, $00, $01, $00, $00, $01, $09, $67, $55
    db $14, $00, $06, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $67
    db $61, $00, $02, $00, $00, $01, $09, $67, $6e

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld [bc], a
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $67, $7a, $00, $03, $00, $00, $01, $09, $67, $87

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $67, $93, $00, $04, $00, $00, $01, $09, $67, $a0, $14, $00, $06, $ff
    db $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc, $1a, $00, $67, $ac, $00, $05, $00
    db $00, $01, $09, $67, $b9

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

    db $1a, $00, $67, $c5, $00, $06, $00, $00, $01, $09, $67, $d2

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $67, $de, $00, $07, $00, $00, $01, $09, $67, $eb, $14, $00, $06, $ff
    db $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc, $1a, $00, $67, $f7, $00, $08, $00
    db $00, $01, $09, $68, $04

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $68, $10, $00, $09, $00, $00, $01, $09, $68, $1d

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $68, $29, $00, $0a, $00, $00, $01, $09, $68, $36

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $68, $42, $00, $0b, $00, $00, $01, $09, $68, $4f

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $68, $5b, $00, $0c, $00, $00, $01, $09, $68, $68

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $68, $74, $00, $0d, $00, $00, $05, $09, $68, $81

    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $60, $00, $7f, $cc, $03, $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af
    db $02, $21, $01, $c6, $0d, $57, $03, $00, $25, $12, $04, $14, $00, $01, $ff, $fc
    db $14, $00, $0c, $ff, $fd, $75, $ff, $fc, $1a, $00, $68, $b5, $00, $00, $00, $00
    db $01, $09, $68, $c2

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $68, $ce, $00, $01, $00, $00, $01, $09, $68, $db, $14, $00, $02, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $68, $e7, $00, $02, $00
    db $00, $01, $09, $68, $f4, $14, $00, $02, $ff, $fc, $14, $00, $02, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $69, $00, $00, $03, $00, $00, $01, $09, $69, $0d

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $19, $00, $04, $00, $00, $01, $09, $69, $26

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $32, $00, $05, $00, $00, $01, $09, $69, $3f

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $4b, $00, $06, $00, $00, $01, $09, $69, $58

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $64, $00, $07, $00, $00, $01, $09, $69, $71

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $7d, $00, $08, $00, $00, $01, $09, $69, $8a

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $96, $00, $09, $00, $00, $01, $09, $69, $a3

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $af, $00, $0a, $00, $00, $01, $09, $69, $bc

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $c8, $00, $0b, $00, $00, $01, $09, $69, $d5

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $e1, $00, $0c, $00, $00, $01, $09, $69, $ee

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $69, $fa, $00, $0d, $00, $00, $05, $09, $6a, $07

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $6a, $36, $00, $00, $00, $00, $01, $09, $6a, $43

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6a, $4f, $00, $01, $00, $00, $01, $09, $6a, $5c, $14, $00, $03, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $6a, $68, $00, $02, $00
    db $00, $01, $09, $6a, $75

    inc d
    nop
    inc bc
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

    db $1a, $00, $6a, $81, $00, $03, $00, $00, $01, $09, $6a, $8e, $14, $00, $03, $ff
    db $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc, $1a, $00, $6a, $9a, $00, $04, $00
    db $00, $01, $09, $6a, $a7

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6a, $b3, $00, $05, $00, $00, $01, $09, $6a, $c0, $14, $00, $03, $ff
    db $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc, $1a, $00, $6a, $cc, $00, $06, $00
    db $00, $01, $09, $6a, $d9

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6a, $e5, $00, $07, $00, $00, $01, $09, $6a, $f2

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6a, $fe, $00, $08, $00, $00, $01, $09, $6b, $0b

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6b, $17, $00, $09, $00, $00, $01, $09, $6b, $24

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6b, $30, $00, $0a, $00, $00, $01, $09, $6b, $3d

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6b, $49, $00, $0b, $00, $00, $01, $09, $6b, $56, $14, $00, $03, $ff
    db $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc, $1a, $00, $6b, $62, $00, $0c, $00
    db $00, $01, $09, $6b, $6f

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6b, $7b, $00, $0d, $00, $00, $05, $09, $6b, $88

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $20, $00, $07, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00
    db $00, $0f, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $09, $f3, $71, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $20, $00, $02, $80, $04, $00, $00, $0f, $f8
    db $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $9b, $45, $0a, $dd, $40, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $02, $00, $06
    db $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $09, $5b, $6c
    db $09, $52, $4c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20
    db $00, $05, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $1f, $10, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $09, $76, $72, $09, $f1, $4c, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $20, $00, $06, $80, $06, $00, $00, $0f, $f8, $07, $00, $00, $00
    db $00, $0f, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $09, $7f, $74, $0a, $0d, $41, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $20, $00, $06, $00, $04, $00, $00, $0f, $f8
    db $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $09, $48, $76, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $00, $80, $04
    db $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $09, $f3, $71
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20
    db $80, $08, $00, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $08, $29, $7d, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $20, $80, $08, $00, $05, $00, $00, $0f, $f8, $07, $00, $00, $00
    db $00, $ff, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $08, $29, $7d, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $25, $12, $05, $14, $00, $01, $ff, $fc, $3f
    db $08, $00, $ff, $fc, $14, $00, $06, $ff, $fc, $33, $ff, $fc, $14, $00, $01, $ff
    db $fb, $0d, $ff, $fb, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $1a, $00
    db $6d, $a2, $00, $01, $00, $00, $01, $09, $6d, $e2, $1a, $00, $6d, $b6, $00, $00
    db $00, $01, $01, $14, $00, $06, $ff, $fc, $33, $ff, $fc, $09, $6d, $e2, $14, $00
    db $06, $ff, $fc, $31, $ff, $fc, $14, $00, $06, $ff, $fc, $14, $07, $80, $ff, $fd
    db $14, $06, $00, $ff, $fe, $14, $00, $00, $ff, $ff, $30, $ff, $fc, $14, $00, $01
    db $00, $01, $14, $00, $06, $ff, $fc, $33, $ff, $fc, $14, $00, $07, $ff, $fc, $3f
    db $08, $00, $ff, $fc, $14, $00, $08, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff
    db $fc, $1a, $00, $6e, $05, $00, $00, $00, $00, $01, $09, $6e, $12, $14, $00, $09
    db $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $1e, $00, $01
    db $00, $00, $01, $09, $6e, $2b, $14, $00, $09, $ff, $fc, $14, $00, $01, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $6e, $37, $00, $02, $00, $00, $01, $09, $6e, $44, $14
    db $00, $09, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $50
    db $00, $03, $00, $00, $01, $09, $6e, $5d, $14, $00, $09, $ff, $fc, $14, $00, $03
    db $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $69, $00, $04, $00, $00, $01, $09, $6e
    db $76

    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6e, $82, $00, $05, $00, $00, $01, $09, $6e, $8f

    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6e, $9b, $00, $06, $00, $00, $01, $09, $6e, $a8, $14, $00, $09, $ff
    db $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $b4, $00, $07, $00
    db $00, $01, $09, $6e, $c1, $14, $00, $09, $ff, $fc, $14, $00, $07, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $6e, $cd, $00, $08, $00, $00, $01, $09, $6e, $da

    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6e, $e6, $00, $09, $00, $00, $01, $09, $6e, $f3

    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6e, $ff, $00, $0a, $00, $00, $01, $09, $6f, $0c

    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6f, $18, $00, $0b, $00, $00, $01, $09, $6f, $25, $14, $00, $09, $ff
    db $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f, $31, $00, $0c, $00
    db $00, $01, $09, $6f, $3e, $14, $00, $09, $ff, $fc, $14, $00, $0b, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $6f, $4a, $00, $0d, $00, $00, $05, $09, $6f, $57

    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $00, $25, $12, $04, $1a, $00, $6f, $6f, $00, $01, $00, $00, $05

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    add hl, bc
    ld l, a
    ld l, a

    db $14, $00, $04, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f
    db $88, $00, $00, $00, $00, $01, $09, $6f, $95

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6f, $a1, $00, $01, $00, $00, $01, $09, $6f, $ae, $14, $00, $05, $ff
    db $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f, $ba, $00, $02, $00
    db $00, $01, $09, $6f, $c7, $14, $00, $05, $ff, $fc, $14, $00, $02, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $6f, $d3, $00, $03, $00, $00, $01, $09, $6f, $e0

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $6f, $ec, $00, $04, $00, $00, $01, $09, $6f, $f9

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $05, $00, $05, $00, $00, $01, $09, $70, $12

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $1e, $00, $06, $00, $00, $01, $09, $70, $2b, $14, $00, $05, $ff
    db $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc, $1a, $00, $70, $37, $00, $07, $00
    db $00, $01, $09, $70, $44, $14, $00, $05, $ff, $fc, $14, $00, $07, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $70, $50, $00, $08, $00, $00, $01, $09, $70, $5d

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $69, $00, $09, $00, $00, $01, $09, $70, $76

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $82, $00, $0a, $00, $00, $01, $09, $70, $8f

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $9b, $00, $0b, $00, $00, $01, $09, $70, $a8

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $b4, $00, $0c, $00, $00, $01, $09, $70, $c1

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $70, $cd, $00, $0d, $00, $00, $05, $09, $70, $da

    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $1a, $00, $70, $fc, $00, $0d, $00, $00, $05, $09
    db $71, $04

    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc

    db $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc, $1a, $00, $71
    db $1d, $00, $00, $00, $00, $01, $09, $71, $2a, $14, $00, $04, $ff, $fc, $14, $00
    db $00, $ff, $fd, $75, $ff, $fc, $1a, $00, $71, $36, $00, $01, $00, $00, $01, $09
    db $71, $43

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $4f, $00, $02, $00, $00, $01, $09, $71, $5c

    inc d
    nop
    inc b
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

    db $1a, $00, $71, $68, $00, $03, $00, $00, $01, $09, $71, $75

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $81, $00, $04, $00, $00, $01, $09, $71, $8e

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $9a, $00, $05, $00, $00, $01, $09, $71, $a7

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $b3, $00, $06, $00, $00, $01, $09, $71, $c0

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $cc, $00, $07, $00, $00, $01, $09, $71, $d9

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $e5, $00, $08, $00, $00, $01, $09, $71, $f2

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $71, $fe, $00, $09, $00, $00, $01, $09, $72, $0b

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $72, $17, $00, $0a, $00, $00, $01, $09, $72, $24

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $72, $30, $00, $0b, $00, $00, $01, $09, $72, $3d, $14, $00, $04, $ff
    db $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc, $1a, $00, $72, $49, $00, $0c, $00
    db $00, $01, $09, $72, $56, $14, $00, $04, $ff, $fc, $14, $00, $0b, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $72, $62, $00, $0d, $00, $00, $05, $09, $72, $6f

    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00, $25, $12, $04, $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $72, $9e, $00, $00, $00, $00, $01, $09, $72, $ab

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $72, $b7, $00, $01, $00, $00, $01

    add hl, bc
    ld [hl], d
    db $c4

    db $14, $00, $03, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $72
    db $d0, $00, $02, $00, $00, $01, $09, $72, $dd

    inc d
    nop
    inc bc
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

    db $1a, $00, $72, $e9, $00, $03, $00, $00, $01, $09, $72, $f6

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $02, $00, $04, $00, $00, $01, $09, $73, $0f

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $1b, $00, $05, $00, $00, $01, $09, $73, $28

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $34, $00, $06, $00, $00, $01, $09, $73, $41

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $4d, $00, $07, $00, $00, $01, $09, $73, $5a

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $66, $00, $08, $00, $00, $01, $09, $73, $73

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $7f, $00, $09, $00, $00, $01, $09, $73, $8c

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld [$fdff], sp
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $98, $00, $0a, $00, $00, $01, $09, $73, $a5

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    add hl, bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $b1, $00, $0b, $00, $00, $01, $09, $73, $be

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $ca, $00, $0c, $00, $00, $01, $09, $73, $d7

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    dec bc
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $1a, $00, $73, $e3, $00, $0d, $00, $00, $05, $09, $73, $f0

    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d
    db $57, $03, $00

    ld [de], a
    dec b
    ld a, [de]
    nop
    ld [hl], h
    ld de, $0a00
    nop
    nop
    ld [bc], a
    add hl, bc
    ld [hl], h
    ld d, d
    ld b, b
    nop
    ld d, h
    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_007_7480

    ld [hl], d
    ld h, c
    db $76
    ld h, l
    jr nz, jr_007_748b

    ld l, a
    ld l, a
    ld l, e
    ld [hl], e
    ld a, [bc]
    ld h, [hl]
    ld [hl], d
    ld h, l
    ld [hl], e
    ld l, b
    jr nz, jr_007_748c

    ld l, [hl]
    ld h, h
    ld a, [bc]
    ld h, l
    ld l, [hl]
    ld [hl], h
    ld l, c
    ld h, e
    ld l, c
    ld l, [hl]
    ld h, a
    ld l, $2e
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld [hl], h
    ld e, [hl]
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $7509
    adc l
    inc d
    nop
    nop
    rst $38
    db $fc
    inc a
    rst $38
    ei
    rst $38
    db $fc
    ld a, [de]
    nop
    ld [hl], l
    adc l
    nop
    ld bc, $fbff
    ld b, $14
    nop
    nop
    rst $38
    db $fc
    dec a
    rst $38
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fc
    add h

jr_007_7480:
    nop
    ld bc, $fcff
    inc d
    nop
    nop
    rst $38
    db $fc
    inc d
    nop

jr_007_748b:
    nop

jr_007_748c:
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    ei
    dec c
    rst $38
    ei
    nop
    ld d, l
    xor a
    ld [bc], a
    inc d
    nop
    nop
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    ei
    dec c
    rst $38
    ei
    nop
    ld d, l
    xor a
    ld [bc], a
    inc d
    nop
    nop
    rst $38
    db $fc
    add h
    nop
    nop
    rst $38
    db $fc
    inc d
    nop
    nop
    rst $38
    db $fc
    dec a
    rlca
    rst $38
    db $fc
    ld a, [de]
    nop
    ld [hl], h
    push de
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $7509
    adc d
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    ld b, b
    nop

    db "You dug up\n" ; 0x74df
    db "the grave"

    ld l, $00
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
    ld bc, $0014
    dec bc
    nop
    nop
    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld a, [bc]
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld b, b
    nop

    db "You got the\n" ; 0x7521
    db "Human Corpse!"

    db $00, $47
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

jr_007_7548:
    nop
    ld b, h
    rlca
    ld bc, $0040

    db "The meaty flesh\n" ; 0x754e
    db "hasn't had time\n"
    db "to rot."

    nop
    ld b, a

jr_007_7577:
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
    ld bc, $7509
    adc l

jr_007_758d:
    nop

    db $12, $05, $1a, $00, $75, $9c, $00, $0a, $00, $00, $02, $09, $75, $dd

    ld b, b
    nop

jr_007_759e:
    db "This grave looks\n"
    db "fresh and\n"
    db "enticing..."

    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, l
    rst $38

jr_007_75ce:
    dec c
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

    db $1a, $00, $75, $e9, $00, $0a, $00, $00, $01

    add hl, bc
    ld [hl], a
    db $18

    db $14, $00, $00, $ff, $fc, $3c, $ff, $fb, $ff, $fc, $1a, $00, $77, $18, $00, $03
    db $ff, $fb, $06, $14, $00, $00, $ff, $fc, $3d, $ff, $ff, $fc, $14, $00, $00, $ff
    db $fc, $84, $00, $01, $ff, $fc, $14, $00, $00, $ff, $fc, $14, $00, $02, $ff, $fd
    db $75, $ff, $fc, $14, $00, $0c, $ff, $fb, $0d, $ff, $fb, $00, $55, $af, $02, $14
    db $00, $00, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc, $14, $00, $0c, $ff
    db $fb, $0d, $ff, $fb, $00, $55, $af, $02, $14, $00, $00, $ff, $fc, $84, $00, $00
    db $ff, $fc, $14, $00, $00, $ff, $fc, $3d, $07, $ff, $fc, $1a, $00, $76, $60, $00
    db $0a, $00, $00, $01

    add hl, bc
    ld [hl], a
    dec d

    db $14, $00, $04, $ff, $fc, $33, $ff, $fc, $40, $00

    db "You dug up\n"
    db "the grave."

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $45, $fe, $12, $00, $44, $03, $01, $14, $00, $0b, $00, $00, $14, $00
    db $05, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc, $40, $00

    db "You got the\n"
    db "Human Corpse!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "The meaty flesh\n"
    db "hasn't had time\n"
    db "to rot."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $09, $77, $18, $00
    
bank007_7719:
    db $2c, $00
    INCBIN "gfx/bank007_items_771b.2bpp"

bank007_79db:
    db $2c, $00
    INCBIN "gfx/bank007_link_79dd.2bpp"

    ld hl, $c51e
    ld [hl], $00
    ld hl, $c51f
    ld [hl], $00
    ld hl, $c520
    ld [hl], $18
    ld hl, $c521
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
    ld hl, $4562
    call RST_08
    add sp, $04
    ret


    add sp, -$07
    ld hl, $c507
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

    ld hl, $c507
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

    ld hl, $c507
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

    ld hl, $c507
    ld [hl], $01
    ld c, $00
    jr jr_007_7d41

jr_007_7d32:
    ld a, d
    or e
    jr z, jr_007_7d3f

    ld hl, $c507
    ld [hl], $01
    ld c, $80
    jr jr_007_7d41

jr_007_7d3f:
    ld c, $00

jr_007_7d41:
    ld a, [$c507]
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
    call Call_000_3541
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
    call Call_000_3541
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
    ld hl, $4c19
    call RST_08
    add sp, $04
    ld hl, sp+$00
    ld [hl], e
    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
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

    ld hl, $c507
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
    ld hl, $61bc
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
    ld hl, $4b8e
    call RST_08
    inc sp

jr_007_7ffd:
    add sp, $07
    ret

