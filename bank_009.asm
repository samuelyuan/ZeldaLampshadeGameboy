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

bank009_4186:
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

bank009_49de:
    db $25, $12, $04, $40, $00

    db "You pulled the\n" ; 0x49e3
    db "plug...", $00

    db $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44, $07
    db $01, $45, $fe, $12, $00, $44, $03, $01, $21, $01, $c6, $0d, $57, $01, $14, $00
    db $00, $ff, $fc, $14, $06, $00, $ff, $fd, $14, $07, $00, $ff, $fe, $35, $ff, $fc
    db $32, $02, $ff, $fc, $27, $03, $02
    
    db $09, $f0, $5c, $00 ; bank 9 0x5cf0 DefeatedLampshadeBossScreen
    
bank009_4a35:
    db $25, $40, $00
    
    db "A sinister looking\n"
    db "well..."

    nop
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
    
    db "Wow, that was\n"
    db "easy..."

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
    ld bc, $2500
    ld [de], a
    inc b
    ld b, b
    nop

    db "You got the\n"
    db "Mystical Lampshade!"
    
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
    
    db "You'll need to\n" ; 0x4ad6
    db "take it to the"

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

    db "Temple of Light\n" ; 0x4b03
    db "to the North."

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
    db $09, $91, $61, $00 ; bank 9 0x6191 Well

    ; 0x4b6d
    db $25, $40, $00

    ; 0x4b70
    db "We might be\n"
    db "stamping down on\n"
    db "prices,"
    
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

    db "but we don't seem\n"
    db "to sell any PCs!"

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

jr_009_4bdc:
    ld b, h
    inc bc
    db $01, $00

    ; 0x4be0
    db $25, $40, $00
    
    db "I'm not a plot\n"
    db "character, but I'm\n"
    db "still in the game!"

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

jr_009_4c24:
    rst $38
    nop
    ld b, h
    rlca
    db $01, $40, $00
    
    db "Power to the NPC!"

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

jr_009_4c4d:
    nop
    ld b, h
    inc bc
    
    db $01, $00

    ; bank 9: 0x4c52
    db $25, $40, $00
    
    db "Enjoy the movie!"

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

jr_009_4c75:
    rlca
    ld bc, $0040
    
    db "... mmmm popcorn"

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

    db "North:\n"
    db "Temple of Light"

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

    db "West:\n"
    db "Graveyard"

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
    db $01, $00
    
    ; bank 9 0x4cf1
    db $25, $40, $00
    
    db "I'm Gerkinman."

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
    
    db "Revel in my\n"
    db "weirdery."
    
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
    db $01, $00

    ; bank 9 0x4d41
    db $25, $40, $00

    db "There used to be\n"
    db "a FROG in this\n"
    db "pond..."
    
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

    db "but it ran away!"

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
    db $01, $00

    ; bank 9 0x4da5
    db $25, $40, $00
    
    db "Hi, I'm Richie\n"
    db "Zirbes."
    
    nop
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
    
    db "I'm working really\n"
    db "hard on PK4 and\n"
    db "the PK: Game."

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
    db $01, $00

    ; bank 9 0x4e18
    db $25, $12, $05, $1a, $00, $4e, $27, $00, $07, $00, $00, $02, $09, $4e, $57, $40, $00
    
    db "Aww...\n"
    db "he's asleep..."
    
    nop
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
    
    db "Oh dear..."

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
    
    db "Maybe this taser\n"
    db "will wake him up..."

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
    
    ; bank 9 0x4f45
    db $25, $40, $00
    
    db "Welcome to the top\n"
    db "secret NG\n"
    db "headquarters."

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
    
    db "We finally set up\n"
    db "an office."

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
    ld bc, $0040

    db "YOINK!"

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

jr_009_4fc5:
    ld bc, $fe45

jr_009_4fc8:
    ld [de], a
    nop
    ld b, h
    inc bc

jr_009_4fcc:
    db $01, $00
    
    ; bank 9 0x4fce
    db $25, $40, $00
    
    db "Mmm, that burger\n"
    db "was dead tasty!"

jr_009_4ff0:
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

jr_009_5005:
    ld [de], a
    nop
    ld b, h
    inc bc
    db $01, $00

    ; bank 9 0x500b
    db $25
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
    
    db "That water didn't\n"
    db "wake him up,"

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
    
    db "he needs to be\n"
    db "shocked awake..."

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
    
    db "North:\n"
    db "Temple of Light"

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
    
    db "South:\n"
    db "Town"

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

    db "Good night!"

    nop
    ld b, a

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

    db "Old 'Sonic the\n"
    db "Comic's are piled\n"
    db "against the wall"

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

    db "A single book lies\n"
    db "in the bookcase."

    nop
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

    db "'The official cheat\n"
    db "guide to life:"

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
    
    db "with pull out\n"
    db "secret section'"

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
    
    db "Good night!"

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

bank009_5296:
    INCBIN "gfx/bank009_5296.2bpp"
    
Palette1::
    db $ff, $d0, $e0
    
GraveyardDialogue:: ; 0x5329
    db $20, $00, $04, $00, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $09, $0e, $6f ; points to bank 9: 0x6f0e dante
    db $07, $a4, $4b ; points to bank 7: 0x4ba4 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $00, $01, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $0a, $9b, $45 ; bank 0a: 0x459b
    db $0a, $37, $41 ; bank 0a: 0x4137 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $00, $02, $00, $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $3f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $09, $fc, $73 ; points to bank 9: 0x73fc heihachi
    db $07, $ec, $4d ; points to bank 7: 0x4dec dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $00, $05, $80, $07, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $09, $a9, $72 ; bank 9: 0x72a9 Grave cover
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

GraveyardEntry::    ; bank 9 0x5461 
    db $14, $12, $00
    db $06, $03, $00, $05
    db $00, $09, $0a, $78
    db $0a, $97, $41 ; bank 0a: 0x4197 tiles
    db $08, $79, $5d ; bank 8 0x5d79 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $52, $5a, $00
    db $00, $00
    db $07, $05, $5c ; bank 7 0x5c05 sprites
    db $09, $29, $53 ; bank 9 0x5329 dialogue match
    db $0a, $cd, $42, $00 ; bank 0a 0x42cd transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
PCWorldDialogue:: 
    db $20, $00, $04, $80, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $0a, $9b, $45 ; bank 0a 0x459b
    db $0a, $67, $41 ; bank 0a 0x4167

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $00, $05, $80, $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $1f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $09, $6d, $79 ; points to bank 9: 0x796d rubberninja
    db $09, $6d, $4b ; points to bank 9: 0x4b6d dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $00, $02, $00, $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $09, $02, $75 ; points to bank 9: 0x7502 jen
    db $09, $e0, $4b ; points to bank 9: 0x4be0 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
PCWorldEntry::    ; bank 9 0x55a0 
    db $14, $12, $00
    db $05, $02, $00, $04
    db $00, $09, $0a, $78
    db $0a, $07, $42  ; bank 0a: 0x4207 tiles
    db $08, $e1, $5e ; bank 8: 0x5ee1 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $14, $5c, $00
    db $00, $00
    db $0a, $e5, $42 ; bank 0a 0x42e5 sprites
    db $09, $9c, $54
    db $0a, $f1, $42, $00 ; 0x42f1 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

McdonaldsDialogue::  ; 0x55db
    db $20, $00, $05, $80
    db $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $1f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $94, $7e ; bank 9: 0x7e94 mcdonald's worker
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $01, $80
    db $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $f0, $79 ; bank 9: 0x79f0 samus
    db $07, $e0, $56 ; bank 7: 0x56e0
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
McdonaldsEntry::    ; bank 9 0x56ab 
    db $14, $12, $00
    db $04, $02, $00, $03
    db $00, $09, $0a, $78
    db $0a, $15, $42  ; bank 0a: 0x4215 tiles
    db $08, $49, $60 ; bank 8 0x6049 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $95, $5d, $00
    db $00, $00
    db $0a, $01, $43  ; bank 0a 0x4301 sprites
    db $09, $db, $55
    db $0a, $0a, $43, $00 ; bank 0a 0x430a transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

JRInsideDialogue:: ; 0x56e6
    db $20, $00, $03, $80
    db $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $1f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $ea, $78 ; points to bank 9: 0x78ea richie
    db $09, $a5, $4d ; points to bank 9: 0x4da5 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $02, $00
    db $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $17, $77 ; points to bank 9: 0x7717 kirby
    db $07, $e6, $49 ; points to bank 7: 0x49e6 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
JRInsideEntry::    ; 0x57b6 
    db $14, $12, $00
    db $04, $01, $00, $03
    db $00, $09, $0a, $78
    db $0a, $31, $42  ; bank 0a: 0x4231 tiles
    db $08, $b1, $61 ; bank 8 0x61b1 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $16, $5f, $00
    db $00, $00
    db $0a, $1a, $43 ; bank 0a 0x431a sprites
    db $09, $e6, $56
    db $0a, $23, $43, $00 ; bank 0a 0x4323 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
JTHouseInsideDialogue:: ; 0x57f1
    db $20, $00, $01, $80
    db $07, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $d6, $6c ; bank 9: 0x6cd6
    db $09, $cf, $50 ; bank 9: 0x50cf
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $01, $80
    db $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $d6, $6c ; bank 9: 0x6cd6
    db $09, $29, $52 ; bank 9: 0x5229
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $04, $80
    db $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $ad, $6e ; points to bank 9: 0x6ead dan
    db $07, $d3, $55 ; points to bank 7: 0x55d3 dialogue (JT's house)
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $04, $00
    db $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $9b, $45 ; bank 0a; 0x459b
    db $09, $8a, $51 ; bank 9: 0x518a
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
JTHouseInsideEntry::    ; 0x5929 
    db $14, $12, $00
    db $06, $01, $00, $04
    db $00, $09, $0a, $78
    db $0a, $a5, $41  ; bank 0a: 0x41a5 tiles
    db $08, $19, $63 ; bank 8 0x6319 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $97, $60, $00
    db $00, $00
    db $0a, $2b, $43 ; bank 0a 0x432b sprites
    db $09, $f1, $57
    db $0a, $37, $43, $00 ; bank 0a 0x4337 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
DimHouseInsideDialogue:: ; 0x5964
    db $20, $00, $03, $80, $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $09, $d1, $6f ; points to bank 9: 0x6fd1 dim
    db $06, $9f, $57 ; points to bank 9: 0x579f
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $00, $04, $00, $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $0a, $9b, $45 ; bank 0a: 0x459b sign
    db $09, $3c, $51 ; bank 9: 0x513c message on the sign
 
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
DimHouseInsideEntry::    ; bank 9 0x5a34 
    db $14, $12, $00
    db $04, $01, $00, $03
    db $00, $09, $0a, $78
    db $0a, $cf, $41  ; points to bank 0a: 0x41cf tiles
    db $08, $81, $64 ; bank 8 0x6481 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $18, $62
    db $00, $00, $00
    db $0a, $3f, $43 ; bank 0a 0x433f sprites
    db $09, $64, $59 ; bank 9 0x5964 dialogue match
    db $0a, $48, $43, $00 ; bank 0a 0x4348 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
RoomBeforeLampshadeBossEntry::    ; bank 9 0x5a6f 
    db $14, $12, $00
    db $00, $01, $00, $00
    db $00, $09, $0a, $78
    db $0a, $77, $42  ; points to bank 0a: 0x4277 tiles
    db $08, $e9, $65 ; bank 8 0x65e9 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $03, $e1, $7f
    db $00, $00, $00
    db $00, $00, $00 ; no sprites
    db $00, $00, $00 ; no dialogue match
    db $0a, $50, $43, $00 ; bank 0a 0x4350 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
LampshadeBossRoomDialogue:: ; 0x5aaa
    db $20, $00, $06, $80
    db $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $9b, $45 ; bank 0a: 0x459b sign
    db $09, $de, $49 ; bank 9 0x49de message "You pulled the plug"
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $02, $80
    db $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
        
    db $09, $94, $70 ; points to bank 9 0x7094 lampshade boss
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $03, $80
    db $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $9b, $45 ; bank 0a: 0x459b sign
    db $06, $ef, $59 ; bank 6 0x59ef
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

LampshadeBossRoomSceneInit:: ; 0x5b46
    db $25, $12, $01, $58, $45, $0d, $0a, $01, $59, $0f, $01
    
    db $60, $00, $7f, $9f, $04 ; bank 4 0x7f9f lampshade boss music

    db $14, $00, $01, $ff, $ff, $0d, $ff, $ff, $00, $55, $af, $02, $21, $0f, $c6, $0d
    db $57, $03, $40, $00

    db "LAMPSHADE GUARDIAN" ; 0x5b6a

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "INVINCIBLE SEWER\n" ; 0x5b90
    db "DEMON"

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00

LampshadeBossRoomEntry::    ; 0x5bbc 
    db $14, $12, $00
    db $03, $00, $00, $02
    db $00, $09, $0a, $78
    db $0a, $69, $42  ; points to bank 0a: 0x4269 tiles
    db $08, $51, $67 ; bank 8 0x6751 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $09, $46, $5b ; bank 9 0x5b46 scene init
    db $00, $00, $00
    db $08, $b9, $68 ; bank 8 0x68b9 sprites
    db $09, $aa, $5a ; bank 9 0x5aaa dialogue match
    db $00, $00, $00, $00 ; no transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
DefeatedLampshadeBossDialogue:: ; 0x5bf7
    db $20, $00, $06, $80
    db $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $9b, $45 ; bank 0a: 0x459b sign
    db $09, $6c, $4a ; bank 9 0x4a6c dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $03, $00
    db $00, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d ; bank 8: 0x7d29 item
    db $09, $9e, $4a ; bank 9 0x4a9e message to receive mystical lampshade
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
bank009_5c93: ; related to DefeatedLampshadeBossScreen
    db $25, $12, $05, $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc, $61, $14, $00
    db $02, $ff, $fc, $3e, $08, $ff, $fc, $14, $00, $01, $ff, $fb, $0d, $ff, $fb, $00
    db $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $14, $00, $1e, $ff, $fb, $0d, $ff
    db $fb, $00, $55, $af, $02, $14, $00, $02, $ff, $fc, $14, $03, $80, $ff, $fd, $14
    db $06, $00, $ff, $fe, $14, $00, $00, $ff, $ff, $30, $ff, $fc, $00
    
DefeatedLampshadeBossScreenEntry::    ; 0x5cf0 
    db $14, $12, $00
    db $03, $00, $00, $02
    db $00, $09, $0a, $78
    db $0a, $5b, $42  ; bank 0a: 0x425b tiles
    db $08, $bf, $68 ; bank 0x68bf collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $09, $93, $5c, $00
    db $00, $00
    db $0a, $58, $43 ; bank 0a 0x4358 sprites
    db $09, $f7, $5b
    db $00, $00, $00, $00 ; no transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

TempleLightOutsideDialogue:: ; 0x5d2b
    db $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
TempleLightOutsideEntry::    ; 0x5d93 
    db $14, $12, $00
    db $02, $02, $00, $01
    db $00, $09, $0a, $78
    db $0a, $93, $42 ; bank 0a: 0x4293 tiles
    db $08, $27, $6a ; bank 8 0x6a27 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $99, $63, $00
    db $00, $00
    db $0a, $5e, $43 ; bank 0a 0x435e sprites
    db $09, $2b, $5d ; bank 9 0x5d2b dialogue match
    db $0a, $61, $43, $00 ; bank 0a 0x4361 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
TempleLightInsideDialogue:: ; 0x5dce
    db $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $08, $29, $7d
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $03, $00
    db $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
TempleLightInsideSceneInit:: ; 0x5e36
    db $25, $12, $04, $14, $00, $01, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    
    db $60, $00, $6e, $b1, $02 ; bank 2 0x6eb1 intro music
    
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01
    db $c6, $0d, $57, $03, $00
    
TempleLightInsideEntry::    ; 0x5e6b 
    db $14, $12, $00
    db $02, $02, $00, $01
    db $00, $09, $0a, $78    
    db $0a, $85, $42 ; bank 0a: 0x4285 tiles
    db $08, $8f, $6b ; bank 8 0x6b8f collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $09, $36, $5e ; bank 9 0x5e36 scene init
    db $00, $00, $00
    db $0a, $71, $43 ; bank 0a 0x4371 sprites
    db $09, $ce, $5d ; bank 9 0x5dce dialogue match
    db $0a, $74, $43, $00 ; bank 0a 0x4374 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
JTHouseOutsideDialogue:: ; 0x5ea6
    db $20, $00, $02, $80
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $3f, $40, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $13, $7b ; points to bank 9: 0x7b13 JT
    db $09, $18, $4e ; points to bank 9: 0x4e18 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $03, $80
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $ad, $6e ; points to bank 9: 0x6ead dan
    db $09, $0b, $50 ; points to bank 9: 0x500b dialogue (JT house Outside)
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d ; points to bank 8: 0x7d29 items
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d ; points to bank 8: 0x7d29 items
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

JTHouseOutsideEntry:: ; bank 9 0x5f76 
    db $14, $12, $00
    db $04, $04, $00, $03
    db $00, $09, $0a, $78
    db $0a, $b3, $41  ; bank 0a: 0x41b3 tiles
    db $08, $f7, $6c ; bank 8 0x6cf7 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $1a, $65, $00
    db $00, $00
    db $0a, $84, $43 ; bank 0a 0x4384 sprites
    db $09, $a6, $5e ; bank 9 0x5ea6 dialogue match
    db $0a, $8d, $43, $00 ; bank 0a 0x438d transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

TitleScreenSceneInit:: ; 0x5fb1
    db $25, $12, $04, $76, $00, $02, $00, $00, $00, $00
    
    db $60, $00, $6e, $b1, $02 ; bank 2 0x6eb1 intro music
    
    db $14, $00, $00, $ff, $fc, $33, $ff, $fc, $55
    
    ; 0x5fc9
    db $44, $c3, $0a ; bank 0a 0x44c3
    
    db $04, $53, $84, $10, $14
    db $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57
    db $03, $00
    
TitleScreenEntry:: ; bank 09: 0x5fe3
    db $14, $12, $05
    db $00, $00, $00, $00
    db $00, $09, $0a, $78
    db $0a, $af, $42  ; bank 0a: 0x42af tiles
    db $08, $5f, $6e ; bank 8 0x6e5f collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $09, $b1, $5f ; bank 9 0x5fb1 scene init
    db $00, $00, $00 
    db $00, $00, $00 ; no sprites
    db $00, $00, $00 ; no dialogue match
    db $00, $00, $00, $00 ; no transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
GameFinishedScreenEntry:: ; 0x601e
    db $14, $12, $00
    db $00, $00, $00, $00
    db $00, $09, $0a, $78
    db $0a, $a1, $42  ; bank 0a: 0x42a1 tiles
    db $08, $c7, $6f ; bank 8 0x6fc7 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $0a, $ad, $43, $00
    db $00, $00
    db $00, $00, $00
    db $00, $00, $00
    db $00, $00, $00, $00
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

WellDialogue:: ; 0x6059
    db $20, $00, $06, $80
    db $01, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $70, $45 ; points to bank 0a: 0x4570 sign
    db $01, $ad, $61 ; points to bank 1: 0x61ad dialogue "Welcome To Hyscule"
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $03, $80
    db $06, $00, $f8, $17, $e8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $c9, $45 ; points to bank 0a 0x45c9 well
    db $09, $35, $4a ; points to bank 9: 0x4a35 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $01, $80
    db $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $9b, $45 ; points to bank 0a: 0x459b sign
    db $09, $9f, $4c ; points to bank 9: 0x4c9f dialogue "North: Temple of Light"
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $03, $80
    db $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $ad, $6e ; points to bank 9: 0x6ead dan
    db $02, $a4, $63 ; points to bank 9: 0x63a4 dialogue (well)
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d ; points to bank 8: 0x7d29 items
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d ; points to bank 8: 0x7d29 items
    db $00, $00, $00
 
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
WellEntry:: ; bank 9 0x6191
    db $14, $12, $00
    db $06, $03, $00, $05
    db $00, $09, $0a, $78
    db $0a, $c1, $41  ; bank 0a: 0x41c1 tiles
    db $08, $2f, $71 ; bank 8 0x712f collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $eb, $66 ; bank 7 0x66eb scene init
    db $00, $00, $00
    db $0a, $d3, $43 ; bank 0a 0x43d3 sprites
    db $09, $59, $60
    db $0a, $e2, $43, $00 ; bank 0a: 0x43e2 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
DimHouseOutsideDialogue:: ; 0x61cc
    db $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

DimHouseOutsideEntry:: ; 0x6234 
    db $14, $12, $00
    db $02, $03, $00, $01
    db $00, $09, $0a, $78
    db $0a, $dd, $41 ; bank 0a: 0x41dd tiles
    db $08, $97, $72 ; bank 8 0x7297 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $99, $68, $00
    db $00, $00
    db $0a, $fa, $43 ; bank 0a 0x43fa sprites
    db $09, $cc, $61 ; bank 9 0x61cc dialogue match
    db $0a, $fd, $43, $00 ; bank 0a 0x43fd transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

NgHeadquartersOutsideDialogue:: ; 0x626f    
    db $20, $00, $02, $80, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $6a, $7c ; points to bank 9: 0x7c6a snake
    db $07, $05, $50 ; points to bank 7: 0x5005 dialogue

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $20, $80, $08, $00, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
NgHeadquartersOutsideEntry:: ; 0x630b 
    db $14, $12, $00
    db $03, $03, $00, $02
    db $00, $09, $0a, $78
    db $0a, $f9, $41  ; bank 0a: 0x41f9 tiles
    db $08, $ff, $73 ; bank 8 0x73ff collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $1a, $6a, $00
    db $00, $00
    db $0a, $15, $44 ; bank 0a 0x4415 sprites
    db $09, $6f, $62 ; bank 9 0x626f dialogue match
    db $0a, $1b, $44, $00 ; bank 0a: 0x441b transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
   
OutsideShopEntry:: ; bank 9 0x6346 
    db $14, $12, $00
    db $09, $06, $00, $07
    db $00, $09, $0a, $78
    db $0a, $23, $42  ; bank 0a: 0x4223 tiles
    db $08, $67, $75 ; bank 8 0x7567 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $6f, $6d, $00
    db $00, $00
    db $0a, $33, $44 ; bank 0a: 0x4433 sprites
    db $07, $9b, $6b ; bank 7: 0x6b9b dialogue match
    db $0a, $48, $44, $00 ; bank 0a: 0x4448 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
JROutsideDialogue:: ; 0x6381
    db $20, $00, $03, $80
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $73, $7f ; points to bank 9: 0x7f73 pond
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $04, $80
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $1f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
   
    db $09, $85, $75 ; points to bank 9: 0x7585 joey
    db $09, $41, $4d ; points to bank 9: 0x4d41 dialogue

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $02, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $09, $48, $76 ; points to bank 9: 0x7648 john
    db $09, $ce, $4f ; points to bank 9: 0x4fce dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
JROutsideEntry:: ; bank 9 0x6485 
    db $14, $12, $00
    db $05, $03, $00, $04
    db $00, $09, $0a, $78
    db $0a, $3f, $42  ; points to bank 0a: 0x423f tiles
    db $08, $cf, $76 ; bank 8 0x76cf collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $58, $6f, $00
    db $00, $00
    db $0a, $78, $44
    db $09, $81, $63
    db $0a, $84, $44, $00
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
BridgeDialogue:: ; 0x64c0
    db $20, $00, $05, $80
    db $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $0a, $9b, $45 ; points to bank 0a: 0x459b sign
    db $09, $81, $50 ; points to bank 9 0x5081 dialogue "North: Temple of Light"
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $03, $80
    db $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $40, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $67, $78 ; points to bank 9: 0x7867 randy
    db $07, $d2, $52 ; points to bank 7: 0x52d2 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
BridgeEntry:: ; bank 9 0x6590 
    db $14, $12, $00
    db $04, $02, $00, $03
    db $00, $09, $0a, $78
    db $0a, $4d, $42 ; points to bank 0a: 0x424d tiles
    db $08, $37, $78 ; bank 8 0x7837 collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $ed, $70, $00
    db $00, $00
    db $0a, $9c, $44 ; bank 0a 0x449c sprites
    db $09, $c0, $64
    db $0a, $a5, $44, $00 ; bank 0a 0x44a5 transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
NgHeadquartersInsideDialogue:: ; 0x65cb
    db $20, $80, $03, $00
    db $02, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $09, $f1, $7d ; points to bank 9: 0x7df1 tom fulp
    db $09, $45, $4f ; points to bank 9: 0x4f45 dialogue
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $80, $08, $00
    db $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
    db $08, $29, $7d
    db $00, $00, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    
NgHeadquartersInsideEntry:: ; bank 9 0x6667 
    db $14, $12, $00
    db $03, $01, $00, $02
    db $00, $09, $0a, $78
    db $0a, $eb, $41 ; bank 0a: 0x41eb tiles
    db $08, $9f, $79 ; bank 8: 0x799f collision
    db $04, $b4, $7f ; bank 4 0x7fb4 palette 0
    db $09, $26, $53 ; bank 9 0x5326 palette 1
    db $07, $82, $72, $00
    db $00, $00
    db $0a, $b5, $44 ; bank 0a 0x44b5 sprites
    db $09, $cb, $65
    db $0a, $bb, $44, $00 ; bank 0a 0x44bb transition
    db $00, $00, $00, $00
    db $00, $00, $14, $00
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

bank009_66a2_dialogue:
    db $40, $00
    
    db "We might be\n" ; 0x66a4
    db "stamping down on\n"
    db "prices,", $00

    db $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44, $07
    db $01, $40, $00

    db "but we don't seem\n"
    db "to sell any PCs!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $40, $00

    db "Hi, I work here\n"
    db "over the summer,"

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "but I keep burning\n"
    db "myself..."

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $40, $00

    db "Sorry, we're all\n"
    db "out of meat,"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44
    db $07, $01, $40, $00

    db "We just sold our\n"
    db "last burger to the\n"
    db "guy with glasses."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $40, $00
    
    db "Thanks for the\n"
    db "corpse."

    db $00, $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e, $00, $41, $ff, $00, $44, $07
    db $01, $40, $00

    db "I was worried we'd\n"
    db "go out of business."

    db $00, $47, $03, $01, $04, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $12, $04, $40, $00
    
    db "Hey you've got\n"
    db "some meat! Good\n"
    db "quality too..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44, $07
    db $01, $40, $00
    
    db "we'll make you a\n"
    db "burger right now\n"
    db "if you want."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $14, $00, $0c, $00, $00, $14, $00, $04, $ff, $fc, $14
    db $00, $0b, $ff, $fd, $75, $ff, $fc, $40, $00
    
    db "You got the Burger!"

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44, $07
    db $01, $40, $00

    db "Hmmm, so that's\n" ; 0x6925
    db "why they taste\n"
    db "funny..."

    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $00, $12, $04, $14, $00, $01, $ff, $fc, $14, $00, $00
    db $ff, $fd, $75, $ff, $fc, $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd, $75
    db $ff, $fc, $40, $00

    db "You placed the\n" ; 0x6980
    db "lampshade on\n"
    db "the altar."

    db $00, $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00, $44, $07
    db $01, $40, $00
    
    db "The Feng Shui of\n" ; 0x69ba
    db "the room was\n"
    db "perfected."
    
    db $00, $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01, $45, $fe
    db $12, $00, $44, $03, $01, $21, $1f, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc
    db $14, $00, $00, $ff, $fd, $14, $00, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff
    db $fc
    
    db $27, $03, $02
    
    db $09, $1e, $60 ; bank 9 0x601e GameFinishedScreen
    db $00

bank009_6a1a:
    db $14, $00
    INCBIN "gfx/bank009_6a1c.2bpp"

bank00_6b5c:
    db $00, $08, $06, $00, $00, $f8, $08, $00, $80, $00, $00, $00
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80, $00, $00, $00
    db $00, $08, $04, $00, $00, $f8, $04, $20, $80, $00, $00, $00
    db $00, $00, $00, $20, $00, $08, $02, $20, $80, $00, $00, $00
    db $00, $08, $10, $00, $00, $f8, $12, $00, $80, $00, $00, $00
    db $00, $08, $0a, $00, $00, $f8, $0c, $00, $80, $00, $00, $00
    db $00, $08, $0e, $00, $00, $f8, $0e, $20, $80, $00, $00, $00
    db $00, $00, $0a, $20, $00, $08, $0c, $20, $80, $00, $00, $00

    ; frames
    db $5c, $6b
    db $68, $6b
    db $74, $6b
    db $80, $6b
    db $8c, $6b
    db $5c, $6b
    db $98, $6b
    db $68, $6b
    db $a4, $6b
    db $74, $6b
    db $b0, $6b
    db $80, $6b
    
    db $00, $00, $01, $01, $02, $02, $03, $03, $04, $05, $06, $07, $08, $09, $0a, $0b
    db $00, $00
    
    ; bank 9 0x6be6
    db $0c, $00, $f0, $bc, $6b, $d4, $6b, $e4, $6b, $00, $0f, $00, $07
    
    db $09, $1a, $6a, $00, $00, $00 ; bank 9 0x6a1a

AlexlabbeSpriteImage:: ; 0x6bf9
    db $04, $00
    INCBIN "gfx/bank009_alexlabbe_6bfb.2bpp"

AlexlabbeSpriteFrames::
    ; frame 1: 0x6c3b
    db $00, $08, $00, $00, $00, $f8, $02, $00
    
    db $80, $00, $00, $00

    db $3b, $6c
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    ; bank 9 0x6c5b
    db $01, $00, $f0, $47, $6c, $49, $6c, $59, $6c, $00, $0f, $f8, $07

    db $09, $f9, $6b, $00, $00, $00 ; points to sprite at bank 9: 0x6bf9

bank009_6c6e:
    db $04, $00
    INCBIN "gfx/bank009_6c70.2bpp"

Bank009_6c70SpriteFrames::
    ; frame 1 0x6cb0
    db $80, $00, $00, $00

    ; frame 2 0x6cb4
    db $f0, $08, $00, $00
    
    db $00, $f8, $02, $00
    db $80, $00, $00, $00

    ; frames
    db $b0, $6c
    db $b4, $6c

    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $00

    ; bank 9: 0x6ce3
    db $02, $00, $e0, $c0, $6c, $c4, $6c, $d4, $6c, $00, $0f, $f8, $07

    db $09, $6e, $6c, $00, $00, $00 ; points to sprite at bank 9: 0x6c6e

DanSpriteImage:: ; 0x6ce9
    db $14, $00
    INCBIN "gfx/bank009_dan_6ceb.2bpp"

DanSpriteFrames::
    ; dan frame 1: 0x6e2b
    db $00, $09, $10, $00, $00, $f8, $12, $00, $80
    
    db $00, $00, $00

    ; dan frame 2: 0x6e37
    db $00, $08, $12, $20, $00, $f8, $10, $20, $80

    db $00, $00, $00

    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    db $00, $08, $04, $00, $00, $f8, $06, $00, $80

    db $00, $00, $00
    
    db $00, $08, $08, $00, $00, $f8, $0a, $00, $80

    db $00, $00, $00
    
    db $00, $08, $0c, $00, $00, $f8, $0e, $00, $80

    db $00, $00, $00

    db $00, $00, $00, $20, $00, $08, $02, $20, $80

    db $00, $00, $00

    db $00, $00, $04, $20, $00, $08, $06, $20, $80

    db $00, $00, $00
    
    ; frames
    db $2b, $6e
    db $37, $6e
    db $43, $6e
    db $4f, $6e
    db $5b, $6e
    db $67, $6e
    db $73, $6e
    db $7f, $6e

    db $00, $01, $02, $03, $04, $05, $06, $07, $00, $01, $02, $03, $04, $05, $06, $07
    db $00, $00

    ; bank 9 0x6ead dan
    db $08, $00, $f0, $8b, $6e, $9b, $6e, $ab, $6e, $00, $0f, $f8, $07

    ; bank 9 0x6eba
    db $09, $e9, $6c, $00, $00, $00 ; points to bank 9: 0x6ce9 dan

DanteSpriteFrames::
    ; dante frame 1: 0x6ec0
    db $fa, $0c, $00, $00, $00, $f8, $02, $00, $00, $f8, $04, $00, $08, $10, $06, $00
    db $00, $f8, $08, $00, $00, $f8, $0a, $00, $80

    db $00, $00, $00
    ; dante frame 2: 0x6edc
    db $fa, $0d, $0c, $00, $00, $f8, $0e, $00, $00, $f8, $10, $00, $08, $10, $12, $00
    db $00, $f8, $08, $40, $00, $f8, $14, $00, $80

    db $00, $00, $00

    ; frames
    db $c0, $6e
    db $dc, $6e
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9: 0x6f0e dante
    db $02, $00, $e8, $f8, $6e, $fc, $6e, $0c, $6f, $00, $0f, $f8, $07

    ; bank 9: 0x6f1b
    db $08, $07, $7b, $00, $00, $00 ; points to bank 8: 0x7b07 dante

DimSpriteImage:: ; 0x6f21
    db $08, $00
    INCBIN "gfx/bank009_dim_6f23.2bpp"

DimSpriteFrames::
    ; frame 1: 0x6fa3
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 2: 0x6faf
    db $00, $08, $04, $00, $00, $f8, $06, $00, $80

    db $00, $00, $00

    ; frames   
    db $a3, $6f ; 0x6fa3
    db $af, $6f ; 0x6faf
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9: 0x6fd1
    db $02, $00, $f0, $bb, $6f, $bf, $6f, $cf, $6f, $00, $0f, $f8, $07

    ; bank 9: 0x6fde
    db $09, $21, $6f, $00, $00, $00 ; points to bank 9: 0x6f21

LampshadeBossSpriteImage:: ; 0x6fe4
    db $08, $00
    INCBIN "gfx/bank009_lampshadeboss_6fe6.2bpp"

LampshadeBossSpriteFrames::
    ; frame 1: 0x7066
    db $00, $08, $00, $00
    db $00, $f8, $02, $00
    
    db $80
    db $00, $00, $00
    
    ; frame 2: 0x7072
    db $00, $08, $04, $00
    db $00, $f8, $06, $00

    db $80, $00, $00, $00
    
    ; frames
    db $66, $70 ; 0x7066
    db $72, $70 ; 0x7072

    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $00

    ; bank 9: 0x7094
    db $02, $00, $f0, $7e, $70, $82, $70, $92, $70, $00, $0f, $f8, $07

    ; bank 9: 0x70a1
    db $09, $e4, $6f, $00, $00, $00 ; points to bank 9: 0x6fe4

FlowerSpriteImage:: ; 0x70a7
    db $10, $00
    INCBIN "gfx/bank009_flower_70a9.2bpp"
   
FlowerSpriteFrames::
    ; frame 1: 0x71a9
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80
    db $00, $00, $00

    ; frame 2: 0x71b5
    db $00, $08, $04, $00, $00, $f8, $06, $00, $80
    db $00, $00, $00

    ; frame 3: 0x71c1
    db $00, $08, $08, $00, $00, $f8, $0a, $00, $80
    db $00, $00, $00
    
    ; frame 4: 0x71cd
    db $00, $08, $0c, $00, $00, $f8, $0e, $00, $80
    db $00, $00, $00

    ; frames
    db $a9, $71
    db $b5, $71
    db $c1, $71
    db $cd, $71
    
    db $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03
    db $00, $00
    
    ; bank 9: 0x71f3
    db $04, $00, $f0, $d9, $71, $e1, $71, $f1, $71, $00, $0f, $f8, $07

    ; bank 9: 0x7200
    db $09, $a7, $70, $00, $00, $00 ; bank 9: 0x70a7 sprite
   
GerkinmanSpriteImage:: ; 0x7206
    db $04, $00
    INCBIN "gfx/bank009_gerkinman_7208.2bpp"

GerkinmanSpriteFrames::
    ; frame 1: 0x7248
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 1: 0x7254
    db $00, $08, $02, $20, $00, $f8, $00, $20, $80

    db $00, $00, $00

    ; frames
    db $48, $72
    db $54, $72
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x7276
    db $02, $00, $f0, $60, $72, $64, $72, $74, $72, $00, $0f, $f8, $07

    ; bank 9 0x7283
    db $09, $06, $72, $00, $00, $00 ; points to bank 9: 0x7206

GraveCoverSpriteFrames::
    ; grave cover frame 0x7289
    db $00, $08, $00, $00, $00, $f8, $00, $00, $80
    db $00, $00, $00

    ; frames
    db $89, $72
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00

    ; bank 9 0x72a9
    db $01, $00, $f0, $95, $72, $97, $72, $a7, $72, $00, $0f, $f8, $07

    db $0a, $36, $45, $00, $00, $00 ; points to bank 0a: 0x4536

HeihachiSpriteImage:: ; 0x72bc
    db $10, $00
    INCBIN "gfx/bank009_heihachi_72be.2bpp"

HeihachiSpriteFrames::
    ; frame 1: 0x73be
    db $f8, $08, $00, $00
    db $00, $f8, $02, $00
    db $08, $08, $04, $00
    db $00, $f8, $06, $00
    
    db $80
    db $00, $00, $00

    ; frame 2: 0x73d2
    db $f8, $08, $08, $00
    db $00, $f8, $0a, $00
    db $08, $08, $0c, $00
    db $00, $f8, $0e, $00
    
    db $80
    db $00, $00, $00

    ; frames
    db $be, $73
    db $d2, $73
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x73fc
    db $02, $00, $e8, $e6, $73, $ea, $73, $fa, $73, $00, $0f, $f8, $07

    db $09, $bc, $72, $00, $00, $00 ; points to bank 9: 0x72bc

JasperSpriteImage:: ; 0x740f
    db $04, $00
    INCBIN "gfx/bank009_jasper_7411.2bpp"

JasperSpriteFrames::
    ; frame 1: 0x7451
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 2: 0x745d
    db $00, $08, $02, $20, $00, $f8, $00, $20, $80

    db $00, $00, $00

    ; frames
    db $51, $74
    db $5d, $74
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00
    
    ; bank 9 0x747f
    db $02, $00, $f0, $69, $74, $6d, $74, $7d, $74, $00, $0f, $f8, $07

    ; bank 9: 0x748c
    db $09, $0f, $74, $00, $00, $00 ; points to bank 9: 0x740f

JenSpriteImage:: ; 0x7492
    db $04, $00
    INCBIN "gfx/bank009_jen_7494.2bpp"

JenSpriteFrames::
    ; frame 1: 0x74d4
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 2: 0x74e0
    db $00, $08, $02, $20, $00, $f8, $00, $20, $80

    db $00, $00, $00

    ; frames
    db $d4, $74
    db $e0, $74
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x7502
    db $02, $00, $f0, $ec, $74, $f0, $74, $00, $75, $00, $0f, $f8, $07

jr_009_750f:
    db $09, $92, $74, $00, $00, $00 ; points to bank 9: 0x7492

JoeySpriteImage:: ; 0x7515
    db $04, $00
    INCBIN "gfx/bank009_joey_7517.2bpp"

JoeySpriteFrames::
    ; frame 1 0x7557
    db $00, $08, $00, $00
    db $00, $f8, $02, $00
    
    db $80
    db $00, $00, $00

    ; frame 2 0x755b
    db $00, $08, $02, $20
    db $00, $f8, $00, $20,

    db $80
    db $00, $00, $00

    ; frames
    db $57, $75
    db $63, $75
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x7585
    db $02, $00, $f0, $6f, $75, $73, $75, $83, $75, $00, $0f, $f8, $07

    db $09, $15, $75, $00, $00, $00 ; points to bank 9: 0x7515

JohnSpriteImage:: ; 0x7598
    db $08, $00
    INCBIN "gfx/bank009_john_759a.2bpp"

JohnSpriteFrames::
    ; frame 0x761a
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 0x7626
    db $00, $08, $04, $00, $00, $f8, $06, $00, $80

    db $00, $00, $00

    ; frames
    db $1a, $76
    db $26, $76
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x7648
    db $02, $00, $f0, $32, $76, $36, $76, $46, $76, $00, $0f, $f8, $07

    db $09, $98, $75, $00, $00, $00 ; points to bank 9: 0x7598

KirbySpriteImage:: ; 0x765b
    db $08, $00
    INCBIN "gfx/bank009_kirby_765d.2bpp"

KirbySpriteFrames::
    ; frame 1: 0x76dd
    db $fc, $08, $00, $00
    db $04, $00, $02, $00
    db $00, $f8, $04, $00
    db $fc, $00, $06, $00

    db $80, $00, $00, $00

    ; frame 2: 0x76f1
    db $00, $07, $04, $20
    db $00, $f8, $02, $20
    db $fc, $08, $06, $20
    
    db $80, $00, $00, $00

    ; frames
    db $dd, $76
    db $f1, $76
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x7717
    db $02, $00, $e8, $01, $77, $05, $77, $15, $77, $00, $0f, $f8, $07

    db $09, $5b, $76, $00, $00, $00 ; points to bank 9: 0x765b

LinkSpriteFrames::
    ; link frame (down): 0x772a
    db $00, $08, $08, $00, $00, $f8, $0a, $00, $80

    db $00, $00, $00

    ; link frame (right): 0x7736
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; link frame (up): 0x7742
    db $00, $08, $04, $00, $00, $f8, $06, $00, $80

    db $00, $00, $00

    ; link frame (left): 0x774e
    db $00, $08, $02, $20, $00, $f8, $00, $20, $80

    db $00, $00, $00

    db $00, $08, $10, $00, $00, $f8, $12, $00, $80

    db $00, $00, $00

    db $00, $08, $12, $20, $00, $f8, $10, $20, $80

    db $00, $00, $00

    db $00, $08, $0c, $00, $00, $f8, $0e, $00, $80
 
    db $00, $00, $00

    db $00, $08, $06, $20, $00, $f8, $04, $20, $80

    db $00, $00, $00

    db $00, $08, $0e, $20, $00, $f8, $0c, $20, $80

    db $00, $00, $00
 
    db $00, $08, $14, $00, $00, $f8, $16, $00, $80

    db $00, $00, $00

    db $00, $08, $18, $00, $00, $f8, $1a, $00, $80
   
    db $00, $00, $00

    db $00, $08, $16, $20, $00, $f8, $14, $20, $80

    db $00, $00, $00

    db $00, $08, $1a, $20, $00, $f8, $18, $20, $80

    db $00, $00, $00
 
    ; frames
    db $2a, $77
    db $36, $77
    db $42, $77
    db $4e, $77
    db $5a, $77
    db $66, $77
    db $72, $77
    db $36, $77
    db $7e, $77
    db $42, $77
    db $8a, $77
    db $4e, $77
    db $96, $77
    db $a2, $77
    db $ae, $77
    db $ba, $77
    
    db $00, $00, $01, $01, $02, $02, $03, $03, $04, $05, $06, $07, $08, $09, $0a, $0b
    db $0c, $0f, $0c, $0f, $0c, $0f, $0c, $0f, $0c, $0f, $0c, $0f, $0c, $0f, $0c, $0f
    db $00, $00, $08, $00

    ; bank 9 0x780a
    db $10, $00, $f0, $c6, $77, $e6, $77, $06, $78, $00, $0f, $00, $07
    
    ; bank 9 0x7817
    db $07, $db, $79, $00, $00, $00 ; points to bank 7: 0x79db

RandySpriteFrames::
    ; randy frame 1: 0x781d
    db $00, $0f, $00, $00, $00, $f8, $02, $00, $f0, $00, $04, $00, $10, $f8, $06, $00
    db $f0, $00, $08, $00, $80

    db $00, $00, $00

    ; randy frame 2: 0x7835
    db $00, $0e, $0a, $00, $f0, $00, $0c, $00, $10, $f8, $0e, $00, $f0, $00, $10, $00
    db $10, $f8, $12, $00, $f0, $00, $14, $00, $80

    db $00, $00, $00

    ; frames
    db $1d, $78
    db $35, $78
    
    db $00, $01, $00, $01
    db $00, $01, $00, $01
    db $00, $01, $00, $01
    db $00, $01, $00, $01
    db $00, $00

    ; bank 9: 0x7867
    db $02, $00, $e0, $51, $78, $55, $78, $65, $78, $00, $0f, $f8, $07

    ; bank 9: 0x7874
    db $08, $3c, $7d, $00, $00, $00 ; points to bank 8: 0x7d3c

RichieSpriteImage:: ; 0x787a
    db $04, $00
    INCBIN "gfx/bank009_richie_787c.2bpp"

    ; frame 1: 0x78bc
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 2: 0x78c8
    db $00, $08, $02, $20, $00, $f8, $00, $20, $80

    db $00, $00, $00

    ; frames
    db $bc, $78
    db $c8, $78
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x78ea
    db $02, $00, $f0, $d4, $78, $d8, $78, $e8, $78, $00, $0f, $f8, $07

    db $09, $7a, $78, $00, $00, $00 ; points to bank 9: 0x787a

RubberninjaSpriteImage:: ; 0x78fd
    db $04, $00
    INCBIN "gfx/bank009_rubberninja_78ff.2bpp"
    
    ; frame 1: 0x793f
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; frame 2: 0x794b
    db $00, $08, $02, $20, $00, $f8, $00, $20, $80

    db $00, $00, $00

    ; frames
    db $3f, $79
    db $4b, $79
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x796d
    db $02, $00, $f0, $57, $79, $5b, $79, $6b, $79, $00, $0f, $f8, $07

    db $09, $fd, $78, $00, $00, $00 ; points to bank 9: 0x78fd

SamusSpriteImage:: ; 0x7980
    db $04, $00
    INCBIN "gfx/bank009_samus_7982.2bpp"

SamusSpriteFrames::
    ; frame 1: 0x79c2
    db $00, $08, $00, $00
    db $00, $f8, $02, $00
    
    db $80
    db $00, $00, $00

    ; frame 2: 0x79ce
    db $00, $08, $02, $20
    db $00, $f8, $00, $20
    
    db $80
    db $00, $00, $00

    ; frames
    db $c2, $79
    db $ce, $79
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x79f0
    db $02, $00, $f0, $da, $79, $de, $79, $ee, $79, $00, $0f, $f8, $07

    db $09, $80, $79, $00, $00, $00 ; points to bank 9: 0x7980

ImageBank009_7a05SpriteImage: ; 0x7a03
    db $08, $00
    INCBIN "gfx/bank009_7a05.2bpp"
    
JTSpriteFrames::
    ; JT frame 1: 0x7a85
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80

    db $00, $00, $00

    ; JT frame 2: 0x7a91
    db $00, $08, $04, $00, $00, $f8, $06, $00, $80

    db $00, $00, $00

    db $00, $08, $08, $00, $f0, $00, $0a, $00, $10, $f8, $0c, $00, $f0, $00, $0e, $00
    db $80

    db $00, $00, $00

    db $00, $08, $10, $00, $f0, $00, $0e, $20, $10, $f8, $12, $00, $f0, $00, $0a, $20
    db $80

    db $00, $00, $00

    ; JT frame (dead): 0x7ac5
    db $00, $08, $14, $00, $00, $f8, $14, $20, $80

    db $00, $00, $00

    ; frames
    db $85, $7a
    db $91, $7a
    db $9d, $7a
    db $b1, $7a
    db $c5, $7a
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $02, $03
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $00, $00, $00, $00

    db $08, $00, $10, $00

    ; bank 9 0x7b13
    db $05, $00, $e0, $d1, $7a, $db, $7a, $0b, $7b, $00, $0f, $f8, $07

    ; bank 9 0x7b20
    db $08, $9e, $7e, $00, $00, $00 ; points to bank 8: 0x7e9e

SnakeSpriteImage:: ; 0x7b26
    db $10, $00
    INCBIN "gfx/bank009_snake_7b28.2bpp"
    
SnakeSpriteFrames::
    ; frame 1: 0x7c28
    db $00, $08, $00, $00
    
    ; 0x7c2c
    db $f0, $00, $02, $00
    
    ; 0x7c30
    db $10, $f8, $04, $00
    
    ; 0x7c34
    db $f0, $00, $06, $00
    
    db $80
    db $00, $00, $00

    ; frame 2: 0x7c3c
    db $f0, $10, $08, $00
    
    ; 0x7c40
    db $10, $f8, $0a, $00
    
    ; 0x7c44
    db $f0, $00, $0c, $00
    
    ; 0x7c48
    db $10, $f8, $04, $00
    
    db $f0, $00, $0e, $00, $80

    db $00, $00, $00

    ; frames
    db $28, $7c
    db $3c, $7c
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $01, $00, $01, $00, $00

    ; bank 9 0x7c6a
    db $02, $00, $e0, $54, $7c, $58, $7c, $68, $7c, $00, $0f, $f8, $07

    db $09, $26, $7b, $00, $00, $00 ; points to bank 9: 0x7b26

TomfulpSpriteImage:: ; 0x7c7d
    db $10, $00
    INCBIN "gfx/bank009_tomfulp_7c7f.2bpp"

TomfulpSpriteFrames::
    ; frame 1: 0x7d7f
    db $00, $08, $00, $00, $f0, $00, $02, $00, $10, $f8, $04, $00, $f0, $00, $06, $00
    db $80

    db $00, $00, $00

    ; frame 2: 0x7d93
    db $00, $08, $08, $00, $f0, $00, $0a, $00, $10, $f8, $0c, $00, $f0, $00, $0e, $00
    db $80

    db $00, $00, $00

    ; frame 3: 0x7da7
    db $00, $08, $0c, $20, $f0, $00, $0e, $20, $10, $f8, $08, $20, $f0, $00, $0a, $20
    db $80

    db $00, $00, $00

    ; frame 4: 0x7dbb
    db $00, $08, $04, $20, $f0, $00, $06, $20, $10, $f8, $00, $20, $f0, $00, $02, $20
    db $80

    db $00, $00, $00

    ; frames
    db $7f, $7d
    db $93, $7d
    db $7f, $7d
    db $93, $7d
    db $a7, $7d
    db $bb, $7d
    db $a7, $7d
    db $bb, $7d
    
    db $00, $07, $00, $07, $00, $07, $00, $07, $00, $07, $00, $07, $00, $07, $00, $07
    db $00, $00

    ; bank 9 0x7df1 tom fulp
    db $08, $00, $e0, $cf, $7d, $df, $7d, $ef, $7d, $00, $0f, $f8, $07

    db $09, $7d, $7c, $00, $00, $00 ; points to bank 9: 0x7c7d tom fulp
   
McdonaldsWorkerSpriteImage:: ; 0x7e04
    db $06, $00 
    INCBIN "gfx/bank009_mcdonaldsworker_7e06.2bpp"

McdonaldsWorkerSpriteFrames::
    ; frame 1: 0x7e66
    db $00, $08, $00, $00, $00, $f8, $02, $00, $80
    db $00, $00, $00

    ; frame 2: 0x7e72
    db $00, $08, $00, $00, $00, $f8, $04, $00, $80
    db $00, $00, $00

    ; frames
    db $66, $7e
    db $72, $7e
    
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
    db $00, $00

    ; bank 9 0x7e94
    db $02, $00, $f0, $7e, $7e, $82, $7e, $92, $7e, $00, $0f, $f8, $07

    db $09, $04, $7e, $00, $00, $00 ; bank 9: 0x7e04

PondSpriteImage:: ; 0x7ea7
    db $08, $00
    INCBIN "gfx/bank009_pond_7ea9.2bpp"
    
PondSpriteFrames::
    ; bank 9: frame 1 0x7f29
    db $00, $08, $00, $00
    
    ; 0x7f2d
    db $00, $f8, $00, $00
    
    db $80, $00, $00, $00

    ; bank 9: frame 2 0x7f35
    db $00, $08, $02, $00
    
    ; 0x7f39
    db $00, $f8, $02, $00
    
    db $80, $00, $00, $00

    ; bank 9: frame 3 0x7f41
    db $00, $08, $04, $00
    
    ; 0x7f45
    db $00, $f8, $04, $00
    
    db $80, $00, $00, $00
    
    ; bank 9: frame 4 0x7f4d
    db $00, $08, $06, $00
    
    ; 0x7f51
    db $00, $f8, $06, $00
    
    db $80, $00, $00, $00

    ; frames       
    db $29, $7f
    db $35, $7f
    db $41, $7f
    db $4d, $7f
    
    db $00, $03, $00, $03, $00, $03, $00, $03
    db $00, $03, $00, $03, $00, $03, $00, $03, $00, $00

    ; bank 9 0x7f73
    db $04, $00, $f0, $59, $7f, $61, $7f, $71, $7f, $00, $0f, $f8, $07

    ; bank 9 0x7f80
    db $09, $a7, $7e, $00, $00, $00 ; points to bank 9: 0x7ea7

bank009_7f86: ; related to Mcdonalds transition
    db $25, $12, $01, $19, $00, $00, $ff, $ff
    db $1a, $00, $7f, $9a, $00, $01, $ff, $ff, $01, $09, $7f, $eb
    db $1a, $00, $7f, $a6, $00, $00, $00, $00, $01, $09, $7f, $ae, $55, $67, $14, $09, $04, $53, $84, $10
    db $1a, $00, $7f, $ba, $00, $01, $00, $00, $05, $09, $7f, $c2, $55, $67, $7c, $09, $04, $53, $84, $10
    db $1a, $00, $7f, $ce, $00, $0c, $00, $00, $05, $09, $7f, $d6, $55, $67, $fa, $09, $04, $53, $84, $10
    db $1a, $00, $7f, $e2, $00, $0b, $00, $00, $01, $09, $7f, $ea, $55, $68, $62, $09, $04, $53, $84, $10
    db $00, $19, $00, $00, $ff, $ff
    db $1a, $00, $7f, $fc, $00, $02, $ff, $ff, $01, $09, $7f, $ff, $5f, $10, $00, $00,

