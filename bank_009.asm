SECTION "ROM Bank $009", ROMX[$4000], BANK[$9]

    push bc
    di
    ldh a, [$90]
    push af
    ld hl, sp+$06
    ld a, [hl]
    ld c, a
    srl a
    add $0c
    ld [$2000], a
    ld h, $40
    bit 0, c
    jr z, jr_009_4018

    set 5, h

jr_009_4018:
    xor a
    ld l, a
    ld d, $a0
    ld e, a

jr_009_401d:
    ld a, $0a
    ld [$0000], a
    ld a, c
    ld [$4000], a
    ld a, [de]
    ld b, a
    ld a, $00
    ld [$0000], a
    ld a, $a9
    ld [$0aaa], a
    ld a, $56
    ld [$0555], a
    ld a, $a0
    ld [$0aaa], a
    ld a, b
    ld [hl], a
    ld b, $00

jr_009_4040:
    cp [hl]
    jr z, jr_009_404e

    push hl
    pop hl
    push hl
    pop hl
    dec b
    jr nz, jr_009_4040

    ld e, $00
    jr jr_009_4057

jr_009_404e:
    inc de
    inc hl
    ld a, $c0
    cp d
    jr nz, jr_009_401d

    ld e, $01

jr_009_4057:
    ld a, $f0
    ld [$4000], a
    ld a, $0a
    ld [$0000], a
    pop af
    ld [$2000], a
    ei
    pop bc
    ret


    ld hl, sp+$06
    ld b, [hl]
    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ff98
    add hl, sp
    ld sp, hl
    push de
    push hl
    ld c, $68
    ld de, $4000
    rst $30
    ld a, b
    pop bc
    ld e, $00
    sub $01
    jr c, jr_009_4097

    and $03

jr_009_4086:
    push af
    ld h, b
    ld l, c
    inc sp
    rst $20
    dec sp
    ld a, e
    or a
    jr z, jr_009_4096

    pop af
    sub $01
    jr nc, jr_009_4086

    push af

jr_009_4096:
    pop af

jr_009_4097:
    pop hl
    ld sp, hl
    ret


    di
    ldh a, [$90]
    push af
    ld a, $00
    ld [$0000], a
    ld a, $0c
    ld [$2000], a
    ld a, $f0
    ld [$4000], a
    ld a, $a9
    ld [$0aaa], a
    ld a, $56
    ld [$0555], a
    ld a, $80
    ld [$0aaa], a
    ld a, $a9
    ld [$0aaa], a
    ld a, $56
    ld [$0555], a
    ld a, $30
    ld [$4000], a
    ld de, $0000

jr_009_40ce:
    ld a, [$4000]
    cp $ff
    jr z, jr_009_40e3

    push hl
    pop hl
    push hl
    pop hl
    dec e
    jr nz, jr_009_40ce

    dec d
    jr nz, jr_009_40ce

    ld e, $00
    jr jr_009_40e5

jr_009_40e3:
    ld e, $01

jr_009_40e5:
    ld a, $0a
    ld [$0000], a
    pop af
    ld [$2000], a
    ei
    ret


    ld hl, sp+$00
    ld d, h
    ld e, l
    ld hl, $ffaa
    add hl, sp
    ld sp, hl
    push de
    push hl
    ld c, $56
    ld de, $409a
    rst $30
    pop hl
    rst $20
    pop hl
    ld sp, hl
    ret


    ld hl, sp+$06
    ld c, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld b, a
    ld a, c
    and $0f
    or b
    ld [hl], a
    ld hl, $4000
    ld [hl], a
    ld e, $0c
    ld l, c
    srl l
    add hl, de
    ld a, c
    and $01
    swap a
    rlca
    and $e0
    ld b, a
    ld c, $00
    ld a, b
    add $40
    ld b, a
    ld a, l
    push af
    inc sp
    ld de, $2000
    push de
    push bc
    ld de, $a000
    push de
    call Call_000_1323
    add sp, $07
    ret


    ld b, $00

jr_009_4142:
    ld a, b
    sub $04
    ret nc

    push bc
    push bc
    inc sp
    ld e, $09
    ld hl, $4106
    call RST_08
    inc sp
    pop bc
    inc b
    jr jr_009_4142

    ld hl, $c820
    ld c, [hl]
    push bc
    ld e, $09
    ld hl, $40f0
    call RST_08
    ld a, e
    pop bc
    or a
    jr nz, jr_009_416a

    ld e, a
    ret


jr_009_416a:
    push bc
    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    ld e, $09
    ld hl, $4068
    call RST_08
    inc sp
    pop bc
    ld b, e
    ld hl, $c820
    ld a, [hl]
    ld [hl], c
    ld hl, $4000
    ld [hl], c
    ld e, b
    ret


    ld hl, $c63d
    ld [hl], $ff
    ld hl, $c7f1
    ld [hl], $ff
    xor a
    ld hl, $c7f2
    ld [hl+], a
    ld [hl], a
    ld a, $80
    ldh [rNR52], a
    ld a, $ff
    ldh [rNR51], a
    ld a, $77
    ldh [rNR50], a
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
    ld hl, $c63e
    ld [hl], $00
    ld hl, $c63f
    ld [hl], $00
    ld hl, $c644
    ld [hl], $00
    ld hl, $c645
    ld [hl], $00
    ld hl, $c646
    ld [hl], $00
    ld hl, $c647
    ld [hl], $00
    ret


    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_009_41fb

    ld c, $00

jr_009_41e5:
    ld a, c
    sub $04
    jr nc, jr_009_420c

    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, $c629
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    inc c
    jr jr_009_41e5

jr_009_41fb:
    ld de, $0014
    push de
    ld de, $0000
    push de
    ld de, $c629
    push de
    call Call_000_37b0
    add sp, $06

jr_009_420c:
    di
    ld hl, $c628
    ld [hl], $00
    ld hl, $c627
    ld [hl], $00
    ei
    ret


    ld a, [$c627]
    ld hl, $c628
    sub [hl]
    jr z, jr_009_4240

    di
    ld hl, $c628
    inc [hl]
    ld a, [hl]
    and $03
    ld [hl], a
    add $23
    ld c, a
    ld a, $c6
    adc $00
    ld b, a
    ld a, [bc]
    ld c, a
    ei
    ld a, c
    and $04
    ld b, a
    ld a, c
    and $f0
    or b
    ld e, a
    ret


jr_009_4240:
    ld e, $00
    ret


    ld hl, sp+$02
    ld a, [hl]
    ld [$c645], a
    or a
    ret z

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
    ret


    ld hl, sp+$09
    ld a, [hl-]
    or a
    ret z

    ld d, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    push bc
    dec d
    jr z, jr_009_4293

jr_009_4277:
    ld b, h
    ld c, l
    ld a, $20
    add l
    ld l, a
    adc h
    sub l
    ld h, a
    push hl
    push de

jr_009_4282:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_009_4282

    ld a, [hl+]
    ld [bc], a
    inc bc
    dec e
    jr nz, jr_009_4282

    pop de
    pop hl
    dec d
    jr nz, jr_009_4277

jr_009_4293:
    push hl
    ld hl, sp+$0e
    ld d, [hl]
    pop hl

jr_009_4298:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_009_4298

    ld a, d
    ld [hl+], a
    dec e
    jr nz, jr_009_4298

    pop bc
    ret


    dec sp
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_42c2

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_009_42c6

jr_009_42c2:
    ld hl, $cb98
    add hl, bc

jr_009_42c6:
    ld c, l
    ld b, h
    ldh a, [rIE]
    ld hl, sp+$00
    ld [hl], a
    ld a, [hl]
    res 3, a
    push af
    inc sp
    call Call_000_01bb
    inc sp
    push bc
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, $4543
    call RST_08
    inc sp
    pop bc
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$00
    ld a, [hl]
    push af
    inc sp
    call Call_000_01bb
    pop hl
    ret


    dec sp
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_4314

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_009_4318

jr_009_4314:
    ld hl, $cb98
    add hl, bc

jr_009_4318:
    ld c, l
    ld b, h
    ldh a, [rIE]
    ld hl, sp+$00
    ld [hl], a
    ld a, [hl]
    res 3, a
    push af
    inc sp
    call Call_000_01bb
    inc sp
    push bc
    ld hl, sp+$0f
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, $4565
    call RST_08
    add sp, $03
    pop bc
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$00
    ld a, [hl]
    push af
    inc sp
    call Call_000_01bb
    pop hl
    ret


    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, $4a9f
    call RST_08
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
    jr z, jr_009_4384

    pop de
    push de

Jump_009_437c:
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_009_4388

jr_009_4384:
    ld hl, $cb98
    add hl, bc

jr_009_4388:
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
    jr z, jr_009_43a6

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_009_43ab

jr_009_43a6:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_009_43ab:
    ld b, h
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_009_43b6

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a

jr_009_43b6:
    push bc
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$1a
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, $4ad0
    call RST_08
    add sp, $07
    ld c, e
    ld b, $00
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
    jr z, jr_009_4410

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
    jr jr_009_4414

jr_009_4410:
    ld hl, $cb98
    add hl, bc

jr_009_4414:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_4435

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
    jr jr_009_443a

jr_009_4435:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_009_443a:
    ld b, h
    pop de
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [bc]
    ld c, a
    ld hl, $18c4
    ld b, $00
    add hl, bc
    ld c, [hl]
    ld hl, sp+$10
    ld e, [hl]
    ld a, $07
    sub e
    ld b, a
    inc b
    jr jr_009_4459

jr_009_4457:
    sra c

jr_009_4459:
    dec b
    jr nz, jr_009_4457

    ld a, c
    rlca
    sbc a
    ld b, a
    push de
    push bc
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    pop de
    inc e
    jr jr_009_4477

jr_009_4473:
    sra b
    rr c

jr_009_4477:
    dec e
    jr nz, jr_009_4473

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
    jr z, jr_009_44b2

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
    jr jr_009_44b6

jr_009_44b2:
    ld hl, $cb98
    add hl, bc

jr_009_44b6:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_44d7

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
    jr jr_009_44dc

jr_009_44d7:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_009_44dc:
    ld b, h
    pop de
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [bc]
    add $40
    ld c, a
    ld hl, $18c4
    ld b, $00
    add hl, bc
    ld c, [hl]
    ld hl, sp+$10
    ld e, [hl]
    ld a, $07
    sub e
    ld b, a
    inc b
    jr jr_009_44fd

jr_009_44fb:
    sra c

jr_009_44fd:
    dec b
    jr nz, jr_009_44fb

    ld a, c
    rlca
    sbc a
    ld b, a
    push de
    push bc
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    pop de
    inc e
    jr jr_009_451b

jr_009_4517:
    sra b
    rr c

jr_009_451b:
    dec e
    jr nz, jr_009_4517

    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret


    dec sp
    dec sp
    ld hl, $c646
    ld [hl], $00
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    dec hl
    ld b, a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld e, c
    ld d, b
    ld a, [hl+]
    ld [hl], a
    ld a, [$c63d]
    ld hl, sp+$00
    sub [hl]
    jr nz, jr_009_4550

    ld hl, $c642
    ld a, [hl]
    sub c
    jr nz, jr_009_4550

    inc hl
    ld a, [hl]
    sub b
    jr z, jr_009_4567

jr_009_4550:
    ld hl, $c63d
    ld [hl], $ff
    ld hl, $c642
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $c640
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$01
    ld a, [hl]
    ld [$c63d], a

jr_009_4567:
    inc sp
    inc sp
    ret


    ld hl, $c63d
    ld [hl], $ff
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
    ret


    ld hl, sp+$08
    ld a, [hl]
    ld [$c646], a
    ld [$d9de], a
    ld c, a
    rrca
    jr nc, jr_009_45a0

    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR14], a

jr_009_45a0:
    bit 1, c
    jr z, jr_009_45ab

    xor a
    ldh [rNR22], a
    ld a, $c0
    ldh [rNR24], a

jr_009_45ab:
    bit 2, c
    jr z, jr_009_45b2

    xor a
    ldh [rNR32], a

jr_009_45b2:
    bit 3, c
    jr z, jr_009_45bd

    xor a
    ldh [rNR42], a
    ld a, $c0
    ldh [rNR44], a

jr_009_45bd:
    ld a, $ff
    ldh [rNR51], a
    ret


    ld bc, $c629
    ld hl, sp+$08
    ld a, [hl]
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


    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    call Call_000_05fc
    inc sp
    ret


    ld hl, sp+$08
    ld a, [hl]
    ldh [rNR50], a
    ret


    dec sp
    dec sp
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl-]
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    dec hl
    ld c, [hl]
    ld hl, sp+$01
    ld [hl-], a
    ld a, [hl]
    ld hl, $c647
    sub [hl]
    jr c, jr_009_4669

    ld hl, $c7f1
    ld [hl], $ff
    ld hl, sp+$00
    ld a, [hl]
    ld [$c647], a
    ld a, [$c63f]
    ld b, a
    rrca
    jr nc, jr_009_462e

    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR14], a

jr_009_462e:
    bit 1, b
    jr z, jr_009_4639

    xor a
    ldh [rNR22], a
    ld a, $c0
    ldh [rNR24], a

jr_009_4639:
    bit 2, b
    jr z, jr_009_4640

    xor a
    ldh [rNR32], a

jr_009_4640:
    bit 3, b
    jr z, jr_009_464b

    xor a
    ldh [rNR42], a
    ld a, $c0
    ldh [rNR44], a

jr_009_464b:
    ld a, $ff
    ldh [rNR51], a
    ld hl, sp+$01
    ld a, [hl]
    ld [$c63f], a
    ld hl, $c7f1
    ld [hl], $ff
    ld hl, $c7f4
    ld [hl], $00
    ld hl, $c7f2
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $c7f1
    ld [hl], c

jr_009_4669:
    inc sp
    inc sp
    ret


    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_4688

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
    jr jr_009_468c

jr_009_4688:
    ld hl, $cb98
    add hl, bc

jr_009_468c:
    ld c, l
    ld b, h
    ld hl, $0006
    add hl, bc
    ld d, [hl]
    ld hl, $0004
    add hl, bc
    ld a, [hl]
    push de
    inc sp
    push af
    inc sp
    push bc
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    ld e, $03
    ld hl, $4c26
    call RST_08
    add sp, $05
    ret


    add sp, -$07
    ld hl, sp+$0f
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    ld bc, $c758
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, $c526
    ld b, [hl]
    ld hl, $c527
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $001d
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$00
    push de
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld a, d
    ld [hl-], a
    pop de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    push bc
    inc sp
    push de
    ld b, a
    push bc
    call Call_000_12e0
    add sp, $05
    ld hl, sp+$11
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$10
    ld a, [hl]
    push af
    inc sp
    ld hl, $0017
    push hl
    push de
    push bc
    call Call_000_1323
    add sp, $07
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld e, [hl]
    inc hl
    ld h, [hl]
    ld l, e
    inc hl
    push af
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    ld e, l
    ld d, h
    push bc
    ld hl, $c538
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    push de
    call Call_000_135b
    add sp, $06
    ld c, e
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    ld hl, $c538
    sub [hl]
    jr nc, jr_009_4753

    ld hl, $c580
    ld b, $00
    add hl, bc
    ld a, [hl]
    jr jr_009_4754

jr_009_4753:
    xor a

jr_009_4754:
    ld [de], a
    add sp, $07
    ret


    ld hl, $6000
    ld [hl], $00
    ld [hl], $01
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
    jr z, jr_009_477e

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
    jr jr_009_4782

jr_009_477e:
    ld hl, $cb98
    add hl, bc

jr_009_4782:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0c
    ld a, [hl]
    and $03
    add $08
    push af
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld c, a
    pop af
    push af
    and $0f
    or c
    ld c, a
    pop af
    ld [hl], c
    ld hl, $4000
    ld [hl], c
    ld hl, $a000
    ld c, [hl]
    ld b, $00
    sub $0b
    jr nz, jr_009_47c1

    ld hl, $c820
    ld a, [hl]
    and $f0
    or $0c
    ld [hl], a
    ld [$4000], a
    ld a, [$a000]
    rrca
    jr nc, jr_009_47c1

    set 0, b

jr_009_47c1:
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    inc sp
    inc sp
    ret


    dec sp
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_47e7

    ld hl, sp+$07
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
    jr jr_009_47ec

jr_009_47e7:
    ld hl, $cb98
    add hl, bc
    ld c, l

jr_009_47ec:
    ld l, c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0b
    ld a, [hl]
    and $03
    add $08
    ld hl, sp+$00
    ld [hl], a
    ld a, [$c820]
    and $f0
    ld e, a
    ld hl, sp+$00
    ld a, [hl]
    and $0f
    or e
    ld [$c820], a
    ld [$4000], a
    ld hl, $a000
    ld [hl], c
    ld hl, sp+$00
    ld a, [hl]
    sub $0b
    jr nz, jr_009_482f

    ld hl, $c820
    ld a, [hl]
    and $f0
    or $0c
    ld [hl], a
    ld [$4000], a
    ld hl, $a000
    ld a, [hl]
    and $0e
    ld e, a
    ld a, b
    and $01
    or e
    ld [hl], a

jr_009_482f:
    inc sp
    ret


    ld hl, sp+$08
    ld c, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    or $0c
    ld [hl], a
    ld [$4000], a
    ld a, c
    or a
    jr z, jr_009_484c

    ld hl, $a000
    ld a, [hl]
    and $bf
    ld [hl], a
    ret


jr_009_484c:
    ld hl, $a000
    ld a, [hl]
    or $40
    ld [hl], a
    ret


    ld de, $c526
    ld hl, $c57e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0003
    push hl
    push de
    push bc
    call Call_000_376d
    add sp, $06
    ld de, $c0ba
    ld hl, $c57e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld hl, $0004
    push hl
    push de
    push bc
    call Call_000_376d
    add sp, $06
    ld hl, $c57e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0007
    add hl, bc
    ld bc, $c0be
    ld a, [bc]
    ld [hl], a
    ld hl, $c57e
    ld a, [hl]
    add $08
    ld [hl+], a
    ld a, [hl]
    adc $00
    ld [hl], a
    ret


Jump_009_489a:
    ld hl, $cb92
    ld [hl], $02
    ld hl, $cb93
    ld [hl], $03
    ld hl, $cb94
    ld [hl], $01
    ld hl, $c57e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld l, d
    ld [$cb95], a
    ld a, l
    ld [$cb96], a
    inc de
    inc de
    inc de
    ld bc, $0004
    push bc
    push de
    ld de, $c0ba
    push de
    call Call_000_376d
    add sp, $06
    ld bc, $c0be
    ld hl, $c57e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0007
    add hl, de
    ld a, [hl]
    ld [bc], a
    ret


    ld hl, $c57e
    ld a, [hl]
    add $f8
    ld [hl+], a
    ld a, [hl]
    adc $ff
    ld [hl], a
    jp Jump_009_489a


    ld hl, $c57e
    ld [hl], $3e
    inc hl
    ld [hl], $c5
    jp Jump_009_489a


    ld hl, $c57e
    ld [hl], $3e
    inc hl
    ld [hl], $c5
    ret


    push bc
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    ld a, d
    add a
    jr c, jr_009_490f

    call Call_009_4934
    jr jr_009_4925

jr_009_490f:
    rra
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de
    ld hl, $ca54
    ld a, [hl]
    or a
    jr z, jr_009_491e

    dec [hl]

jr_009_491e:
    ld a, $2d
    ld [bc], a
    inc bc
    call Call_009_4934

jr_009_4925:
    ld h, b
    ld l, c
    pop de
    ld a, d
    cpl
    ld d, a
    ld a, e
    cpl
    ld e, a
    inc de
    add hl, de
    ld d, h
    ld e, l
    pop bc
    ret


Call_009_4934:
    push bc
    ld hl, $ca57
    xor a
    ld [hl-], a
    ld [hl-], a
    ld [hl], a
    ld b, $10

jr_009_493e:
    sla e
    rl d
    ld a, [hl]
    adc a
    daa
    ld [hl+], a
    ld a, [hl]
    adc a
    daa
    ld [hl+], a
    ld a, [hl]
    adc a
    daa
    ld [hl-], a
    dec hl
    dec b
    jr nz, jr_009_493e

    pop bc
    ld a, [$ca54]
    sub $05
    jr c, jr_009_4969

    jr z, jr_009_4969

    ld d, a
    ld a, $30

jr_009_495f:
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_009_495f

    ld a, $05
    ld [$ca54], a

jr_009_4969:
    ld a, [$ca54]
    or a
    jr z, jr_009_4971

    ld a, $01

jr_009_4971:
    ld d, a
    ld e, $30
    ld hl, $ca57
    ld a, [hl-]
    and $0f
    add d
    jr z, jr_009_498e

    sub d
    add e
    ld d, $01
    ld [bc], a
    inc bc
    ld a, [$ca54]
    or a
    jr z, jr_009_498e

    cp $05
    jr nc, jr_009_498e

    dec bc

jr_009_498e:
    ld a, [hl]
    swap a
    and $0f
    add d
    jr z, jr_009_49a7

    sub d
    add e
    ld d, $01
    ld [bc], a
    inc bc
    ld a, [$ca54]
    or a
    jr z, jr_009_49a7

    cp $04
    jr nc, jr_009_49a7

    dec bc

jr_009_49a7:
    ld a, [hl-]
    and $0f
    add d
    jr z, jr_009_49be

    sub d
    add e
    ld d, $01
    ld [bc], a
    inc bc
    ld a, [$ca54]
    or a
    jr z, jr_009_49be

    cp $03
    jr nc, jr_009_49be

    dec bc

jr_009_49be:
    ld a, [hl]
    swap a
    and $0f
    add d
    jr z, jr_009_49d5

    sub d
    add e
    ld [bc], a
    inc bc
    ld a, [$ca54]
    or a
    jr z, jr_009_49d5

    cp $02
    jr nc, jr_009_49d5

    dec bc

jr_009_49d5:
    ld a, [hl]
    and $0f
    add e
    ld [bc], a
    inc bc
    xor a
    ld [bc], a
    ret


    dec h
    ld [de], a
    inc b
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_009_4a58

    ld [hl], l
    ld l, h
    ld l, h
    ld h, l
    ld h, h
    jr nz, jr_009_4a63

    ld l, b
    ld h, l
    ld a, [bc]
    ld [hl], b
    ld l, h
    ld [hl], l
    ld h, a
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $0121
    add $0d
    ld d, a
    ld bc, $0014
    nop
    rst $38
    db $fc
    inc d
    ld b, $00
    rst $38
    db $fd
    inc d
    rlca
    nop
    rst $38
    cp $35
    rst $38
    db $fc
    ld [hl-], a
    ld [bc], a
    rst $38
    db $fc
    daa
    inc bc
    ld [bc], a
    add hl, bc
    ldh a, [$5c]
    nop
    dec h
    ld b, b
    nop
    ld b, c
    jr nz, jr_009_4aae

    ld l, c
    ld l, [hl]
    ld l, c
    ld [hl], e
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_009_4ab0

    ld l, a
    ld l, a
    ld l, e
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]
    ld [hl], a
    ld h, l
    ld l, h
    ld l, h
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404

jr_009_4a58:
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

jr_009_4a63:
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld b, b
    nop
    ld d, a
    ld l, a
    ld [hl], a
    inc l
    jr nz, jr_009_4ae9

    ld l, b
    ld h, c
    ld [hl], h
    jr nz, jr_009_4af1

    ld h, c
    ld [hl], e
    ld a, [bc]
    ld h, l
    ld h, c
    ld [hl], e
    ld a, c
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld [de], a
    inc b
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_009_4b0f

    ld l, a
    ld [hl], h
    jr nz, @+$76

    ld l, b
    ld h, l

jr_009_4aae:
    ld a, [bc]
    ld c, l

jr_009_4ab0:
    ld a, c
    ld [hl], e
    ld [hl], h
    ld l, c
    ld h, e
    ld h, c
    ld l, h
    jr nz, jr_009_4b05

    ld h, c
    ld l, l
    ld [hl], b
    ld [hl], e
    ld l, b
    ld h, c
    ld h, h
    ld h, l
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
    ld e, c
    ld l, a
    ld [hl], l
    daa
    ld l, h
    ld l, h
    jr nz, @+$70

    ld h, l
    ld h, l
    ld h, h
    jr nz, jr_009_4b57

    ld l, a
    ld a, [bc]
    ld [hl], h
    ld h, c
    ld l, e
    ld h, l

jr_009_4ae9:
    jr nz, jr_009_4b54

    ld [hl], h
    jr nz, jr_009_4b62

    ld l, a
    jr nz, jr_009_4b65

jr_009_4af1:
    ld l, b
    ld h, l
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
    ld h, l

jr_009_4b05:
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    jr nz, jr_009_4b7a

    ld h, [hl]
    jr nz, jr_009_4b5a

    ld l, c

jr_009_4b0f:
    ld h, a
    ld l, b
    ld [hl], h
    ld a, [bc]
    ld [hl], h
    ld l, a
    jr nz, jr_009_4b8b

    ld l, b
    ld h, l
    jr nz, jr_009_4b69

    ld l, a
    ld [hl], d
    ld [hl], h
    ld l, b
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
    ld hl, $c603
    dec c
    ld d, a
    ld bc, $0014
    nop
    rst $38

jr_009_4b54:
    db $fc
    inc d
    inc bc

jr_009_4b57:
    add b
    rst $38
    db $fd

jr_009_4b5a:
    inc d
    inc b
    add b
    rst $38
    cp $35
    rst $38
    db $fc

jr_009_4b62:
    ld [hl-], a
    ld [bc], a
    rst $38

jr_009_4b65:
    db $fc
    daa
    inc bc
    ld [bc], a

jr_009_4b69:
    add hl, bc
    sub c
    ld h, c
    nop
    dec h
    ld b, b
    nop
    ld d, a
    ld h, l
    jr nz, jr_009_4be1

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    jr nz, jr_009_4bdc

jr_009_4b7a:
    ld h, l
    ld a, [bc]
    ld [hl], e
    ld [hl], h
    ld h, c
    ld l, l
    ld [hl], b
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_009_4bea

    ld l, a
    ld [hl], a
    ld l, [hl]
    jr nz, jr_009_4bfa

jr_009_4b8b:
    ld l, [hl]
    ld a, [bc]
    ld [hl], b
    ld [hl], d
    ld l, c
    ld h, e
    ld h, l
    ld [hl], e
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
    ld h, d
    ld [hl], l
    ld [hl], h
    jr nz, jr_009_4c24

    ld h, l
    jr nz, jr_009_4c14

    ld l, a
    ld l, [hl]
    daa
    ld [hl], h
    jr nz, @+$75

    ld h, l
    ld h, l
    ld l, l
    ld a, [bc]
    ld [hl], h
    ld l, a
    jr nz, @+$75

    ld h, l
    ld l, h
    ld l, h
    jr nz, jr_009_4c24

    ld l, [hl]
    ld a, c
    jr nz, @+$52

    ld b, e
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
    ld bc, $fe45
    ld [de], a
    nop

jr_009_4bdc:
    ld b, h
    inc bc
    ld bc, $2500

jr_009_4be1:
    ld b, b
    nop
    ld c, c
    daa
    ld l, l
    jr nz, jr_009_4c56

    ld l, a
    ld [hl], h

jr_009_4bea:
    jr nz, jr_009_4c4d

    jr nz, jr_009_4c5e

    ld l, h
    ld l, a
    ld [hl], h
    ld a, [bc]
    ld h, e
    ld l, b
    ld h, c
    ld [hl], d
    ld h, c
    ld h, e
    ld [hl], h
    ld h, l

jr_009_4bfa:
    ld [hl], d
    inc l
    jr nz, jr_009_4c60

    ld [hl], l
    ld [hl], h
    jr nz, @+$4b

    daa
    ld l, l
    ld a, [bc]
    ld [hl], e
    ld [hl], h
    ld l, c
    ld l, h
    ld l, h
    jr nz, jr_009_4c75

    ld l, [hl]
    jr nz, jr_009_4c83

    ld l, b
    ld h, l
    jr nz, @+$69

    ld h, c

jr_009_4c14:
    ld l, l
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

jr_009_4c24:
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld d, b
    ld l, a
    ld [hl], a
    ld h, l
    ld [hl], d
    jr nz, jr_009_4ca6

    ld l, a
    jr nz, jr_009_4ca9

    ld l, b
    ld h, l
    jr nz, jr_009_4c87

    ld d, b
    ld b, e
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
    ld bc, $fe45
    ld [de], a

jr_009_4c4d:
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld b, b
    nop
    ld b, l

jr_009_4c56:
    ld l, [hl]
    ld l, d
    ld l, a
    ld a, c
    jr nz, jr_009_4cd0

    ld l, b
    ld h, l

jr_009_4c5e:
    jr nz, jr_009_4ccd

jr_009_4c60:
    ld l, a
    db $76
    ld l, c
    ld h, l
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

jr_009_4c75:
    rlca
    ld bc, $0040
    ld l, $2e
    ld l, $20
    ld l, l
    ld l, l
    ld l, l
    ld l, l
    jr nz, jr_009_4cf3

jr_009_4c83:
    ld l, a
    ld [hl], b
    ld h, e
    ld l, a

jr_009_4c87:
    ld [hl], d
    ld l, [hl]
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
    ld bc, $2500
    ld b, b
    nop
    ld c, [hl]
    ld l, a
    ld [hl], d
    ld [hl], h

jr_009_4ca6:
    ld l, b
    ld a, [hl-]
    ld a, [bc]

jr_009_4ca9:
    ld d, h
    ld h, l
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    jr nz, jr_009_4d20

    ld h, [hl]
    jr nz, jr_009_4d00

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
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
    ld d, a

jr_009_4ccd:
    ld h, l
    ld [hl], e
    ld [hl], h

jr_009_4cd0:
    ld a, [hl-]
    ld a, [bc]
    ld b, a
    ld [hl], d
    ld h, c
    db $76
    ld h, l
    ld a, c
    ld h, c
    ld [hl], d
    ld h, h
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
    ld bc, $2500
    ld b, b

jr_009_4cf3:
    nop
    ld c, c
    daa
    ld l, l
    jr nz, @+$49

    ld h, l
    ld [hl], d
    ld l, e
    ld l, c
    ld l, [hl]
    ld l, l
    ld h, c

jr_009_4d00:
    ld l, [hl]
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
    ld d, d
    ld h, l
    db $76
    ld h, l
    ld l, h
    jr nz, @+$6b

    ld l, [hl]
    jr nz, jr_009_4d8d

jr_009_4d20:
    ld a, c
    ld a, [bc]
    ld [hl], a
    ld h, l
    ld l, c
    ld [hl], d
    ld h, h
    ld h, l
    ld [hl], d
    ld a, c
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
    ld bc, $2500
    ld b, b
    nop
    ld d, h
    ld l, b
    ld h, l
    ld [hl], d
    ld h, l
    jr nz, jr_009_4dc0

    ld [hl], e
    ld h, l
    ld h, h
    jr nz, jr_009_4dc4

    ld l, a
    jr nz, jr_009_4db5

    ld h, l
    ld a, [bc]
    ld h, c
    jr nz, @+$48

    ld d, d
    ld c, a
    ld b, a
    jr nz, jr_009_4dc6

    ld l, [hl]
    jr nz, jr_009_4dd4

    ld l, b
    ld l, c
    ld [hl], e
    ld a, [bc]
    ld [hl], b
    ld l, a
    ld l, [hl]
    ld h, h
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
    ld bc, $0040
    ld h, d
    ld [hl], l
    ld [hl], h
    jr nz, @+$6b

    ld [hl], h
    jr nz, @+$74

    ld h, c
    ld l, [hl]
    jr nz, jr_009_4dec

    ld [hl], a
    ld h, c

jr_009_4d8d:
    ld a, c
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld b, b
    nop
    ld c, b
    ld l, c
    inc l
    jr nz, jr_009_4df6

    daa
    ld l, l
    jr nz, jr_009_4e03

    ld l, c
    ld h, e
    ld l, b
    ld l, c

jr_009_4db5:
    ld h, l
    ld a, [bc]
    ld e, d
    ld l, c
    ld [hl], d
    ld h, d
    ld h, l
    ld [hl], e
    ld l, $00
    ld b, a

jr_009_4dc0:
    inc bc
    ld bc, $1405

jr_009_4dc4:
    nop
    nop

jr_009_4dc6:
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
    daa

jr_009_4dd4:
    ld l, l
    jr nz, jr_009_4e4e

    ld l, a
    ld [hl], d
    ld l, e
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, @+$74

    ld h, l
    ld h, c
    ld l, h
    ld l, h
    ld a, c
    ld a, [bc]
    ld l, b
    ld h, c
    ld [hl], d
    ld h, h
    jr nz, jr_009_4e5a

    ld l, [hl]

jr_009_4dec:
    jr nz, @+$52

    ld c, e
    inc [hl]
    jr nz, jr_009_4e53

    ld l, [hl]
    ld h, h
    ld a, [bc]
    ld [hl], h

jr_009_4df6:
    ld l, b
    ld h, l
    jr nz, jr_009_4e4a

    ld c, e
    ld a, [hl-]
    jr nz, jr_009_4e45

    ld h, c
    ld l, l
    ld h, l
    ld l, $00

jr_009_4e03:
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
    ld bc, $2500
    ld [de], a
    dec b
    ld a, [de]
    nop
    ld c, [hl]
    daa
    nop
    rlca
    nop
    nop
    ld [bc], a
    add hl, bc
    ld c, [hl]
    ld d, a
    ld b, b
    nop
    ld b, c
    ld [hl], a
    ld [hl], a
    ld l, $2e
    ld l, $0a
    ld l, b
    ld h, l
    daa
    ld [hl], e
    jr nz, jr_009_4e97

    ld [hl], e
    ld l, h
    ld h, l
    ld h, l
    ld [hl], b
    ld l, $2e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop

jr_009_4e45:
    nop
    ld b, l
    rst $38
    ld c, $00

jr_009_4e4a:
    ld b, c
    rst $38
    nop
    ld b, h

jr_009_4e4e:
    rlca
    ld bc, $fe45
    ld [de], a

jr_009_4e53:
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld c, [hl]

jr_009_4e5a:
    ld h, e
    nop
    ld [$0000], sp
    dec b
    add hl, bc
    ld c, [hl]
    adc b
    ld b, b
    nop
    ld c, a
    ld l, b
    jr nz, @+$66

    ld h, l
    ld h, c
    ld [hl], d
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $001a
    ld c, [hl]
    sub h
    nop
    rlca
    nop
    nop
    ld bc, $4f09
    ld b, h
    ld b, b
    nop
    ld c, l

jr_009_4e97:
    ld h, c
    ld a, c
    ld h, d
    ld h, l
    jr nz, jr_009_4f11

    ld l, b
    ld l, c
    ld [hl], e
    jr nz, jr_009_4f16

    ld h, c
    ld [hl], e
    ld h, l
    ld [hl], d
    ld a, [bc]
    ld [hl], a
    ld l, c
    ld l, h
    ld l, h
    jr nz, jr_009_4f24

    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_009_4f1a

    ld l, c
    ld l, l
    jr nz, jr_009_4f2b

    ld [hl], b
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $0014
    ld bc, $fcff
    add h
    nop
    ld [bc], a
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fcff
    dec a
    inc bc
    rst $38
    db $fc
    inc d
    nop
    ld e, $ff
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
    ld bc, $fcff
    inc d
    ld bc, $ff00
    db $fd
    inc d
    dec b
    add b
    rst $38
    cp $14
    nop
    ld bc, $ffff
    jr nc, @+$01

    db $fc
    inc d
    nop
    ld bc, $fcff
    add h
    nop
    inc bc

jr_009_4f11:
    rst $38
    db $fc
    inc d
    nop
    inc b

jr_009_4f16:
    rst $38
    db $fc
    inc d
    nop

jr_009_4f1a:
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
    inc d
    nop
    ld [bc], a
    rst $38

jr_009_4f24:
    db $fc
    inc d
    ld [bc], a
    nop
    rst $38
    db $fd
    inc d

jr_009_4f2b:
    inc b
    add b
    rst $38
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
    ld [$0000], sp
    nop
    dec h
    ld b, b
    nop
    ld d, a
    ld h, l
    ld l, h
    ld h, e
    ld l, a
    ld l, l
    ld h, l
    jr nz, jr_009_4fc5

    ld l, a
    jr nz, jr_009_4fc8

    ld l, b
    ld h, l
    jr nz, jr_009_4fcc

    ld l, a
    ld [hl], b
    ld a, [bc]
    ld [hl], e
    ld h, l
    ld h, e
    ld [hl], d
    ld h, l
    ld [hl], h
    jr nz, @+$50

    ld b, a
    ld a, [bc]
    ld l, b
    ld h, l
    ld h, c
    ld h, h
    ld [hl], c
    ld [hl], l
    ld h, c
    ld [hl], d
    ld [hl], h
    ld h, l
    ld [hl], d
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
    ld d, a
    ld h, l
    jr nz, jr_009_4ff0

    ld l, c
    ld l, [hl]
    ld h, c
    ld l, h
    ld l, h
    ld a, c
    jr nz, jr_009_5005

    ld h, l
    ld [hl], h
    jr nz, @+$77

    ld [hl], b
    ld a, [bc]
    ld h, c
    ld l, [hl]
    jr nz, @+$71

    ld h, [hl]
    ld h, [hl]
    ld l, c
    ld h, e
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
    ld bc, $0040
    ld e, c
    ld c, a
    ld c, c
    ld c, [hl]
    ld c, e
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

jr_009_4fc5:
    ld bc, $fe45

jr_009_4fc8:
    ld [de], a
    nop
    ld b, h
    inc bc

jr_009_4fcc:
    ld bc, $2500
    ld b, b
    nop
    ld c, l
    ld l, l
    ld l, l
    inc l
    jr nz, @+$76

    ld l, b
    ld h, c
    ld [hl], h
    jr nz, jr_009_503e

    ld [hl], l
    ld [hl], d
    ld h, a
    ld h, l
    ld [hl], d
    ld a, [bc]
    ld [hl], a
    ld h, c
    ld [hl], e
    jr nz, @+$66

    ld h, l
    ld h, c
    ld h, h
    jr nz, jr_009_5060

    ld h, c
    ld [hl], e
    ld [hl], h
    ld a, c

jr_009_4ff0:
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

jr_009_5005:
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld a, [de]
    nop
    ld d, b
    jr jr_009_5011

jr_009_5011:
    rlca
    nop
    nop
    inc bc
    add hl, bc
    ld d, b
    add b
    ld b, b
    nop
    ld d, h
    ld l, b
    ld h, c
    ld [hl], h
    jr nz, jr_009_5097

    ld h, c
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_009_508a

    ld l, c
    ld h, h
    ld l, [hl]
    daa
    ld [hl], h
    ld a, [bc]
    ld [hl], a
    ld h, c
    ld l, e
    ld h, l
    jr nz, jr_009_509a

    ld l, c
    ld l, l
    jr nz, jr_009_50ab

    ld [hl], b
    inc l
    nop
    ld b, a
    inc bc
    ld bc, $1404

jr_009_503e:
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
    ld l, b
    ld h, l
    jr nz, @+$70

    ld h, l
    ld h, l
    ld h, h
    ld [hl], e
    jr nz, jr_009_50ca

    ld l, a
    jr nz, jr_009_50bb

    ld h, l
    ld a, [bc]
    ld [hl], e
    ld l, b
    ld l, a
    ld h, e
    ld l, e

jr_009_5060:
    ld h, l
    ld h, h
    jr nz, jr_009_50c5

    ld [hl], a
    ld h, c
    ld l, e
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
    ld bc, $2500
    ld b, b
    nop
    ld c, [hl]
    ld l, a
    ld [hl], d
    ld [hl], h
    ld l, b
    ld a, [hl-]

jr_009_508a:
    ld a, [bc]
    ld d, h
    ld h, l
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    jr nz, jr_009_5102

    ld h, [hl]
    jr nz, @+$4e

    ld l, c

jr_009_5097:
    ld h, a
    ld l, b
    ld [hl], h

jr_009_509a:
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

jr_009_50ab:
    ld bc, $0040
    ld d, e
    ld l, a
    ld [hl], l
    ld [hl], h
    ld l, b
    ld a, [hl-]
    ld a, [bc]
    ld d, h
    ld l, a
    ld [hl], a
    ld l, [hl]
    nop
    ld b, a

jr_009_50bb:
    inc bc
    ld bc, $1404
    nop
    nop
    ld b, c
    rst $38
    nop
    ld b, h

jr_009_50c5:
    rlca
    ld bc, $fe45
    ld [de], a

jr_009_50ca:
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld [de], a
    dec b
    inc d
    nop
    nop
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop
    ld bc, $fcff
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    inc d
    nop
    jr nc, @+$01

    ei
    dec c
    rst $38
    ei
    nop
    ld d, l
    xor a
    ld [bc], a
    ld b, b
    nop
    ld b, a
    ld l, a
    ld l, a
    ld h, h
    jr nz, jr_009_5169

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    ld hl, $4700

jr_009_5102:
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
    ld bc, $1f21
    add $0d
    ld d, a
    ld bc, $0014
    nop
    rst $38
    db $fc
    inc d
    ld [bc], a
    nop
    rst $38
    db $fd
    inc d
    ld b, $80
    rst $38
    cp $35
    rst $38
    db $fc
    ld [hl-], a
    ld bc, $fcff
    daa
    inc bc
    ld [bc], a
    add hl, bc
    add hl, hl
    ld e, c
    nop
    dec h
    ld b, b
    nop
    ld c, a
    ld l, h
    ld h, h
    jr nz, jr_009_516b

    ld d, e
    ld l, a
    ld l, [hl]
    ld l, c
    ld h, e
    jr nz, jr_009_51bf

    ld l, b
    ld h, l
    ld a, [bc]
    ld b, e
    ld l, a
    ld l, l
    ld l, c
    ld h, e
    daa
    ld [hl], e
    jr nz, jr_009_51b8

    ld [hl], d
    ld h, l
    jr nz, jr_009_51cb

    ld l, c
    ld l, h
    ld h, l
    ld h, h
    ld a, [bc]
    ld h, c
    ld h, a
    ld h, c
    ld l, c
    ld l, [hl]
    ld [hl], e
    ld [hl], h
    jr nz, jr_009_51dd

jr_009_5169:
    ld l, b
    ld h, l

jr_009_516b:
    jr nz, jr_009_51e4

    ld h, c
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
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $2500
    ld b, b
    nop
    ld b, c
    jr nz, jr_009_5203

    ld l, c
    ld l, [hl]
    ld h, a
    ld l, h
    ld h, l
    jr nz, jr_009_51f9

    ld l, a
    ld l, a
    ld l, e
    jr nz, jr_009_5208

    ld l, c
    ld h, l
    ld [hl], e
    ld a, [bc]
    ld l, c
    ld l, [hl]
    jr nz, @+$76

    ld l, b
    ld h, l
    jr nz, jr_009_520a

    ld l, a
    ld l, a
    ld l, e
    ld h, e
    ld h, c
    ld [hl], e
    ld h, l
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1404
    nop
    nop

jr_009_51b8:
    ld b, l
    rst $38
    ld c, $00
    ld b, c
    rst $38
    nop

jr_009_51bf:
    ld b, h
    rlca
    ld bc, $0040
    daa
    ld d, h
    ld l, b
    ld h, l
    jr nz, jr_009_5239

    ld h, [hl]

jr_009_51cb:
    ld h, [hl]
    ld l, c
    ld h, e
    ld l, c
    ld h, c
    ld l, h
    jr nz, jr_009_5236

    ld l, b
    ld h, l
    ld h, c
    ld [hl], h
    ld a, [bc]
    ld h, a
    ld [hl], l
    ld l, c
    ld h, h
    ld h, l

jr_009_51dd:
    jr nz, jr_009_5253

    ld l, a
    jr nz, jr_009_524e

    ld l, c
    ld h, [hl]

jr_009_51e4:
    ld h, l
    ld a, [hl-]
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
    ld [hl], a
    ld l, c
    ld [hl], h

jr_009_51f9:
    ld l, b
    jr nz, @+$72

    ld [hl], l
    ld l, h
    ld l, h
    jr nz, jr_009_5270

    ld [hl], l
    ld [hl], h

jr_009_5203:
    ld a, [bc]
    ld [hl], e
    ld h, l
    ld h, e
    ld [hl], d

jr_009_5208:
    ld h, l
    ld [hl], h

jr_009_520a:
    jr nz, jr_009_527f

    ld h, l
    ld h, e
    ld [hl], h
    ld l, c
    ld l, a
    ld l, [hl]
    daa
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
    ld bc, $2500
    ld [de], a
    dec b
    inc d
    nop
    nop
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    inc d
    nop

jr_009_5236:
    ld [bc], a
    rst $38
    db $fc

jr_009_5239:
    inc d
    nop
    ld bc, $fdff
    ld [hl], l
    rst $38
    db $fc
    inc d
    nop
    jr nc, @+$01

    ei
    dec c
    rst $38
    ei
    nop
    ld d, l
    xor a
    ld [bc], a
    ld b, b

jr_009_524e:
    nop
    ld b, a
    ld l, a
    ld l, a
    ld h, h

jr_009_5253:
    jr nz, jr_009_52c3

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
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

jr_009_5270:
    ld b, h
    inc bc
    ld bc, $1f21
    add $0d
    ld d, a
    ld bc, $0014
    nop
    rst $38
    db $fc
    inc d

jr_009_527f:
    ld [bc], a
    nop
    rst $38
    db $fd
    inc d
    ld bc, $ff80
    cp $35
    rst $38
    db $fc
    ld [hl-], a
    ld bc, $fcff
    daa
    inc bc
    ld [bc], a
    add hl, bc
    add hl, hl
    ld e, c
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
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

jr_009_52c3:
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
    ret nc

    ldh [rNR41], a
    nop
    inc b
    nop
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
    ld c, $6f
    rlca
    and h
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
    nop
    jr nz, jr_009_535f

jr_009_535f:
    ld bc, $0480
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

jr_009_537b:
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    ld a, [bc]
    scf
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
    jr nz, jr_009_5393

jr_009_5393:
    ld [bc], a
    nop
    dec b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    ccf
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

jr_009_53af:
    nop
    nop
    nop
    nop
    add hl, bc
    db $fc
    ld [hl], e
    rlca
    db $ec
    ld c, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_53c7

jr_009_53c7:
    dec b
    add b
    rlca
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
    xor c
    ld [hl], d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_537b

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
    jr nz, jr_009_53af

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
    inc d
    ld [de], a
    nop
    ld b, $03
    nop
    dec b
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    sub a
    ld b, c
    ld [$5d79], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    ld d, d
    ld e, d
    nop
    nop
    nop
    rlca
    dec b
    ld e, h
    add hl, bc
    add hl, hl
    ld d, e
    ld a, [bc]
    call Call_000_0042
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_549e

jr_009_549e:
    inc b
    add b
    inc bc
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

jr_009_54ba:
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    ld a, [bc]
    ld h, a
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
    jr nz, jr_009_54d2

jr_009_54d2:
    dec b
    add b
    ld bc, $0000
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

jr_009_54ee:
    nop
    nop
    nop
    nop
    add hl, bc
    ld l, l
    ld a, c
    add hl, bc
    ld l, l
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
    nop
    jr nz, jr_009_5506

jr_009_5506:
    ld [bc], a
    nop
    ld bc, $0000
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
    ld [bc], a
    ld [hl], l
    add hl, bc
    ldh [rWX], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_54ba

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
    jr nz, jr_009_54ee

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
    inc d
    ld [de], a
    nop
    dec b
    ld [bc], a
    nop
    inc b
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    rlca
    ld b, d
    ld [$5ee1], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    inc d
    ld e, h
    nop
    nop
    nop
    ld a, [bc]
    push hl
    ld b, d
    add hl, bc
    sbc h
    ld d, h
    ld a, [bc]
    pop af

jr_009_55c5:
    ld b, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_55dd

jr_009_55dd:
    dec b
    add b
    ld bc, $0000
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

jr_009_55f9:
    nop
    nop
    nop
    nop
    add hl, bc
    sub h
    ld a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5611

jr_009_5611:
    ld bc, $0180
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
    ldh a, [$79]
    rlca
    ldh [rRP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_55c5

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
    jr nz, jr_009_55f9

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
    inc d
    ld [de], a
    nop
    inc b
    ld [bc], a
    nop
    inc bc
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    dec d
    ld b, d
    ld [$6049], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    sub l
    ld e, l
    nop
    nop
    nop
    ld a, [bc]
    ld bc, $0943
    db $db
    ld d, l
    ld a, [bc]
    ld a, [bc]

jr_009_56d0:
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_56e8

jr_009_56e8:
    inc bc
    add b
    ld [bc], a
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

jr_009_5704:
    nop
    nop
    nop
    nop
    add hl, bc
    ld [$0978], a
    and l
    ld c, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_571c

jr_009_571c:
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
    rla
    ld [hl], a
    rlca
    and $49
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_56d0

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
    jr nz, jr_009_5704

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
    inc d
    ld [de], a
    nop
    inc b
    ld bc, $0300
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ld sp, $0842
    or c
    ld h, c
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    ld d, $5f
    nop
    nop
    nop
    ld a, [bc]
    ld a, [de]
    ld b, e
    add hl, bc
    and $56
    ld a, [bc]
    inc hl
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_57f3

jr_009_57f3:
    ld bc, $0780
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

jr_009_580f:
    nop
    nop
    nop
    nop
    add hl, bc
    sub $6c
    add hl, bc
    rst $08
    ld d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5827

jr_009_5827:
    ld bc, $0280
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

jr_009_5843:
    nop
    nop
    nop
    nop
    add hl, bc
    sub $6c
    add hl, bc
    add hl, hl
    ld d, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_585b

jr_009_585b:
    inc b
    add b
    ld [bc], a
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
    xor l
    ld l, [hl]
    rlca
    db $d3
    ld d, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_580f

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
    jr nz, jr_009_5843

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
    jr nz, jr_009_58f7

jr_009_58f7:
    inc b
    nop
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
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l

jr_009_591a:
    add hl, bc
    adc d
    ld d, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    ld b, $01
    nop
    inc b
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    and l
    ld b, c
    ld [$6319], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    sub a
    ld h, b
    nop
    nop
    nop
    ld a, [bc]
    dec hl
    ld b, e
    add hl, bc
    pop af
    ld d, a
    ld a, [bc]
    scf

jr_009_594e:
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_5966

jr_009_5966:
    inc bc
    add b
    ld [bc], a
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
    pop de
    ld l, a
    ld b, $9f
    ld d, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_591a

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
    jr nz, jr_009_594e

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
    jr nz, jr_009_5a02

jr_009_5a02:
    inc b
    nop
    ld bc, $0000
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
    add hl, bc
    inc a
    ld d, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    inc b
    ld bc, $0300
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    rst $08
    ld b, c
    ld [$6481], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    jr jr_009_5ab0

    nop
    nop
    nop
    ld a, [bc]
    ccf
    ld b, e
    add hl, bc
    ld h, h
    ld e, c
    ld a, [bc]
    ld c, b
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_5a60:
    nop
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
    inc d
    ld [de], a
    nop
    nop
    ld bc, $0000
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ld [hl], a
    ld b, d
    ld [$65e9], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    inc bc
    pop hl
    ld a, a
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
    ld d, b

jr_009_5a94:
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_5aac

jr_009_5aac:
    ld b, $80
    ld b, $00

jr_009_5ab0:
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
    add hl, bc
    sbc $49
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5a60

    ld [bc], a
    add b
    ld [bc], a
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
    add hl, bc
    sub h
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
    jr nz, jr_009_5a94

    inc bc
    add b
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
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    ld b, $ef
    ld e, c
    nop
    nop
    nop
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
    ld bc, $4558
    dec c
    ld a, [bc]
    ld bc, $0f59
    ld bc, $0060
    ld a, a
    sbc a
    inc b
    inc d
    nop
    ld bc, $ffff
    dec c
    rst $38
    rst $38
    nop
    ld d, l
    xor a
    ld [bc], a
    ld hl, $c60f
    dec c
    ld d, a
    inc bc
    ld b, b
    nop
    ld c, h
    ld b, c
    ld c, l
    ld d, b
    ld d, e
    ld c, b
    ld b, c
    ld b, h
    ld b, l
    jr nz, @+$49

    ld d, l
    ld b, c
    ld d, d
    ld b, h
    ld c, c
    ld b, c
    ld c, [hl]
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
    ld c, c
    ld c, [hl]
    ld d, [hl]
    ld c, c
    ld c, [hl]
    ld b, e
    ld c, c
    ld b, d
    ld c, h
    ld b, l
    jr nz, jr_009_5bef

    ld b, l
    ld d, a
    ld b, l
    ld d, d
    ld a, [bc]
    ld b, h
    ld b, l
    ld c, l
    ld c, a
    ld c, [hl]
    nop
    ld b, a
    inc bc
    ld bc, $1404
    nop

jr_009_5bad:
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
    ld bc, $1400
    ld [de], a
    nop
    inc bc
    nop
    nop
    ld [bc], a
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ld l, c
    ld b, d
    ld [$6751], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    add hl, bc
    ld b, [hl]
    ld e, e
    nop
    nop
    nop
    ld [$68b9], sp
    add hl, bc
    xor d
    ld e, d
    nop
    nop

jr_009_5be1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    nop
    nop
    nop
    nop
    nop

jr_009_5bef:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5bf9

jr_009_5bf9:
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
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    add hl, bc
    ld l, h
    ld c, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5bad

    inc bc
    nop
    nop
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
    add hl, bc
    sbc [hl]
    ld c, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5be1

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
    dec h
    ld [de], a
    dec b
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

jr_009_5cad:
    ld [hl], l
    rst $38
    db $fc
    ld h, c
    inc d
    nop
    ld [bc], a
    rst $38
    db $fc
    ld a, $08
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
    inc d
    nop
    ld e, $ff
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
    ld [bc], a
    rst $38
    db $fc
    inc d
    inc bc
    add b
    rst $38

jr_009_5ce1:
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
    nop
    inc d
    ld [de], a
    nop
    inc bc
    nop
    nop
    ld [bc], a
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ld e, e
    ld b, d
    ld [$68bf], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    add hl, bc
    sub e
    ld e, h
    nop
    nop
    nop
    ld a, [bc]
    ld e, b
    ld b, e
    add hl, bc
    rst $30
    ld e, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_5cad

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

jr_009_5d50:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5ce1

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

jr_009_5d84:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0900
    ld a, [bc]
    ld a, b
    ld a, [bc]
    sub e
    ld b, d
    ld [$6a27], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    sbc c
    ld h, e
    nop
    nop
    nop
    ld a, [bc]
    ld e, [hl]
    ld b, e
    add hl, bc
    dec hl
    ld e, l
    ld a, [bc]
    ld h, c
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_5d50

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
    jr nz, jr_009_5d84

    inc bc
    nop
    ld bc, $0000
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
    ld h, b
    nop
    ld l, [hl]
    or c
    ld [bc], a
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
    inc d
    ld [de], a
    nop
    ld [bc], a
    ld [bc], a
    nop
    ld bc, $0900
    ld a, [bc]
    ld a, b
    ld a, [bc]
    add l
    ld b, d
    ld [$6b8f], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    add hl, bc
    ld [hl], $5e
    nop
    nop
    nop
    ld a, [bc]
    ld [hl], c
    ld b, e
    add hl, bc
    adc $5d
    ld a, [bc]
    ld [hl], h

jr_009_5e90:
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_5ea8

jr_009_5ea8:
    ld [bc], a
    add b
    dec b
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop
    ccf
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
    nop
    nop

jr_009_5ec4:
    nop
    nop
    nop
    nop
    add hl, bc
    inc de
    ld a, e
    add hl, bc
    jr jr_009_5f1c

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5edc

jr_009_5edc:
    inc bc
    add b
    dec b
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
    xor l
    ld l, [hl]
    add hl, bc
    dec bc
    ld d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_5e90

    ld [$0300], sp
    nop
    nop
    rrca
    ld hl, sp+$07
    nop
    nop
    nop
    nop

jr_009_5f1c:
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
    jr nz, jr_009_5ec4

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
    inc d
    ld [de], a
    nop
    inc b
    inc b
    nop
    inc bc
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    or e
    ld b, c
    ld [$6cf7], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    ld a, [de]
    ld h, l
    nop
    nop
    nop
    ld a, [bc]
    add h
    ld b, e
    add hl, bc
    and [hl]
    ld e, [hl]
    ld a, [bc]
    adc l
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec h
    ld [de], a
    inc b
    halt
    ld [bc], a
    nop
    nop
    nop
    nop
    ld h, b
    nop
    ld l, [hl]
    or c
    ld [bc], a
    inc d
    nop
    nop
    rst $38
    db $fc
    inc sp
    rst $38
    db $fc
    ld d, l
    ld b, h
    jp Jump_000_040a


    ld d, e
    add h
    db $10
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
    inc d
    ld [de], a
    dec b
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    xor a
    ld b, d
    ld [$6e5f], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    add hl, bc
    or c
    ld e, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_600f:
    nop
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
    inc d
    ld [de], a
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    and c
    ld b, d
    ld [$6fc7], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    ld a, [bc]
    xor l
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_605b

jr_009_605b:
    ld b, $80
    ld bc, $0000
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
    ld [hl], b
    ld b, l
    ld bc, $61ad
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_600f

    inc bc
    add b
    ld b, $00
    ld hl, sp+$17
    add sp, $07
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

jr_009_60ab:
    nop
    nop
    nop
    nop
    ld a, [bc]
    ret


    ld b, l
    add hl, bc
    dec [hl]
    ld c, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_60c3

jr_009_60c3:
    ld bc, $0280
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

jr_009_60df:
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    add hl, bc
    sbc a
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
    jr nz, jr_009_60f7

jr_009_60f7:
    inc bc
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
    xor l
    ld l, [hl]
    ld [bc], a
    and h
    ld h, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_60ab

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

jr_009_614e:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_60df

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

jr_009_6182:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    ld b, $03
    nop
    dec b
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    pop bc
    ld b, c
    ld [$712f], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    db $eb
    ld h, [hl]
    nop
    nop
    nop
    ld a, [bc]
    db $d3
    ld b, e
    add hl, bc
    ld e, c
    ld h, b
    ld a, [bc]
    ld [c], a
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_614e

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
    jr nz, jr_009_6182

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

jr_009_6225:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    ld [bc], a
    inc bc
    nop
    ld bc, $0900
    ld a, [bc]
    ld a, b
    ld a, [bc]
    db $dd
    ld b, c
    ld [$7297], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    sbc c
    ld l, b
    nop
    nop
    nop
    ld a, [bc]
    ld a, [$0943]
    call z, Call_000_0a61
    db $fd

jr_009_6259:
    ld b, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_6271

jr_009_6271:
    ld [bc], a
    add b
    inc bc
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
    ld l, d
    ld a, h
    rlca
    dec b
    ld d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_6225

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
    jr nz, jr_009_6259

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
    inc d
    ld [de], a
    nop
    inc bc
    inc bc
    nop
    ld [bc], a
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ld sp, hl
    ld b, c
    ld [$73ff], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    ld a, [de]
    ld l, d
    nop
    nop
    nop
    ld a, [bc]
    dec d
    ld b, h
    add hl, bc
    ld l, a
    ld h, d
    ld a, [bc]
    dec de
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc d
    ld [de], a
    nop
    add hl, bc
    ld b, $00
    rlca
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    inc hl
    ld b, d
    ld [$7567], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    ld l, a
    ld l, l
    nop
    nop
    nop
    ld a, [bc]
    inc sp
    ld b, h
    rlca
    sbc e
    ld l, e
    ld a, [bc]
    ld c, b
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_6383

jr_009_6383:
    inc bc
    add b
    dec b
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

jr_009_639f:
    nop
    nop
    nop
    nop
    add hl, bc
    ld [hl], e
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_63b7

jr_009_63b7:
    inc b
    add b
    dec b
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

jr_009_63d3:
    nop
    nop
    nop
    nop
    add hl, bc
    add l
    ld [hl], l
    add hl, bc
    ld b, c
    ld c, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_63eb

jr_009_63eb:
    ld [bc], a
    nop
    inc bc
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
    ld c, b
    db $76
    add hl, bc
    adc $4f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_639f

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
    jr nz, jr_009_63d3

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

jr_009_6476:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    dec b
    inc bc
    nop
    inc b
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ccf
    ld b, d
    ld [$76cf], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    ld e, b
    ld l, a
    nop
    nop
    nop
    ld a, [bc]
    ld a, b
    ld b, h
    add hl, bc
    add c
    ld h, e
    ld a, [bc]
    add h

jr_009_64aa:
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_64c2

jr_009_64c2:
    dec b
    add b
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

jr_009_64de:
    nop
    nop
    nop
    nop
    ld a, [bc]
    sbc e
    ld b, l
    add hl, bc
    add c
    ld d, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_6476

    inc bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, bc
    ld h, a
    ld a, b
    rlca
    jp nc, $0052

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_64aa

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

jr_009_654d:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_64de

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

jr_009_6581:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc d
    ld [de], a
    nop
    inc b
    ld [bc], a
    nop
    inc bc
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    ld c, l
    ld b, d
    ld [$7837], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    db $ed
    ld [hl], b
    nop
    nop
    nop
    ld a, [bc]
    sbc h
    ld b, h
    add hl, bc
    ret nz

    ld h, h
    ld a, [bc]
    and l

jr_009_65b5:
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nz, jr_009_654d

    inc bc
    nop
    ld [bc], a
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
    pop af
    ld a, l
    add hl, bc
    ld b, l
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
    jr nz, jr_009_6581

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
    jr nz, jr_009_65b5

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
    inc d
    ld [de], a
    nop
    inc bc
    ld bc, $0200
    nop
    add hl, bc
    ld a, [bc]
    ld a, b
    ld a, [bc]
    db $eb
    ld b, c
    ld [$799f], sp
    inc b
    or h
    ld a, a
    add hl, bc
    ld h, $53
    rlca
    add d
    ld [hl], d
    nop
    nop
    nop
    ld a, [bc]
    or l
    ld b, h
    add hl, bc
    bit 4, l
    ld a, [bc]
    cp e
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld b, b
    nop
    ld d, a
    ld h, l
    jr nz, jr_009_6715

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    jr nz, jr_009_6710

    ld h, l
    ld a, [bc]
    ld [hl], e
    ld [hl], h
    ld h, c
    ld l, l
    ld [hl], b
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, jr_009_671e

    ld l, a
    ld [hl], a
    ld l, [hl]
    jr nz, jr_009_672e

    ld l, [hl]
    ld a, [bc]
    ld [hl], b
    ld [hl], d
    ld l, c
    ld h, e
    ld h, l
    ld [hl], e
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
    ld h, d
    ld [hl], l
    ld [hl], h
    jr nz, jr_009_6758

    ld h, l
    jr nz, @+$66

    ld l, a
    ld l, [hl]
    daa
    ld [hl], h
    jr nz, jr_009_675d

    ld h, l
    ld h, l
    ld l, l
    ld a, [bc]
    ld [hl], h
    ld l, a
    jr nz, jr_009_6765

    ld h, l
    ld l, h
    ld l, h
    jr nz, jr_009_6758

    ld l, [hl]
    ld a, c
    jr nz, jr_009_674b

    ld b, e
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
    ld bc, $fe45
    ld [de], a
    nop

jr_009_6710:
    ld b, h
    inc bc
    ld bc, $4000

jr_009_6715:
    nop
    ld c, b
    ld l, c
    inc l
    jr nz, @+$4b

    jr nz, jr_009_6794

    ld l, a

jr_009_671e:
    ld [hl], d
    ld l, e
    jr nz, jr_009_678a

    ld h, l
    ld [hl], d
    ld h, l
    ld a, [bc]
    ld l, a
    db $76
    ld h, l
    ld [hl], d
    jr nz, @+$76

    ld l, b
    ld h, l

jr_009_672e:
    jr nz, jr_009_67a3

    ld [hl], l
    ld l, l
    ld l, l
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
    ld h, d

jr_009_674b:
    ld [hl], l
    ld [hl], h
    jr nz, jr_009_6798

    jr nz, @+$6d

    ld h, l
    ld h, l
    ld [hl], b
    jr nz, jr_009_67b8

    ld [hl], l
    ld [hl], d

jr_009_6758:
    ld l, [hl]
    ld l, c
    ld l, [hl]
    ld h, a
    ld a, [bc]

jr_009_675d:
    ld l, l
    ld a, c
    ld [hl], e
    ld h, l
    ld l, h
    ld h, [hl]
    ld l, $2e

jr_009_6765:
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
    ld bc, $4000
    nop
    ld d, e
    ld l, a
    ld [hl], d
    ld [hl], d
    ld a, c
    inc l
    jr nz, jr_009_67fd

    ld h, l
    daa
    ld [hl], d
    ld h, l

jr_009_678a:
    jr nz, jr_009_67ed

    ld l, h
    ld l, h
    ld a, [bc]
    ld l, a
    ld [hl], l
    ld [hl], h
    jr nz, @+$71

jr_009_6794:
    ld h, [hl]
    jr nz, jr_009_6804

    ld h, l

jr_009_6798:
    ld h, c
    ld [hl], h
    inc l
    nop
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop

jr_009_67a3:
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
    ld d, a
    ld h, l
    jr nz, @+$6c

    ld [hl], l
    ld [hl], e
    ld [hl], h
    jr nz, jr_009_682b

jr_009_67b8:
    ld l, a
    ld l, h
    ld h, h
    jr nz, @+$71

    ld [hl], l
    ld [hl], d
    ld a, [bc]
    ld l, h
    ld h, c
    ld [hl], e
    ld [hl], h
    jr nz, @+$64

    ld [hl], l
    ld [hl], d
    ld h, a
    ld h, l
    ld [hl], d
    jr nz, jr_009_6841

    ld l, a
    jr nz, jr_009_6844

    ld l, b
    ld h, l
    ld a, [bc]
    ld h, a
    ld [hl], l
    ld a, c
    jr nz, jr_009_684f

    ld l, c
    ld [hl], h
    ld l, b
    jr nz, jr_009_6844

    ld l, h
    ld h, c
    ld [hl], e
    ld [hl], e
    ld h, l
    ld [hl], e
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop
    ld b, c

jr_009_67ed:
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $fe45
    ld [de], a
    nop
    ld b, h
    inc bc
    ld bc, $4000
    nop
    ld d, h

jr_009_67fd:
    ld l, b
    ld h, c
    ld l, [hl]
    ld l, e
    ld [hl], e
    jr nz, @+$68

jr_009_6804:
    ld l, a
    ld [hl], d
    jr nz, jr_009_687c

    ld l, b
    ld h, l
    ld a, [bc]
    ld h, e
    ld l, a
    ld [hl], d
    ld [hl], b
    ld [hl], e
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
    ld bc, $0040
    ld c, c
    jr nz, jr_009_68a0

    ld h, c
    ld [hl], e

jr_009_682b:
    jr nz, jr_009_68a4

    ld l, a
    ld [hl], d
    ld [hl], d
    ld l, c
    ld h, l
    ld h, h
    jr nz, jr_009_68ac

    ld h, l
    daa
    ld h, h
    ld a, [bc]
    ld h, a
    ld l, a
    jr nz, jr_009_68ac

    ld [hl], l
    ld [hl], h
    jr nz, jr_009_68b0

jr_009_6841:
    ld h, [hl]
    jr nz, @+$64

jr_009_6844:
    ld [hl], l
    ld [hl], e
    ld l, c
    ld l, [hl]
    ld h, l
    ld [hl], e
    ld [hl], e
    ld l, $00
    ld b, a
    inc bc

jr_009_684f:
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
    ld bc, $1200
    inc b
    ld b, b
    nop
    ld c, b
    ld h, l
    ld a, c
    jr nz, @+$7b

    ld l, a
    ld [hl], l
    daa
    db $76
    ld h, l
    jr nz, @+$69

    ld l, a
    ld [hl], h
    ld a, [bc]
    ld [hl], e
    ld l, a
    ld l, l
    ld h, l
    jr nz, jr_009_68e8

    ld h, l

jr_009_687c:
    ld h, c
    ld [hl], h
    ld hl, $4720
    ld l, a
    ld l, a
    ld h, h
    ld a, [bc]
    ld [hl], c
    ld [hl], l
    ld h, c
    ld l, h
    ld l, c
    ld [hl], h
    ld a, c
    jr nz, @+$76

    ld l, a
    ld l, a
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

jr_009_68a0:
    rst $38
    nop
    ld b, h
    rlca

jr_009_68a4:
    ld bc, $0040
    ld [hl], a
    ld h, l
    daa
    ld l, h
    ld l, h

jr_009_68ac:
    jr nz, jr_009_691b

    ld h, c
    ld l, e

jr_009_68b0:
    ld h, l
    jr nz, jr_009_692c

    ld l, a
    ld [hl], l
    jr nz, jr_009_6918

    ld a, [bc]
    ld h, d
    ld [hl], l
    ld [hl], d
    ld h, a
    ld h, l
    ld [hl], d
    jr nz, jr_009_6932

    ld l, c
    ld h, a
    ld l, b
    ld [hl], h
    jr nz, jr_009_6934

    ld l, a
    ld [hl], a
    ld a, [bc]
    ld l, c
    ld h, [hl]
    jr nz, jr_009_6946

    ld l, a
    ld [hl], l
    jr nz, jr_009_6948

    ld h, c
    ld l, [hl]
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
    ld [de], a
    nop
    ld b, h

jr_009_68e8:
    inc bc
    ld bc, $0014
    inc c
    nop
    nop
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
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_009_696a

    ld l, a
    ld [hl], h
    jr nz, jr_009_697b

    ld l, b
    ld h, l
    jr nz, jr_009_694d

    ld [hl], l
    ld [hl], d
    ld h, a
    ld h, l
    ld [hl], d
    ld hl, $4700
    inc bc
    ld bc, $1405
    nop

jr_009_6918:
    nop
    ld b, l
    rst $38

jr_009_691b:
    dec c
    nop
    ld b, c
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld c, b
    ld l, l
    ld l, l
    ld l, l
    inc l
    jr nz, jr_009_699f

jr_009_692c:
    ld l, a
    jr nz, jr_009_69a3

    ld l, b
    ld h, c
    ld [hl], h

jr_009_6932:
    daa
    ld [hl], e

jr_009_6934:
    ld a, [bc]
    ld [hl], a
    ld l, b
    ld a, c
    jr nz, jr_009_69ae

    ld l, b
    ld h, l
    ld a, c
    jr nz, jr_009_69b3

    ld h, c
    ld [hl], e
    ld [hl], h
    ld h, l
    ld a, [bc]
    ld h, [hl]
    ld [hl], l

jr_009_6946:
    ld l, [hl]
    ld l, [hl]

jr_009_6948:
    ld a, c
    ld l, $2e
    ld l, $00

jr_009_694d:
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
    ld bc, $1200
    inc b
    inc d
    nop
    ld bc, $fcff
    inc d

jr_009_696a:
    nop
    nop
    rst $38
    db $fd
    ld [hl], l
    rst $38
    db $fc
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

jr_009_697b:
    ld [hl], l
    rst $38
    db $fc
    ld b, b
    nop
    ld e, c
    ld l, a
    ld [hl], l
    jr nz, jr_009_69f5

    ld l, h
    ld h, c
    ld h, e
    ld h, l
    ld h, h
    jr nz, jr_009_6a00

    ld l, b
    ld h, l
    ld a, [bc]
    ld l, h
    ld h, c
    ld l, l
    ld [hl], b
    ld [hl], e
    ld l, b
    ld h, c
    ld h, h
    ld h, l
    jr nz, jr_009_6a09

    ld l, [hl]
    ld a, [bc]
    ld [hl], h
    ld l, b
    ld h, l

jr_009_699f:
    jr nz, jr_009_6a02

    ld l, h
    ld [hl], h

jr_009_69a3:
    ld h, c
    ld [hl], d
    ld l, $00
    ld b, a
    inc bc
    ld bc, $1405
    nop
    nop

jr_009_69ae:
    ld b, l
    rst $38
    dec c
    nop
    ld b, c

jr_009_69b3:
    rst $38
    nop
    ld b, h
    rlca
    ld bc, $0040
    ld d, h
    ld l, b
    ld h, l
    jr nz, jr_009_6a05

    ld h, l
    ld l, [hl]
    ld h, a
    jr nz, jr_009_6a17

    ld l, b
    ld [hl], l
    ld l, c
    jr nz, @+$71

    ld h, [hl]
    ld a, [bc]
    ld [hl], h
    ld l, b
    ld h, l
    jr nz, jr_009_6a42

    ld l, a
    ld l, a
    ld l, l
    jr nz, jr_009_6a4c

    ld h, c
    ld [hl], e
    ld a, [bc]
    ld [hl], b
    ld h, l
    ld [hl], d
    ld h, [hl]
    ld h, l
    ld h, e
    ld [hl], h
    ld h, l
    ld h, h
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

jr_009_69f5:
    inc bc
    ld bc, $1f21
    add $0d
    ld d, a
    ld bc, $0014
    nop

jr_009_6a00:
    rst $38
    db $fc

jr_009_6a02:
    inc d
    nop
    nop

jr_009_6a05:
    rst $38
    db $fd
    inc d
    nop

jr_009_6a09:
    nop
    rst $38
    cp $35
    rst $38
    db $fc
    ld [hl-], a
    nop
    rst $38
    db $fc
    daa
    inc bc
    ld [bc], a
    add hl, bc

jr_009_6a17:
    ld e, $60
    nop
    inc d
    nop
    nop
    nop
    nop
    nop
    ldh [$e0], a
    ldh a, [$b0]
    ld hl, sp-$68
    db $fc
    adc h
    cp $06
    cp $02
    cp $02
    ld b, $fe
    adc h
    db $fc
    sbc b
    ld hl, sp-$50
    ldh a, [$e0]
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_6a42:
    nop
    nop
    nop
    nop
    ld a, a
    ld a, a
    ld a, a
    ld b, b
    ld a, a
    ld b, b

jr_009_6a4c:
    ld a, a
    ld b, b
    ld b, b
    ld a, a

jr_009_6a50:
    ld a, a
    ld a, a

jr_009_6a52:
    nop
    nop

jr_009_6a54:
    nop
    nop

jr_009_6a56:
    nop
    nop

jr_009_6a58:
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh [$60], a
    ldh a, [$30]
    ld hl, sp+$18
    db $fc
    inc c
    db $fc
    inc b
    db $fc
    inc a
    ldh [rNR41], a
    jr nz, jr_009_6a50

    jr nz, jr_009_6a52

    jr nz, jr_009_6a54

    jr nz, jr_009_6a56

    jr nz, jr_009_6a58

    ldh [$e0], a
    nop
    nop
    nop
    nop
    ldh [$e0], a
    ldh [rNR41], a
    ldh [rNR41], a
    ldh [rNR41], a

jr_009_6a86:
    ldh [rNR41], a
    ldh [rNR41], a
    ldh [rNR41], a

jr_009_6a8c:
    db $fc
    inc a
    inc b
    db $fc
    inc c
    db $fc
    jr jr_009_6a8c

    jr nc, jr_009_6a86

    ldh [$e0], a
    ret nz

    ret nz

    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    ccf
    inc a
    jr nz, jr_009_6aef

    jr nc, jr_009_6af1

    jr jr_009_6ad3

    inc c
    rrca
    ld b, $07
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], b
    ld [hl], b
    ld a, b
    ld e, b
    ld a, h
    ld c, h
    cp $c6
    rst $38
    inc bc
    rst $38
    ld bc, $01ff
    inc bc
    rst $38
    add $fe
    ld c, h

jr_009_6ad3:
    ld a, h
    ld e, b
    ld a, b
    ld [hl], b
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
    ccf
    ccf
    ccf
    jr nz, jr_009_6b2a

    jr nz, jr_009_6b2c

    jr nz, @+$22

jr_009_6aef:
    ccf

jr_009_6af0:
    ccf

jr_009_6af1:
    ccf

jr_009_6af2:
    nop
    nop

jr_009_6af4:
    nop
    nop

jr_009_6af6:
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

jr_009_6afd:
    ret nz

    ldh [$60], a
    ldh a, [$30]
    ld hl, sp+$18
    db $fc
    inc c
    db $fc
    inc b
    db $fc
    inc a
    ldh [rNR41], a
    jr nz, @-$1e

    jr nz, jr_009_6af0

    jr nz, jr_009_6af2

    jr nz, jr_009_6af4

    jr nz, jr_009_6af6

    ldh [$e0], a
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
    ldh [rNR41], a
    ldh [rNR41], a

jr_009_6b28:
    ldh [rNR41], a

jr_009_6b2a:
    ldh [rNR41], a

jr_009_6b2c:
    ldh [rNR41], a

jr_009_6b2e:
    db $fc
    inc a
    inc b
    db $fc
    inc c
    db $fc
    jr jr_009_6b2e

    jr nc, jr_009_6b28

    ld h, b
    ldh [$c0], a
    ret nz

    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    rlca
    inc b
    ccf
    inc a
    jr nz, jr_009_6b91

    jr nc, jr_009_6b93

    jr jr_009_6b75

    inc c
    rrca
    rlca
    rlca
    inc bc
    inc bc
    nop
    ld [$0006], sp
    nop
    ld hl, sp+$08
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop

jr_009_6b75:
    ld [$0004], sp
    nop
    ld hl, sp+$04
    jr nz, jr_009_6afd

    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_6b85

jr_009_6b85:
    ld [$2002], sp
    add b
    nop
    nop
    nop
    nop
    ld [$0010], sp
    nop

jr_009_6b91:
    ld hl, sp+$12

jr_009_6b93:
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$000a], sp
    nop
    ld hl, sp+$0c
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$000e], sp
    nop
    ld hl, sp+$0e
    jr nz, @-$7e

    nop
    nop
    nop
    nop
    nop
    ld a, [bc]
    jr nz, jr_009_6bb5

jr_009_6bb5:
    ld [$200c], sp
    add b
    nop
    nop
    nop
    ld e, h
    ld l, e
    ld l, b
    ld l, e
    ld [hl], h
    ld l, e
    add b
    ld l, e
    adc h
    ld l, e
    ld e, h
    ld l, e
    sbc b
    ld l, e
    ld l, b
    ld l, e
    and h
    ld l, e
    ld [hl], h
    ld l, e
    or b
    ld l, e
    add b
    ld l, e
    nop
    nop
    ld bc, $0201
    ld [bc], a
    inc bc
    inc bc
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    nop
    nop
    inc c
    nop
    ldh a, [$bc]
    ld l, e
    call nc, $e46b
    ld l, e
    nop
    rrca
    nop
    rlca
    add hl, bc
    ld a, [de]
    ld l, d
    nop

jr_009_6bf7:
    nop
    nop

    db $04, $00

    INCBIN "gfx/image_009_6bfb.2bpp"

    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    nop
    nop
    nop

    db $3b, $6c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00

    ld bc, $f000

    db $47, $6c, $49, $6c, $59, $6c

    nop
    rrca
    ld hl, sp+$07

    db $09, $f9, $6b

    nop
    nop
    nop

    db $04, $00

    INCBIN "gfx/image_009_6c70.2bpp"

    db $80

    nop
    nop
    nop
    ldh a, [$08]
    nop
    nop
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop

    db $b0, $6c

    or h
    ld l, h

    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $00

    ld [bc], a
    nop
    db $e0

    db $c0, $6c, $c4, $6c, $d4, $6c

    nop
    rrca
    ld hl, sp+$07

    db $09, $6e, $6c

    nop
    nop
    nop

    db $14, $00

    INCBIN "gfx/image_009_6ceb.2bpp"

    ldh [$e0], a
    sbc b
    ld a, b
    inc b
    db $fc
    ld [bc], a
    cp $02
    db $fe
    
    INCBIN "gfx/image_009_6d75.2bpp"

    ld b, b
    ld a, a
    add b
    rst $38
    rst $38
    rst $38

    db $00, $09, $10, $00, $00, $f8, $12, $00, $80

    nop
    nop
    nop
    nop
    ld [$2012], sp
    nop
    ld hl, sp+$10
    jr nz, @-$7e

    nop
    nop
    nop
    nop
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

jr_009_6e62:
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$000c], sp
    nop
    ld hl, sp+$0e
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_009_6e78

jr_009_6e78:
    ld [$2002], sp
    add b
    nop
    nop
    nop
    nop
    nop
    inc b
    jr nz, jr_009_6e84

jr_009_6e84:
    ld [$2006], sp
    add b
    nop
    nop
    nop
    dec hl
    ld l, [hl]
    scf
    ld l, [hl]
    ld b, e
    ld l, [hl]
    ld c, a
    ld l, [hl]
    ld e, e
    ld l, [hl]
    ld h, a
    ld l, [hl]
    ld [hl], e
    ld l, [hl]
    ld a, a
    ld l, [hl]
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    nop
    nop
    ld [$f000], sp
    adc e
    ld l, [hl]
    sbc e
    ld l, [hl]
    xor e
    ld l, [hl]
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    jp hl


    ld l, h
    nop
    nop
    nop
    ld a, [$000c]
    nop
    nop
    ld hl, sp+$02
    nop
    nop
    ld hl, sp+$04
    nop
    ld [$0610], sp
    nop
    nop
    ld hl, sp+$08
    nop
    nop
    ld hl, sp+$0a
    nop
    add b
    nop
    nop
    nop
    ld a, [$0c0d]
    nop
    nop
    ld hl, sp+$0e
    nop
    nop
    ld hl, sp+$10
    nop
    ld [$1210], sp
    nop
    nop
    ld hl, sp+$08
    ld b, b
    nop
    ld hl, sp+$14
    nop
    add b
    nop
    nop
    nop
    ret nz

    ld l, [hl]
    call c, Call_000_006e
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    add sp, -$08
    ld l, [hl]
    db $fc
    ld l, [hl]
    inc c
    ld l, a
    nop
    rrca
    ld hl, sp+$07
    ld [$7b07], sp
    nop
    nop
    nop
    ld [$fc00], sp
    db $fc
    cp $fe
    ei
    dec hl
    ld hl, sp+$28
    db $fc
    inc b
    cp $e2
    cp $fe
    db $fc
    call nz, $34fc
    jp z, $cefe

    cp $fc
    db $f4
    db $fc
    call nz, $f888
    ldh a, [rSVBK]
    ld hl, sp-$08
    rrca
    rrca
    ccf
    ccf
    ld a, a
    ld a, [hl]
    ld a, a
    ld a, h
    ld a, a
    ld h, h
    ld a, a
    ld h, h
    cpl
    ld sp, $1f1b
    rrca
    rrca
    rrca
    rrca
    rra
    rra
    ccf
    inc a
    ccf
    inc a
    ld a, a
    ld a, a
    ei
    db $fc
    rra
    rra
    nop
    nop
    db $fc
    db $fc
    cp $fe
    ld a, [$f82a]
    jr z, @-$02

    inc b
    cp $e2
    cp $fe
    db $fc
    call nz, $34fc
    jp z, $cefe

    cp $fc
    ld [hl], h
    db $fc
    ld a, h
    sbc $e2
    cp $fe
    nop
    nop
    rrca
    rrca
    ccf
    ccf
    ld a, a
    ld a, [hl]
    ld a, a
    ld a, h
    ld a, a
    ld h, h
    ld a, a
    ld h, h
    cpl
    ld sp, $1f1b
    rrca
    rrca
    rrca
    rrca
    rra
    rra
    ccf
    ld a, $ff
    cp $6f
    ld [hl], c
    ccf
    ccf
    nop
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
    and e
    ld l, a
    xor a
    ld l, a
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$bb]
    ld l, a
    cp a
    ld l, a
    rst $08
    ld l, a
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    ld hl, $006f
    nop
    nop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    ccf
    pop bc
    rra
    ldh [$1f], a
    ldh [$9f], a
    ldh [$9f], a
    ldh [$9f], a
    ldh [$1f], a
    pop hl
    ccf
    pop bc
    ld a, $c2
    ld a, h
    add h
    ld hl, sp+$18
    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    db $fc
    add e
    ld hl, sp+$07
    ld hl, sp+$07
    ld sp, hl
    ld b, $f9
    rlca
    ld sp, hl
    rlca
    ld hl, sp-$79
    db $fc
    jp Jump_009_437c


    ld a, $21
    rra
    jr jr_009_702c

    rlca
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_702c:
    rst $38
    rst $38
    ld bc, $00ff
    rst $38
    nop

Call_009_7033:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    rst $38

jr_009_703c:
    dec b
    rst $38
    ld a, [de]
    cp $e4
    db $fc
    jr jr_009_703c

    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
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
    nop
    rst $38
    add b
    rst $38
    ldh [rIE], a
    ld e, b
    ld a, a
    daa
    ccf
    jr jr_009_7083

    rlca
    rlca
    nop
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
    ld h, [hl]
    ld [hl], b
    ld [hl], d
    ld [hl], b
    nop

jr_009_7083:
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100

jr_009_708e:
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$7e]
    ld [hl], b
    add d
    ld [hl], b
    sub d
    ld [hl], b
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    db $e4
    ld l, a
    nop
    nop
    nop
    stop
    inc b
    ei
    ld c, $f7
    xor l
    ld a, [hl]
    reti


    cp a
    ld e, e
    rst $38
    ld l, [hl]
    rst $38
    ld a, [hl+]
    rst $38
    jr nz, @+$01

    nop

jr_009_70ba:
    rst $38
    jr c, @-$37

    ld a, [hl]
    cp c
    ld a, [hl]
    cp c
    ld a, [hl]
    cp c
    ld a, [hl]
    rst $00
    jr c, jr_009_708e

    jr c, @+$01

    inc e
    db $e3
    ld a, [hl]
    sbc l
    ld a, a
    sbc h
    ld a, a
    sbc h
    ld a, a
    ld [c], a
    dec e

jr_009_70d4:
    db $e3
    inc e
    rst $38
    nop
    rst $38
    jr nz, jr_009_70ba

    ld [hl], b
    rst $28
    or l

jr_009_70de:
    ld a, [hl]
    sbc e
    db $fd
    jp c, Jump_009_76ff

    rst $38
    ld d, h
    rst $38
    inc b
    rst $38
    inc b
    ei
    ld c, $f7
    xor l
    ld a, [hl]
    reti


    cp a
    ld e, e
    rst $38
    ld l, [hl]
    rst $38
    ld a, [hl+]
    rst $38
    jr nz, @+$01

    inc e

jr_009_70fa:
    db $e3
    ccf
    call c, $9c7f
    ld a, a
    sbc h
    ld a, a
    and e
    ld e, h
    db $e3
    inc e
    rst $38
    nop
    rst $38
    nop
    rst $38
    jr c, jr_009_70d4

    ld a, [hl]
    cp c
    ld a, [hl]
    cp c
    ld a, [hl]
    cp c
    ld a, [hl]
    rst $00
    jr c, jr_009_70de

    jr c, @+$01

    jr nz, jr_009_70fa

    ld [hl], b
    rst $28
    or l
    ld a, [hl]
    sbc e
    db $fd
    jp c, Jump_009_76ff

    rst $38
    ld d, h
    rst $38
    inc b
    rst $38
    inc b
    ei
    ld c, $f7
    xor l
    ld a, [hl]
    reti


    cp a
    ld e, e
    rst $38
    ld l, [hl]
    rst $38
    ld a, [hl+]
    rst $38
    jr nz, @+$01

    nop

jr_009_713a:
    rst $38
    ld c, $f1
    ccf
    adc $3f
    adc $3f
    adc $3f
    pop af
    ld c, $f1
    ld c, $ff
    inc e
    db $e3
    ccf
    call c, $9c7f
    ld a, a
    sbc h
    ld a, a
    and e
    ld e, h
    db $e3
    inc e
    rst $38
    nop
    rst $38
    jr nz, jr_009_713a

    ld [hl], b
    rst $28
    or l
    ld a, [hl]
    sbc e
    db $fd
    jp c, Jump_009_76ff

    rst $38
    ld d, h
    rst $38
    inc b
    rst $38
    inc b
    ei
    ld c, $f7
    xor l
    ld a, [hl]
    reti


    cp a
    ld e, e
    rst $38
    ld l, [hl]
    rst $38
    ld a, [hl+]
    rst $38
    jr nz, @+$01

    inc e

jr_009_717a:
    db $e3
    ld a, [hl]
    sbc l
    ld a, a
    sbc h
    ld a, a
    sbc h
    ld a, a
    ld [c], a
    dec e
    db $e3
    inc e
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld c, $f1
    ccf
    adc $3f
    adc $3f
    adc $3f
    pop af
    ld c, $f1
    ld c, $ff
    jr nz, jr_009_717a

    ld [hl], b
    rst $28
    or l
    ld a, [hl]
    sbc e
    db $fd
    jp c, Jump_009_76ff

    rst $38
    ld d, h
    rst $38
    inc b
    rst $38
    nop
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
    ld hl, sp+$0e
    nop
    add b
    nop
    nop
    nop
    xor c
    ld [hl], c
    or l
    ld [hl], c

jr_009_71dd:
    pop bc
    ld [hl], c
    call Call_000_0071
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    nop
    inc b
    nop
    ldh a, [$d9]
    ld [hl], c
    pop hl
    ld [hl], c
    pop af
    ld [hl], c
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    and a
    ld [hl], b
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$f0]
    ld hl, sp-$08
    ld hl, sp+$78
    cp $26
    cp $86
    db $ec
    sbc h
    ret nc

    jr nc, @-$06

    ld hl, sp-$04
    db $e4
    inc a
    db $e4
    ld hl, sp-$08
    ldh a, [rNR10]
    ldh a, [$f0]
    nop
    nop
    nop
    nop
    ld c, $0e
    rra
    rra
    rra
    rra
    rra
    ld a, [de]
    ccf
    jr z, jr_009_7276

    inc h
    rra
    inc d
    rra
    jr jr_009_727c

    daa
    ccf
    daa
    inc e
    rra
    ld [$1f0f], sp
    rra
    rrca
    rrca
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_71dd

    nop
    nop
    nop
    ld c, b
    ld [hl], d
    ld d, h
    ld [hl], d
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop

jr_009_7276:
    ld [bc], a
    nop
    ldh a, [$60]
    ld [hl], d
    ld h, h

jr_009_727c:
    ld [hl], d
    ld [hl], h
    ld [hl], d
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    ld b, $72
    nop
    nop
    nop
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$00
    nop
    add b
    nop
    nop
    nop
    adc c
    ld [hl], d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $f000
    sub l
    ld [hl], d
    sub a
    ld [hl], d
    and a
    ld [hl], d
    nop
    rrca
    ld hl, sp+$07
    ld a, [bc]
    ld [hl], $45
    nop
    nop
    nop
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
    add b
    add b
    ret nz

    ld b, b
    ldh [$e0], a
    ldh a, [rNR10]
    ld hl, sp+$08
    ld hl, sp+$38
    ld hl, sp-$38
    db $fc
    ld c, h
    ld a, [c]
    ld a, $00
    nop
    nop
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
    db $10
    rra
    inc hl
    inc a
    cpl
    inc sp
    ccf
    ld l, $3f
    ld a, $7f
    ld a, h
    ld e, a
    ld h, a
    ld a, a
    ld b, b
    ld a, a
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
    nop
    nop
    nop
    nop
    cp $1e
    db $fc
    ld h, h
    ld hl, sp+$48
    ldh a, [$f0]
    add sp, $38
    ld hl, sp+$38
    call c, $fce4
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
    nop
    nop
    ccf
    jr nz, jr_009_7370

    jr c, jr_009_7346

    inc e
    rrca
    rrca
    inc de
    rra
    ld hl, $403f
    ld a, a
    ld a, a
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_7346:
    nop
    nop
    nop
    nop
    add b
    add b
    ret nz

    ld b, b
    ldh [$e0], a
    ldh a, [rNR10]
    ld hl, sp+$08
    ld hl, sp+$38
    ld hl, sp-$38
    db $fc
    ld c, h
    ld a, [c]
    ld a, $fe
    ld e, $00
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
    db $10
    rra
    inc hl
    inc a
    cpl
    inc sp

jr_009_7370:
    ccf
    ld l, $3f
    ld a, $7f
    ld a, h
    ld e, a
    ld h, a
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ccf
    jr nz, jr_009_737f

jr_009_737f:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    ld h, h
    ld hl, sp+$48
    ldh a, [$f0]
    ldh [$60], a
    ret nc

    ld [hl], b
    sub b
    ldh a, [rNR41]
    ldh [$f0], a
    ldh a, [rP1]
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr c, @+$15

    inc e
    rrca
    rrca
    dec bc
    ld c, $13
    ld e, $11
    rra
    jr nz, jr_009_73fb

    ccf
    ccf
    ld hl, sp+$08
    nop
    nop
    nop
    ld hl, sp+$02
    nop
    ld [$0408], sp
    nop
    nop
    ld hl, sp+$06
    nop
    add b
    nop
    nop
    nop
    ld hl, sp+$08
    ld [$0000], sp
    ld hl, sp+$0a
    nop
    ld [$0c08], sp
    nop
    nop
    ld hl, sp+$0e
    nop
    add b
    nop
    nop
    nop

jr_009_73e6:
    cp [hl]
    ld [hl], e
    jp nc, Jump_000_0073

    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop

jr_009_73fb:
    nop
    ld [bc], a
    nop
    add sp, -$1a
    ld [hl], e
    ld [$fa73], a
    ld [hl], e
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    cp h
    ld [hl], d
    nop
    nop
    nop
    inc b
    nop
    ldh [$e0], a
    ld [hl], h
    db $f4
    cp $fe
    cp $fe
    cp $7e
    db $fc
    inc l
    cp $2a
    cp $02
    db $f4
    inc c
    ld hl, sp-$38
    ld hl, sp+$18
    db $fc
    db $f4
    inc e
    db $f4
    ld hl, sp+$78
    cp h
    call nz, $fcfc
    rlca
    rlca
    ld c, $0f
    rra
    rra
    rra
    ld e, $1f
    inc e
    rra
    dec e
    ccf
    dec h
    ccf
    jr nz, jr_009_7459

    jr @+$11

    inc c
    rra
    ld [de], a
    rra
    inc de
    inc c
    rrca
    dec bc
    inc c
    rra
    rra
    rrca
    rrca
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop

jr_009_7459:
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_73e6

    nop
    nop
    nop

jr_009_7469:
    ld d, c
    ld [hl], h
    ld e, l
    ld [hl], h
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [rBCPD]
    ld [hl], h
    ld l, l
    ld [hl], h
    ld a, l
    ld [hl], h
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    rrca
    ld [hl], h
    nop
    nop
    nop
    inc b
    nop
    ldh [$e0], a
    ldh a, [$f0]
    ld hl, sp-$08
    ld hl, sp+$78
    ld hl, sp+$78
    db $fc
    ld [hl], h
    cp $56
    ei
    ld c, a
    rst $30
    rra
    rst $38
    ccf
    cp $ee
    ld a, h
    and h
    cp h
    ld h, h
    inc e
    db $fc
    ld [$f8f8], sp
    ld hl, sp+$07
    rlca
    rrca
    rrca
    rra
    rra
    rra
    rra
    rra
    rra
    ccf
    cpl
    ccf
    ld a, [hl+]
    ld e, a
    ld [hl], d
    rst $28
    ld hl, sp-$01
    db $fc
    rst $38
    rst $30
    ld a, h
    ld l, e
    dec sp
    inc l
    jr nc, jr_009_750f

    rra
    db $10
    rra
    rra
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_7469

    nop
    nop
    nop

jr_009_74ec:
    call nc, $e074
    ld [hl], h
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$ec]
    ld [hl], h
    ldh a, [$74]
    nop
    ld [hl], l
    nop
    rrca
    ld hl, sp+$07

jr_009_750f:
    add hl, bc
    sub d
    ld [hl], h
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    jr nz, jr_009_753b

    add sp, -$18
    ldh a, [$f0]
    db $fc
    ld a, h
    cp $12
    cp $12
    cp $82
    db $fc
    adc h
    ret nc

    jr nc, @-$06

    ld hl, sp-$04
    db $e4
    inc a
    db $e4
    ld hl, sp-$08
    ldh a, [rNR10]
    ldh a, [$f0]
    nop
    nop
    nop
    nop

jr_009_753b:
    rlca
    rlca
    rrca
    rrca
    rra
    inc e
    ccf
    jr z, jr_009_7583

    jr z, jr_009_7585

    inc h
    rra
    inc d
    rra
    jr jr_009_758b

    daa
    ccf
    daa
    jr jr_009_7570

    rrca
    rrca
    rra
    rra
    rrca
    rrca
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_74ec

    nop
    nop
    nop
    ld d, a

jr_009_7570:
    ld [hl], l
    ld h, e
    ld [hl], l
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100

jr_009_7583:
    nop
    nop

jr_009_7585:
    ld [bc], a
    nop
    ldh a, [$6f]
    ld [hl], l
    ld [hl], e

jr_009_758b:
    ld [hl], l
    add e
    ld [hl], l
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    dec d
    ld [hl], l
    nop
    nop
    nop
    ld [$f000], sp
    ldh a, [$f8]
    ld hl, sp-$08
    ld c, b
    ld hl, sp-$48
    db $fc
    ld b, h
    db $fc
    ld d, h
    db $fc
    ld b, h
    ld hl, sp-$48
    ld hl, sp+$08
    db $f4
    call c, Call_000_1af6
    cp $fa
    ld c, h
    cp h
    ld a, b
    ld hl, sp-$44
    call nz, $fcfc
    ld e, $1e
    ccf
    ccf
    ccf
    inc a
    ccf
    ccf
    rrca
    inc c
    rra
    dec e
    ccf
    inc h
    ccf
    inc hl
    rla
    jr jr_009_75ec

    inc e
    daa
    ld a, $2f
    inc sp
    ld a, $33
    inc e
    rra
    inc de
    rra
    rra
    rra
    cp h
    cp h
    cp $fe
    cp $1e
    cp $fe
    ld hl, sp+$18
    db $fc
    ld e, h
    cp $12
    cp $e2
    db $f4
    inc c

jr_009_75ec:
    db $fc
    sbc h
    ld a, [c]
    ld a, $fa
    and $3e
    and $1c
    db $fc
    db $e4
    db $fc
    db $fc
    db $fc
    rlca
    rlca
    rrca
    rrca
    rrca
    add hl, bc
    rrca
    ld c, $1f
    ld de, $151f
    rra
    ld de, $0e0f
    rrca
    ld [$1d17], sp
    scf
    inc l
    ccf
    cpl
    add hl, de
    ld e, $0f
    rrca
    ld e, $11
    rra
    rra
    nop
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
    ld a, [de]
    db $76
    ld h, $76
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$32]
    db $76
    ld [hl], $76
    ld b, [hl]
    halt
    rrca
    ld hl, sp+$07
    add hl, bc
    sbc b
    ld [hl], l
    nop
    nop
    nop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop

jr_009_7663:
    nop
    nop
    ret nz

    ret nz

    ldh [rNR41], a
    jr nz, @-$1e

    db $10
    ldh a, [rNR10]
    ldh a, [$88]
    ld hl, sp+$08
    ld hl, sp-$74
    db $fc
    jp z, Jump_000_0a7e

    cp $82
    cp $de
    ld [hl], d
    ret nz

    ret nz

    ldh [rNR41], a
    jr nz, jr_009_7663

    db $10
    ldh a, [rNR10]
    ldh a, [$88]
    ld hl, sp+$08
    ld hl, sp-$74
    db $fc
    jp z, Jump_000_0a7e

    cp $82
    cp $de
    ld [hl], d
    inc a
    db $fc
    ldh a, [$f0]
    ld l, b
    sbc b
    ldh a, [$f0]
    ret nc

    or b
    sub e
    di
    sbc h
    rst $38
    sub b
    rst $38
    and c
    rst $38
    and e
    cp $88
    rst $38
    ld e, h
    ld [hl], a
    ld b, c
    ld a, a
    ld c, b
    ld a, a
    ld e, h
    ld [hl], a
    ld b, c
    ld a, a
    ldh a, [rIE]
    rst $38
    sbc a
    rst $28
    sbc a
    ld a, a
    ld a, a
    ld [hl], b
    ld [hl], b
    cp b
    ret z

    ld hl, sp-$78
    ld hl, sp-$78
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_76d7:
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    ld [$0000], sp
    inc b
    nop
    ld [bc], a
    nop
    nop
    ld hl, sp+$04
    nop
    db $fc
    nop
    ld b, $00
    add b
    nop

jr_009_76ef:
    nop
    nop
    nop
    rlca
    inc b
    jr nz, jr_009_76f6

jr_009_76f6:
    ld hl, sp+$02
    jr nz, jr_009_76f6

    ld [$2006], sp
    add b
    nop

Jump_009_76ff:
    nop
    nop
    db $dd
    db $76
    pop af
    halt
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    add sp, $01
    ld [hl], a
    dec b
    ld [hl], a
    dec d
    ld [hl], a
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    ld e, e
    halt
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

jr_009_7737:
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop

jr_009_7743:
    ld [$0004], sp
    nop
    ld hl, sp+$06
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_76d7

    nop
    nop
    nop
    nop
    ld [$0010], sp
    nop
    ld hl, sp+$12
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2012], sp
    nop
    ld hl, sp+$10
    jr nz, jr_009_76ef

    nop
    nop
    nop
    nop
    ld [$000c], sp
    nop
    ld hl, sp+$0e
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2006], sp
    nop
    ld hl, sp+$04
    jr nz, @-$7e

    nop
    nop
    nop
    nop
    ld [$200e], sp
    nop
    ld hl, sp+$0c
    jr nz, @-$7e

    nop
    nop
    nop
    nop
    ld [$0014], sp
    nop
    ld hl, sp+$16
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0018], sp
    nop
    ld hl, sp+$1a
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2016], sp
    nop
    ld hl, sp+$14
    jr nz, jr_009_7737

    nop
    nop
    nop
    nop
    ld [$201a], sp
    nop
    ld hl, sp+$18
    jr nz, jr_009_7743

    nop
    nop
    nop
    ld a, [hl+]
    ld [hl], a
    ld [hl], $77
    ld b, d
    ld [hl], a
    ld c, [hl]
    ld [hl], a
    ld e, d
    ld [hl], a
    ld h, [hl]
    ld [hl], a
    ld [hl], d
    ld [hl], a
    ld [hl], $77
    ld a, [hl]
    ld [hl], a
    ld b, d
    ld [hl], a
    adc d
    ld [hl], a
    ld c, [hl]
    ld [hl], a
    sub [hl]
    ld [hl], a
    and d
    ld [hl], a
    xor [hl]
    ld [hl], a
    cp d
    ld [hl], a
    nop
    nop
    ld bc, $0201
    ld [bc], a
    inc bc
    inc bc
    inc b
    dec b
    ld b, $07
    ld [$0a09], sp
    dec bc
    inc c
    rrca
    inc c
    rrca
    inc c
    rrca
    inc c
    rrca
    inc c
    rrca
    inc c
    rrca
    inc c
    rrca
    inc c
    rrca
    nop
    nop
    ld [$1000], sp
    nop
    ldh a, [$c6]
    ld [hl], a
    and $77
    ld b, $78
    nop
    rrca
    nop
    rlca
    rlca
    db $db
    ld a, c
    nop
    nop
    nop
    nop
    rrca
    nop
    nop
    nop
    ld hl, sp+$02
    nop
    ldh a, [rP1]
    inc b
    nop
    db $10
    ld hl, sp+$06
    nop
    ldh a, [rP1]
    ld [$8000], sp
    nop
    nop
    nop
    nop
    ld c, $0a
    nop
    ldh a, [rP1]
    inc c
    nop
    db $10
    ld hl, sp+$0e
    nop
    ldh a, [rP1]
    stop
    db $10
    ld hl, sp+$12
    nop
    ldh a, [rP1]
    inc d
    nop
    add b
    nop
    nop
    nop

jr_009_7851:
    dec e
    ld a, b
    dec [hl]
    ld a, b
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh [rHDMA1], a
    ld a, b
    ld d, l
    ld a, b
    ld h, l
    ld a, b
    nop
    rrca
    ld hl, sp+$07
    ld [$7d3c], sp
    nop
    nop
    nop
    inc b
    nop
    ldh [$e0], a
    ld hl, sp+$18
    db $fc
    inc b
    cp $8a
    cp $8a
    cp $72
    sbc h
    db $ec
    or $fa
    rst $38
    ld bc, $71af
    ld d, l
    ei
    adc d
    cp $f4
    inc c
    inc a
    db $fc
    sbc $e2
    db $fc
    db $fc
    rlca
    rlca
    rra
    jr jr_009_78e0

    inc h
    ld a, a
    ld b, h
    ld a, a
    ld [hl], h
    ld a, a
    ld c, b
    ld e, a
    ld h, e
    scf
    inc a
    ld c, a
    ld a, b
    ld c, a
    ld a, b
    sbc e
    db $fc
    sub h
    rst $38
    ld [hl], a
    ld a, e
    jr c, jr_009_78f7

    ld a, a
    ld a, a
    rra
    rra
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_7851

    nop
    nop
    nop

jr_009_78d4:
    cp h
    ld a, b
    ret z

    ld a, b
    nop
    ld bc, $0100
    nop
    ld bc, $0100

jr_009_78e0:
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$d4]
    ld a, b
    ret c

    ld a, b
    add sp, $78
    nop
    rrca
    ld hl, sp+$07

jr_009_78f7:
    add hl, bc
    ld a, d
    ld a, b
    nop
    nop
    nop
    inc b
    nop
    ld a, b
    ld a, b
    db $fc
    db $fc
    db $fc
    inc a
    db $fc
    inc a
    ldh a, [$b0]
    ld hl, sp-$48
    db $fc
    inc h
    db $fc
    inc b
    ld hl, sp+$08
    ldh a, [$30]
    ld hl, sp+$48
    ld hl, sp-$38
    ld hl, sp-$08
    ld hl, sp-$08
    cp h
    call nz, $fcfc
    rrca
    rrca
    rra
    rra
    rra
    add hl, de
    rra
    jr jr_009_7937

    ld a, [bc]
    rra
    ld a, [de]
    ccf
    jr z, jr_009_796d

    jr nz, jr_009_796f

    jr nz, @+$21

    dec de
    rra
    jr jr_009_7975

    inc h

jr_009_7937:
    ccf
    daa
    rra
    rra
    add hl, sp
    daa
    ccf
    ccf
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_78d4

    nop
    nop
    nop

jr_009_7957:
    ccf
    ld a, c
    ld c, e
    ld a, c
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop

jr_009_796d:
    ld [bc], a
    nop

jr_009_796f:
    ldh a, [$57]
    ld a, c
    ld e, e
    ld a, c
    ld l, e

jr_009_7975:
    ld a, c
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    db $fd
    ld a, b
    nop

jr_009_797e:
    nop
    nop
    inc b
    nop
    ldh [$e0], a
    jr jr_009_797e

    add h
    db $fc
    ld a, [c]
    ld l, [hl]
    ld a, [$fff6]
    ld e, a
    rst $38
    ld c, c
    sub a
    ld l, e
    db $fd
    rlca
    push af
    adc a
    call $ff3f
    ld [hl], l
    rst $18
    or e
    sbc [hl]
    ld [hl], d
    ld c, $fe
    db $fc
    db $fc
    rlca
    rlca
    jr @+$21

    daa
    ccf
    ld a, e
    ld e, h
    ld a, a
    ld a, a
    rst $38
    db $f4
    rst $38
    and h
    db $d3
    xor h
    ld a, a
    ld b, c
    ld e, a
    ld h, d
    rst $28
    or b
    rst $38
    cp h
    rst $20
    ei
    ld b, e
    ld a, h
    ld h, c
    ld a, [hl]
    ccf
    ccf
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$2002], sp
    nop
    ld hl, sp+$00
    jr nz, jr_009_7957

    nop
    nop
    nop
    jp nz, $ce79

    ld a, c
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$da]
    ld a, c
    sbc $79
    xor $79
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    add b
    ld a, c
    nop
    nop
    nop
    ld [$ff00], sp
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add a
    rst $38
    dec [hl]
    rst $38
    or l
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rlca
    cp $07
    cp $07
    rst $38
    inc bc
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add hl, bc
    rst $38
    ld c, c
    rst $38
    ld l, l
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ldh [$7f], a
    ldh [$7f], a

jr_009_7a42:
    ldh [rIE], a
    ret nz

    rst $38
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

jr_009_7a4e:
    ld a, a
    push af
    ld a, a
    push af
    ld a, a
    rst $30
    ld a, a
    ldh a, [$7f]
    rst $38
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    rst $38
    rlca
    cp $07
    cp $07
    rst $38
    inc bc
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
    jr nz, @-$1f

    ld [hl], b
    rst $28
    or l
    ld a, [hl]
    sbc e
    db $fd
    jp c, Jump_009_76ff

    rst $38
    ld d, h
    rst $38
    inc b
    rst $38
    nop
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
    ldh a, [rP1]
    ld a, [bc]
    nop
    db $10
    ld hl, sp+$0c
    nop
    ldh a, [rP1]
    ld c, $00
    add b
    nop
    nop
    nop
    nop
    ld [$0010], sp
    ldh a, [rP1]
    ld c, $20
    db $10
    ld hl, sp+$12
    nop
    ldh a, [rP1]
    ld a, [bc]
    jr nz, jr_009_7a42

    nop
    nop
    nop
    nop
    ld [$0014], sp
    nop
    ld hl, sp+$14
    jr nz, jr_009_7a4e

    nop
    nop
    nop
    add l
    ld a, d
    sub c
    ld a, d
    sbc l
    ld a, d
    or c
    ld a, d
    push bc
    ld a, d
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a

jr_009_7af4:
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    nop
    nop
    nop
    nop
    ld [$1000], sp
    nop
    dec b
    nop
    ldh [$d1], a
    ld a, d
    db $db
    ld a, d
    dec bc
    ld a, e
    nop
    rrca
    ld hl, sp+$07
    ld [$7e9e], sp
    nop
    nop
    nop
    stop
    ld [hl], b
    sub b
    jr c, jr_009_7af4

    inc a
    call z, $cc3c
    ld a, [hl]
    sub d
    rst $38
    inc sp
    ei
    rst $30
    rst $38
    push hl
    rst $30
    dec c
    db $dd
    dec sp
    db $fd
    db $e3
    push af
    dec bc
    ld [c], a
    ld e, $e2
    ld e, $cc
    inc a
    ldh a, [$f0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$f0]
    ld hl, sp+$08
    db $fc
    ld d, h
    db $fc
    ld d, h
    jp c, $0226

    cp $fe
    cp $3c
    call nz, $fc7c
    ld b, $07
    dec de
    dec e
    cpl
    ld sp, $273a
    ld [hl], h
    ld c, a
    db $fc
    rst $08
    rst $18
    rst $28
    rst $38
    and a
    rst $28
    or b
    cp e
    call c, $c7bf
    xor a
    ret nc

    ld b, a
    ld a, b
    ld b, a
    ld a, b
    inc sp
    inc a
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

jr_009_7b94:
    nop
    nop
    inc bc
    inc bc
    inc b
    rlca
    ld [$100f], sp
    rra
    db $10
    rra
    ld de, $101f
    rra
    ld [$080f], sp
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
    add b
    nop
    ld b, b
    ld a, b
    ld sp, hl
    jr c, jr_009_7b94

    inc a
    call z, $cc3c
    ld a, [hl]
    sub d
    rst $38
    inc sp
    ei
    rst $30
    rst $38
    push hl
    rst $30
    dec c
    db $dd
    dec sp
    db $fd
    db $e3
    push af
    dec bc
    ld [c], a
    ld e, $e2
    ld e, $cc
    inc a
    ldh a, [$f0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$f0]
    ld hl, sp-$68
    call c, $0224
    cp $fe
    ld a, d
    cp $fe
    cp $fa
    ldh [$fe], a
    db $fc
    ei
    inc a
    push bc
    nop
    nop
    nop
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
    inc b
    add hl, bc
    ld c, $10
    rra
    ld de, $131f
    rra
    rla
    rra
    dec de
    rra
    ld [$0c0f], sp
    rrca
    nop
    ld [$0000], sp
    ldh a, [rP1]
    ld [bc], a
    nop
    db $10
    ld hl, sp+$04
    nop
    ldh a, [rP1]
    ld b, $00
    add b
    nop
    nop
    nop
    ldh a, [rNR10]
    ld [$1000], sp
    ld hl, sp+$0a
    nop
    ldh a, [rP1]
    inc c
    nop
    db $10
    ld hl, sp+$04
    nop
    ldh a, [rP1]
    ld c, $00
    add b
    nop
    nop
    nop
    jr z, jr_009_7cd2

    inc a
    ld a, h
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh [rHDMA4], a
    ld a, h
    ld e, b
    ld a, h
    ld l, b
    ld a, h
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    ld h, $7b
    nop
    nop
    nop
    stop
    db $f4
    adc h
    and h
    call c, Call_009_7ccc
    ld hl, sp-$48
    db $fc
    and h
    db $fc
    inc b
    db $f4
    inc c
    ld hl, sp+$58
    db $fc
    sbc h
    ld a, [c]
    ld a, $ff
    ld a, e
    cp a
    ld sp, hl
    ld e, $fe
    cp $fe
    ld l, a
    pop af
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
    jr jr_009_7cc1

    jr z, jr_009_7ce3

    ld a, b
    ld c, b
    adc b
    ld hl, sp-$10
    or b
    ldh a, [rNR10]
    db $10
    ldh a, [$60]
    ldh [$c0], a
    ret nz

    ldh a, [$30]
    add sp, $58
    db $f4
    adc h
    ld a, [de]
    rla

jr_009_7cc1:
    rla
    rra
    rrca
    ld [$0e0d], sp
    rra
    jr @+$01

    ldh a, [rIE]

Call_009_7ccc:
    sub c
    rst $38
    rst $18
    ld l, a
    ld a, l
    cpl

jr_009_7cd2:
    jr c, @+$21

    inc e
    rrca
    rrca
    ld c, $0f
    inc bc
    inc bc
    rlca
    inc b
    rlca
    rlca
    nop
    nop
    nop
    nop

jr_009_7ce3:
    nop
    nop
    nop
    nop
    nop
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
    ld bc, $0101
    rlca
    rlca
    rrca
    add hl, bc
    rra
    dec d
    rra
    ld [de], a
    add sp, $18
    ld c, b
    cp b
    sbc b
    ld hl, sp-$10
    ld [hl], b
    ld hl, sp+$48
    ld hl, sp+$08
    add sp, $18
    ldh a, [$b0]
    db $fc
    inc a
    ld a, [c]
    ld a, [hl]
    cp a
    ei

jr_009_7d15:
    ccf
    ld sp, hl
    rra
    cp $ff
    cp $6f
    pop af
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
    jr nc, jr_009_7d59

    ld d, b
    ld [hl], b
    ldh a, [$90]
    db $10
    ldh a, [$e0]
    ld h, b
    ldh [rNR41], a
    jr nz, jr_009_7d15

    ret nz

    ret nz

    add b

jr_009_7d38:
    add b
    ldh [$60], a
    ret nc

    or b
    add sp, $18
    dec [hl]
    cpl
    cpl
    ccf
    rra
    db $10
    dec de
    dec e
    ccf
    ld sp, $e0ff
    rst $38

jr_009_7d4c:
    and d
    rst $38
    cp $7f
    ld a, e
    ccf
    jr nc, jr_009_7d73

    jr jr_009_7d65

    rrca
    ld c, $0f

jr_009_7d59:
    inc bc
    inc bc
    rlca
    inc b
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop

jr_009_7d65:
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

jr_009_7d73:
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    rrca
    rrca
    rra
    ld [de], a
    ccf
    ld a, [hl+]
    ccf
    dec h
    nop
    ld [$0000], sp
    ldh a, [rP1]
    ld [bc], a
    nop
    db $10
    ld hl, sp+$04
    nop
    ldh a, [rP1]
    ld b, $00
    add b
    nop
    nop
    nop
    nop
    ld [$0008], sp
    ldh a, [rP1]
    ld a, [bc]
    nop
    db $10
    ld hl, sp+$0c
    nop
    ldh a, [rP1]
    ld c, $00
    add b

jr_009_7da4:
    nop
    nop
    nop
    nop
    ld [$200c], sp
    ldh a, [rP1]
    ld c, $20
    db $10
    ld hl, sp+$08
    jr nz, jr_009_7da4

    nop
    ld a, [bc]
    jr nz, jr_009_7d38

jr_009_7db8:
    nop
    nop
    nop
    nop
    ld [$2004], sp
    ldh a, [rP1]
    ld b, $20
    db $10
    ld hl, sp+$00
    jr nz, jr_009_7db8

    nop
    ld [bc], a
    jr nz, jr_009_7d4c

    nop
    nop
    nop
    ld a, a
    ld a, l
    sub e
    ld a, l
    ld a, a
    ld a, l
    sub e
    ld a, l
    and a
    ld a, l
    cp e
    ld a, l
    and a
    ld a, l
    cp e
    ld a, l
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    nop
    ld [$e000], sp
    rst $08
    ld a, l
    rst $18
    ld a, l
    rst $28
    ld a, l
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    ld a, l
    ld a, h
    nop
    nop
    nop
    ld b, $00
    ldh a, [$f0]
    ld hl, sp+$18
    db $fc
    inc c
    cp $12
    cp $82
    ld a, [$fc86]
    inc c
    ld hl, sp+$18
    db $f4
    inc e
    db $e4
    inc a
    db $e4
    ld a, h
    db $f4
    sbc h
    ld hl, sp-$68
    ld hl, sp-$08
    sbc h
    db $e4
    db $fc
    db $fc
    inc bc
    inc bc
    rlca
    inc b
    rrca
    ld [$080f], sp
    rra
    inc d
    rra
    inc d
    rrca
    ld [$121f], sp
    ld a, $3f
    ld l, e
    ld a, h
    ld c, l
    ld a, [hl]
    ld e, a
    ld [hl], a
    ccf
    inc sp
    rrca
    rrca
    inc e
    inc de
    rra
    rra
    inc bc
    inc bc
    rlca
    inc b
    rrca
    ld [$080f], sp
    rra
    inc d
    rra
    inc d
    rrca
    ld [$121f], sp
    ld e, $1f
    dec hl
    inc a
    dec h
    ld a, $2f
    dec sp
    rra
    dec de
    rrca
    rrca
    inc e
    inc de
    rra
    rra
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$02
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$04
    nop
    add b
    nop
    nop
    nop
    ld h, [hl]
    ld a, [hl]
    ld [hl], d
    ld a, [hl]
    nop
    ld bc, $0100
    nop
    ld bc, $0100

jr_009_7e8a:
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    nop
    ld [bc], a
    nop
    ldh a, [$7e]

jr_009_7e98:
    ld a, [hl]
    add d
    ld a, [hl]
    sub d
    ld a, [hl]
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    inc b
    ld a, [hl]
    nop
    nop
    nop
    ld [$3000], sp
    rst $08
    ld l, h
    sub e
    jp Jump_000_003c


    rst $38
    ldh [$1f], a
    inc sp
    call z, $e31c
    nop
    rst $38
    jr nc, jr_009_7e8a

    ld l, h
    sub e
    jp Jump_000_003c


    rst $38
    ldh [$1f], a
    inc sp
    call z, $e31c
    nop
    rst $38
    pop af
    ld c, $1f
    ldh [rP1], a
    rst $38
    jr c, jr_009_7e98

    call z, $0733
    ld hl, sp+$00
    rst $38
    ldh [$1f], a
    pop af
    ld c, $1f
    ldh [rP1], a
    rst $38
    jr c, @-$37

    call z, $0733
    ld hl, sp+$00
    rst $38
    ldh [$1f], a
    inc bc
    db $fc
    add $39
    inc a
    jp $ff00


    ld c, $f1
    inc sp
    call z, Call_000_3ec1
    nop
    rst $38
    inc bc
    db $fc
    add $39
    inc a
    jp $ff00


    ld c, $f1
    inc sp
    call z, Call_000_3ec1
    nop
    rst $38
    nop
    rst $38
    inc c
    di
    dec de
    db $e4
    ldh a, [rIF]
    nop
    rst $38
    add e
    ld a, h
    call z, Call_009_7033
    adc a
    nop
    rst $38
    inc c
    di
    dec de
    db $e4
    ldh a, [rIF]
    nop
    rst $38
    add e
    ld a, h
    call z, Call_009_7033
    adc a
    nop
    ld [$0000], sp
    nop
    ld hl, sp+$00
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0002], sp
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
    ld hl, sp+$04
    nop
    add b
    nop
    nop
    nop
    nop
    ld [$0006], sp
    nop
    ld hl, sp+$06
    nop
    add b
    nop
    nop
    nop
    add hl, hl
    ld a, a
    dec [hl]
    ld a, a
    ld b, c
    ld a, a
    ld c, l
    ld a, a
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    nop
    inc b
    nop
    ldh a, [$59]
    ld a, a
    ld h, c
    ld a, a
    ld [hl], c
    ld a, a
    nop
    rrca
    ld hl, sp+$07
    add hl, bc
    and a
    ld a, [hl]
    nop
    nop
    nop
    dec h
    ld [de], a
    ld bc, $0019
    nop
    rst $38
    rst $38
    ld a, [de]
    nop
    ld a, a
    sbc d
    nop
    ld bc, $ffff
    ld bc, $7f09
    db $eb
    ld a, [de]
    nop
    ld a, a
    and [hl]
    nop
    nop
    nop
    nop
    ld bc, $7f09
    xor [hl]
    ld d, l
    ld h, a
    inc d
    add hl, bc
    inc b
    ld d, e
    add h
    db $10
    ld a, [de]
    nop
    ld a, a
    cp d
    nop
    ld bc, $0000
    dec b
    add hl, bc
    ld a, a
    jp nz, $6755

    ld a, h
    add hl, bc
    inc b
    ld d, e
    add h
    db $10
    ld a, [de]
    nop
    ld a, a
    adc $00
    inc c
    nop
    nop
    dec b
    add hl, bc
    ld a, a
    sub $55
    ld h, a
    ld a, [$0409]
    ld d, e
    add h
    db $10
    ld a, [de]
    nop
    ld a, a
    ld [c], a
    nop
    dec bc
    nop
    nop
    ld bc, $7f09
    ld [$6855], a
    ld h, d
    add hl, bc
    inc b
    ld d, e
    add h
    stop
    add hl, de
    nop
    nop
    rst $38
    rst $38
    ld a, [de]
    nop
    ld a, a
    db $fc
    nop
    ld [bc], a
    rst $38
    rst $38
    ld bc, $7f09
    rst $38
    ld e, a
    stop
    nop
