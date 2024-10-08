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

Call_007_40d4:
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
    jr nz, jr_007_4360

    inc bc

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
    call $4367
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
    call $4367
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
    call $4367
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
    ld bc, $0703
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

Call_007_48f8:
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


    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld c, c
    push af
    nop
    ld b, $00
    nop
    ld [bc], a
    add hl, bc
    ld c, d
    ld h, c
    ld b, b
    nop
    ld c, c
    daa
    ld l, l
    jr nz, jr_007_4a63

    ld l, a
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_007_4a71

    ld l, [hl]
    jr nz, jr_007_4a66

    ld a, [bc]
    ld l, d
    ld [hl], l
    ld l, [hl]
    ld h, a
    ld l, h
    ld h, l
    jr nz, jr_007_4a7b

    ld l, c
    ld [hl], e
    ld [hl], e
    ld l, c
    ld l, a
    ld l, [hl]
    ld a, [bc]
    ld [hl], e
    ld l, a
    ld l, a
    ld l, [hl]
    inc l
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
    ld l, [hl]
    ld h, l
    ld h, l
    ld h, h
    jr nz, jr_007_4aa8

    ld l, a
    jr nz, @+$72

    ld [hl], d
    ld h, c
    ld h, e
    ld [hl], h
    ld l, c
    ld h, e
    ld h, l
    ld a, [bc]
    ld l, l
    ld a, c
    jr nz, @+$75

    ld [hl], h
    ld h, l
    ld h, c
    ld l, h
    ld [hl], h
    ld l, b
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

jr_007_4a63:
    ld c, d
    ld l, l
    nop

jr_007_4a66:
    rlca
    nop
    nop
    dec b
    add hl, bc
    ld c, d
    xor l
    ld b, b
    nop
    ld d, d
    ld c, a

jr_007_4a71:
    ld b, c
    ld d, d
    ld hl, $4700
    inc bc
    ld bc, $1404
    nop

jr_007_4a7b:
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
    ld c, l
    ld h, c
    ld l, [hl]
    inc l
    jr nz, jr_007_4ad7

    daa
    ld l, l
    jr nz, jr_007_4af9

    ld l, a
    ld l, a
    ld h, h
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

jr_007_4aa8:
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld c, d
    cp c
    nop
    ld b, $00
    nop
    ld bc, $4b09
    and e
    ld b, b
    nop
    ld d, a
    ld l, a
    ld l, a
    ld l, b
    ld l, a
    ld l, a
    ld hl, $5420
    ld l, b
    ld h, l
    ld [hl], e
    ld h, l
    jr nz, jr_007_4b30

    ld h, c
    ld h, e
    ld h, l
    ld a, [bc]
    ld [hl], b
    ld h, c
    ld l, c
    ld l, [hl]
    ld [hl], h
    ld [hl], e
    jr nz, jr_007_4b37

    ld [hl], d

jr_007_4ad7:
    ld h, l
    jr nz, jr_007_4b3d

    ld l, a
    ld l, a
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
    ld bc, $0040
    ld c, b
    ld h, l
    ld [hl], d
    ld h, l
    inc l
    jr nz, jr_007_4b6d

jr_007_4af9:
    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_007_4b72

    ld l, b
    ld l, c
    ld [hl], e
    ld l, $0a
    ld c, c
    daa
    db $76
    ld h, l
    jr nz, jr_007_4b70

    ld l, a
    ld [hl], h
    jr nz, jr_007_4b3f

    jr nc, jr_007_4b3d

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
    ld bc, $0014
    rlca
    nop
    nop
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop

jr_007_4b30:
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld b, b

jr_007_4b37:
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, @+$69

jr_007_4b3d:
    ld l, a
    ld [hl], h

jr_007_4b3f:
    jr nz, jr_007_4bb5

    ld l, b
    ld h, l
    jr nz, jr_007_4b99

    ld h, c
    ld [hl], e
    ld h, l
    ld [hl], d
    ld hl, $4700
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
    ld b, e
    ld h, c
    ld [hl], l
    ld [hl], h
    ld l, c
    ld l, a
    ld l, [hl]
    ld a, [hl-]
    jr nz, jr_007_4bb3

    ld h, l
    ld h, l
    ld [hl], b
    jr nz, jr_007_4bce

jr_007_4b6d:
    ld [hl], a
    ld h, c
    ld a, c

jr_007_4b70:
    ld a, [bc]
    ld h, [hl]

jr_007_4b72:
    ld [hl], d
    ld l, a
    ld l, l
    jr nz, @+$79

    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_007_4bde

    ld l, [hl]
    ld h, h
    ld a, [bc]
    ld [hl], e
    ld l, l
    ld h, c
    ld l, h
    ld l, h
    jr nz, jr_007_4bf7

    ld [hl], l
    ld [hl], b
    ld [hl], b
    ld l, c
    ld h, l
    ld [hl], e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c
    rst $38
    nop

jr_007_4b99:
    ld b, h
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld c, e
    or e
    nop
    add hl, bc
    nop
    nop
    ld [bc], a
    add hl, bc
    ld c, h
    ld e, a

jr_007_4bb3:
    ld b, b
    nop

jr_007_4bb5:
    ld c, h
    ld l, c
    ld h, [hl]
    ld h, l
    jr nz, jr_007_4c1c

    ld [hl], e
    jr nz, jr_007_4c1f

    jr nz, @+$69

    ld [hl], d
    ld h, c
    db $76
    ld h, l
    ld a, [bc]
    ld h, h
    ld l, c
    ld h, a
    ld h, a
    ld h, l
    ld [hl], d
    jr nz, jr_007_4c40

    ld [hl], l

jr_007_4bce:
    ld [hl], d
    ld h, l
    jr nz, @+$6b

    ld [hl], e
    ld a, [bc]
    ld h, d
    ld l, a
    ld [hl], d
    ld l, c
    ld l, [hl]
    ld h, a
    ld l, $00
    ld b, a
    inc bc

jr_007_4bde:
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
    jr nz, @+$6f

    ld l, c
    ld [hl], e
    ld [hl], e
    jr nz, jr_007_4c64

jr_007_4bf7:
    ld a, c
    jr nz, jr_007_4c62

    ld h, c
    ld l, [hl]
    ld h, h
    ld h, a
    ld [hl], l
    ld l, [hl]
    ld [hl], e
    ld a, [bc]
    ld [hl], h
    ld l, a
    ld l, a
    jr nz, jr_007_4c34

    jr nz, @+$76

    ld l, b
    ld h, l
    jr nz, jr_007_4c80

    ld l, b
    ld l, a
    db $76
    ld h, l
    ld l, h
    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c
    rst $38

jr_007_4c1c:
    nop
    ld b, h
    rlca

jr_007_4c1f:
    ld bc, $0040
    ld l, d
    ld [hl], l
    ld [hl], e
    ld [hl], h
    jr nz, jr_007_4c8c

    ld l, a
    ld h, l
    ld [hl], e
    ld l, [hl]
    daa
    ld [hl], h
    jr nz, jr_007_4c93

    ld [hl], l
    ld [hl], h
    ld a, [bc]
    ld l, c

jr_007_4c34:
    ld [hl], h
    jr nz, @+$79

    ld l, b
    ld h, l
    ld l, [hl]
    jr nz, jr_007_4ca2

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h

jr_007_4c40:
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]
    ld h, h
    ld h, l
    ld l, l
    ld l, a
    ld l, [hl]
    ld [hl], e
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
    ld bc, $001a
    ld c, h

jr_007_4c62:
    ld l, e
    nop

jr_007_4c64:
    ld a, [bc]
    nop
    nop
    dec b
    add hl, bc
    ld c, h
    cp a
    ld b, b
    nop
    ld c, b
    ld h, l
    ld a, c
    jr nz, @+$79

    ld h, c
    ld l, c
    ld [hl], h
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop

jr_007_4c80:
    ld b, l
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040

jr_007_4c8c:
    ld d, h
    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_007_4cf9

    ld [hl], l

jr_007_4c93:
    ld l, [hl]
    jr nz, jr_007_4cff

    ld [hl], e
    jr nz, jr_007_4d06

    ld h, c
    ld h, h
    ld h, l
    ld a, [bc]
    ld l, a
    ld h, [hl]
    jr nz, @+$72

    ld l, h

jr_007_4ca2:
    ld h, c
    ld [hl], e
    ld [hl], h
    ld l, c
    ld h, e
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
    ld c, h
    rlc b
    add hl, bc
    nop
    nop
    ld bc, $4d09
    db $eb
    ld b, b
    nop
    ld d, h
    ld l, b
    ld h, c
    ld l, [hl]
    ld l, e
    ld [hl], e
    jr nz, jr_007_4d3b

    ld l, a
    ld [hl], d
    jr nz, jr_007_4d4d

    ld l, b
    ld h, l
    ld a, [bc]
    ld l, b
    ld h, c
    ld l, [hl]
    ld h, h
    ld h, a
    ld [hl], l
    ld l, [hl]
    ld hl, $4700
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
    ld e, c

jr_007_4cf9:
    ld l, a
    ld [hl], l
    jr nz, jr_007_4d60

    ld h, c
    ld l, [hl]

jr_007_4cff:
    jr nz, jr_007_4d75

    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_007_4d7a

jr_007_4d06:
    ld l, b
    ld l, c
    ld [hl], e
    ld a, [bc]
    ld [hl], e
    ld l, b
    ld l, a
    db $76
    ld h, l
    ld l, h
    jr nz, jr_007_4d7b

    ld h, [hl]
    jr nz, jr_007_4d8e

    ld l, a
    ld [hl], l
    ld a, [bc]
    ld [hl], a
    ld h, c
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
    ld bc, $0040
    ld c, c
    ld [hl], h
    jr nz, jr_007_4d97

    ld l, a
    ld h, l
    ld [hl], e
    ld l, [hl]
    daa
    ld [hl], h
    jr nz, jr_007_4da3

jr_007_4d3b:
    ld h, c
    db $76
    ld h, l
    jr nz, jr_007_4da1

    ld a, [bc]
    ld b, h
    ld d, h
    jr nz, jr_007_4db2

    ld l, a
    ld h, h
    ld h, l
    jr nz, jr_007_4dbe

    ld l, b
    ld l, a
    ld [hl], l

jr_007_4d4d:
    ld h, a
    ld l, b
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

jr_007_4d60:
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $0014
    ld a, [bc]
    nop
    nop
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

jr_007_4d75:
    rst $38
    db $fc
    ld b, b
    nop
    ld e, c

jr_007_4d7a:
    ld l, a

jr_007_4d7b:
    ld [hl], l
    jr nz, @+$69

    ld l, a
    ld [hl], h
    jr nz, jr_007_4df6

    ld l, b
    ld h, l
    jr nz, jr_007_4dd9

    ld l, b
    ld l, a
    db $76
    ld h, l
    ld l, h
    ld hl, $4700

jr_007_4d8e:
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, l
    rst $38
    dec c

jr_007_4d97:
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld d, h

jr_007_4da1:
    ld l, a
    ld l, a

jr_007_4da3:
    ld l, h
    jr nz, @+$71

    ld h, [hl]
    jr nz, @+$65

    ld l, b
    ld l, a
    ld l, c
    ld h, e
    ld h, l
    jr nz, jr_007_4e16

    ld l, a
    ld [hl], d

jr_007_4db2:
    ld a, [bc]
    ld a, b
    ld l, a
    ld l, l
    ld h, d
    ld l, c
    ld h, l
    ld [hl], e
    jr nz, jr_007_4e1d

    ld l, [hl]
    ld h, h

jr_007_4dbe:
    jr nz, jr_007_4e27

    ld [hl], d
    ld h, c
    db $76
    ld h, l
    dec l
    ld a, [bc]
    ld h, h
    ld l, c
    ld h, a
    ld h, a
    ld h, l
    ld [hl], d
    ld [hl], e
    jr nz, jr_007_4e30

    ld l, h
    ld l, c
    ld l, e
    ld h, l
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc

jr_007_4dd9:
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
    ld bc, $2500
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld c, l
    ei
    nop
    inc bc
    nop

jr_007_4df6:
    nop
    ld [bc], a
    add hl, bc
    ld c, [hl]
    or [hl]
    ld b, b
    nop
    ld c, c
    jr nz, jr_007_4e6a

    ld [hl], l
    ld [hl], e
    ld [hl], h
    jr nz, jr_007_4e7c

    ld h, c
    ld l, [hl]
    ld [hl], h
    jr nz, jr_007_4e7e

    ld l, a
    jr nz, jr_007_4e71

    ld l, c
    ld h, l
    ld hl, $4700
    inc bc
    ld bc, $1405

jr_007_4e16:
    nop
    nop
    ld b, l
    rst $38
    dec c
    nop
    ld b, c

jr_007_4e1d:
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld c, [hl]
    ld h, c
    ld l, l

jr_007_4e27:
    ld h, e
    ld l, a
    jr nz, jr_007_4e95

    ld [hl], l
    ld [hl], e
    ld [hl], h
    jr nz, jr_007_4ea7

jr_007_4e30:
    ld l, a
    ld l, [hl]
    daa
    ld [hl], h
    ld a, [bc]
    ld l, e
    ld l, c
    ld l, h
    ld l, h
    jr nz, jr_007_4ea8

    ld h, l
    jr nz, jr_007_4ead

    ld h, [hl]
    ld h, [hl]
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
    ld c, c
    daa
    ld l, l
    jr nz, jr_007_4ebc

    ld [hl], l
    ld h, a
    jr nz, jr_007_4ec9

    ld a, c
    jr nz, jr_007_4ece

    ld [hl], a
    ld l, [hl]
    ld a, [bc]
    ld h, a
    ld [hl], d
    ld h, c
    db $76
    ld h, l
    inc l
    nop
    ld b, a

jr_007_4e6a:
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c

jr_007_4e71:
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld [hl], a
    ld l, c
    ld [hl], h
    ld l, b

jr_007_4e7c:
    jr nz, jr_007_4ee4

jr_007_4e7e:
    ld l, h
    ld l, a
    ld [hl], a
    ld h, l
    ld [hl], d
    ld [hl], e
    jr nz, @+$63

    ld l, [hl]
    ld h, h
    jr nz, jr_007_4eeb

    ld a, [bc]
    db $76
    ld h, c
    ld [hl], e
    ld h, l
    jr nz, jr_007_4ef2

    ld l, [hl]
    ld h, h
    ld a, [bc]
    ld h, l

jr_007_4e95:
    db $76
    ld h, l
    ld [hl], d
    ld a, c
    ld [hl], h
    ld l, b
    ld l, c
    ld l, [hl]
    ld h, a
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405

jr_007_4ea7:
    nop

jr_007_4ea8:
    nop
    ld b, c
    rst $38
    nop
    ld b, h

jr_007_4ead:
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld c, [hl]
    jp nz, $0300

jr_007_4ebc:
    nop
    nop
    ld bc, $5009
    inc b
    ld b, b
    nop
    ld d, a
    ld l, b
    ld h, c
    ld [hl], h
    daa

jr_007_4ec9:
    ld [hl], e
    jr nz, jr_007_4f40

    ld l, b
    ld l, c

jr_007_4ece:
    ld [hl], e
    jr nz, jr_007_4f3d

    ld l, c
    ld [hl], h
    ld [hl], h
    ld l, h
    ld h, l
    ld a, [bc]
    ld l, c
    ld [hl], d
    ld l, a
    ld l, [hl]
    ccf
    nop
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop

jr_007_4ee4:
    ld b, l
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop

jr_007_4eeb:
    ld b, h
    rlca
    ld bc, $0040
    ld c, l
    ld h, c

jr_007_4ef2:
    ld a, c
    ld h, d
    ld h, l
    jr nz, jr_007_4f40

    jr nz, jr_007_4f6c

    ld l, b
    ld l, a
    ld [hl], l
    ld l, h
    ld h, h
    ld a, [bc]
    ld h, e
    ld l, b
    ld h, l
    ld [hl], a
    jr nz, jr_007_4f74

    ld l, [hl]
    jr nz, jr_007_4f28

    ld l, c
    ld [hl], h
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
    ld bc, $0040
    ld d, l
    ld d, d
    ld b, a
    ld c, b
    ld hl, $4700
    inc bc
    ld bc, $1404

jr_007_4f28:
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld c, l
    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_007_4fab

    ld [hl], l
    ld [hl], d
    ld h, l
    jr nz, jr_007_4fab

jr_007_4f3d:
    ld l, a
    dec l
    ld l, a

jr_007_4f40:
    ld l, [hl]
    ld h, l
    ld a, [bc]
    ld [hl], e
    ld [hl], h
    ld h, l
    ld h, c
    ld l, h
    ld [hl], e
    jr nz, jr_007_4fb8

    ld a, c
    jr nz, jr_007_4fc4

    ld h, c
    ld [hl], e
    ld h, l
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
    inc bc

jr_007_4f6c:
    rst $38
    db $fc
    inc d
    ld bc, $ff00
    db $fd
    inc d

jr_007_4f74:
    dec b
    nop
    rst $38
    cp $14
    nop
    ld bc, $ffff
    jr nc, @+$01

    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    inc b
    nop
    nop
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
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_5008

    ld l, a
    ld [hl], h
    jr nz, jr_007_5019

    ld l, b
    ld h, l
    jr nz, jr_007_4fff

    ld h, c
    ld [hl], e

jr_007_4fab:
    ld h, l
    ld hl, $4700
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, l
    rst $38
    dec c

jr_007_4fb8:
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld d, h
    ld l, b
    ld h, l

jr_007_4fc4:
    ld [hl], d
    ld h, l
    daa
    ld [hl], e
    jr nz, jr_007_502b

    jr nz, jr_007_5038

    ld l, c
    ld [hl], h
    ld [hl], h
    ld l, h
    ld h, l
    ld a, [bc]
    ld [hl], a
    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_007_5045

    ld h, l
    ld h, [hl]
    ld [hl], h
    jr nz, @+$63

    ld [hl], h
    ld a, [bc]
    ld [hl], h
    ld l, b
    ld h, l
    jr nz, jr_007_5047

    ld l, a
    ld [hl], h
    ld [hl], h
    ld l, a
    ld l, l
    ld l, $2e
    ld l, $20
    jr nz, jr_007_4ff0

jr_007_4ff0:
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

jr_007_4fff:
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld [de], a
    inc b

jr_007_5008:
    ld a, [de]
    nop
    ld d, b
    inc d
    nop
    dec b
    nop
    nop
    ld [bc], a
    add hl, bc
    ld d, b
    cp h
    ld b, b
    nop
    ld c, c
    daa
    ld l, l

jr_007_5019:
    jr nz, jr_007_5092

    ld h, c
    ld l, c
    ld [hl], h
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_007_5097

    ld l, a
    jr nz, jr_007_508d

    ld h, l
    ld [hl], h
    ld a, [bc]
    ld d, h
    ld l, a

jr_007_502b:
    ld l, l
    jr nz, jr_007_5074

    ld [hl], l
    ld l, h
    ld [hl], b
    daa
    ld [hl], e
    ld a, [bc]
    ld h, c
    ld [hl], l
    ld [hl], h
    ld l, a

jr_007_5038:
    ld h, a
    ld [hl], d
    ld h, c
    ld [hl], b
    ld l, b
    ld hl, $4700
    inc bc
    ld bc, $1405
    nop

jr_007_5045:
    nop
    ld b, l

jr_007_5047:
    rst $38
    dec c
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld b, d
    ld [hl], l
    ld [hl], h
    jr nz, @+$4b

    daa
    ld l, l
    jr nz, @+$69

    ld h, l
    ld [hl], h
    ld [hl], h
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]
    ld [hl], b
    ld h, l
    ld h, e
    ld l, e
    ld l, c
    ld [hl], e
    ld l, b
    jr nz, jr_007_5098

    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c

jr_007_5074:
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld c, c
    jr nz, jr_007_50ed

    ld l, [hl]
    ld l, h
    ld a, c
    jr nz, jr_007_50ef

    ld l, c
    ld l, e
    ld h, l
    ld a, [bc]
    ld l, b
    ld h, l
    ld l, h
    ld [hl], b
    ld l, h
    ld h, l

jr_007_508d:
    ld [hl], e
    ld [hl], e
    jr nz, jr_007_50f2

    ld l, [hl]

jr_007_5092:
    ld l, c
    ld l, l
    ld h, c
    ld l, h
    ld [hl], e

jr_007_5097:
    ld a, [bc]

jr_007_5098:
    ld [hl], h
    ld l, a
    jr nz, @+$67

    ld h, c
    ld [hl], h
    inc l
    jr nz, @+$76

    ld l, b
    ld l, a
    ld [hl], l
    ld h, a
    ld l, b
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
    ld d, b
    ret z

    nop
    ld b, $00
    nop
    dec b
    add hl, bc
    ld d, c
    ld [hl], d
    ld b, b
    nop
    ld c, c
    ld h, [hl]
    jr nz, jr_007_5117

    jr nz, jr_007_5133

    ld l, a
    ld l, h
    ld l, h
    ld h, l
    ld h, e
    ld [hl], h
    jr nz, jr_007_5139

    ld l, h
    ld l, h
    ld a, [bc]
    ld l, a
    ld h, [hl]
    jr nz, @+$76

    ld l, b
    ld h, l
    ld [hl], e
    ld h, l
    jr nz, @+$68

    ld [hl], d
    ld l, a
    ld h, a
    ld [hl], e
    jr nz, jr_007_5134

    ld a, [bc]
    ld h, a

jr_007_50ed:
    ld h, l
    ld [hl], h

jr_007_50ef:
    jr nz, jr_007_5165

    ld l, b

jr_007_50f2:
    ld h, l
    jr nz, jr_007_5168

    ld [hl], h
    ld h, l
    ld h, c
    ld l, h
    ld [hl], h
    ld l, b
    ld a, [bc]
    ld h, e
    ld h, c
    ld l, l
    ld l, a
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1406
    nop
    nop
    ld b, l
    rst $38
    inc c
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040

jr_007_5117:
    ld l, a
    ld [hl], d
    jr nz, jr_007_5164

    jr nz, jr_007_5180

    ld l, a
    ld [hl], l
    ld l, h
    ld h, h
    jr nz, jr_007_5187

    ld l, a
    jr nz, jr_007_5187

    jr nz, @+$70

    ld l, a
    dec l
    ld a, [bc]
    ld h, c
    ld l, h
    ld h, l
    ld [hl], d
    ld [hl], h
    jr nz, @+$72

    ld l, h

jr_007_5133:
    ld h, c

jr_007_5134:
    ld a, c
    ld [hl], h
    ld l, b
    ld [hl], d
    ld l, a

jr_007_5139:
    ld [hl], l
    ld h, a
    ld l, b
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1406
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld d, a
    ld l, b
    ld l, c
    ld h, e
    ld l, b
    jr nz, @+$6b

    ld [hl], e
    jr nz, @+$67

    ld h, c
    ld [hl], e
    ld l, c
    ld h, l
    ld [hl], d
    ccf
    nop
    ld b, a
    inc bc
    ld bc, $1406
    nop

jr_007_5164:
    nop

jr_007_5165:
    ld b, c
    rst $38
    nop

jr_007_5168:
    ld b, h
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld d, c
    ld a, [hl]
    nop
    dec b
    nop
    nop
    ld bc, $5209
    pop de
    ld b, b
    nop

jr_007_5180:
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_51e7

    ld [hl], d
    ld l, a

jr_007_5187:
    ld [hl], l
    ld h, a
    ld l, b
    ld [hl], h
    jr nz, jr_007_51fa

    ld h, l
    jr nz, jr_007_51f1

    ld a, [bc]
    ld h, [hl]
    ld [hl], d
    ld l, a
    ld h, a
    jr nz, jr_007_520b

    ld l, a
    jr nz, jr_007_51ff

    ld h, c
    ld [hl], h
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
    ld bc, $0040
    ld d, h
    ld l, b
    ld h, c
    ld l, [hl]
    ld l, e
    ld [hl], e
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
    ld c, b
    ld h, l
    ld [hl], d
    ld h, l
    inc l
    jr nz, jr_007_5243

    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_007_5248

    ld l, b
    ld l, c
    ld [hl], e
    ld a, [bc]
    ld [hl], h
    ld l, c
    ld h, a
    ld h, l
    ld [hl], d
    jr nz, jr_007_5245

    ld h, c
    ld h, e
    ld h, l
    jr nz, jr_007_5254

    ld h, c
    ld l, c
    ld l, [hl]

jr_007_51e7:
    ld [hl], h
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop

jr_007_51f1:
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld c, c

jr_007_51fa:
    ld [hl], h
    daa
    ld [hl], e
    jr nz, @+$70

jr_007_51ff:
    ld l, a
    ld [hl], h
    jr nz, jr_007_526f

    ld l, a
    ld [hl], a
    ld h, l
    ld [hl], d
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]

jr_007_520b:
    ld l, l
    ld a, c
    jr nz, jr_007_5272

    ld h, c
    ld l, l
    ld l, a
    jr nz, jr_007_527d

    ld l, [hl]
    ld h, h
    ld h, l
    ld a, b
    ld a, [bc]
    ld h, l
    ld l, [hl]
    ld l, a
    ld [hl], l
    ld h, a
    ld l, b
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
    ld bc, $0014
    ld b, $00
    nop
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop

jr_007_5243:
    ld b, $ff

jr_007_5245:
    db $fd
    ld [hl], l
    rst $38

jr_007_5248:
    db $fc
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_52b7

    ld l, a
    ld [hl], h
    jr nz, jr_007_52c8

jr_007_5254:
    ld l, b
    ld h, l
    ld a, [bc]
    ld d, h
    ld l, c
    ld h, a
    ld h, l
    ld [hl], d
    jr nz, jr_007_52a4

    ld h, c
    ld h, e
    ld h, l
    jr nz, jr_007_52b3

    ld h, c
    ld l, c
    ld l, [hl]
    ld [hl], h
    ld [hl], e
    ld hl, $4700
    inc bc
    ld bc, $1404

jr_007_526f:
    nop
    nop
    ld b, l

jr_007_5272:
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040

jr_007_527d:
    ld b, a
    ld [hl], d
    ld h, l
    ld h, c
    ld [hl], h
    jr nz, jr_007_52ea

    ld l, a
    ld [hl], d
    jr nz, @+$75

    ld [hl], h
    ld h, l
    ld h, c
    ld l, h
    ld [hl], h
    ld l, b
    ld a, [bc]
    ld l, l
    ld l, c
    ld [hl], e
    ld [hl], e
    ld l, c
    ld l, a
    ld l, [hl]
    ld [hl], e
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, c
    rst $38

jr_007_52a4:
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld h, c
    ld l, [hl]
    ld h, h
    jr nz, jr_007_531a

    ld l, c
    ld h, h
    ld [hl], e
    daa

jr_007_52b3:
    jr nz, jr_007_5325

    ld h, c
    ld [hl], d

jr_007_52b7:
    ld [hl], h
    ld l, c
    ld h, l
    ld [hl], e
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

jr_007_52c8:
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld [de], a
    dec b
    ld a, [de]
    nop
    ld d, d
    pop hl
    nop
    inc c
    nop
    nop
    ld [bc], a
    add hl, bc
    ld d, e
    ld d, h
    ld a, [de]
    nop
    ld d, d
    db $ed
    nop
    ld bc, $0000
    dec b

jr_007_52ea:
    add hl, bc
    ld d, e
    ld d, h
    ld b, b
    nop
    ld b, a
    ld h, l
    ld [hl], h
    jr nz, jr_007_5361

    ld h, l
    jr nz, jr_007_536a

    ld l, a
    ld l, l
    ld h, l
    jr nz, jr_007_5362

    ld l, a
    ld l, a
    ld h, h
    inc l
    ld a, [bc]
    ld h, e
    ld l, a
    ld [hl], l
    ld l, h
    ld h, h
    jr nz, jr_007_5381

    ld l, a
    ld [hl], l
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
    rst $38
    nop

jr_007_531a:
    ld b, h
    rlca
    ld bc, $0040
    ld c, c
    daa
    ld l, h
    ld l, h
    jr nz, @+$6a

jr_007_5325:
    ld h, c
    db $76
    ld h, l
    jr nz, jr_007_538b

    jr nz, jr_007_538e

    ld [hl], l
    ld [hl], d
    ld h, a
    ld h, l
    ld [hl], d
    ld a, [bc]
    ld h, c
    ld l, [hl]
    ld h, h
    jr nz, jr_007_5398

    jr nz, jr_007_53ac

    ld [hl], b
    ld [hl], d
    ld l, c
    ld [hl], h
    ld h, l
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
    ld d, e
    ld h, b
    nop
    nop
    nop
    nop
    ld bc, $5409
    cp b
    ld b, b

jr_007_5361:
    nop

jr_007_5362:
    ld c, c
    daa
    ld l, l
    jr nz, jr_007_53ce

    ld [hl], l
    ld h, c
    ld [hl], d

jr_007_536a:
    ld h, h
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_007_53e4

    ld l, b
    ld h, l
    ld a, [bc]
    ld [hl], h
    ld h, l
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    ld hl, $4700
    inc bc
    ld bc, $1405
    nop

jr_007_5381:
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

jr_007_538b:
    ld bc, $0040

jr_007_538e:
    ld c, c
    jr nz, jr_007_53fe

    ld l, c
    ld [hl], e
    ld [hl], e
    ld h, l
    ld h, h
    jr nz, jr_007_5404

jr_007_5398:
    ld [hl], l
    ld l, [hl]
    ld h, e
    ld l, b
    ld a, [bc]
    ld h, c
    ld l, [hl]
    ld h, h
    jr nz, jr_007_53eb

    daa
    ld l, l
    jr nz, jr_007_5419

    ld [hl], h
    ld h, c
    ld [hl], d
    db $76
    ld l, c
    ld l, [hl]

jr_007_53ac:
    ld h, a
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
    ld d, h
    ld h, c
    ld l, e
    ld h, l
    jr nz, @+$76

    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_007_5438

    ld l, a
    ld l, [hl]
    ld h, l

jr_007_53ce:
    ld a, c
    ld a, [bc]
    ld h, c
    ld l, [hl]
    ld h, h
    jr nz, jr_007_543c

    ld h, l
    ld [hl], h
    jr nz, jr_007_5446

    ld h, l
    jr nz, jr_007_544f

    ld l, a
    ld l, l
    ld h, l
    ld a, [bc]
    ld l, h
    ld [hl], l
    ld l, [hl]
    ld h, e

jr_007_53e4:
    ld l, b
    inc l
    jr nz, jr_007_544b

    ld l, a
    ld [hl], l
    ld l, h

jr_007_53eb:
    ld h, h
    jr nz, @+$7b

    ld l, a
    ld [hl], l
    ccf
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

jr_007_53fe:
    ld bc, $0040
    ld c, c
    daa
    ld l, h

jr_007_5404:
    ld l, h
    jr nz, jr_007_546f

    ld h, c
    db $76
    ld h, l
    jr nz, jr_007_546d

    jr nz, jr_007_5470

    ld [hl], l
    ld [hl], d
    ld h, a
    ld h, l
    ld [hl], d
    ld a, [bc]
    ld h, c
    ld l, [hl]
    ld h, h
    jr nz, @+$63

jr_007_5419:
    jr nz, jr_007_548e

    ld [hl], b
    ld [hl], d
    ld l, c
    ld [hl], h
    ld h, l
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
    ld bc, $0014

jr_007_5438:
    ld bc, $0000
    inc d

jr_007_543c:
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l

jr_007_5446:
    rst $38
    db $fc
    ld b, b
    nop
    ld e, c

jr_007_544b:
    ld l, a
    ld [hl], l
    jr nz, jr_007_54b6

jr_007_544f:
    ld l, a
    ld [hl], h
    jr nz, jr_007_54c7

    ld l, b
    ld h, l
    ld a, [bc]
    ld b, d
    ld l, c
    ld h, a
    jr nz, jr_007_549d

    ld h, c
    ld h, a
    jr nz, @+$71

    ld h, [hl]
    jr nz, jr_007_54af

    ld l, a
    ld l, [hl]
    ld h, l
    ld a, c
    ld hl, $4700
    inc bc
    ld bc, $1405

jr_007_546d:
    nop
    nop

jr_007_546f:
    ld b, l

jr_007_5470:
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
    ld [hl], h
    jr nz, jr_007_54eb

    ld l, a
    ld l, a
    ld l, e
    ld [hl], e
    jr nz, jr_007_54f1

    ld l, c
    ld l, e
    ld h, l
    ld a, [bc]
    ld d, d
    ld h, c
    ld l, [hl]
    ld h, h
    ld a, c

jr_007_548e:
    daa
    ld [hl], e
    jr nz, jr_007_54f3

    ld h, h
    db $76
    ld h, l
    ld [hl], d
    ld [hl], h
    ld l, c
    ld [hl], e
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]

jr_007_549d:
    ld l, l
    ld l, a
    ld l, [hl]
    ld h, l
    ld a, c
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

jr_007_54af:
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h

jr_007_54b6:
    inc bc
    ld bc, $001a
    ld d, h
    call nz, $0c00
    nop
    nop
    ld bc, $5509
    jp nc, VBlankInterrupt

    ld c, b

jr_007_54c7:
    ld h, l
    ld a, c
    jr nz, @+$7b

    ld l, a
    ld [hl], l
    jr nz, jr_007_5535

    ld l, c
    ld l, [hl]
    ld h, c
    ld l, h
    ld l, h
    ld a, c
    ld a, [bc]
    ld h, a
    ld l, a
    ld [hl], h
    jr nz, jr_007_554e

    ld l, a
    ld l, l
    ld h, l
    jr nz, jr_007_5546

    ld l, a
    ld l, a
    ld h, h
    ld hl, $4700
    inc bc
    ld bc, $1404
    nop

jr_007_54eb:
    nop
    ld b, l
    rst $38
    ld c, $00
    ld b, c

jr_007_54f1:
    rst $38
    nop

jr_007_54f3:
    ld b, h
    rlca
    ld bc, $0040
    ld d, a
    ld l, b
    ld h, c
    ld [hl], h
    jr nz, jr_007_5572

    ld l, a
    ld l, a
    ld l, e
    jr nz, jr_007_557c

    ld l, a
    ld [hl], l
    jr nz, jr_007_557a

    ld l, a
    ld a, [bc]
    ld l, h
    ld l, a
    ld l, [hl]
    ld h, a
    ccf
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
    ld d, h
    ld l, b
    ld h, c
    ld l, [hl]
    ld l, e
    ld [hl], e
    jr nz, jr_007_5587

    ld l, [hl]
    ld a, c
    ld [hl], a
    ld h, c
    ld a, c
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, c

jr_007_5535:
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
    ld e, $ff
    ei

jr_007_5546:
    dec c
    rst $38
    ei
    nop
    ld d, l
    xor a
    ld [bc], a
    ld b, b

jr_007_554e:
    nop
    ld [hl], l
    ld [hl], l
    ld [hl], d
    ld h, a
    ld l, b
    ld l, b
    ld l, $2e
    ld l, $2e
    ld l, $2e
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
    ld [hl], e
    ld [hl], h
    ld l, a

jr_007_5572:
    ld l, l
    ld h, c
    ld h, e
    ld l, b
    ld l, $2e
    ld l, $2e

jr_007_557a:
    ld l, $2e

jr_007_557c:
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop

jr_007_5587:
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld [hl], b
    ld h, c
    ld l, c
    ld l, [hl]
    ld l, $2e
    ld l, $2e
    ld l, $2e
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
    ld bc, $0014
    ld [bc], a
    rst $38
    db $fc
    inc d
    inc bc
    add b
    rst $38
    db $fd
    inc d
    ld [$ff80], sp
    cp $14
    nop
    ld bc, $ffff
    jr nc, @+$01

    db $fc
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    dec c
    nop
    nop
    nop
    dec h
    ld [de], a
    inc b
    ld b, b
    nop
    ld d, b
    ld l, a
    ld l, a
    ld [hl], d
    jr nz, jr_007_5628

    ld d, h
    ld l, $2e
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
    ld bc, $0040
    ld c, a
    ld l, b
    jr nz, jr_007_5671

    ld h, l
    ld l, h
    ld l, h
    inc l
    jr nz, jr_007_5649

    jr nz, jr_007_5669

    ld h, l
    ld [hl], h
    jr nz, jr_007_566e

    ld l, c
    ld [hl], e
    ld a, [bc]
    ld [hl], e
    ld [hl], h
    ld [hl], l
    ld h, [hl]
    ld h, [hl]
    ld hl, $4700
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
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_5687

    ld h, c
    ld l, [hl]
    jr nz, @+$6a

jr_007_5628:
    ld h, c
    db $76
    ld h, l
    jr nz, jr_007_5695

    ld l, c
    ld [hl], e
    ld a, [bc]
    ld l, h
    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    jr nz, @+$69

    ld [hl], l
    ld l, [hl]
    jr nz, jr_007_56af

    ld l, b
    ld l, a
    ld [hl], l
    ld h, a
    ld l, b
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop

jr_007_5649:
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
    ld d, [hl]
    ld h, d
    nop
    ld [$0000], sp
    ld bc, $5609
    rst $18
    inc d
    nop
    add hl, bc
    nop
    nop
    inc d
    nop

jr_007_5669:
    dec b
    rst $38
    db $fc
    inc d
    nop

jr_007_566e:
    ld [$fdff], sp

jr_007_5671:
    ld [hl], l
    rst $38
    db $fc
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_56e2

    ld l, a
    ld [hl], h
    jr nz, jr_007_56f3

    ld l, b
    ld h, l
    ld a, [bc]
    ld c, h
    ld l, c
    ld h, a
    ld l, b
    ld [hl], h

jr_007_5687:
    jr nz, jr_007_56d0

    ld [hl], l
    ld l, [hl]
    ld hl, $4700
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, l

jr_007_5695:
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
    ld [hl], h
    daa
    ld [hl], e
    jr nz, jr_007_5719

    ld l, a
    jr nz, jr_007_5720

    ld h, l
    ld l, h
    ld l, h
    jr nz, @+$6f

    ld h, c

jr_007_56af:
    ld h, h
    ld h, l
    inc l
    ld a, [bc]
    ld l, c
    ld [hl], h
    jr nz, jr_007_5718

    ld l, h
    ld l, l
    ld l, a
    ld [hl], e
    ld [hl], h
    jr nz, jr_007_572a

    ld l, a
    ld l, a
    ld l, e
    ld [hl], e
    ld a, [bc]
    ld [hl], d
    ld h, l
    ld h, c
    ld l, h
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405

jr_007_56d0:
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
    ld bc, $2500
    ld [de], a

jr_007_56e2:
    inc b
    ld a, [de]
    nop
    ld d, [hl]
    rst $28
    nop
    ld [bc], a
    nop
    nop
    ld [bc], a
    add hl, bc
    ld d, a
    ld h, h
    ld b, b
    nop
    ld b, c
    ld l, h

jr_007_56f3:
    ld l, h
    jr nz, jr_007_576a

    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_007_5762

    ld [hl], d
    ld h, l
    ld h, c
    ld [hl], e
    ld a, c
    ld a, [bc]
    ld h, [hl]
    ld l, a
    ld l, a
    ld h, h
    jr nz, jr_007_5770

    ld [hl], e
    jr nz, jr_007_576e

    ld l, a
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]
    ld l, [hl]
    ld l, a
    ld [hl], h
    ld l, b
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_007_577e

jr_007_5718:
    ld l, a

jr_007_5719:
    ld [hl], d
    jr nz, jr_007_5789

    ld a, c
    ld a, [bc]
    ld l, b
    ld h, c

jr_007_5720:
    ld l, c
    ld [hl], d
    ld hl, $4700
    inc bc
    ld bc, $1406
    nop

jr_007_572a:
    nop
    ld b, l
    rst $38
    inc c
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld c, c
    jr nz, jr_007_57a8

    ld h, l
    ld h, l
    ld h, h
    jr nz, jr_007_57b3

    ld l, a
    jr nz, @+$75

    ld l, a
    ld [hl], d
    ld [hl], h
    ld a, [bc]
    ld l, c
    ld [hl], h
    jr nz, jr_007_57b9

    ld [hl], l
    ld [hl], h
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1406
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

jr_007_5762:
    inc bc
    ld bc, $001a
    ld d, a
    ld [hl], b
    nop
    inc bc

jr_007_576a:
    nop
    nop
    dec b
    add hl, bc

jr_007_576e:
    ld d, a
    push hl

jr_007_5770:
    ld b, b
    nop
    ld c, [hl]
    ld l, a
    ld [hl], a
    jr nz, jr_007_57c0

    jr nz, jr_007_57dc

    ld h, c
    ld l, [hl]
    jr nz, @+$63

    ld l, h

jr_007_577e:
    ld [hl], a
    ld h, c
    ld a, c
    ld [hl], e
    ld a, [bc]
    ld l, h
    ld l, a
    ld l, a
    ld l, e
    jr nz, jr_007_57f6

jr_007_5789:
    ld a, c
    jr nz, @+$64

    ld h, l
    ld [hl], e
    ld [hl], h
    jr nz, jr_007_5808

    ld l, b
    ld h, l
    ld l, [hl]
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

jr_007_57a8:
    ld c, c
    daa
    ld l, l
    jr nz, jr_007_5813

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    ld l, c
    ld l, [hl]

jr_007_57b3:
    ld h, a
    jr nz, @+$76

    ld l, b
    ld l, a
    ld [hl], e

jr_007_57b9:
    ld h, l
    ld a, [bc]
    ld h, e
    ld [hl], d
    ld h, l
    ld h, l
    ld [hl], b

jr_007_57c0:
    ld a, c
    jr nz, jr_007_5836

    ld [hl], b
    ld h, c
    ld h, e
    ld h, l
    ld a, [bc]
    ld [hl], b
    ld l, c
    ld [hl], d
    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], e
    ld hl, $4700
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h

jr_007_57dc:
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld d, a
    pop af
    nop
    ld [bc], a
    nop
    nop
    ld bc, $5809
    jp hl


    ld b, b
    nop
    ld b, e
    ld h, c
    ld l, [hl]

jr_007_57f6:
    jr nz, @+$4b

    jr nz, jr_007_586e

    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_007_5873

    ld l, b
    ld l, a
    ld [hl], e
    ld h, l
    ld a, [bc]
    ld l, b
    ld h, c
    ld l, c
    ld [hl], d

jr_007_5808:
    jr nz, jr_007_587a

    ld [hl], d
    ld l, a
    ld h, h
    ld [hl], l
    ld h, e
    ld [hl], h
    ld [hl], e
    ccf
    nop

jr_007_5813:
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
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_588e

    ld h, c
    ld l, [hl]
    jr nz, jr_007_5897

    ld h, c
    db $76
    ld h, l
    jr nz, @+$76

    ld l, b
    ld l, c

jr_007_5836:
    ld [hl], e
    ld a, [bc]
    ld h, [hl]
    ld [hl], d
    ld h, l
    ld h, l
    jr nz, jr_007_58b2

    ld l, a
    ld a, c
    jr nz, jr_007_588b

    jr nz, jr_007_58ab

    ld l, a
    ld [hl], h
    jr nz, jr_007_58bf

    ld l, c
    ld [hl], h
    ld l, b
    ld a, [bc]
    ld l, l
    ld a, c
    jr nz, jr_007_5898

    ld h, c
    ld [hl], b
    ld [hl], b
    ld a, c
    jr nz, @+$4f

    ld h, l
    ld h, c
    ld l, h
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

jr_007_586e:
    ld b, h
    inc bc
    ld bc, $0014

jr_007_5873:
    inc bc
    nop
    nop
    inc d
    nop
    inc b
    rst $38

jr_007_587a:
    db $fc
    inc d
    nop
    inc bc
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
    jr nz, @+$69

    ld l, a

jr_007_588b:
    ld [hl], h
    jr nz, jr_007_5902

jr_007_588e:
    ld l, b
    ld h, l
    jr nz, jr_007_58e6

    ld l, c
    ld l, [hl]
    ld a, c
    ld a, [bc]
    ld b, l

jr_007_5897:
    ld a, b

jr_007_5898:
    ld [hl], h
    ld [hl], d
    ld h, l
    ld l, l
    ld h, l
    jr nz, jr_007_58e8

    ld [hl], d
    ld l, a
    ld l, [hl]
    ld hl, $4700
    inc bc
    ld bc, $1404
    nop
    nop

jr_007_58ab:
    ld b, l
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop

jr_007_58b2:
    ld b, h
    rlca
    ld bc, $0040
    ld d, a
    ld h, c
    ld [hl], d
    ld l, [hl]
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [hl-]

jr_007_58bf:
    jr nz, jr_007_5905

    ld h, l
    ld h, c
    ld h, h
    ld l, h
    ld a, c
    ld a, [bc]
    ld l, c
    ld h, [hl]
    jr nz, jr_007_593e

    ld [hl], a
    ld h, c
    ld l, h
    ld l, h
    ld l, a
    ld [hl], a
    ld h, l
    ld h, h
    ld hl, $4700
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

jr_007_58e6:
    ld b, h
    inc bc

jr_007_58e8:
    ld bc, $0000
    ld bc, $0302
    nop
    ld bc, $0302
    nop
    ld bc, $0302
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc

jr_007_5902:
    ld [$0a09], sp

jr_007_5905:
    dec bc
    ld [$0a09], sp
    dec bc
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
    jr jr_007_5935

    rla
    ld a, [de]
    db $10
    ld de, $1312
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_007_5931

    ld hl, $2322
    inc h
    dec h
    ld h, $27
    dec h

jr_007_5931:
    jr z, jr_007_5952

    jr nz, jr_007_593d

jr_007_5935:
    ld hl, $2a29
    dec hl
    inc l
    ld [de], a
    inc de
    inc d

jr_007_593d:
    dec d

jr_007_593e:
    dec l
    ld l, $24
    dec h
    dec h
    dec h
    dec h
    jr z, jr_007_5976

    jr nc, jr_007_595d

    dec d
    ld sp, $3332
    inc [hl]
    ld [$2221], sp
    inc hl

jr_007_5952:
    dec [hl]
    ld [hl], $37
    jr c, jr_007_598f

    jr c, jr_007_5991

    add hl, sp
    ld a, [hl-]
    dec sp
    ld [hl+], a

jr_007_595d:
    inc hl
    inc a
    dec h
    dec h
    dec a
    inc d
    dec d
    dec l
    ld l, $2d
    ld l, $3e
    ccf
    ld b, b
    ld b, c
    ld a, $3f
    ld [bc], a
    inc bc
    nop
    ld bc, $2542
    dec h
    ld b, e

jr_007_5976:
    ld [hl+], a
    inc hl
    dec [hl]
    ld [hl], $35
    ld [hl], $44
    ld b, l
    ld b, [hl]
    ld b, a
    ld b, h
    ld b, l
    ld a, [bc]
    dec bc
    ld [$4809], sp
    ld c, c
    ld c, d
    ld c, e
    dec l
    ld l, $4c
    ld c, l
    dec l

jr_007_598f:
    ld l, $4e

jr_007_5991:
    ld c, a
    ld c, a
    ld c, a
    ld c, a
    ld d, b
    cpl
    jr nc, jr_007_59ad

    dec d
    ld d, c
    ld d, d
    ld d, e
    ld d, h
    dec [hl]
    ld [hl], $55
    ld d, [hl]
    dec [hl]
    ld [hl], $57
    dec h
    ld e, b
    dec h
    ld e, b
    ld e, c
    ld a, [hl-]
    dec sp
    ld [hl+], a

jr_007_59ad:
    inc hl
    ld e, d
    ld e, e
    ld e, h
    ld e, l
    dec l
    ld l, $5e
    ld e, a
    dec l
    ld l, $57
    ld h, b
    dec h
    ld h, b
    dec h
    ld h, b
    ld c, a
    ld c, a
    ld h, c
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ld h, l
    dec [hl]
    ld [hl], $66
    ld h, a
    dec [hl]
    ld [hl], $57
    dec h
    ld e, b
    dec h
    ld e, b
    dec h
    ld e, b
    dec h
    ld h, c
    ld h, c
    ld l, b
    ld l, c
    ld l, d
    ld l, e
    ld l, h
    ld l, l
    dec l
    ld l, $2d
    ld l, $57
    ld h, b
    dec h
    ld h, b
    ld c, h
    ld c, l
    dec h
    ld h, b
    dec h
    ld h, b
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    dec [hl]
    ld [hl], $35
    ld [hl], $57
    dec h
    ld e, b
    dec h
    ld d, l
    ld d, [hl]
    ld e, b
    dec h
    ld e, b
    dec h
    ld [hl], h
    ld [hl], l
    db $76
    ld [hl], a
    ld c, h
    ld c, l
    ld c, a
    ld c, a
    ld c, a
    ld c, a
    ld c, h
    ld c, l
    dec h
    ld h, b
    ld e, [hl]
    ld e, a
    dec h
    ld h, b
    ld c, h
    ld c, l
    ld a, b
    ld a, c
    ld a, d
    ld a, e
    ld d, l
    ld d, [hl]
    ld e, b
    dec h
    ld e, b
    dec h
    ld d, l
    ld d, [hl]
    ld e, b
    dec h
    ld h, [hl]
    ld h, a
    ld e, b
    dec h
    ld d, l
    ld d, [hl]
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    dec h
    ld h, b
    ld c, h
    ld c, l
    ld l, h
    ld l, l
    dec h
    ld h, b
    ld l, h
    ld l, l
    ld l, h
    ld l, l
    ld l, h
    ld l, l
    or h
    or l
    or [hl]
    or a
    cp b
    cp c
    ld e, b
    dec h
    ld d, l
    ld d, [hl]
    ld [hl], d
    ld [hl], e
    ld e, b
    dec h
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], e
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp a
    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld e, d
    ld h, c
    nop
    inc b
    nop
    nop
    dec b
    add hl, bc
    ld e, d
    ld l, c
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    inc b
    rst $38
    db $fc
    ccf
    ld [$ff00], sp
    db $fc
    ld a, [de]
    nop
    ld e, d
    ld a, a
    nop
    dec bc
    nop
    nop
    dec b
    add hl, bc
    ld e, d
    add a
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld e, d
    and b
    nop
    nop
    nop
    nop
    ld bc, $5a09
    xor l
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
    ld a, [de]
    nop
    ld e, d
    cp c
    nop
    ld bc, $0000
    ld bc, $5a09
    add $14
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld e, d
    jp nc, Jump_000_0200

    nop
    nop
    ld bc, $5a09
    rst $18
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
    ld a, [de]
    nop
    ld e, d
    db $eb
    nop
    inc bc
    nop
    nop
    ld bc, $5a09
    ld hl, sp+$14
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
    ld a, [de]
    nop
    ld e, e
    inc b
    nop
    inc b
    nop
    nop
    ld bc, $5b09
    ld de, $0014
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
    ld a, [de]
    nop
    ld e, e
    dec e
    nop
    dec b
    nop
    nop
    ld bc, $5b09
    ld a, [hl+]
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
    ld a, [de]
    nop
    ld e, e
    ld [hl], $00
    ld b, $00
    nop
    ld bc, $5b09
    ld b, e
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
    ld a, [de]
    nop
    ld e, e
    ld c, a
    nop
    rlca
    nop
    nop
    ld bc, $5b09
    ld e, h
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
    ld a, [de]
    nop
    ld e, e
    ld l, b
    nop
    ld [$0000], sp
    ld bc, $5b09
    ld [hl], l
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
    ld a, [de]
    nop
    ld e, e
    add c
    nop
    add hl, bc
    nop
    nop
    ld bc, $5b09
    adc [hl]
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
    ld a, [de]
    nop
    ld e, e
    sbc d
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $5b09
    and a
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
    ld a, [de]
    nop
    ld e, e
    or e
    nop
    dec bc
    nop
    nop
    ld bc, $5b09
    ret nz

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
    ld a, [de]
    nop
    ld e, e
    call z, $0c00
    nop
    nop
    ld bc, $5b09
    reti


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
    ld a, [de]
    nop
    ld e, e
    push hl
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld e, e
    ld a, [c]
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    add hl, bc
    ld c, $6f
    ld a, [bc]
    sbc e
    ld b, l
    add hl, bc
    db $fc
    ld [hl], e
    add hl, bc
    xor c
    ld [hl], d
    ld [$7d29], sp
    dec h
    ld [de], a
    inc b
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld e, h
    jr nc, jr_007_5c29

jr_007_5c29:
    nop
    nop
    nop
    ld bc, $5c09
    dec a
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
    ld a, [de]
    nop
    ld e, h
    ld c, c
    nop
    ld bc, $0000
    ld bc, $5c09
    ld d, [hl]
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
    ld a, [de]
    nop
    ld e, h
    ld h, d
    nop
    ld [bc], a
    nop
    nop
    ld bc, $5c09
    ld l, a
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
    ld a, [de]
    nop
    ld e, h
    ld a, e
    nop
    inc bc
    nop
    nop
    ld bc, $5c09
    adc b
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
    ld a, [de]
    nop
    ld e, h
    sub h
    nop
    inc b
    nop
    nop
    ld bc, $5c09
    and c
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
    ld a, [de]
    nop
    ld e, h
    xor l
    nop
    dec b
    nop
    nop
    ld bc, $5c09
    cp d
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
    ld a, [de]
    nop
    ld e, h
    add $00
    ld b, $00
    nop
    ld bc, $5c09
    db $d3
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
    ld a, [de]
    nop
    ld e, h
    rst $18
    nop
    rlca
    nop
    nop
    ld bc, $5c09
    db $ec
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
    ld a, [de]
    nop
    ld e, h
    ld hl, sp+$00
    ld [$0000], sp
    ld bc, $5d09
    dec b
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
    ld a, [de]
    nop
    ld e, l
    ld de, $0900
    nop
    nop
    ld bc, $5d09
    ld e, $14
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
    ld a, [de]
    nop
    ld e, l
    ld a, [hl+]
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $5d09
    scf
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
    ld a, [de]
    nop
    ld e, l
    ld b, e
    nop
    dec bc
    nop
    nop
    ld bc, $5d09
    ld d, b
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
    ld a, [de]
    nop
    ld e, l
    ld e, h
    nop
    inc c
    nop
    nop
    ld bc, $5d09
    ld l, c
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
    ld a, [de]
    nop
    ld e, l
    ld [hl], l
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld e, l
    add d
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld e, l
    or c
    nop
    nop
    nop
    nop
    ld bc, $5d09
    cp [hl]
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
    ld a, [de]
    nop
    ld e, l
    jp z, Boot

    nop
    nop
    ld bc, $5d09
    rst $10
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
    ld a, [de]
    nop
    ld e, l
    db $e3
    nop
    ld [bc], a
    nop
    nop
    ld bc, $5d09
    ldh a, [rNR14]
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
    ld a, [de]
    nop
    ld e, l
    db $fc
    nop
    inc bc
    nop
    nop
    ld bc, $5e09
    add hl, bc
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
    ld a, [de]
    nop
    ld e, [hl]
    dec d
    nop
    inc b
    nop
    nop
    ld bc, $5e09
    ld [hl+], a
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
    ld a, [de]
    nop
    ld e, [hl]
    ld l, $00
    dec b
    nop
    nop
    ld bc, $5e09
    dec sp
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
    ld a, [de]
    nop
    ld e, [hl]
    ld b, a
    nop
    ld b, $00
    nop
    ld bc, $5e09
    ld d, h
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
    ld a, [de]
    nop
    ld e, [hl]
    ld h, b
    nop
    rlca
    nop
    nop
    ld bc, $5e09
    ld l, l
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
    ld a, [de]
    nop
    ld e, [hl]
    ld a, c
    nop
    ld [$0000], sp
    ld bc, $5e09
    add [hl]
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
    ld a, [de]
    nop
    ld e, [hl]
    sub d
    nop
    add hl, bc
    nop
    nop
    ld bc, $5e09
    sbc a
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
    ld a, [de]
    nop
    ld e, [hl]
    xor e
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $5e09
    cp b
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
    ld a, [de]
    nop
    ld e, [hl]
    call nz, Call_000_0b00
    nop
    nop
    ld bc, $5e09
    pop de
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
    ld a, [de]
    nop
    ld e, [hl]
    db $dd
    nop
    inc c
    nop
    nop
    ld bc, $5e09
    ld [$0014], a
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
    ld a, [de]
    nop
    ld e, [hl]
    or $00
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld e, a
    inc bc
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld e, a
    ld [hl-], a
    nop
    nop
    nop
    nop
    ld bc, $5f09
    ccf
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
    ld a, [de]
    nop
    ld e, a
    ld c, e
    nop
    ld bc, $0000
    ld bc, $5f09
    ld e, b
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
    ld a, [de]
    nop
    ld e, a
    ld h, h
    nop
    ld [bc], a
    nop
    nop
    ld bc, $5f09
    ld [hl], c
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
    ld a, [de]
    nop
    ld e, a
    ld a, l
    nop
    inc bc
    nop
    nop
    ld bc, $5f09
    adc d
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
    ld a, [de]
    nop
    ld e, a
    sub [hl]
    nop
    inc b
    nop
    nop
    ld bc, $5f09
    and e
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
    ld a, [de]
    nop
    ld e, a
    xor a
    nop
    dec b
    nop
    nop
    ld bc, $5f09
    cp h
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
    ld a, [de]
    nop
    ld e, a
    ret z

    nop
    ld b, $00
    nop
    ld bc, $5f09
    push de
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
    ld a, [de]
    nop
    ld e, a
    pop hl
    nop
    rlca
    nop
    nop
    ld bc, $5f09
    xor $14
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
    ld a, [de]
    nop
    ld e, a
    ld a, [$0800]
    nop
    nop
    ld bc, $6009
    rlca
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
    ld a, [de]
    nop
    ld h, b
    inc de
    nop
    add hl, bc
    nop
    nop
    ld bc, $6009
    jr nz, jr_007_6028

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
    ld a, [de]
    nop
    ld h, b
    inc l
    nop
    ld a, [bc]
    nop
    nop

jr_007_6028:
    ld bc, $6009
    add hl, sp
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
    ld a, [de]
    nop
    ld h, b
    ld b, l
    nop
    dec bc
    nop
    nop
    ld bc, $6009
    ld d, d
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
    ld a, [de]
    nop
    ld h, b
    ld e, [hl]
    nop
    inc c
    nop
    nop
    ld bc, $6009
    ld l, e
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
    ld a, [de]
    nop
    ld h, b
    ld [hl], a
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld h, b
    add h
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, b
    or e
    nop
    nop
    nop
    nop
    ld bc, $6009
    ret nz

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
    ld a, [de]
    nop
    ld h, b
    call z, Boot
    nop
    nop
    ld bc, $6009
    reti


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
    ld a, [de]
    nop
    ld h, b
    push hl
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6009
    ld a, [c]
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
    ld a, [de]
    nop
    ld h, b
    cp $00
    inc bc
    nop
    nop
    ld bc, $6109
    dec bc
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
    ld a, [de]
    nop
    ld h, c
    rla
    nop
    inc b
    nop
    nop
    ld bc, $6109
    inc h
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
    ld a, [de]
    nop
    ld h, c
    jr nc, jr_007_6129

jr_007_6129:
    dec b
    nop
    nop
    ld bc, $6109
    dec a
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
    ld a, [de]
    nop
    ld h, c
    ld c, c
    nop
    ld b, $00
    nop
    ld bc, $6109
    ld d, [hl]
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
    ld a, [de]
    nop
    ld h, c
    ld h, d
    nop
    rlca
    nop
    nop
    ld bc, $6109
    ld l, a
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
    ld a, [de]
    nop
    ld h, c
    ld a, e
    nop
    ld [$0000], sp
    ld bc, $6109
    adc b
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
    ld a, [de]
    nop
    ld h, c
    sub h
    nop
    add hl, bc
    nop
    nop
    ld bc, $6109
    and c
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
    ld a, [de]
    nop
    ld h, c
    xor l
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $6109
    cp d
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
    ld a, [de]
    nop
    ld h, c
    add $00
    dec bc
    nop
    nop
    ld bc, $6109
    db $d3
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
    ld a, [de]
    nop
    ld h, c
    rst $18
    nop
    inc c
    nop
    nop
    ld bc, $6109
    db $ec
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
    ld a, [de]
    nop
    ld h, c
    ld hl, sp+$00
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld h, d
    dec b
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, d
    inc [hl]
    nop
    nop
    nop
    nop
    ld bc, $6209
    ld b, c
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
    ld a, [de]
    nop
    ld h, d
    ld c, l
    nop
    ld bc, $0000
    ld bc, $6209
    ld e, d
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, d
    ld h, [hl]
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6209
    ld [hl], e
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
    ld a, [de]
    nop
    ld h, d
    ld a, a
    nop
    inc bc
    nop
    nop
    ld bc, $6209
    adc h
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
    ld a, [de]
    nop
    ld h, d
    sbc b
    nop
    inc b
    nop
    nop
    ld bc, $6209
    and l
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
    ld a, [de]
    nop
    ld h, d
    or c
    nop
    dec b
    nop
    nop
    ld bc, $6209
    cp [hl]
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
    ld a, [de]
    nop
    ld h, d
    jp z, Jump_000_0600

    nop
    nop
    ld bc, $6209
    rst $10
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
    ld a, [de]
    nop
    ld h, d
    db $e3
    nop
    rlca
    nop
    nop
    ld bc, $6209
    ldh a, [rNR14]
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
    ld a, [de]
    nop
    ld h, d
    db $fc
    nop
    ld [$0000], sp
    ld bc, $6309
    add hl, bc
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
    ld a, [de]
    nop
    ld h, e
    dec d
    nop
    add hl, bc
    nop
    nop
    ld bc, $6309
    ld [hl+], a
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
    ld a, [de]
    nop
    ld h, e
    ld l, $00
    ld a, [bc]
    nop
    nop
    ld bc, $6309
    dec sp
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
    ld a, [de]
    nop
    ld h, e
    ld b, a
    nop
    dec bc
    nop
    nop
    ld bc, $6309
    ld d, h
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
    ld a, [de]
    nop
    ld h, e
    ld h, b
    nop
    inc c
    nop
    nop
    ld bc, $6309
    ld l, l
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
    ld a, [de]
    nop
    ld h, e
    ld a, c
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld h, e
    add [hl]
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    ld bc, $fcff
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, e
    or l
    nop
    nop
    nop
    nop
    ld bc, $6309
    jp nz, $0014

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
    ld a, [de]
    nop
    ld h, e
    adc $00
    ld bc, $0000
    ld bc, $6309
    db $db
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
    ld a, [de]
    nop
    ld h, e
    rst $20
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6309
    db $f4
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
    ld a, [de]
    nop
    ld h, h
    nop
    nop
    inc bc
    nop
    nop
    ld bc, $6409
    dec c
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
    ld a, [de]
    nop
    ld h, h
    add hl, de
    nop
    inc b
    nop
    nop
    ld bc, $6409
    ld h, $14
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
    ld a, [de]
    nop
    ld h, h
    ld [hl-], a
    nop
    dec b
    nop
    nop
    ld bc, $6409
    ccf
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
    ld a, [de]
    nop
    ld h, h
    ld c, e
    nop
    ld b, $00
    nop
    ld bc, $6409
    ld e, b
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
    ld a, [de]
    nop
    ld h, h
    ld h, h
    nop
    rlca
    nop
    nop
    ld bc, $6409
    ld [hl], c
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
    ld a, [de]
    nop
    ld h, h
    ld a, l
    nop
    ld [$0000], sp
    ld bc, $6409
    adc d
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
    ld a, [de]
    nop
    ld h, h
    sub [hl]
    nop
    add hl, bc
    nop
    nop
    ld bc, $6409
    and e
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
    ld a, [de]
    nop
    ld h, h
    xor a
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $6409
    cp h
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
    ld a, [de]
    nop
    ld h, h
    ret z

    nop
    dec bc
    nop
    nop
    ld bc, $6409
    push de
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
    ld a, [de]
    nop
    ld h, h
    pop hl
    nop
    inc c
    nop
    nop
    ld bc, $6409
    xor $14
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
    ld a, [de]
    nop
    ld h, h
    ld a, [$0d00]
    nop
    nop
    dec b
    add hl, bc
    ld h, l
    rlca
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld h, l
    add hl, hl
    nop
    ld [$0000], sp
    dec b
    add hl, bc
    ld h, l
    ld b, l
    inc d
    nop
    ld bc, $fcff
    inc d
    ld bc, $ff00
    db $fd
    inc d
    dec b
    add b
    rst $38
    cp $35
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fcff
    add h
    nop
    inc bc
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, l
    ld d, c
    nop
    dec b
    nop
    nop
    ld [bc], a
    add hl, bc
    ld h, l
    ld e, c
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, l
    ld h, l
    nop
    ld [$0000], sp
    dec b
    add hl, bc
    ld h, l
    ld l, l
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, l
    add [hl]
    nop
    nop
    nop
    nop
    ld bc, $6509
    sub e
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
    ld a, [de]
    nop
    ld h, l
    sbc a
    nop
    ld bc, $0000
    ld bc, $6509
    xor h
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
    ld a, [de]
    nop
    ld h, l
    cp b
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6509
    push bc
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
    ld a, [de]
    nop
    ld h, l
    pop de
    nop
    inc bc
    nop
    nop
    ld bc, $6509
    sbc $14
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
    ld a, [de]
    nop
    ld h, l
    ld [$0400], a
    nop
    nop
    ld bc, $6509
    rst $30
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
    ld a, [de]
    nop
    ld h, [hl]
    inc bc
    nop
    dec b
    nop
    nop
    ld bc, $6609
    db $10
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
    ld a, [de]
    nop
    ld h, [hl]
    inc e
    nop
    ld b, $00
    nop
    ld bc, $6609
    add hl, hl
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
    ld a, [de]
    nop
    ld h, [hl]
    dec [hl]
    nop
    rlca
    nop
    nop
    ld bc, $6609
    ld b, d
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
    ld a, [de]
    nop
    ld h, [hl]
    ld c, [hl]
    nop
    ld [$0000], sp
    ld bc, $6609
    ld e, e
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
    ld a, [de]
    nop
    ld h, [hl]
    ld h, a
    nop
    add hl, bc
    nop
    nop
    ld bc, $6609
    ld [hl], h
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
    ld a, [de]
    nop
    ld h, [hl]
    add b
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $6609
    adc l
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
    ld a, [de]
    nop
    ld h, [hl]
    sbc c
    nop
    dec bc
    nop
    nop
    ld bc, $6609
    and [hl]
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
    ld a, [de]
    nop
    ld h, [hl]
    or d
    nop
    inc c
    nop
    nop
    ld bc, $6609
    cp a
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
    ld a, [de]
    nop
    ld h, [hl]
    rlc b
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld h, [hl]
    ret c

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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld h, [hl]
    ld a, [$0100]
    nop
    nop
    ld [bc], a
    add hl, bc
    ld h, a
    ld [bc], a
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, a
    ld c, $00
    dec b
    nop
    nop
    dec b
    add hl, bc
    ld h, a
    ld d, $14
    nop
    inc b
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    dec b
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, a
    cpl
    nop
    nop
    nop
    nop
    ld bc, $6709
    inc a
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
    ld a, [de]
    nop
    ld h, a
    ld c, b
    nop
    ld bc, $0000
    ld bc, $6709
    ld d, l
    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, a
    ld h, c
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6709
    ld l, [hl]
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
    ld a, [de]
    nop
    ld h, a
    ld a, d
    nop
    inc bc
    nop
    nop
    ld bc, $6709
    add a
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
    ld a, [de]
    nop
    ld h, a
    sub e
    nop
    inc b
    nop
    nop
    ld bc, $6709
    and b
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
    ld a, [de]
    nop
    ld h, a
    xor h
    nop
    dec b
    nop
    nop
    ld bc, $6709
    cp c
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
    ld a, [de]
    nop
    ld h, a
    push bc
    nop
    ld b, $00
    nop
    ld bc, $6709
    jp nc, $0014

    ld b, $ff
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld h, a
    sbc $00
    rlca
    nop
    nop
    ld bc, $6709
    db $eb
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
    ld a, [de]
    nop
    ld h, a
    rst $30
    nop
    ld [$0000], sp
    ld bc, $6809
    inc b
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
    ld a, [de]
    nop
    ld l, b
    stop
    add hl, bc
    nop
    nop
    ld bc, $6809
    dec e
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
    ld a, [de]
    nop
    ld l, b
    add hl, hl
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $6809
    ld [hl], $14
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
    ld a, [de]
    nop
    ld l, b
    ld b, d
    nop
    dec bc
    nop
    nop
    ld bc, $6809
    ld c, a
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
    ld a, [de]
    nop
    ld l, b
    ld e, e
    nop
    inc c
    nop
    nop
    ld bc, $6809
    ld l, b
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
    ld a, [de]
    nop
    ld l, b
    ld [hl], h
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld l, b
    add c
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
    ld h, b
    nop
    ld a, a
    call z, Call_000_1403
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    ld bc, $fcff
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, b
    or l
    nop
    nop
    nop
    nop
    ld bc, $6809
    jp nz, $0014

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
    ld a, [de]
    nop
    ld l, b
    adc $00
    ld bc, $0000
    ld bc, $6809
    db $db
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
    ld a, [de]
    nop
    ld l, b
    rst $20
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6809
    db $f4
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
    ld a, [de]
    nop
    ld l, c
    nop
    nop
    inc bc
    nop
    nop
    ld bc, $6909
    dec c
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
    ld a, [de]
    nop
    ld l, c
    add hl, de
    nop
    inc b
    nop
    nop
    ld bc, $6909
    ld h, $14
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
    ld a, [de]
    nop
    ld l, c
    ld [hl-], a
    nop
    dec b
    nop
    nop
    ld bc, $6909
    ccf
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
    ld a, [de]
    nop
    ld l, c
    ld c, e
    nop
    ld b, $00
    nop
    ld bc, $6909
    ld e, b
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
    ld a, [de]
    nop
    ld l, c
    ld h, h
    nop
    rlca
    nop
    nop
    ld bc, $6909
    ld [hl], c
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
    ld a, [de]
    nop
    ld l, c
    ld a, l
    nop
    ld [$0000], sp
    ld bc, $6909
    adc d
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
    ld a, [de]
    nop
    ld l, c
    sub [hl]
    nop
    add hl, bc
    nop
    nop
    ld bc, $6909
    and e
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
    ld a, [de]
    nop
    ld l, c
    xor a
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $6909
    cp h
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
    ld a, [de]
    nop
    ld l, c
    ret z

    nop
    dec bc
    nop
    nop
    ld bc, $6909
    push de
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
    ld a, [de]
    nop
    ld l, c
    pop hl
    nop
    inc c
    nop
    nop
    ld bc, $6909
    xor $14
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
    ld a, [de]
    nop
    ld l, c
    ld a, [$0d00]
    nop
    nop
    dec b
    add hl, bc
    ld l, d
    rlca
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, d
    ld [hl], $00
    nop
    nop
    nop
    ld bc, $6a09
    ld b, e
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
    ld a, [de]
    nop
    ld l, d
    ld c, a
    nop
    ld bc, $0000
    ld bc, $6a09
    ld e, h
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, d
    ld l, b
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6a09
    ld [hl], l
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
    ld a, [de]
    nop
    ld l, d
    add c
    nop
    inc bc
    nop
    nop
    ld bc, $6a09
    adc [hl]
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
    ld a, [de]
    nop
    ld l, d
    sbc d
    nop
    inc b
    nop
    nop
    ld bc, $6a09
    and a
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
    ld a, [de]
    nop
    ld l, d
    or e
    nop
    dec b
    nop
    nop
    ld bc, $6a09
    ret nz

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
    ld a, [de]
    nop
    ld l, d
    call z, Call_000_0600
    nop
    nop
    ld bc, $6a09
    reti


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
    ld a, [de]
    nop
    ld l, d
    push hl
    nop
    rlca
    nop
    nop
    ld bc, $6a09
    ld a, [c]
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
    ld a, [de]
    nop
    ld l, d
    cp $00
    ld [$0000], sp
    ld bc, $6b09
    dec bc
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
    ld a, [de]
    nop
    ld l, e
    rla
    nop
    add hl, bc
    nop
    nop
    ld bc, $6b09
    inc h
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
    ld a, [de]
    nop
    ld l, e
    jr nc, jr_007_6b29

jr_007_6b29:
    ld a, [bc]
    nop
    nop
    ld bc, $6b09
    dec a
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
    ld a, [de]
    nop
    ld l, e
    ld c, c
    nop
    dec bc
    nop
    nop
    ld bc, $6b09
    ld d, [hl]
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
    ld a, [de]
    nop
    ld l, e
    ld h, d
    nop
    inc c
    nop
    nop
    ld bc, $6b09
    ld l, a
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
    ld a, [de]
    nop
    ld l, e
    ld a, e
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld l, e
    adc b
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    jr nz, jr_007_6b9d

jr_007_6b9d:
    rlca
    add b
    inc b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rrca
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
    nop
    nop
    add hl, bc
    di
    ld [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6bd1

jr_007_6bd1:
    ld [bc], a
    add b
    inc b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rrca
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
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    ld a, [bc]
    db $dd
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6c05

jr_007_6c05:
    ld [bc], a
    nop
    ld b, $00
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rst $38
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
    nop
    nop
    add hl, bc
    ld e, e
    ld l, h
    add hl, bc
    ld d, d
    ld c, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6c39

jr_007_6c39:
    dec b
    add b
    inc b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rra
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
    nop
    nop
    add hl, bc
    db $76
    ld [hl], d
    add hl, bc
    pop af
    ld c, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6c6d

jr_007_6c6d:
    ld b, $80
    ld b, $00
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rrca
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

jr_007_6c89:
    nop
    nop
    nop
    nop
    add hl, bc
    ld a, a
    ld [hl], h
    ld a, [bc]
    dec c
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
    jr nz, jr_007_6ca1

jr_007_6ca1:
    ld b, $00
    inc b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rrca
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

jr_007_6cbd:
    nop
    nop
    nop
    nop
    add hl, bc
    ld c, b
    halt
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6cd5

jr_007_6cd5:
    nop
    add b
    inc b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rrca
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
    nop
    nop
    add hl, bc
    di
    ld [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6c89

    ld [$0300], sp
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rst $38
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
    nop
    nop
    ld [$7d29], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_007_6cbd

    ld [$0500], sp
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    rst $38
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
    nop
    nop
    ld [$7d29], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec h
    ld [de], a
    dec b
    inc d
    nop
    ld bc, $fcff
    ccf
    ld [$ff00], sp
    db $fc
    inc d
    nop
    ld b, $ff
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fbff
    dec c
    rst $38
    ei
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    ld a, [de]
    nop
    ld l, l
    and d
    nop
    ld bc, $0000
    ld bc, $6d09
    ld [c], a
    ld a, [de]
    nop
    ld l, l
    or [hl]
    nop
    nop
    nop
    ld bc, $1401
    nop
    ld b, $ff
    db $fc
    inc sp
    rst $38
    db $fc
    add hl, bc
    ld l, l
    ld [c], a
    inc d
    nop
    ld b, $ff
    db $fc
    ld sp, $fcff
    inc d
    nop
    ld b, $ff
    db $fc
    inc d
    rlca
    add b
    rst $38
    db $fd
    inc d
    ld b, $00
    rst $38
    cp $14
    nop
    nop
    rst $38
    rst $38
    jr nc, @+$01

    db $fc
    inc d
    nop
    ld bc, $0100
    inc d
    nop
    ld b, $ff
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    rlca
    rst $38
    db $fc
    ccf
    ld [$ff00], sp
    db $fc
    inc d
    nop
    ld [$fcff], sp
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, [hl]
    dec b
    nop
    nop
    nop
    nop
    ld bc, $6e09
    ld [de], a
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
    ld a, [de]
    nop
    ld l, [hl]
    ld e, $00
    ld bc, $0000
    ld bc, $6e09
    dec hl
    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, [hl]
    scf
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6e09
    ld b, h
    inc d
    nop
    add hl, bc
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
    ld a, [de]
    nop
    ld l, [hl]
    ld d, b
    nop
    inc bc
    nop
    nop
    ld bc, $6e09
    ld e, l
    inc d
    nop
    add hl, bc
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
    ld a, [de]
    nop
    ld l, [hl]
    ld l, c
    nop
    inc b
    nop
    nop
    ld bc, $6e09
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
    ld a, [de]
    nop
    ld l, [hl]
    add d
    nop
    dec b
    nop
    nop
    ld bc, $6e09
    adc a
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
    ld a, [de]
    nop
    ld l, [hl]
    sbc e
    nop
    ld b, $00
    nop
    ld bc, $6e09
    xor b
    inc d
    nop
    add hl, bc
    rst $38
    db $fc
    inc d
    nop
    ld b, $ff
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, [hl]
    or h
    nop
    rlca
    nop
    nop
    ld bc, $6e09
    pop bc
    inc d
    nop
    add hl, bc
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
    ld a, [de]
    nop
    ld l, [hl]
    call Call_000_0800
    nop
    nop
    ld bc, $6e09
    jp c, $0014

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
    ld a, [de]
    nop
    ld l, [hl]
    and $00
    add hl, bc
    nop
    nop
    ld bc, $6e09
    di
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
    ld a, [de]
    nop
    ld l, [hl]
    rst $38
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $6f09
    inc c
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
    ld a, [de]
    nop
    ld l, a
    jr jr_007_6f11

jr_007_6f11:
    dec bc
    nop
    nop
    ld bc, $6f09
    dec h
    inc d
    nop
    add hl, bc
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
    ld a, [de]
    nop
    ld l, a
    ld sp, $0c00
    nop
    nop
    ld bc, $6f09
    ld a, $14
    nop
    add hl, bc
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
    ld a, [de]
    nop
    ld l, a
    ld c, d
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld l, a
    ld d, a
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
    nop
    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld l, a
    ld l, a
    nop
    ld bc, $0000
    dec b
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
    inc d
    nop
    inc b
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld l, a
    adc b
    nop
    nop
    nop
    nop
    ld bc, $6f09
    sub l
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
    ld a, [de]
    nop
    ld l, a
    and c
    nop
    ld bc, $0000
    ld bc, $6f09
    xor [hl]
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
    ld a, [de]
    nop
    ld l, a
    cp d
    nop
    ld [bc], a
    nop
    nop
    ld bc, $6f09
    rst $00
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
    ld a, [de]
    nop
    ld l, a
    db $d3
    nop
    inc bc
    nop
    nop
    ld bc, $6f09
    ldh [rNR14], a
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
    ld a, [de]
    nop
    ld l, a
    db $ec
    nop
    inc b
    nop
    nop
    ld bc, $6f09
    ld sp, hl
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
    ld a, [de]
    nop
    ld [hl], b
    dec b
    nop
    dec b
    nop
    nop
    ld bc, $7009
    ld [de], a
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
    ld a, [de]
    nop
    ld [hl], b
    ld e, $00
    ld b, $00
    nop
    ld bc, $7009
    dec hl
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
    ld a, [de]
    nop
    ld [hl], b
    scf
    nop
    rlca
    nop
    nop
    ld bc, $7009
    ld b, h
    inc d
    nop
    dec b
    rst $38
    db $fc

Call_007_703c:
    inc d
    nop
    rlca
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld [hl], b
    ld d, b
    nop
    ld [$0000], sp
    ld bc, $7009
    ld e, l
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
    ld a, [de]
    nop
    ld [hl], b
    ld l, c
    nop
    add hl, bc
    nop
    nop
    ld bc, $7009
    db $76
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
    ld a, [de]
    nop
    ld [hl], b
    add d
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $7009
    adc a
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
    ld a, [de]
    nop
    ld [hl], b
    sbc e
    nop
    dec bc
    nop
    nop
    ld bc, $7009
    xor b
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
    ld a, [de]
    nop
    ld [hl], b
    or h
    nop
    inc c
    nop
    nop
    ld bc, $7009
    pop bc
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
    ld a, [de]
    nop
    ld [hl], b
    call $0d00
    nop
    nop
    dec b
    add hl, bc
    ld [hl], b
    jp c, $0014

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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    ld a, [de]
    nop
    ld [hl], b
    db $fc
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld [hl], c
    inc b
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    inc bc
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld [hl], c
    dec e
    nop
    nop
    nop
    nop
    ld bc, $7109
    ld a, [hl+]
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
    ld a, [de]
    nop
    ld [hl], c
    ld [hl], $00
    ld bc, $0000
    ld bc, $7109
    ld b, e
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
    ld a, [de]
    nop
    ld [hl], c
    ld c, a
    nop
    ld [bc], a
    nop
    nop
    ld bc, $7109
    ld e, h
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
    ld a, [de]
    nop
    ld [hl], c
    ld l, b
    nop
    inc bc
    nop
    nop
    ld bc, $7109
    ld [hl], l
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
    ld a, [de]
    nop
    ld [hl], c
    add c
    nop
    inc b
    nop
    nop
    ld bc, $7109
    adc [hl]
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
    ld a, [de]
    nop
    ld [hl], c
    sbc d
    nop
    dec b
    nop
    nop
    ld bc, $7109
    and a
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
    ld a, [de]
    nop
    ld [hl], c
    or e
    nop
    ld b, $00
    nop
    ld bc, $7109
    ret nz

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
    ld a, [de]
    nop
    ld [hl], c
    call z, $0700
    nop
    nop
    ld bc, $7109
    reti


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
    ld a, [de]
    nop
    ld [hl], c
    push hl
    nop
    ld [$0000], sp
    ld bc, $7109
    ld a, [c]
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
    ld a, [de]
    nop
    ld [hl], c
    cp $00
    add hl, bc
    nop
    nop
    ld bc, $7209
    dec bc
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
    ld a, [de]
    nop
    ld [hl], d
    rla
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $7209
    inc h
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
    ld a, [de]
    nop
    ld [hl], d
    jr nc, jr_007_7229

jr_007_7229:
    dec bc
    nop
    nop
    ld bc, $7209
    dec a
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
    ld a, [de]
    nop
    ld [hl], d
    ld c, c
    nop
    inc c
    nop
    nop
    ld bc, $7209
    ld d, [hl]
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
    ld a, [de]
    nop
    ld [hl], d
    ld h, d
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld [hl], d
    ld l, a
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
    dec h
    ld [de], a
    inc b
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    inc c
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld [hl], d
    sbc [hl]
    nop
    nop
    nop
    nop
    ld bc, $7209
    xor e
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
    ld a, [de]
    nop
    ld [hl], d
    or a
    nop
    ld bc, $0000
    ld bc, $7209
    call nz, $0014
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    ld a, [de]
    nop
    ld [hl], d
    ret nc

    nop
    ld [bc], a
    nop
    nop
    ld bc, $7209
    db $dd
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
    ld a, [de]
    nop
    ld [hl], d
    jp hl


    nop
    inc bc
    nop
    nop
    ld bc, $7209
    or $14
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
    ld a, [de]
    nop
    ld [hl], e
    ld [bc], a
    nop
    inc b
    nop
    nop
    ld bc, $7309
    rrca
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
    ld a, [de]
    nop
    ld [hl], e
    dec de
    nop
    dec b
    nop
    nop
    ld bc, $7309
    jr z, jr_007_7330

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
    ld a, [de]
    nop
    ld [hl], e
    inc [hl]
    nop
    ld b, $00
    nop

jr_007_7330:
    ld bc, $7309
    ld b, c
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
    ld a, [de]
    nop
    ld [hl], e
    ld c, l
    nop
    rlca
    nop
    nop
    ld bc, $7309
    ld e, d
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
    ld a, [de]
    nop
    ld [hl], e
    ld h, [hl]
    nop
    ld [$0000], sp
    ld bc, $7309
    ld [hl], e
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
    ld a, [de]
    nop
    ld [hl], e
    ld a, a
    nop
    add hl, bc
    nop
    nop
    ld bc, $7309
    adc h
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
    ld a, [de]
    nop
    ld [hl], e
    sbc b
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $7309
    and l
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
    ld a, [de]
    nop
    ld [hl], e
    or c
    nop
    dec bc
    nop
    nop
    ld bc, $7309
    cp [hl]
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
    ld a, [de]
    nop
    ld [hl], e
    jp z, $0c00

    nop
    nop
    ld bc, $7309
    rst $10
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
    ld a, [de]
    nop
    ld [hl], e
    db $e3
    nop
    dec c
    nop
    nop
    dec b
    add hl, bc
    ld [hl], e
    ldh a, [rNR14]
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
    inc d
    nop
    ld bc, $fcff
    dec c
    rst $38
    db $fc
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c601
    dec c
    ld d, a
    inc bc
    nop
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
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_7548

    ld [hl], l
    ld h, a
    jr nz, jr_007_755d

    ld [hl], b
    ld a, [bc]
    ld [hl], h
    ld l, b
    ld h, l
    jr nz, jr_007_7556

    ld [hl], d
    ld h, c
    db $76
    ld h, l
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop

Call_007_74fc:
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
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_758d

    ld l, a
    ld [hl], h
    jr nz, jr_007_759e

    ld l, b
    ld h, l
    ld a, [bc]
    ld c, b
    ld [hl], l
    ld l, l
    ld h, c
    ld l, [hl]
    jr nz, jr_007_7577

    ld l, a
    ld [hl], d
    ld [hl], b
    ld [hl], e
    ld h, l
    ld hl, $4700
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
    ld d, h
    ld l, b
    ld h, l
    jr nz, jr_007_75c0

    ld h, l
    ld h, c
    ld [hl], h

jr_007_7556:
    ld a, c
    jr nz, jr_007_75bf

    ld l, h
    ld h, l
    ld [hl], e
    ld l, b

jr_007_755d:
    ld a, [bc]
    ld l, b
    ld h, c
    ld [hl], e
    ld l, [hl]
    daa
    ld [hl], h
    jr nz, jr_007_75ce

    ld h, c
    ld h, h
    jr nz, @+$76

    ld l, c
    ld l, l
    ld h, l
    ld a, [bc]
    ld [hl], h
    ld l, a
    jr nz, jr_007_75e4

    ld l, a
    ld [hl], h
    ld l, $00
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
    ld [de], a
    dec b
    ld a, [de]
    nop
    ld [hl], l
    sbc h
    nop
    ld a, [bc]
    nop
    nop
    ld [bc], a
    add hl, bc
    ld [hl], l
    db $dd
    ld b, b
    nop

jr_007_759e:
    ld d, h
    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_007_760b

    ld [hl], d
    ld h, c
    db $76
    ld h, l
    jr nz, jr_007_7616

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
    jr nz, jr_007_7617

    ld l, [hl]
    ld h, h
    ld a, [bc]
    ld h, l
    ld l, [hl]
    ld [hl], h
    ld l, c
    ld h, e
    ld l, c

jr_007_75bf:
    ld l, [hl]

jr_007_75c0:
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
    ld bc, $001a
    ld [hl], l
    jp hl


    nop
    ld a, [bc]
    nop

jr_007_75e4:
    nop
    ld bc, $7709
    jr jr_007_75fe

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
    ld [hl], a
    jr jr_007_75f8

jr_007_75f8:
    inc bc
    rst $38
    ei
    ld b, $14
    nop

jr_007_75fe:
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

jr_007_760b:
    nop
    ld bc, $fcff
    inc d
    nop
    nop
    rst $38
    db $fc
    inc d
    nop

jr_007_7616:
    ld [bc], a

jr_007_7617:
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
    inc bc
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
    db $76
    ld h, b
    nop
    ld a, [bc]
    nop
    nop
    ld bc, $7709
    dec d
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
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_007_76d3

    ld [hl], l
    ld h, a
    jr nz, jr_007_76e8

    ld [hl], b
    ld a, [bc]
    ld [hl], h
    ld l, b
    ld h, l
    jr nz, jr_007_76e1

    ld [hl], d
    ld h, c
    db $76
    ld h, l
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
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, @+$69

    ld l, a
    ld [hl], h
    jr nz, @+$76

    ld l, b
    ld h, l
    ld a, [bc]
    ld c, b
    ld [hl], l
    ld l, l
    ld h, c
    ld l, [hl]
    jr nz, jr_007_7702

    ld l, a
    ld [hl], d
    ld [hl], b
    ld [hl], e
    ld h, l
    ld hl, $4700
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

jr_007_76d3:
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld d, h
    ld l, b
    ld h, l
    jr nz, jr_007_774b

    ld h, l
    ld h, c
    ld [hl], h

jr_007_76e1:
    ld a, c
    jr nz, @+$68

    ld l, h
    ld h, l
    ld [hl], e
    ld l, b

jr_007_76e8:
    ld a, [bc]
    ld l, b
    ld h, c
    ld [hl], e
    ld l, [hl]
    daa
    ld [hl], h
    jr nz, jr_007_7759

    ld h, c
    ld h, h
    jr nz, @+$76

    ld l, c
    ld l, l
    ld h, l
    ld a, [bc]
    ld [hl], h
    ld l, a
    jr nz, jr_007_776f

    ld l, a
    ld [hl], h
    ld l, $00
    ld b, a

jr_007_7702:
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
    ld bc, $7709
    jr jr_007_7719

jr_007_7719:
    inc l
    nop
    add b
    add b
    ld h, b
    ldh [rNR41], a
    ldh [rLCDC], a
    ret nz

    add b
    add b
    ld [hl], b
    ldh a, [$08]
    ld hl, sp-$7c
    db $fc
    jp nz, $82fe

    cp $c1
    rst $38
    and c
    rst $38
    pop bc
    rst $38
    add d
    cp $0c
    db $fc
    ldh a, [$f0]
    ld bc, $0601
    rlca
    inc b
    rlca
    ld [bc], a
    inc bc
    ld bc, $0e01
    rrca
    db $10
    rra
    jr nz, jr_007_778a

jr_007_774b:
    ld b, c
    ld a, a
    ld b, d
    ld a, a
    add c
    rst $38
    add b
    rst $38
    add c
    rst $38
    ld b, b
    ld a, a
    jr nc, jr_007_7798

jr_007_7759:
    rrca
    rrca
    nop
    nop
    add b
    add b
    call z, $cc4c
    ld c, h
    sub d
    sbc [hl]
    ld e, $1e
    ld hl, $213f
    ccf
    ccf
    ld hl, $a1bf

jr_007_776f:
    and c
    cp a
    and c
    cp a
    and c
    cp a
    and c
    cp a
    ld hl, $1e3f
    ld e, $1c
    inc e
    rst $38
    db $e3
    rst $38
    ldh [$3f], a
    jr nz, @+$61

    ld d, c
    ld c, $0e
    ld e, $12
    ccf

jr_007_778a:
    ld hl, $213f
    ld a, a
    ld b, b
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ccf

jr_007_7798:
    ld hl, $1e1e
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_77a2:
    nop
    ldh [$e0], a
    ldh a, [$f0]
    db $10
    db $10
    ld hl, sp-$08
    inc b
    db $fc
    call nz, $e23c
    ld e, $e2
    ld e, $ff
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
    inc bc
    inc bc
    rlca
    rlca
    inc b
    inc b
    rrca
    rrca

jr_007_77cb:
    db $10
    rra

jr_007_77cd:
    dec l
    ld a, $4f
    ld a, h
    adc a
    ldh a, [rIE]
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    jr nc, @-$0e

    db $10
    ldh a, [rNR41]
    ldh [rLCDC], a
    ret nz

    ret nz

    ret nz

    ld b, b
    ret nz

    jr nz, jr_007_77cb

    jr nz, jr_007_77cd

    ldh [$e0], a
    ldh a, [$f0]
    jr nc, @-$0e

    db $10
    ldh a, [rNR10]
    ldh a, [$30]
    ldh a, [$e0]
    ldh [rP1], a
    nop
    jr c, jr_007_7837

    add $fe
    ld sp, $0fff
    pop af
    ld a, $c2
    ld a, h
    add h
    ret z

    jr c, jr_007_77a2

    ld a, [hl]
    ld sp, $2eff
    xor $a0
    ldh [$98], a
    ld hl, sp+$44
    ld a, h
    jr c, jr_007_7851

    nop
    nop
    nop

jr_007_781c:
    nop
    nop
    nop
    nop
    nop
    ld bc, $0601
    rlca
    ld [$100f], sp
    rra
    jr nz, jr_007_786a

    ld hl, $433e
    ld a, h
    ld c, a
    ld a, c
    ld a, a
    ld [hl], e
    adc h

jr_007_7834:
    db $f4
    cp h
    db $fc

jr_007_7837:
    add d
    cp $7c
    ld a, h
    nop
    nop
    nop
    nop
    add b
    add b
    ld h, b
    ldh [rNR23], a
    ld hl, sp-$1a
    cp $e1
    rst $38
    pop de
    rst $38
    daa
    rst $38
    rra
    ld sp, hl
    ld a, a
    pop hl

jr_007_7851:
    cp $86
    ld hl, sp+$18
    ldh [$60], a
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0601
    rlca
    add hl, de
    rra
    ld h, d
    ld a, a
    add c
    rst $38
    add c

jr_007_786a:
    rst $38
    ldh [rIE], a
    ld hl, sp-$61
    cp $87
    ld a, a

jr_007_7872:
    ld h, c
    rra
    add hl, de
    rlca
    rlca

jr_007_7877:
    ld bc, $0001
    nop
    jr nc, jr_007_78ad

    jr nc, jr_007_78af

    ld hl, sp-$08
    ld [$08f8], sp
    ld hl, sp-$08
    ld hl, sp+$10
    ldh a, [$d0]
    jr nc, jr_007_781c

    ld [hl], b
    db $10
    ldh a, [$d0]
    jr nc, jr_007_7872

    jr nz, jr_007_7834

    ld h, b
    jr nz, jr_007_7877

    jr nz, @-$1e

    ldh [$e0], a
    inc c
    inc c
    inc c
    inc c
    rra
    rra
    db $10
    rra
    db $10
    rra
    rra
    rra
    ld [$090f], sp
    ld c, $0b
    inc c

jr_007_78ad:
    dec bc
    inc c

jr_007_78af:
    dec bc
    inc c
    inc b
    rlca
    dec b
    ld b, $05
    ld b, $04
    rlca
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_007_78db

    ld a, $3e
    cp $ea
    cp $32
    db $fc
    inc b
    ld hl, sp+$18
    db $e4
    db $fc
    and h
    cp h
    ld h, d
    ld a, [hl]
    ld [de], a
    ld e, $0c
    inc c
    nop
    nop
    nop
    nop

jr_007_78db:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, e
    ld b, e
    ld a, a
    ld a, a
    ld c, e
    ld [hl], h
    ld a, a
    ld [hl], b
    ld [$070f], sp
    rlca
    rlca
    rlca
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_007_7915

    inc h
    inc a
    ld [hl+], a
    ld a, $11
    rra
    add hl, hl
    ccf
    ld d, [hl]
    db $76
    and b
    ldh [rLCDC], a
    ret nz

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

jr_007_7915:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0201
    inc bc
    dec [hl]
    scf
    ld a, d
    ld c, [hl]
    db $f4
    adc h
    cp $82
    cp $82
    db $fc
    add h
    ld a, b
    ld a, b
    nop
    nop
    nop
    nop
    ld hl, sp-$08
    inc b
    db $fc
    sub [hl]
    ld l, d
    ld b, $fa
    ld c, $f2
    ld e, $e6
    ld e, $e6
    inc a
    call z, $1cfc
    ld hl, sp+$78
    ldh a, [$f0]
    ret nz

    ret nz

    nop
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
    ld bc, $0302
    inc c
    rrca
    jr jr_007_7982

    ld [de], a
    dec e
    ld hl, $333e
    inc l
    scf
    jr c, jr_007_79b3

    ccf
    rra
    rra
    rlca
    rlca
    nop
    nop
    ldh a, [$f0]
    inc c
    db $fc
    ld [hl+], a
    sbc $09

jr_007_7982:
    rst $30
    ld b, c
    cp a
    dec b
    ei
    ld de, $42ef
    cp [hl]
    rrca
    db $fd
    rst $38
    pop af
    cp $02
    db $fd
    rrca
    pop af
    rst $38
    ld [bc], a
    cp $0c
    db $fc
    ldh a, [$f0]
    ldh [$e0], a
    or b
    ld d, b
    or b
    ld d, b
    ld e, b
    xor b
    ld e, b
    xor b
    ld e, b
    xor b
    ld d, h
    xor h
    ld a, h
    db $ec
    call nc, Call_007_40d4
    ret nz

    and b
    ld h, b
    ld h, b
    and b

jr_007_79b3:
    ld d, b
    or b
    sub b
    ld [hl], b
    ld h, b
    and b
    ret nz

    ret nz

    rlca
    rlca
    ld a, [bc]
    dec c
    ld a, [bc]
    dec c
    dec d
    ld a, [de]
    dec d
    ld a, [de]
    dec d
    ld a, [de]
    dec [hl]
    ld a, [hl+]
    scf
    ld a, $2b
    dec hl
    ld [bc], a
    inc bc
    dec b
    ld b, $06
    dec b
    add hl, bc
    ld c, $0a
    dec c
    ld b, $05
    inc bc
    inc bc
    inc l
    nop
    ret nz

    ret nz

    or b
    ld [hl], b
    ld a, b
    ret z

    xor $9e
    call c, Call_007_703c
    ldh a, [$fc]
    xor h
    db $fc
    inc h
    add sp, $18
    db $10
    ldh a, [$f0]
    ldh a, [$d0]
    ld [hl], b
    ldh a, [$50]
    ret nc

    ldh a, [$f0]
    ld [hl], b
    ld hl, sp-$08
    rlca
    rlca
    ld [$130f], sp
    inc e
    inc h
    ccf
    ld c, a
    ld a, e
    ld c, l
    ld a, e
    cpl
    add hl, sp
    rra
    add hl, de
    dec bc
    dec c
    dec c
    rrca
    dec bc
    rrca
    inc de
    ld e, $13
    ld e, $1f
    rra
    rrca
    ld [$1f1f], sp
    add b
    add b
    ret nz

    ret nz

    ldh [rNR41], a
    ld hl, sp-$28
    cp h
    ld [hl], h

jr_007_7a27:
    sbc h
    ld [hl], h
    sbc h
    ld [hl], h
    sub h
    ld a, h
    jr c, jr_007_7a27

    ld d, h
    db $fc

jr_007_7a31:
    sub h
    db $fc
    inc l
    call c, Call_000_38c8
    jr c, jr_007_7a31

    db $fc
    call z, $f8f8
    inc bc
    inc bc
    rlca
    rlca

jr_007_7a41:
    rlca
    inc b
    rra
    dec de
    dec a
    ld l, $39
    ld l, $3a
    cpl
    inc l
    ccf
    inc e
    rra
    inc d
    rra
    inc [hl]
    cpl
    dec sp
    cpl
    rla
    jr @+$1a

    rra
    rra
    rra

jr_007_7a5b:
    rrca
    rrca
    ret nz

    ret nz

    jr nz, jr_007_7a41

    jr jr_007_7a5b

    call c, $fc34
    call nc, $f4fc
    db $e4
    db $fc
    ld hl, sp+$48
    add sp, $58
    call nc, $f63c
    ld a, [$fa1e]
    db $ec
    inc e
    jr c, @-$06

    call c, $fce4
    db $fc
    rlca
    rlca
    dec bc
    inc c
    dec de
    rra
    ccf
    inc l
    ccf
    dec hl
    ccf
    cpl
    daa
    ccf
    rra
    ld [de], a
    rla
    ld a, [de]
    dec hl
    inc a
    ld l, a
    ld e, a
    ld a, b
    ld e, a
    scf
    jr c, @+$1e

    rra
    dec sp
    daa
    ccf
    ccf
    nop
    nop
    ret nz

    ret nz

    or h
    ld [hl], h
    ld a, h
    call z, $9cec
    ret c

    jr c, jr_007_7b1a

    ldh a, [$fc]
    xor h
    db $fc
    inc h
    add sp, $18
    ldh a, [$f0]
    ldh [rNR41], a
    ldh [rNR41], a
    ldh a, [$f0]
    ld hl, sp+$08
    ld hl, sp-$08
    nop
    nop
    rrca
    rrca

jr_007_7ac1:
    ld sp, $463e
    ld a, c
    ld b, h
    ld a, a
    ld c, a
    ld a, e
    dec l
    dec sp
    cpl
    add hl, sp
    rra
    add hl, de
    dec bc
    dec c
    rrca
    rrca
    add hl, de
    rra
    add hl, sp
    cpl
    inc a
    cpl
    ccf
    daa

jr_007_7adb:
    ld a, a
    ld a, a
    ret nz

    ret nz

    jr nz, jr_007_7ac1

    jr jr_007_7adb

    call c, $fc34
    call nc, $f4fc

jr_007_7ae9:
    db $e4
    db $fc
    ld hl, sp+$48
    add sp, $58
    call nc, $f43c
    db $fc
    ld [hl], h
    call z, Call_007_48f8
    jr nc, jr_007_7ae9

    ld hl, sp-$08
    ldh a, [$f0]
    rlca
    rlca
    dec bc
    inc c
    dec de
    rra
    ccf
    inc l
    ccf
    dec hl
    ccf
    cpl
    daa
    ccf
    rra
    ld [de], a
    rla
    ld a, [de]
    dec hl
    inc a

jr_007_7b11:
    ld l, a
    ld e, a
    ld a, b
    ld e, a
    scf
    jr c, jr_007_7b36

    rra
    scf

jr_007_7b1a:
    add hl, sp
    rra
    rra
    ret nz

    ret nz

    jr nc, jr_007_7b11

    ret z

    jr c, @+$0a

    ld hl, sp-$04
    db $f4
    or $8e
    rst $28
    sbc a
    cp $fe
    ld hl, sp-$58
    ld a, h
    add h
    adc a
    rst $38
    ld a, a
    db $fd
    db $fd

jr_007_7b36:
    sub a
    ld sp, hl
    sbc a
    pop hl
    ld a, a
    cp a
    cp a
    inc bc
    inc bc
    inc c
    rrca
    ld de, $211e
    ccf
    inc hl
    ld a, $17
    inc e
    rra
    inc e
    rrca
    inc c
    rrca
    dec c
    inc de
    rra
    ld [de], a
    rra
    ld [de], a
    rra
    rla
    rra
    rrca
    add hl, bc
    rrca
    inc c
    rra
    rra
    db $ec
    db $ec
    ld a, h
    sbc h
    cp $7e
    cp $fe
    cp $82
    cp $4a
    cp $4a
    cp $12
    db $fc
    or h
    ld hl, sp+$78
    ret z

    ld a, b
    adc b
    ld hl, sp-$10
    ldh a, [$e0]
    ldh [$f0], a
    db $10
    ld hl, sp-$08
    ld bc, $0201
    inc bc
    db $fc
    rst $38
    cp l
    add $97
    db $fd
    cp a
    xor $9f
    or $fe
    rst $38
    rra
    inc de
    rra
    ld [de], a
    rra
    ld e, $13
    rra
    add hl, de
    rra
    ccf
    cpl
    ccf
    ld h, $3f
    ccf
    ret nz

    ret nz

    ldh [rNR41], a
    ret c

    ld hl, sp-$44
    ld [hl], h

jr_007_7ba5:
    sbc h
    ld [hl], h
    sbc h
    ld [hl], h
    sub h
    ld a, h
    jr c, jr_007_7ba5

    ret c

    add sp, $28
    ret c

    ret z

    jr c, @+$3a

    ld hl, sp-$38
    ld hl, sp-$04
    adc h
    ld hl, sp-$08
    nop
    nop
    rra
    rra
    daa
    inc a
    ld e, e
    ld a, a
    cp l
    xor $f9
    xor $3a
    cpl
    ld l, h
    ld a, a
    ld e, h
    ld a, a
    ld c, h
    ld a, a
    dec sp
    ccf
    rla
    jr @+$1a

    rra
    rra
    rra
    rrca
    rrca
    ld bc, $0001
    nop
    nop
    nop
    ldh a, [$f0]
    ld hl, sp+$78
    ld hl, sp-$48
    ld [hl], b
    ret nc

    db $fc
    call c, Call_007_74fc
    cp $5e
    ld e, [hl]
    ld a, [c]
    cp [hl]
    ld a, [$f7ff]
    db $dd
    rst $30
    db $eb
    ld e, l
    or $ea
    db $fc
    sub h
    ld hl, sp-$08
    nop
    nop
    rlca
    rlca
    add hl, bc
    rrca
    ld d, $19
    daa
    ccf
    daa
    inc a
    ld c, l
    db $76
    ld c, d
    ld [hl], a
    ld b, c
    ld a, a

jr_007_7c0f:
    ld b, e
    ld a, a
    ccf
    ccf
    inc d
    dec de

jr_007_7c15:
    inc de
    inc e
    inc c
    rrca
    rlca
    rlca
    ld bc, $0001
    nop
    add b
    add b
    ld b, b
    ret nz

    jr nc, jr_007_7c15

    jr c, jr_007_7c0f

    ld hl, sp-$18
    cp h
    ld l, h
    db $ec
    db $fc
    sbc $f2
    sbc $b2
    cp h
    ld l, h
    ld hl, sp-$38
    ld [hl], h
    db $fc
    xor h
    ld [hl], h
    ret c

    xor b
    ld hl, sp-$08
    nop
    nop
    rlca
    rlca
    ld [$330f], sp
    inc a
    ld [hl], d
    ld e, l
    ld a, h
    ld e, a
    ld [hl], a
    ld e, b
    ld e, a
    ld a, a
    cpl
    ccf
    cpl
    inc [hl]
    scf
    jr c, jr_007_7c83

    ccf
    ld de, $1f1f
    rra
    ccf
    ld sp, $1f1f
    ldh a, [$f0]
    ld l, h
    sbc h
    ld a, [$dbe6]
    ccf
    rst $20
    db $dd
    rst $30
    db $fd
    db $fd
    dec hl
    ei
    cpl
    or $8e
    db $ec
    call c, $fcf4
    inc a
    db $e4
    call nz, $f8fc
    ld a, b
    db $fc
    call nz, $f8f8
    ld de, $3a11
    dec hl
    ld l, a
    ld d, a

jr_007_7c83:
    rst $10
    cp e
    cp e
    rst $28
    rst $38
    rst $38
    ccf
    dec h
    ccf
    dec l
    rra
    inc d
    rra
    ld [de], a
    dec c
    rrca
    inc b
    rlca
    rlca
    rlca
    rrca
    inc c
    rlca
    rlca
    nop
    nop
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

