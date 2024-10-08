SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

    ld hl, $c539
    ld [hl], $00
    ld hl, $c53b
    ld [hl], $00
    ld hl, $c57e
    ld [hl], $3e
    inc hl
    ld [hl], $c5
    ret


    ld a, [bc]
    ld [c], a
    ld b, l
    dec sp
    ld hl, sp+$09
    ld a, [hl]
    or a
    jp z, Jump_003_40ed

    dec hl
    ld a, [hl-]
    or [hl]
    jp z, Jump_003_40ed

    ld hl, sp+$07
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld e, c
    ld d, b
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    inc bc
    inc bc
    ld a, e
    sub $80
    ld a, d
    sbc $00
    jr nc, jr_003_4056

    ld a, e
    or a
    jp z, Jump_003_40ed

    ld hl, sp+$09
    ld h, [hl]
    push hl
    inc sp
    push bc
    ld h, a
    ld l, $00
    push hl
    call Call_000_1270
    add sp, $05
    jp Jump_003_40ed


jr_003_4056:
    push bc
    push de
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    push bc
    ld hl, $8000
    push hl
    call Call_000_1270
    add sp, $05
    pop de
    pop bc
    ld a, e
    add $80
    ld e, a
    ld a, d
    adc $ff
    ld d, a
    ld hl, $0800
    add hl, bc
    ld c, l
    ld b, h
    ld a, e
    sub $80
    ld a, d
    sbc $00
    jr nc, jr_003_40bf

    ld hl, sp+$00
    ld a, e
    ld [hl], a
    sub $41
    ld a, d
    sbc $00
    jr nc, jr_003_40a6

    ld a, [hl]
    or a
    jr z, jr_003_40ed

    ld e, [hl]
    ld a, $c0
    sub e
    ld hl, sp+$09
    ld h, [hl]
    push hl
    inc sp
    push bc
    ld hl, sp+$03
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_1270
    add sp, $05
    jr jr_003_40ed

jr_003_40a6:
    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_003_40ed

    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    push bc
    ld hl, sp+$03
    ld h, [hl]
    ld l, $80
    push hl
    call Call_000_1270
    add sp, $05
    jr jr_003_40ed

jr_003_40bf:
    push bc
    push de
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    push bc
    ld hl, $8080
    push hl
    call Call_000_1270
    add sp, $05
    pop de
    pop bc
    ld a, e
    add $80
    ld e, a
    ld a, b
    add $08
    ld b, a
    ld a, e
    or a
    jr z, jr_003_40ed

    ld hl, sp+$09
    ld h, [hl]
    push hl
    inc sp
    push bc
    ld h, a
    ld l, $00
    push hl
    call Call_000_128c
    add sp, $05

Jump_003_40ed:
jr_003_40ed:
    inc sp
    ret


    add sp, -$11
    ld hl, sp+$17
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$02
    ld c, l
    ld b, h
    inc sp
    inc sp
    push bc
    push bc
    ld hl, sp+$1b
    ld a, [hl]
    push af
    inc sp
    ld hl, $000e
    push hl
    push de
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_1323
    add sp, $07
    pop bc
    ld hl, $0008
    add hl, bc
    ld a, [hl]
    ld [$c529], a
    ld hl, $0009
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld hl, $c52a
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $000b
    add hl, bc
    ld a, [hl]
    ld [$c52c], a
    ld hl, $000c
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld hl, $c52d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [bc]
    ld [$c532], a
    ld e, c
    ld d, b
    inc de
    ld a, [de]
    ld [$c533], a
    ld hl, $c532
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld e, l
    ld d, h
    ld hl, $c534
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [$c534]
    add $60
    ld [$c7dc], a
    ld a, [$c535]
    adc $ff
    ld [$c7dd], a
    ld hl, $c533
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld e, l
    ld d, h
    ld hl, $c536
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [$c536]
    add $70
    ld [$c7de], a
    ld a, [$c537]
    adc $ff
    ld [$c7df], a
    ld e, c
    ld d, b
    inc de
    inc de
    ld a, [de]
    ld hl, sp+$10
    ld [hl], a
    ld l, c
    ld h, b
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$10
    ld a, [hl]
    push af
    inc sp
    push bc
    ld e, $03
    ld hl, $4016
    call RST_08
    add sp, $14
    ret


    add sp, -$05
    ld hl, sp+$0c
    ld a, [hl+]
    ld d, [hl]
    add $0d
    ld e, a
    jr nc, jr_003_41ba

    inc d

jr_003_41ba:
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0e
    ld a, [hl]
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
    ld hl, sp+$03
    ld [hl], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$04
    ld [hl-], a
    ld e, c
    ld d, b
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld a, e
    or a
    jr z, jr_003_4209

    inc bc
    inc bc
    push de
    ld hl, sp+$05
    ld h, [hl]
    push hl
    inc sp
    push bc
    push af
    inc sp
    ld hl, sp+$0a
    ld a, [hl]
    push af
    inc sp
    call Call_000_128c
    add sp, $05
    pop de

jr_003_4209:
    add sp, $05
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld d, [hl]
    add $09
    ld e, a
    jr nc, jr_003_4216

    inc d

jr_003_4216:
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    dec hl
    ld b, a
    ld a, [hl]
    push af
    inc sp
    ld hl, $0004
    push hl
    push de
    push bc
    call Call_000_1323
    add sp, $07
    ret


    add sp, -$07
    ld hl, sp+$11
    ld a, [hl-]
    dec hl
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    push de
    push bc
    inc sp
    push hl
    call Call_000_1307
    add sp, $03
    ld c, e
    pop de
    ld hl, sp+$00
    ld [hl], c
    inc de
    inc de
    inc de
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a

jr_003_4255:
    ld a, c
    or a
    jr z, jr_003_42a6

    bit 0, c
    jr z, jr_003_428d

    ld hl, sp+$01
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$05
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl-]
    dec hl
    ld [hl], a
    push bc
    push de
    push bc
    inc sp
    ld hl, $0008
    push hl
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_1323
    add sp, $07
    pop de
    pop bc
    ld hl, $0008
    add hl, de
    ld e, l
    ld d, h

jr_003_428d:
    srl c
    push de
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    pop de
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl], a
    jr jr_003_4255

jr_003_42a6:
    ld hl, sp+$00
    ld e, [hl]
    add sp, $07
    ret


    add sp, -$55
    ld hl, sp+$5b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, l
    ld d, h
    ld hl, sp+$40
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push bc
    ld hl, sp+$5f
    ld a, [hl]
    push af
    inc sp
    ld hl, $003b
    push hl
    push bc
    push de
    call Call_000_1323
    add sp, $07
    pop bc
    ld de, $c526
    ld hl, sp+$5d
    ld a, [hl]
    ld [de], a
    ld hl, $c527
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$40
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ld [$c53c], a
    ld hl, sp+$40
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    ld hl, sp+$50
    ld [hl], a
    ld a, [hl+]
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
    ld a, [hl+]
    sub $15
    ld a, [hl]
    sbc $00
    ld d, [hl]
    ld a, $00
    bit 7, a
    jr z, jr_003_431d

    bit 7, d
    jr nz, jr_003_4322

    cp a
    jr jr_003_4322

jr_003_431d:
    bit 7, d
    jr z, jr_003_4322

    scf

jr_003_4322:
    jr nc, jr_003_432c

    ld hl, sp+$50
    ld a, [hl]
    inc a
    ld c, a
    rlca
    jr jr_003_432e

jr_003_432c:
    ld c, $15

jr_003_432e:
    ld hl, $c539
    ld [hl], c
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    cp $1f
    jr c, jr_003_4344

    ld a, $1f

jr_003_4344:
    ld [$da31], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    cp $05
    jr c, jr_003_4359

    ld a, $05

jr_003_4359:
    ld [$c53a], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    cp $40
    jr c, jr_003_436e

    ld a, $40

jr_003_436e:
    ld [$c538], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000e
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld [$c52f], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000f
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld hl, $c530
    ld [hl], c
    inc hl
    ld [hl], a
    ld e, $01
    ld hl, $5705
    call RST_08
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000b
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    push bc
    inc sp
    ld b, a
    push bc
    ld e, $03
    ld hl, $40ef
    call RST_08
    add sp, $03
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0011
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$52
    ld [hl], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$53
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $dfa0
    push de
    ld e, $03
    ld hl, $422c
    call RST_08
    add sp, $05
    ld hl, sp+$53
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    dec hl
    ld b, a
    inc bc
    ld a, [hl]
    push af

Call_003_4404:
    inc sp
    push bc
    call Call_000_1307
    add sp, $03
    ld a, e
    ld [$c648], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0014
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$52
    ld [hl], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0015
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$53
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $c64b
    push de
    ld e, $03
    ld hl, $422c
    call RST_08
    add sp, $05
    ld hl, sp+$53
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    dec hl
    ld b, a
    inc bc
    ld a, [hl]
    push af
    inc sp
    push bc
    call Call_000_1307
    add sp, $03
    ld hl, sp+$53
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$53
    ld a, [hl]
    ld [$c649], a
    ld bc, $c64a
    ld hl, sp+$54
    ld a, [hl]
    ld [bc], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0029
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
    ld de, $0012
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $c68b
    push de
    call Call_000_376d
    add sp, $06
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $002a
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    or a
    jr nz, jr_003_44ad

    ld a, [$c53c]
    sub $05
    ld a, $02
    jr z, jr_003_44a8

    xor a

jr_003_44a8:
    ld [$c53d], a
    jr jr_003_44b2

jr_003_44ad:
    ld hl, $c53d
    ld [hl], $01

jr_003_44b2:
    ld e, $03
    ld hl, $4be6
    call RST_08
    ld a, [$c53c]
    sub $05
    jp z, Jump_003_457a

    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$51
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$50
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld de, $0003
    push de
    push bc
    ld de, $c0db
    push de
    call Call_000_376d
    add sp, $06
    ld hl, sp+$4f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0009
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
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
    ld hl, $c0c3
    ld [hl], $00
    ld a, c
    push af
    inc sp
    push de
    xor a
    push af
    inc sp
    ld e, $03
    ld hl, $41ae
    call RST_08
    add sp, $04
    ld c, e
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0007
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld d, a
    sub c
    jr nc, jr_003_4532

    ld d, c

jr_003_4532:
    ld hl, sp+$51
    ld a, d
    ld [hl-], a
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld b, a
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld de, $c0cb
    push de
    ld de, $0000
    push de
    push bc
    inc sp
    ld b, a
    push bc
    call Call_000_1524
    add sp, $07
    ld hl, sp+$4f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld b, a
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld de, $c0bf
    push de
    push bc
    inc sp
    ld b, a
    push bc
    ld e, $03
    ld hl, $420c
    call RST_08
    add sp, $05
    jr jr_003_45a5

Jump_003_457a:
    ld hl, sp+$51
    ld [hl], $68
    ld hl, $c0c3
    ld [hl], $68
    ld de, $0003
    push de
    ld de, $4013
    push de
    ld de, $c0db
    push de
    call Call_000_376d
    add sp, $06
    ld de, $0010
    push de
    ld de, $0000
    push de
    ld de, $c0cb
    push de
    call Call_000_37b0
    add sp, $06

jr_003_45a5:
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $001d
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$44
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$43
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $001e
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$46
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$45
    ld [hl], a
    ld a, [$c538]
    or a
    jp z, Jump_003_4679

    ld hl, sp+$42
    ld a, [hl]
    ld hl, sp+$4b
    ld [hl], a
    ld hl, sp+$43
    ld a, [hl]
    ld hl, sp+$4c
    ld [hl], a
    ld hl, sp+$44
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$3d
    ld a, l
    ld d, h
    ld hl, sp+$4d
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
    ld hl, sp+$51
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$50
    ld [hl], a
    ld hl, sp+$54
    ld [hl], $00

jr_003_4605:
    ld a, [$c538]
    ld hl, sp+$54
    sub [hl]
    jr z, jr_003_4679

    ld hl, sp+$54
    ld a, [hl]
    sub $40
    jr z, jr_003_4679

    ld hl, sp+$4b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$52
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, sp+$4d
    ld e, [hl]
    inc hl
    ld d, [hl]
    push af
    inc sp
    ld hl, sp+$53
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call Call_000_12e0
    add sp, $05
    ld de, $c580
    ld hl, sp+$54
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$51
    ld a, [hl]
    ld [de], a
    ld hl, sp+$4d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$53
    ld [hl], a
    ld hl, sp+$4f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    push bc
    ld hl, sp+$55
    ld h, [hl]
    push hl
    inc sp
    ld d, a
    push de
    ld hl, sp+$56
    ld a, [hl]
    push af
    inc sp
    ld e, $03
    ld hl, $41ae
    call RST_08
    add sp, $04
    ld a, e
    pop bc
    ld hl, sp+$51
    add [hl]
    ld [hl], a
    inc bc
    inc bc
    inc bc
    ld hl, sp+$54
    inc [hl]
    jr jr_003_4605

Jump_003_4679:
jr_003_4679:
    ld hl, sp+$5e
    ld a, [hl]
    or a
    jp z, Jump_003_4a71

    ld e, $0a
    ld hl, $4029
    call RST_08
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $001a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
    ld de, $0003
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $c0de
    push de
    call Call_000_376d
    add sp, $06
    ld hl, $c507
    ld [hl], $00
    xor a
    ld hl, $c4fd
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c501
    ld [hl+], a
    ld [hl], a
    ld hl, $c0b9
    res 0, [hl]
    ld hl, $c4ff
    ld a, $b9
    ld [hl+], a
    ld a, $c0
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0032
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], a
    ld hl, $c4ff
    ld a, [hl+]
    ld b, [hl]
    add $30
    ld c, a
    jr nc, jr_003_46e0

    inc b

jr_003_46e0:
    ld hl, $c501
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld a, [hl-]
    or [hl]
    jr z, jr_003_4712

    ld a, [hl]
    ld hl, sp+$4f
    ld [hl], a
    ld a, [$c502]
    ld hl, sp+$50
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $c4ff
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_003_4712:
    ld a, [$c4ff]
    ld [$c501], a
    ld a, [$c500]
    ld [$c502], a
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $41db
    call RST_08
    pop hl
    ld a, [$c539]
    or a
    jp z, Jump_003_4942

    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0020
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, $c539
    ld l, [hl]
    ld h, $00
    dec hl
    ld e, l
    ld d, h
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    add hl, de
    add hl, hl
    add hl, hl
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0021
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    push bc
    inc sp
    ld hl, sp+$54
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld b, a
    push bc
    ld de, $c0ed
    push de
    call Call_000_1323
    add sp, $07
    ld a, [$c539]
    dec a
    ld hl, sp+$52
    ld [hl], a
    ld hl, sp+$42
    ld a, [hl]
    ld hl, sp+$46
    ld [hl], a
    ld hl, sp+$43
    ld a, [hl]
    ld hl, sp+$47
    ld [hl], a
    ld hl, sp+$44
    ld a, [hl]
    ld hl, sp+$48
    ld [hl], a
    ld hl, sp+$45
    ld a, [hl]
    ld hl, sp+$49
    ld [hl], a
    ld hl, sp+$53
    ld [hl], $ed
    inc hl
    ld [hl], $c0

Jump_003_479e:
    ld hl, sp+$52
    ld a, [hl]
    or a
    jp z, Jump_003_4942

    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0011
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$51
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$50
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [de]
    ld [hl], a
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000a
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0022
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$4c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$4b
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$4e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$4d
    ld [hl+], a
    ld a, [hl]
    or a
    jr z, jr_003_4836

    pop de
    push de
    ld hl, sp+$51
    ld a, [hl]
    ld [de], a
    ld hl, sp+$4a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$4e
    ld [hl-], a
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld h, [hl]
    push hl
    inc sp
    ld b, a
    push bc
    ld hl, sp+$54
    ld a, [hl]
    push af
    inc sp
    ld e, $03
    ld hl, $41ae
    call RST_08
    add sp, $04
    ld hl, sp+$4e
    ld a, e
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    dec hl
    sub [hl]
    jr nc, jr_003_482e

    ld a, [hl+]
    inc hl
    ld [hl], a

jr_003_482e:
    ld hl, sp+$51
    ld a, [hl-]
    add [hl]
    inc hl
    ld [hl], a
    jr jr_003_486d

jr_003_4836:
    ld hl, sp+$46
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld hl, $c538
    ld h, [hl]
    ld l, b
    push hl
    ld b, a
    push bc
    call Call_000_135b
    add sp, $06
    ld a, e
    ld hl, $c538
    sub [hl]
    jr nc, jr_003_4867

    ld hl, $c580
    ld d, $00
    add hl, de
    ld c, [hl]
    jr jr_003_486a

jr_003_4867:
    ld bc, $0000

jr_003_486a:
    pop hl
    push hl
    ld [hl], c

jr_003_486d:
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$4a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$50
    ld [hl], a
    ld hl, sp+$4c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    ld d, a
    push bc
    ld bc, $0000
    push bc
    ld hl, sp+$54
    ld a, [hl]
    push af
    inc sp
    push de
    call Call_000_1524
    add sp, $07
    ld hl, sp+$53
    ld a, [hl+]
    ld b, a
    ld c, [hl]
    ld l, b
    ld h, c
    res 0, [hl]
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld c, l
    ld b, h
    xor a
    ld [bc], a
    inc bc
    ld [bc], a
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0030
    add hl, de
    ld c, l
    ld b, h
    ld hl, $c501
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld a, [hl-]
    or [hl]
    jr z, jr_003_48f0

    ld a, [hl]
    ld hl, sp+$4d
    ld [hl], a
    ld a, [$c502]
    ld hl, sp+$4e
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$51
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$50
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$53
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_003_48f0:
    ld hl, sp+$53
    ld a, [hl]
    ld [$c501], a
    ld hl, sp+$54
    ld a, [hl]
    ld [$c502], a
    ld hl, sp+$53
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    rrca
    and $01
    jr nz, jr_003_491b

    ld hl, sp+$53
    ld a, [hl]
    ld hl, sp+$4f
    ld [hl], a
    ld hl, sp+$54
    ld a, [hl]
    ld hl, sp+$50
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    rlca
    jr nc, jr_003_492a

jr_003_491b:
    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, $41db
    call RST_08
    pop hl

jr_003_492a:
    ld hl, sp+$52
    dec [hl]
    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0034
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl], a
    jp Jump_003_479e


Jump_003_4942:
    ld a, [$c53a]
    or a
    jp z, Jump_003_4aaf

    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0026
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$50
    ld [hl], a
    ld hl, $c53a
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
    push hl
    ld a, l
    ld hl, sp+$53
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$52
    ld [hl], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0027
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$50
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $c758
    push de
    call Call_000_1323
    add sp, $07
    ld a, [$c53a]
    ld hl, sp+$54
    ld [hl], a
    ld hl, sp+$42
    ld a, [hl]
    ld hl, sp+$52
    ld [hl], a
    ld hl, sp+$43
    ld a, [hl]
    ld hl, sp+$53
    ld [hl], a
    ld hl, sp+$44
    ld a, [hl]
    ld hl, sp+$4e
    ld [hl], a
    ld hl, sp+$45
    ld a, [hl]
    ld hl, sp+$4f
    ld [hl+], a
    ld a, $58
    ld [hl+], a
    ld [hl], $c7

Jump_003_49c7:
    ld hl, sp+$54
    ld a, [hl]
    or a
    jp z, Jump_003_4aaf

    ld hl, sp+$50
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$4b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$4a
    ld [hl], a
    ld hl, sp+$52
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$4b
    ld [hl], a
    ld hl, sp+$4e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$4c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$49
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld a, [$c538]
    push af
    inc sp
    ld hl, sp+$4e
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_135b
    add sp, $06
    ld hl, sp+$4d
    ld [hl], e
    ld hl, sp+$50
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$4c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$4b
    ld [hl+], a
    inc hl
    ld a, [hl]
    ld hl, $c538
    sub [hl]
    jr nc, jr_003_4a4b

    ld hl, sp+$4d
    ld e, [hl]
    ld d, $00
    ld hl, $c580
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$4e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$4d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    ld [hl], $00
    jr jr_003_4a50

jr_003_4a4b:
    xor a
    ld hl, sp+$4c
    ld [hl+], a
    ld [hl], a

jr_003_4a50:
    ld hl, sp+$4c
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld [hl], c
    ld hl, sp+$54
    dec [hl]
    ld hl, sp+$50
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0017
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$52
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$51
    ld [hl], a
    jp Jump_003_49c7


Jump_003_4a71:
    ld a, [$c4fd]
    ld hl, sp+$51
    ld [hl], a
    ld a, [$c4fe]
    ld hl, sp+$52
    ld [hl], a

jr_003_4a7d:
    ld hl, sp+$52
    ld a, [hl-]
    or [hl]
    jr z, jr_003_4aaf

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl
    ld hl, sp+$51
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0030
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$51
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_003_4a7d

Jump_003_4aaf:
jr_003_4aaf:
    ld a, [$da31]
    or a
    jr z, jr_003_4b01

    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$50
    ld [hl], a
    ld a, [$da31]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, sp+$51
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0024
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$53
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$50
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $c821
    push de
    call Call_000_1323
    add sp, $07

jr_003_4b01:
    ld e, $05
    ld hl, $40aa
    call RST_08
    ld e, $06
    ld hl, $4b7e
    call RST_08
    xor a
    ld hl, $c50b
    ld [hl+], a
    ld [hl], a
    ld hl, sp+$5e
    ld a, [hl]
    or a
    jr z, jr_003_4b81

    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0017
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$55
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$54
    ld [hl], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0018
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$51
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jr z, jr_003_4b81

    ld hl, sp+$53
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    xor a
    push af
    inc sp
    ld de, $0000
    push de
    ld hl, sp+$54
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    inc hl
    ld d, a
    push de
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $06
    ld hl, sp+$53
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$54
    ld a, [hl-]
    or [hl]
    inc hl
    sub $01
    ld a, $00
    rla
    ld [hl], a
    xor $01
    ld [hl], a
    ld e, [hl]
    jr jr_003_4b83

jr_003_4b81:
    ld e, $00

jr_003_4b83:
    add sp, $55
    ret


    ld hl, $0597
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $0599
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld bc, $c0be
    ld a, [$059b]
    ld [bc], a
    ld bc, $c0c8
    ld a, [$059f]
    ld [bc], a
    ld bc, $c0c7
    ld a, [$05a0]
    ld [bc], a
    ld hl, $c0c4
    ld [hl], $00
    ld hl, $c0c5
    ld [hl], $00
    ld hl, $c0c6
    ld [hl], $02
    ld hl, $c0b9
    res 1, [hl]
    ld hl, $c0e8
    ld [hl], $01
    ld hl, $c0b9
    set 5, [hl]
    ret


    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, $047c
    push hl
    call Call_000_128c
    add sp, $05
    ret


    dec sp
    xor a
    ld hl, $c7cb
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c7cd
    ld [hl+], a
    ld [hl], a
    ld hl, sp+$00
    ld [hl], $00

jr_003_4bf7:
    ld hl, sp+$00
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    ld bc, $c69f
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $c7cd
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    ld [de], a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $05
    jr nz, jr_003_4bf7

    inc sp
    ret


    add sp, -$12
    ld a, [$c7cd]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c7ce]
    ld hl, sp+$03
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jp z, Jump_003_502c

    ld hl, sp+$18
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
    push hl
    ld a, l
    ld hl, sp+$12
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$11
    ld [hl], a
    ld de, $c758
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
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
    ld hl, $0017
    push hl
    push bc
    push de
    call Call_000_376d
    add sp, $06
    ld hl, sp+$11
    ld [hl], $02
    ld a, $e0
    ld hl, sp+$1b
    sub [hl]
    jr c, jr_003_4ca9

    ld a, [hl]
    sub $a0
    jr c, jr_003_4c91

    ld hl, sp+$11
    ld [hl], $03
    jr jr_003_4ca9

jr_003_4c91:
    ld a, $60
    ld hl, sp+$1b
    sub [hl]
    jr nc, jr_003_4c9e

    ld hl, sp+$11
    ld [hl], $00
    jr jr_003_4ca9

jr_003_4c9e:
    ld hl, sp+$1b
    ld a, [hl]
    sub $20
    jr c, jr_003_4ca9

    ld hl, sp+$11
    ld [hl], $01

jr_003_4ca9:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$1c
    ld a, [hl]
    and $01
    ld l, a
    ld a, [bc]
    and $fe
    or l
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$1c
    ld a, [hl]
    rrca
    and $01
    rlca
    and $02
    ld l, a
    ld a, [bc]
    and $fd
    or l
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    push de
    ld hl, sp+$11
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0009
    add hl, de
    pop de
    ld c, l
    ld b, h
    ld hl, sp+$11
    ld a, [hl]
    add a
    add c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    ld a, [bc]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000a
    add hl, de
    ld e, l
    ld d, h
    ld a, [bc]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000b
    add hl, de
    ld e, l
    ld d, h
    inc bc
    ld a, [bc]
    inc a
    ld [de], a
    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0013
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld hl, sp+$10
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld e, c
    ld d, b
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$06
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    inc bc
    inc bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
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
    ld de, $18c4
    ld hl, sp+$1b
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    add $40
    ld c, a
    ld hl, $18c4
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$0a
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
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
    dec hl
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
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

jr_003_4e24:
    ld hl, sp+$10
    ld a, $ff
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    jr nc, jr_003_4e7a

    ld hl, sp+$06
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
    ld e, [hl]
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $00ff
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$11
    ld [hl-], a
    ld [hl], e
    jr jr_003_4e24

jr_003_4e7a:
    ld hl, sp+$11
    ld a, [hl-]
    or [hl]
    jp z, Jump_003_4f5e

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0e
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, [hl+]
    ld [hl], a
    push af
    inc sp
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    call Call_000_3541
    pop hl
    ld hl, sp+$0c
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0d
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
    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    call Call_000_3541
    pop hl
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$0b
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
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld c, e
    ld b, a
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_003_4f5e:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$10
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$11
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld c, l
    ld b, h
    ld de, $18c4
    ld hl, sp+$11
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    push bc
    ld hl, sp+$12
    ld h, [hl]
    push hl
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
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    ld hl, sp+$11
    ld a, [hl]
    add $40
    ld e, a
    ld hl, $18c4
    ld d, $00
    add hl, de
    ld a, [hl]
    push bc
    ld hl, sp+$12
    ld h, [hl]
    push hl
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
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, $c7ce
    ld a, [hl-]
    or [hl]
    jr z, jr_003_500d

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, $c7cd
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_003_500d:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld c, l
    ld b, h
    ld hl, $c7cb
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl]
    ld [$c7cb], a
    ld hl, sp+$03
    ld a, [hl]
    ld [$c7cc], a

Jump_003_502c:
    add sp, $12
    ret


    adc h
    nop
    add b
    add b
    ld b, [hl]
    ld b, [hl]
    dec h
    dec h
    ld h, [hl]
    inc h
    ld a, [c]
    ld [de], a
    rst $18
    inc a
    inc l
    ret nc

    push de
    ld a, [bc]
    inc a
    inc a
    ld h, d
    ld b, d
    adc l
    add c
    sbc $ae
    jr nc, jr_003_505b

    or b
    db $10
    db $10
    ldh a, [rNR41]
    ld h, b
    jr c, jr_003_508b

    ld b, [hl]
    ld b, [hl]
    sbc c
    add c
    ldh a, [$88]
    ld a, a
    ld a, b

jr_003_505b:
    add hl, bc
    ld c, $05
    ld b, $73
    ld [hl], e
    ld bc, $0201
    ld [bc], a
    ld b, $04
    add $c4
    ccf
    inc a
    ld [hl], l
    ld b, $ca
    ld h, l
    and l
    ret z

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

jr_003_508b:
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
    ld [de], a
    add hl, bc
    inc hl
    ld de, $21c3
    dec de
    dec b
    ld de, $2608
    db $10
    ld [$eb14], a
    inc [hl]
    and b
    ld h, b
    ld b, b
    ret nz

    adc h
    adc h
    inc d
    inc d
    add sp, -$18
    ld e, h
    inc c
    ld a, [$ad02]
    ld d, c
    adc b
    adc b
    and h
    add h
    ld [hl], e
    ld b, e
    ld a, [hl-]
    jr nz, jr_003_5109

    jr nc, jr_003_5149

    ld d, d
    rst $38
    sbc h
    db $e3
    db $e3
    and h
    ret z

    cp d
    db $e4
    ret nz

    jp Jump_000_0039


    inc e
    ld bc, $09f6
    ld [hl], l
    sbc d
    rst $38
    db $ec
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
    jr c, jr_003_5149

    ld a, h
    add d
    cp $01
    rst $38

jr_003_5109:
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
    db $fd
    ld a, $c7
    ld b, a
    sbc c
    add c
    ldh a, [$88]
    rst $38
    ld a, b
    reti


    ld c, [hl]
    db $fd
    ld c, $ff
    rst $38
    rst $38
    add hl, sp
    add $c6
    add [hl]
    add h
    cp $fc

jr_003_5149:
    ccf
    inc a
    ld [hl], l
    ld b, $ca
    ld h, l
    and l
    ret z

    add c
    add c
    ld b, a
    ld b, a
    dec a
    dec a
    db $76
    inc h
    cp $12
    rst $18
    inc a
    inc l
    ret nc

    push de
    ld a, [bc]
    cp a
    ld a, h
    db $e3
    ld b, d
    adc l
    add c
    rst $18
    xor a
    inc sp
    inc de
    cp l
    ld de, $fc1f
    ccf
    ld a, a
    db $fd
    ld a, $ff
    ccf
    rst $38
    ld a, h
    rst $38
    ld a, h
    rst $20
    ld h, b
    sbc $41
    rst $38
    inc c
    rst $38
    db $fc
    rst $38
    add hl, sp
    rst $00
    rst $00
    add b
    add b
    ld hl, sp-$08
    call z, Call_003_6484
    sbc h
    adc b
    ld a, b
    ret c

    ld [hl], b
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
    jr c, jr_003_5202

jr_003_5202:
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

jr_003_5219:
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    adc a
    adc b
    and a
    add h
    ld [hl], e
    ld b, e
    ld a, [$ef20]
    jr nc, jr_003_5219

    ld d, d
    rst $38
    sbc h
    db $e3
    db $e3
    and h
    ret z

    cp d
    db $e4
    ret nz

    jp Jump_000_0039


    inc e
    ld bc, $09f6
    ld [hl], l
    sbc d
    rst $28
    db $ec
    and a
    ld h, e
    ld a, l
    pop bc
    db $ec
    sbc h
    sub [hl]
    ld [hl], h
    rst $28
    add sp, $5f
    inc c
    ei
    ld [bc], a
    xor l
    ld d, c
    rst $00
    ret nz

    cp a
    add b
    ld h, e
    inc e
    db $db
    inc a
    rst $20
    ccf
    cp a
    ld h, b
    ld h, b
    ret nz

    ret nz

    add b
    add sp, $30
    jr jr_003_5275

    jr c, jr_003_526f

    call nz, Call_003_4404
    add h
    db $fc
    call nz, Call_000_3c7c

jr_003_526f:
    nop
    nop
    res 6, b
    res 6, b

jr_003_5275:
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
    nop
    nop
    jr nc, jr_003_5305

jr_003_5305:
    ld c, b
    nop
    jr nz, @+$12

    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop

jr_003_5311:
    nop
    nop
    ld b, $00
    jr z, jr_003_531b

    sub c
    ld [$8853], sp

jr_003_531b:
    ld l, $41
    jr z, jr_003_5321

    nop
    nop

jr_003_5321:
    ld bc, $0101
    ld bc, $1d1f
    scf
    inc hl
    ld a, $21
    cpl
    jr nc, @+$12

    rra
    ld a, [de]
    rrca
    cp a
    ld e, h
    cp a
    ld e, [hl]
    cp a
    ld e, a
    xor a
    ld c, a
    di
    inc bc
    db $dd
    ld sp, $9c7f
    cp a
    rra
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

jr_003_5353:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_003_5353

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
    nop
    nop
    ld h, b
    nop
    inc d
    jr nz, jr_003_5311

    db $10
    jp z, Jump_003_7411

    add d
    inc d
    ld b, b
    nop
    nop
    ld c, c
    nop
    add d
    jr nz, @-$49

    ld b, d
    nop
    dec b
    ld b, b
    scf
    inc de
    ld c, b
    jr nz, jr_003_53f7

    ld c, d
    jr nc, @-$31

    or b
    adc $b0
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
    ld d, $0c
    jr jr_003_53dd

    inc e
    db $10
    inc sp
    db $10
    inc sp
    jr nz, @+$3f

    inc hl

jr_003_53dd:
    ccf
    ld a, $00
    nop
    daa
    inc bc
    db $fd
    ld bc, $10ec
    sub [hl]
    ld a, b
    ld [hl], a
    ld hl, sp-$75
    db $fc
    ei
    inc c
    rlca
    rlca
    ld [c], a
    cp $c5
    call c, $dcc5

jr_003_53f7:
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
    rst $38
    rst $38
    add b
    rst $38
    rst $08
    or b
    cp c
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
    jr jr_003_54f8

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
    rrca
    rrca
    rra
    db $10
    ccf
    jr nz, @+$32

jr_003_54f8:
    cpl
    daa
    ccf
    inc l
    inc a
    cpl
    ccf
    ld l, c
    ld a, c
    ldh a, [$f0]
    ld hl, sp+$08
    db $fc
    inc b
    inc c
    db $f4
    db $e4
    db $fc
    inc [hl]
    inc a
    db $f4
    db $fc
    sub [hl]
    sbc [hl]
    nop
    nop
    ld [bc], a
    ld bc, $0e11
    cpl
    db $10
    rra
    jr nz, jr_003_553b

    jr nz, jr_003_557d

    jr nz, @+$41

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
    nop
    nop
    ld b, b
    add b
    adc b
    ld [hl], b
    db $f4
    ld [$04f8], sp

jr_003_553b:
    ld hl, sp+$04
    ld a, [$fc04]
    ld [bc], a
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

jr_003_5555:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_003_5555

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
    jr jr_003_558c

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

jr_003_557d:
    inc bc
    ei
    inc bc
    ei
    rst $28
    cp a
    ld [$efba], a
    cp a
    ldh [$bf], a
    rst $38
    cp a
    rst $38

jr_003_558c:
    add b
    sbc b
    rst $38
    rst $38
    daa
    rst $30
    db $fd
    ld d, a
    ld e, l
    rst $30
    db $fd
    rlca
    db $fd
    rst $38
    db $fd
    rst $38
    ld bc, $ff19
    rst $38
    and $3f
    ld b, b
    ld e, a
    jr nz, @+$31

    db $10
    rrca
    db $10
    rrca
    db $10
    cpl
    db $10
    ld e, a
    jr nz, jr_003_55ef

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
    jp c, Jump_003_7689

    xor e
    ld d, h
    ei
    inc b
    db $fc
    ld [bc], a
    ld a, [$f404]
    ld [$08f0], sp
    ldh a, [$08]
    db $f4
    ld [$04fa], sp
    db $fc
    ld [bc], a
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

jr_003_55ef:
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
    ld b, h
    add hl, bc
    db $db
    ld l, l
    dec l
    ld a, a
    rst $38
    ccf
    ccf
    rst $38
    rst $38
    rst $38

jr_003_561d:
    rst $38
    ld a, a
    ccf
    ld a, a
    ld [hl+], a
    sub b
    reti


    or h
    or h
    cp $ff
    db $fc
    cp $fd
    rst $38
    rst $38

jr_003_562d:
    rst $38
    cp $fc
    cp $fb
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
    jr nz, jr_003_561d

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


    jr jr_003_562d

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
    rst $38
    ld a, a
    ld a, a
    rst $38
    ccf
    ld a, a
    ccf
    ccf
    ccf
    rst $38
    rra
    ccf
    dec bc
    rra
    nop
    inc sp
    db $fc
    cp $fe
    rst $38
    db $fc
    cp $ff
    db $fc
    db $fc
    rst $38
    db $fc
    cp $68
    db $fc
    nop
    ld h, $ec
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
    jr c, jr_003_572b

    ld e, h
    ld d, h
    sbc [hl]
    sub d
    cp [hl]
    cp d
    add $fe
    add e
    rst $38
    sub d
    cp $83
    rst $38
    inc e
    inc e
    ld l, $2a
    ld c, a
    ld c, c
    ld e, a
    ld e, l
    ld h, e
    ld a, a
    pop bc
    rst $38
    ld c, c
    ld a, a
    pop bc
    rst $38
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

jr_003_572b:
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
    add d
    rst $38
    add e
    rst $38
    add d
    cp $82
    cp $83
    cp $7d
    cp $ff
    nop
    cp $00
    ld b, c
    rst $38
    pop bc
    rst $38
    ld b, c
    ld a, a
    ld b, c
    ld a, a
    pop bc
    ld a, a
    cp [hl]
    ld a, a
    rst $38
    nop
    ld a, a
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
    ld bc, $0700
    inc bc
    dec c
    ld b, $0e
    rra
    scf
    jr c, jr_003_586a

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

jr_003_586a:
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
    cp d
    nop
    nop
    nop
    ld l, c
    ld [hl], b
    ld [hl], a
    ld a, b
    ld a, [hl-]
    ld a, l
    ld e, l
    ccf
    ld l, $1f
    scf
    rrca
    ld l, e
    rra
    nop
    nop
    sbc c
    nop
    cp $01
    ld a, a
    sub e
    db $ec
    rst $38
    inc sp
    call z, Call_000_23dc
    nop
    rst $38
    nop
    nop
    sbc c
    nop
    cp $01
    ld a, a
    sub e
    rst $28
    rst $38
    inc sp
    rst $08
    rst $18
    inc hl
    rlca
    rst $38
    rrca
    rrca
    cp a
    ccf
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
    ldh a, [rIE]
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
    inc sp
    call z, Call_000_23dc
    nop
    rst $38
    db $fc
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $08
    db $dd
    inc hl
    nop
    rst $38
    nop
    nop
    reti


    ret nz

    cp $f1
    rst $38
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    nop
    nop
    sbc c
    nop
    cp $01
    ld a, a
    sub e
    db $ec
    rst $38
    inc sp
    call z, $a3dc
    add b
    rst $38
    nop
    nop
    sbc c
    nop
    ld a, a
    add b
    cp $c9
    scf
    rst $38
    call z, Call_000_3b33
    call nz, $ff00
    nop
    nop
    sub [hl]
    ld c, $ee
    ld e, $5c
    cp [hl]
    cp d
    db $fc
    ld [hl], h
    ld hl, sp-$14
    ldh a, [$d6]
    ld hl, sp-$01
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
    ld d, h
    dec sp
    inc [hl]
    dec de
    ld a, [hl-]
    dec c
    ld a, d
    dec c
    db $76
    add hl, de
    inc a
    dec bc
    ld a, [hl-]
    dec c
    ld l, d
    dec e
    call nz, $f8ff
    rst $38
    di
    db $fc
    cp h
    ei
    cp h
    rst $18
    cp a
    rst $18
    ld d, a
    rst $28
    ld d, e
    rst $28
    inc sp
    rst $38
    call z, $33ff
    call z, $33cc
    nop
    rst $38
    inc sp
    rst $38
    rst $38
    rst $38
    call z, $33ff
    rst $38
    call z, $33ff
    call z, $33cc
    ld h, b
    rst $38
    ld e, e
    rst $38
    rst $20
    rst $38
    db $e3
    rst $38
    scf
    rst $38
    rst $08
    rst $38
    scf
    rst $08
    rst $08
    ccf
    ld [$38ff], sp
    rst $38
    ldh a, [rIE]
    ret nc

    rst $38
    di
    rst $38
    db $ec
    rst $38
    di
    db $ec
    db $fc
    di
    db $10
    rst $38
    inc de
    rst $38
    rrca
    rst $38
    inc c
    rst $38
    inc sp
    rst $38
    call z, $33ff
    call z, $33cc
    ld b, $ff
    dec sp
    rst $38
    rst $20
    rst $38
    call nz, Call_000_3fff
    rst $38
    rst $18
    rst $38
    ccf
    rst $08
    rst $08
    scf
    rlca
    rst $38
    inc sp
    rst $38
    rst $38
    rst $38
    rst $08
    rst $38
    di
    rst $38
    call z, $f3ff
    call z, $f3ec
    ldh [rIE], a
    di
    rst $38
    rst $38
    rst $38
    db $ec
    rst $38
    inc hl
    rst $38
    rra
    rst $38
    call Call_000_3d3f
    rst $18
    dec a
    ei
    db $fd
    ei
    ld [$caf7], a
    rst $30
    ld a, [hl+]
    call c, $d82c
    ld e, h
    or b
    ld e, [hl]
    or b
    ld l, [hl]
    sbc b
    inc a
    ret nc

    ld e, h
    or b
    ld d, [hl]
    cp b
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
    jr c, jr_003_5adb

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
    and [hl]
    rst $18
    and [hl]
    rst $18
    ld d, e
    rst $28
    ld d, e
    rst $28
    and [hl]
    rst $18
    and [hl]
    rst $18
    ld d, e
    rst $28
    ld d, e
    rst $28
    ld [bc], a
    nop
    jr nz, jr_003_5ad7

jr_003_5ad7:
    ld bc, $0800
    nop

jr_003_5adb:
    add b
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld [$1000], sp
    rra
    jr z, jr_003_5af6

    inc c
    dec bc
    ld c, $05
    add a
    inc b
    inc bc
    ld [bc], a
    inc hl
    ld bc, $0109
    jp nz, $20c0

jr_003_5af6:
    ldh [rNR24], a
    ld hl, sp+$06
    cp $01
    rst $38
    add c
    ld a, a
    pop bc
    ccf
    ld [c], a
    rra
    jr nz, jr_003_5b44

    cpl
    ccf
    ld [hl], b
    ld a, a
    sbc a
    ldh [$7f], a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, $fc
    db $f4
    db $fc
    rrca
    cp $f9
    rlca
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc bc
    inc bc
    inc h
    rlca
    jr jr_003_5b48

    ld h, b
    ld a, a
    add b
    rst $38
    add c
    cp $83
    db $fc
    ld b, a
    ld hl, sp+$0a
    ld hl, sp+$10
    ldh a, [$31]
    ret nc

    ld l, b
    and b
    ldh [rNR41], a
    ret nz

    ld b, b
    and d
    add b
    adc b
    add b
    inc bc

jr_003_5b44:
    inc bc
    inc hl
    inc bc
    rlca

jr_003_5b48:
    rlca
    rrca
    rlca
    adc a
    rrca
    rrca
    rrca
    ccf
    rra
    ccf
    ccf
    ld [c], a
    ldh [$e0], a
    ldh [$e1], a
    ldh [$c8], a
    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    and d
    add b
    adc b
    add b
    ld h, l
    ei
    ld h, l
    ei
    jp z, $caf7

    rst $30
    ld h, l
    ei
    ld h, l
    ei
    jp z, $caf7

    rst $30
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
    jr c, jr_003_5b94

jr_003_5b94:
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
    ld [bc], a
    nop
    jr nz, jr_003_5bb7

jr_003_5bb7:
    inc bc
    inc bc
    rrca
    inc c
    sub a
    jr jr_003_5bed

    scf
    jr c, jr_003_5c00

    jr nz, jr_003_5c02

    di
    adc [hl]
    db $fd
    adc [hl]
    ld [hl], a
    ld hl, sp-$01
    nop
    rst $38
    ccf
    ret nz

    rst $38
    nop
    rst $38
    ccf
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    ccf
    ret nz

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_003_5bed:
    nop
    rst $38
    rst $38
    rst $38
    db $fc
    inc bc
    rst $08
    ld [hl], c
    cp a
    ld [hl], c
    xor $1f
    rst $38
    nop
    rst $38
    db $fc
    inc bc
    rst $38
    nop

jr_003_5c00:
    rst $38
    db $fc

jr_003_5c02:
    rst $38
    ld [bc], a
    nop
    jr nz, jr_003_5c07

jr_003_5c07:
    pop bc
    ret nz

    ld hl, sp+$30
    jp hl


    add hl, de
    push af
    db $ed
    rra
    rst $38
    rlca
    rst $38
    ld a, a
    ld a, a
    ld a, [hl]
    ld a, [hl]
    db $fd
    db $fc
    db $fc
    db $fc
    ld hl, sp-$08
    ld hl, sp-$08
    ld a, [c]
    ldh a, [$f8]
    ldh a, [rSC]
    nop
    jr nz, jr_003_5c27

jr_003_5c27:
    ld bc, $0800
    nop
    add b
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld c, $06
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
    daa
    ccf
    dec sp
    inc a
    cpl
    jr nc, jr_003_5cd9

    ld h, b
    rst $18
    ld h, b
    ld b, a
    ld a, a
    ld e, b
    ld a, a
    ld h, b
    ld a, a
    rst $08
    ldh a, [rIE]
    nop
    rst $38
    nop
    cp $01
    cp a
    ld a, a
    pop bc
    rst $38
    ld bc, $01ff
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    add e
    add b
    rlca
    nop
    rlca
    nop
    ld b, $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    pop bc
    ld bc, $00e0
    ldh [rP1], a
    ldh [$80], a
    di
    rrca
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    db $fd
    cp $83
    rst $38
    add b
    rst $38
    add b
    rst $38
    rst $20
    rst $38
    call c, $f73f
    inc c
    ei
    ld b, $fb
    ld b, $e3
    cp $1b
    cp $07
    cp $f2
    ldh a, [rIF]
    rst $38
    ld hl, sp+$07

jr_003_5cd9:
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
    ld e, $1e
    ld a, h
    ld a, h
    db $fd
    db $fc
    cp b
    ld a, b
    db $ec
    inc e
    ei
    rlca
    db $fc
    rlca
    ld hl, sp+$1f
    ld [bc], a
    nop
    ld h, $06
    dec de
    ld e, $24
    inc a
    call nz, $08fc
    ld hl, sp+$12
    ldh a, [$38]
    ret nc

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

jr_003_5d15:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_003_5d15

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
    jr jr_003_5d4c

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
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    jr nz, jr_003_5d8a

    sbc b

jr_003_5d4c:
    rra
    rlca
    rlca
    ld [hl+], a
    nop
    ld [$0100], sp
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    nop
    rst $38
    ret nz

    rst $38
    ccf
    ccf
    ld [$0700], sp
    ld bc, $0107
    add a
    add b
    jp $43c0


    ret nz

    ld hl, $18e0
    ld hl, sp-$01
    rst $38
    ldh [$80], a
    ldh [$80], a
    pop hl
    ld bc, $01c1
    jp nz, $8403

    rlca
    jr jr_003_5da0

    rst $38
    rst $38
    add b
    rst $38
    add b
    rst $38
    nop
    rst $38
    nop

jr_003_5d8a:
    rst $38
    nop
    rst $38
    inc bc
    rst $38
    db $fd
    cp $77
    ld hl, sp+$03
    cp $03
    cp $03
    cp $07
    db $fc
    rra
    ld hl, sp-$01
    ldh [rIE], a

jr_003_5da0:
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
    rst $38
    nop
    ldh [$7f], a
    add b
    rst $38
    add c
    cp $83
    db $fc
    ld b, a
    ld hl, sp-$31
    ld [hl], c
    cp a
    ld [hl], c
    rst $28
    ld e, $62
    and b
    ldh [rNR41], a
    pop de
    ld [hl], b
    ld hl, sp-$70
    add sp, -$68
    ld hl, sp+$08
    or $0c
    db $fc
    inc b
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
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    cp a
    jr nz, jr_003_5e39

    inc a
    daa
    ccf
    jr nz, jr_003_5e42

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
    rst $18
    ldh [$3f], a
    rst $38
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
    ccf
    ret nz

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
    db $fc
    inc bc
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_003_5e39:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ei
    rlca
    db $fc

jr_003_5e42:
    rst $38
    ld a, [$fa06]
    ld b, $fb
    ld b, $fa
    ld b, $fc
    inc b
    call c, $e63c
    db $fc
    inc b
    db $fc
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
    jr nz, @+$41

    jr nz, jr_003_5eb6

    jr nz, jr_003_5eb8

    jr nz, jr_003_5eba

    ret c

    ld a, a
    ld b, a
    ld a, a
    ld e, a
    ld h, b
    ld e, a
    ld h, b
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
    ret nz

    rst $38
    cp a
    ld a, a
    db $fc
    inc bc
    rst $38
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
    rst $38
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
    inc bc
    rst $38
    db $fd
    cp $3f
    ret nz

    ld b, $fc
    inc b

jr_003_5eb6:
    db $fc
    dec b

jr_003_5eb8:
    db $fc
    inc b

jr_003_5eba:
    db $fc
    ld a, [de]
    cp $e2
    cp $fa
    ld b, $fa
    ld b, $d1
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
    jr jr_003_5f0a

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
    ccf
    jr nz, jr_003_5f35

    jr nc, jr_003_5f27

    db $10
    rla

jr_003_5f0a:
    add hl, de
    adc a
    add hl, bc
    dec bc
    ld c, $27
    inc b
    ld c, $05
    rst $30
    ld a, b
    db $fd
    adc [hl]
    di
    adc [hl]
    ld [c], a
    rra
    pop bc
    ccf
    add c
    ld a, a
    ld bc, $07ff
    cp $ef
    ld e, $bf
    ld [hl], c

jr_003_5f27:
    rst $08
    ld [hl], c
    ld b, a
    ld hl, sp-$7d
    db $fc
    add c
    cp $80
    rst $38
    ldh [$7f], a
    cp $04

jr_003_5f35:
    db $f4
    inc c
    ld sp, hl
    ld [$98e8], sp
    ld hl, sp-$68
    ret nc

    ld [hl], b
    ld [c], a
    jr nz, jr_003_5faa

    and b
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

jr_003_5f57:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_003_5f57

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
    jr jr_003_5f8e

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
    inc c
    dec bc
    jr z, jr_003_5f96

    db $10
    rra
    inc hl
    ccf
    and h
    inc a
    ld e, b

jr_003_5f8e:
    ld a, b
    ld h, d
    ld h, b
    ld [$1f00], sp
    ld hl, sp+$3f

jr_003_5f96:
    ldh [$df], a
    ldh [$37], a
    jr c, @-$61

    ld e, $3f
    ccf
    ld a, $3e
    ld a, b
    ld a, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_003_5faa:
    nop
    rst $38
    nop
    rra
    ldh [$f0], a
    rst $38
    rrca
    rrca
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
    ld hl, sp+$07
    rrca
    rst $38
    ld hl, sp-$10
    ld hl, sp+$1f
    db $fc
    rlca
    ei
    rlca
    db $ec
    inc e
    cp b
    ld a, b
    db $fc
    db $fc
    ld a, [hl]
    ld a, h
    ld e, $1e
    ld [hl-], a
    ret nc

    db $10
    ldh a, [$09]
    ld hl, sp-$3c
    db $fc
    and h
    inc a
    ld a, [de]
    ld e, $26
    ld b, $08
    nop
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
    ld h, d
    ld h, b
    jr nz, jr_003_6027

jr_003_6027:
    ld bc, $0800
    nop
    add b
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld [$0700], sp
    rlca
    inc hl
    inc bc
    ld bc, $0801
    nop
    add b
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld [$e200], sp
    ldh [$f0], a
    ldh a, [$f9]
    ld hl, sp-$08
    ld hl, sp-$04
    db $fc
    ld a, h
    ld a, h
    ld a, [hl]
    ld a, h
    db $fc
    db $fc
    ld b, $06
    jr nz, jr_003_6057

jr_003_6057:
    ld bc, $0800
    nop
    add b
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld [$db00], sp
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
    ld [bc], a
    nop
    jr nz, jr_003_60a7

jr_003_60a7:
    ld bc, $0901
    ld bc, $0383
    inc bc
    inc bc
    inc hl
    inc bc
    dec bc
    inc bc
    rra
    rra
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    db $fc
    ldh [$e0], a
    ld [c], a
    ret nz

    ret z

    ret nz

    ld a, [$f8f8]
    ld hl, sp-$0f
    ldh a, [$c8]
    ret nz

jr_003_60cb:
    add b
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld [$ec00], sp
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
    ld [bc], a
    nop
    daa
    rlca
    dec de
    inc e
    cpl
    jr nc, jr_003_60cb

    jr nc, jr_003_6179

    ld a, h
    ld b, a
    ld a, a
    ld e, [hl]
    ld h, c
    cp $ff
    ld a, [hl]
    add e
    db $fc
    rlca
    db $fc
    rlca
    db $fc
    rlca
    rst $38
    rlca
    rra
    ldh [rIE], a
    rst $38
    ld a, a
    rst $38
    ld a, [hl]
    pop bc
    ccf
    ldh [$3f], a
    ldh [$3f], a
    ldh [rIE], a

jr_003_613e:
    ldh [$f8], a
    rlca
    rst $38
    rst $38
    ld [bc], a
    nop
    ldh [$e0], a
    reti


    jr c, jr_003_613e

    inc c
    db $f4
    inc c
    jp c, $e23e

    cp $7b
    add a
    ld [bc], a
    nop
    jr nz, jr_003_6157

jr_003_6157:
    ld bc, $0800
    nop
    add e
    inc bc
    rlca
    rlca
    ccf
    rra
    rst $38
    rst $38
    cp a
    ccf
    ld b, b
    ld b, b
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
    add b
    add b
    rst $38
    rst $38
    inc b
    inc b
    ld [bc], a
    ld [bc], a

jr_003_6179:
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
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    inc c
    ld c, $0c
    ld c, $0c
    ld c, $0c
    ld c, $0c
    ld c, $ff
    rst $38
    nop
    nop
    nop
    nop
    jr nc, jr_003_61d3

    jr nc, jr_003_61d5

    jr nc, jr_003_61d7

    jr nc, jr_003_61d9

    jr nc, jr_003_61db

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

jr_003_61d3:
    inc bc
    ei

jr_003_61d5:
    cp e
    ld b, e

jr_003_61d7:
    cp e
    ld e, e

jr_003_61d9:
    xor e
    ld d, e

jr_003_61db:
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ld a, a
    ld [hl], b
    ld c, a
    ld a, a
    or b
    rst $38
    xor a
    rst $18
    adc $71
    inc sp
    inc a
    cpl
    rrca
    ld [$ff00], sp
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
    ld [hl], d
    adc [hl]
    call z, $f23c
    ldh a, [$08]
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    sbc a
    rra
    nop
    nop
    ld [hl+], a
    nop
    ld [$ff00], sp
    rst $38
    cp $fe
    ld sp, hl
    ld hl, sp-$18
    ldh [$80], a
    nop
    nop
    nop
    ld [hl+], a
    nop
    ld [$c000], sp
    ret nz

    rst $38
    cp a
    rst $38
    ret nz

    rst $38
    cp a
    cp a
    ret nz

    add b
    rst $38
    ld b, b
    ld a, a
    cp a
    ccf
    ld b, $06
    cp $fa
    db $fc
    inc b
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    inc c
    ld c, $00
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    jr nc, @+$3a

    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
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
    ld a, d
    dec c
    ld a, [hl-]
    dec c
    inc l
    dec de
    db $76
    add hl, de
    ld a, d
    dec c
    ld a, [hl-]
    dec c
    inc [hl]
    dec de
    ld d, h
    dec sp
    ld d, e
    rst $28
    ld d, a
    rst $28
    cp a
    rst $18
    cp h
    rst $18
    cp h
    ei
    or e
    db $fc
    ld hl, sp-$01
    call nz, $ccff
    rst $38
    rst $38
    rst $38
    inc sp
    rst $38
    nop
    rst $38
    call z, $3333
    call z, $ffcc
    inc sp
    rst $38
    rst $38
    rst $38
    rst $38
    sbc [hl]
    rst $38
    adc h
    sbc $80
    db $ed
    and c
    jp nc, $ccb3

    cp a
    ret nz

    cp a
    rst $38
    rst $38
    rst $38
    ld a, c
    rst $38
    ld sp, $017b
    or a
    add l
    ld c, e
    call $fd33
    inc bc
    db $fd
    jp z, $eaf7

    rst $30
    db $fd
    ei
    dec a
    ei
    dec a
    rst $18
    rst $08
    ccf
    rra
    rst $38
    inc hl
    rst $38
    ld d, [hl]
    cp b
    ld e, h
    or b
    inc a
    ret nc

    ld l, [hl]
    sbc b
    ld e, [hl]
    or b
    ld e, h
    or b
    inc l
    ret c

    ld a, [hl+]
    call c, $ddc2
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
    ld l, e
    rra
    scf
    rrca
    ld l, $1f
    ld e, l
    ccf
    ld a, [hl-]
    ld a, l
    ld [hl], a
    ld a, b
    ld l, c
    ld [hl], b
    nop
    nop
    nop
    rst $38
    call c, Call_000_3323
    call z, $ffec
    ld a, a
    sub e
    cp $01
    sbc c
    nop
    nop
    nop
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    cp a
    rst $38
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    inc bc
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    rst $38
    ld bc, $0101
    ld bc, $0101
    ld bc, $ff00
    dec sp
    call nz, $33cc
    scf
    rst $38
    cp $c9
    ld a, a
    add b
    sbc c
    nop
    nop
    nop
    sub $f8
    db $ec
    ldh a, [$74]
    ld hl, sp-$46
    db $fc
    ld e, h
    cp [hl]
    xor $1e
    sub [hl]
    ld c, $00
    nop
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

Call_003_6484:
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr jr_003_64e6

    ld a, [de]
    dec de
    inc e
    dec e
    ld e, $1f
    jr nz, jr_003_64f6

    ld [hl+], a
    inc hl
    inc h
    dec h
    ld h, $27
    jr z, jr_003_6506

    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_003_6516

    ld [hl-], a

jr_003_64e6:
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_003_6526

    ld a, [hl-]
    dec sp
    inc a
    dec a
    ld a, $3f
    ld b, b
    ld b, c
    ld b, d

jr_003_64f6:
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

jr_003_6506:
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
    ld e, a
    inc c

jr_003_6516:
    ld h, c
    ld h, d
    ld h, e
    ld h, h
    ld h, l
    ld a, $66
    ld h, a
    ld l, b
    ld l, c
    ld e, a
    ld l, d
    ld e, a
    ld e, a
    ld l, e
    ld l, h

jr_003_6526:
    ld l, l
    ld [bc], a
    ld l, [hl]
    ld l, a
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld h, a
    ld [hl], e
    ld [hl], h
    ld e, a
    ld l, d
    ld [hl], l
    ld e, a
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
    ld e, a
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
    add h
    adc [hl]
    ld e, a
    ld e, a
    ld e, a
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
    ld e, b
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
    sbc h
    sbc l
    sbc [hl]
    sbc a
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


    jp z, $ffff

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
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    rst $38
    rst $38
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    sub e
    sub e
    db $db
    db $db
    or a
    or a
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
    db $db
    db $db
    add c
    add c
    db $db
    db $db
    db $db
    db $db
    add c
    add c
    db $db
    db $db
    rst $38
    rst $38
    rst $28
    rst $28
    rst $00
    rst $00
    xor e
    xor e
    xor a
    xor a
    rst $00
    rst $00
    db $eb
    db $eb
    xor e
    xor e
    rst $00
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    db $db
    db $db
    rst $30
    rst $30
    rst $28
    rst $28
    db $db
    db $db
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $08
    rst $08
    or a
    or a
    xor a
    xor a
    rst $18
    rst $18
    xor e
    xor e
    or a
    or a
    set 1, e
    rst $38
    rst $38
    rst $20
    rst $20
    rst $30
    rst $30
    rst $28
    rst $28
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
    rst $30
    rst $30
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $30
    rst $30
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    xor e
    xor e
    rst $00
    rst $00
    xor e
    xor e
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    add e
    add e
    rst $28
    rst $28
    rst $28
    rst $28
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
    sbc a
    sbc a
    rst $18
    rst $18
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
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
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    db $fd
    db $fd
    ei
    ei
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    jp $9dc3


    sbc l
    xor l
    xor l
    or l
    or l
    cp c
    cp c
    jp $ffc3


    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $10
    rst $10
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    jp $ffc3


    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    db $fd
    db $fd
    jp $bfc3


    cp a
    add c
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    db $fd
    db $fd
    di
    di
    db $fd
    db $fd
    db $fd
    db $fd
    add c
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    cp a
    cp a
    cp a
    cp a
    or a
    or a
    add c
    add c
    rst $30
    rst $30
    rst $30
    rst $30
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    add e
    add e
    db $fd
    db $fd
    db $fd
    db $fd
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bfc3


    cp a
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    add c
    add c
    db $fd
    db $fd
    ei
    ei
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    jp $bdc3


    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    pop bc
    pop bc
    db $fd
    db $fd
    jp $ffc3


    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    di
    di
    rst $08
    rst $08
    cp a
    cp a
    rst $08
    rst $08
    di
    di
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    rst $38
    rst $38
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    sbc a
    sbc a
    rst $20
    rst $20
    ei
    ei
    rst $20
    rst $20
    sbc a
    sbc a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $08
    rst $08
    or a
    or a
    rst $30
    rst $30
    rst $08
    rst $08
    rst $38
    rst $38
    rst $18
    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    db $e3
    db $e3
    db $dd
    db $dd
    or d
    or d
    xor d
    xor d
    xor d
    xor d
    pop de
    pop de
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    add c
    add c
    cp l
    cp l
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    cp l
    cp l
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp a
    cp a
    cp a
    cp a
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    add e
    add e
    cp a
    cp a
    cp a
    cp a
    add c
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    cp a
    cp a
    add e
    add e
    cp a
    cp a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp a
    cp a
    or c
    or c
    cp l
    cp l
    pop bc
    pop bc
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    add c
    add c
    cp l
    cp l
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    sbc a
    sbc a
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    or a
    or a
    xor a
    xor a
    adc a
    adc a
    or a
    or a
    cp e
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    add c
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    cp l
    sbc c
    sbc c
    and l
    and l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    cp l
    sbc l
    sbc l
    xor l
    xor l
    or l
    or l
    cp c
    cp c
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    add e
    add e
    cp a
    cp a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    or l
    or l
    cp e
    cp e
    push bc
    push bc
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    pop bc
    cp a
    cp a
    jp $fdc3


    db $fd
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    add e
    add e
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    rst $10
    rst $10
    rst $10
    rst $10
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    and l
    and l
    sbc c
    sbc c
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    cp l
    cp l
    db $db
    db $db
    rst $20
    rst $20
    rst $20
    rst $20
    db $db
    db $db
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    ei
    ei
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $20
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    cp a
    cp a
    rst $18
    rst $18
    rst $28
    rst $28
    rst $30
    rst $30
    ei
    ei
    db $fd
    db $fd
    rst $38
    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $20
    rst $20
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $10
    rst $10
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
    jp $ffc3


    rst $38
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
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
    jp $bbc3


    cp e
    cp e
    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $38
    rst $38
    cp a
    cp a
    add a
    add a
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    add a
    add a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bfc3


    cp a
    cp a
    cp a
    cp a
    cp a
    jp $ffc3


    rst $38
    rst $38
    rst $38
    ei
    ei
    jp $bbc3


    cp e
    cp e
    cp e
    cp e
    cp e
    jp $ffc3


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    add e
    add e
    cp a
    cp a
    jp $ffc3


    rst $38
    rst $38
    rst $38
    rst $00
    rst $00
    cp a
    cp a
    cp a
    cp a
    add a
    add a
    cp a
    cp a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    jp $fbc3


    ei
    add a
    add a
    rst $38
    rst $38
    cp a
    cp a
    add a
    add a
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $30
    rst $30
    rst $38
    rst $38
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $30
    rst $08
    rst $08
    rst $38
    rst $38
    cp a
    cp a
    cp e
    cp e
    or a
    or a
    adc a
    adc a
    or a
    or a
    cp e
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    sub e
    sub e
    xor e
    xor e
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    and a
    and a
    sbc e
    sbc e
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add a
    add a
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    add a
    add a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bbc3


    cp e
    cp e
    cp e
    cp e
    cp e
    jp $fbc3


    ei
    rst $38
    rst $38
    rst $38
    rst $38
    and a
    and a
    sbc e
    sbc e
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bfc3


    cp a
    rst $00
    rst $00
    ei
    ei
    add a
    add a
    rst $38
    rst $38
    rst $38
    rst $38
    cp a
    cp a
    cp a
    cp a
    add a
    add a
    cp a
    cp a
    cp a
    cp a
    rst $00
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    rst $10
    rst $10
    rst $10
    rst $10
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    xor e
    xor e
    sub e
    sub e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    rst $10
    rst $10
    cp e
    cp e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    sbc a
    sbc a
    rst $38
    rst $38
    rst $38
    rst $38
    add e
    add e
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $30
    rst $30
    rst $28
    rst $28
    rst $28
    rst $28
    rst $18
    rst $18
    rst $28
    rst $28
    rst $28
    rst $28
    rst $30
    rst $30
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $28
    rst $28
    rst $30
    rst $30
    rst $30
    rst $30
    ei
    ei
    rst $30
    rst $30
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    call $b3cd
    or e
    rst $38
    rst $38
    rst $38
    rst $38
    xor d
    xor d
    ld d, l
    ld d, l
    xor d
    xor d
    ld d, l
    ld d, l
    xor d
    xor d
    ld d, l
    ld d, l
    xor d
    xor d
    ld d, l
    ld d, l
    rst $38
    rst $38
    rst $00
    rst $00
    cp a
    cp a
    adc a
    adc a
    adc a
    adc a
    cp a
    cp a
    rst $00
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    di
    di
    rst $28
    rst $28
    rst $00
    rst $00
    rst $28
    rst $28
    sbc a
    sbc a
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
    sub e
    sub e
    db $db
    db $db
    or a
    or a
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
    xor e
    xor e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $18
    rst $18
    adc a
    adc a
    rst $18
    rst $18
    rst $18
    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $18
    rst $18
    adc a
    adc a
    rst $18
    rst $18
    adc a
    adc a
    rst $18
    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    or a
    or a
    rst $28
    rst $28
    rst $18
    rst $18
    or l
    or l
    rst $38
    rst $38
    rst $38
    rst $38
    rst $10
    rst $10
    rst $28
    rst $28
    jp $bfc3


    cp a
    rst $00
    rst $00
    ei
    ei
    add a
    add a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    rst $28
    rst $28
    rst $30
    rst $30
    rst $38
    rst $38
    rst $38
    rst $38
    pop bc
    pop bc
    or a
    or a
    or c
    or c
    or a
    or a
    or a
    or a
    pop bc
    pop bc
    rst $38
    rst $38
    rst $10
    rst $10
    rst $28
    rst $28
    add e
    add e
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    ld sp, hl
    ld sp, hl
    ei
    ei
    db $fd
    db $fd
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
    sbc a
    sbc a
    rst $18
    rst $18
    cp a
    cp a
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
    ret


    ret


    db $db
    db $db
    db $ed
    db $ed
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
    rst $20
    rst $20
    jp $c3c3


    jp $e7e7


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
    rst $00
    rst $00
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
    add e
    add e
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
    db $eb
    db $eb
    rst $10
    rst $10
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
    add l
    add l
    pop de
    pop de
    push de
    push de
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
    rst $18
    rst $18
    rst $28
    rst $28
    rst $30
    rst $30
    rst $28
    rst $28
    rst $18
    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp $b5c3


    or l
    or e
    or e
    pop bc
    pop bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $10
    rst $10
    rst $38
    rst $38
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    cp a
    cp a
    rst $38
    rst $38
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    jp $afc3


    xor a
    xor a
    xor a
    xor a
    xor a
    jp $efc3


    rst $28
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp a
    cp a
    rrca
    rrca
    cp a
    cp a
    add e
    add e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp e
    cp e
    rst $00
    rst $00
    rst $10
    rst $10
    rst $00
    rst $00
    cp e
    cp e
    rst $38
    rst $38
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    add e
    add e
    rst $28
    rst $28
    add e
    add e
    rst $28
    rst $28
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    db $e3
    db $e3
    rst $18
    rst $18
    add a
    add a
    cp e
    cp e
    rst $00
    rst $00
    rst $30
    rst $30
    adc a
    adc a
    rst $38
    rst $38
    rst $38
    rst $38
    db $db
    db $db
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
    jp $bdc3


    cp l
    ld h, [hl]
    ld h, [hl]
    ld e, [hl]
    ld e, [hl]
    ld e, [hl]
    ld e, [hl]
    ld h, [hl]
    ld h, [hl]
    cp l
    cp l
    jp $c7c3


    rst $00
    or a
    or a
    and a
    and a
    sub a
    sub a
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
    db $eb
    db $eb
    rst $10
    rst $10
    xor a
    xor a
    rst $10
    rst $10
    db $eb
    db $eb
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
    jp $fbc3


    ei
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    ld b, [hl]
    ld b, [hl]
    ld e, d
    ld e, d
    ld b, [hl]
    ld b, [hl]
    ld e, d
    ld e, d
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add a
    add a
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
    rst $08
    rst $08
    or a
    or a
    or a
    or a
    rst $08
    rst $08
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
    rst $28
    rst $28
    rst $00
    rst $00
    rst $28
    rst $28
    rst $38
    rst $38
    rst $00
    rst $00
    rst $38
    rst $38
    rst $08
    rst $08
    or a
    or a
    rst $28
    rst $28
    rst $18
    rst $18
    add a
    add a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    adc a
    adc a
    rst $30
    rst $30
    rst $00
    rst $00
    rst $30
    rst $30
    adc a
    adc a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ei
    ei
    rst $30
    rst $30
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
    cp a
    cp a
    or a
    or a
    or a
    or a
    or a
    or a
    adc e
    adc e
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    push bc
    push bc
    add l
    add l
    add l
    add l
    push bc
    push bc
    push af
    push af
    push af
    push af
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
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
    rst $30
    rst $30
    ei
    ei
    rst $30
    rst $30
    rst $38
    rst $38
    sbc a
    sbc a
    rst $18
    rst $18
    rst $18
    rst $18
    adc a
    adc a
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
    rst $10
    rst $10
    db $eb
    db $eb
    push af
    push af
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $38
    rst $38
    rst $08
    rst $08
    cp a
    cp a
    or a
    or a
    rst $08
    rst $08
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    jp $bdc3


    cp l
    add c
    add c
    cp l
    cp l
    rst $38
    rst $38
    ei
    ei
    rst $30
    rst $30
    rst $38
    rst $38
    jp $bdc3


    cp l
    add c
    add c
    cp l
    cp l
    rst $38
    rst $38
    rst $20
    rst $20
    db $db
    db $db
    rst $38
    rst $38
    jp $bdc3


    cp l
    add c
    add c
    cp l
    cp l
    rst $38
    rst $38
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    jp $bdc3


    cp l
    add c
    add c
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    db $db
    db $db
    rst $38
    rst $38
    jp $bdc3


    cp l
    add c
    add c
    cp l
    cp l
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
    rst $38
    rst $38
    jp $bdc3


    cp l
    add c
    add c
    cp l
    cp l
    rst $38
    rst $38
    rst $38
    rst $38
    pop hl
    pop hl
    rst $20
    rst $20
    rst $10
    rst $10
    pop bc
    pop bc
    or a
    or a
    or c
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp a
    cp a
    cp a
    cp a
    cp l
    cp l
    jp $f7c3


    rst $30
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    add e
    add e
    cp a
    cp a
    add c
    add c
    ei
    ei
    rst $30
    rst $30
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    add e
    add e
    cp a
    cp a
    add c
    add c
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    add e
    add e
    cp a
    cp a
    add c
    add c
    rst $38
    rst $38
    db $db
    db $db
    rst $38
    rst $38
    add c
    add c
    cp a
    cp a
    add e
    add e
    cp a
    cp a
    add c
    add c
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $10
    rst $10
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $10
    rst $10
    rst $38
    rst $38
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    add e
    add e
    cp l
    cp l
    cp l
    cp l
    dec c
    dec c
    cp l
    cp l
    add e
    add e
    rst $38
    rst $38
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    sbc l
    sbc l
    xor l
    xor l
    or l
    or l
    cp c
    cp c
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    ei
    ei
    rst $30
    rst $30
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $20
    rst $20
    db $db
    db $db
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    db $db
    db $db
    rst $38
    rst $38
    jp $bdc3


    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    pop bc
    pop bc
    cp c
    cp c
    or l
    or l
    xor l
    xor l
    sbc l
    sbc l
    add e
    add e
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    ei
    ei
    rst $30
    rst $30
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $20
    rst $20
    db $db
    db $db
    rst $38
    rst $38
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    rst $38
    rst $38
    db $db
    db $db
    rst $38
    rst $38
    cp l
    cp l
    cp l
    cp l
    cp l
    cp l
    jp $ffc3


    rst $38
    ei
    ei
    rst $30
    rst $30
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    cp a
    cp a
    adc a
    adc a
    or a
    or a
    or a
    or a
    adc a
    adc a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    add a
    add a
    cp e
    cp e
    or a
    or a
    cp e
    cp e
    cp e
    cp e
    and a
    and a
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    jp $bbc3


    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    ei
    ei
    rst $30
    rst $30
    rst $38
    rst $38
    jp $bbc3


    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $20
    rst $20
    db $db
    db $db
    rst $38
    rst $38
    jp $bbc3


    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    jp $bbc3


    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $38
    rst $38
    db $db
    db $db
    rst $38
    rst $38
    jp $bbc3


    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $20
    rst $20
    rst $20
    rst $20
    rst $38
    rst $38
    jp $bbc3


    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp $b5c3


    or l
    and e
    and e
    pop de
    pop de
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp $bfc3


    cp a
    cp a
    cp a
    cp a
    cp a
    jp $f7c3


    rst $30
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    add e
    add e
    cp a
    cp a
    jp $fbc3


    ei
    rst $30
    rst $30
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    add e
    add e
    cp a
    cp a
    jp $e7c3


    rst $20
    db $db
    db $db
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    add e
    add e
    cp a
    cp a
    jp $ffc3


    rst $38
    db $db
    db $db
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    add e
    add e
    cp a
    cp a
    jp $ffc3


    rst $38
    push af
    push af
    ei
    ei
    push bc
    push bc
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    and a
    and a
    sbc e
    sbc e
    cp e
    cp e
    cp e
    cp e
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    rst $28
    rst $28
    rst $10
    rst $10
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    db $eb
    db $eb
    rst $10
    rst $10
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    rst $10
    rst $10
    rst $38
    rst $38
    rst $00
    rst $00
    cp e
    cp e
    cp e
    cp e
    rst $00
    rst $00
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $28
    rst $28
    rst $38
    rst $38
    add e
    add e
    rst $38
    rst $38
    rst $28
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    jp $b3c3


    or e
    xor e
    xor e
    sbc e
    sbc e
    add a
    add a
    rst $38
    rst $38
    rst $18
    rst $18
    rst $28
    rst $28
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $28
    rst $28
    rst $10
    rst $10
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $10
    rst $10
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    or e
    or e
    set 1, e
    rst $38
    rst $38
    rst $30
    rst $30
    rst $28
    rst $28
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    sbc a
    sbc a
    rst $38
    rst $38
    cp a
    cp a
    sbc a
    sbc a
    xor a
    xor a
    xor a
    xor a
    sbc a
    sbc a
    cp a
    cp a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $10
    rst $10
    rst $38
    rst $38
    cp e
    cp e
    cp e
    cp e
    rst $10
    rst $10
    rst $28
    rst $28
    sbc a
    sbc a
    ld bc, $93ff
    ld h, h
    nop
    nop
    sub e
    ld h, l
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
    inc c
    dec de
    stop
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
    inc e
    stop
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
    ld e, $10
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
    rra
    stop
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
    daa
    stop
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
    jr z, jr_003_72ed

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

jr_003_72ed:
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
    ld a, [hl+]
    stop
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
    dec hl
    stop
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
    inc c
    jr nz, jr_003_7347

jr_003_7347:
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
    inc c
    jr nz, jr_003_7356

jr_003_7356:
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
    inc de
    jr nz, jr_003_7377

jr_003_7377:
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
    inc de
    jr nz, jr_003_7386

jr_003_7386:
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
    jr jr_003_73c6

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
    jr @+$22

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

jr_003_73c6:
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

Jump_003_7411:
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
    inc h
    or b
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
    dec l
    or b
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
    inc h
    or b
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
    dec l
    or b
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
    inc d
    stop
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
    stop
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
    inc e
    stop
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
    dec e
    stop
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
    jr nz, jr_003_75de

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
    ld hl, $0010

jr_003_75de:
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
    jr z, jr_003_760e

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

jr_003_760e:
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
    dec b
    jr nz, jr_003_7647

jr_003_7647:
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
    dec b
    jr nz, jr_003_7656

jr_003_7656:
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
    inc c
    jr nz, jr_003_7677

jr_003_7677:
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
    inc c
    jr nz, jr_003_7686

jr_003_7686:
    ld e, d
    nop
    nop

Jump_003_7689:
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
    rrca
    jr nz, jr_003_76d7

jr_003_76d7:
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
    rrca
    jr nz, jr_003_76e6

jr_003_76e6:
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
    inc hl
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc hl
    stop
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
    inc hl
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc hl
    stop
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
    inc hl
    stop
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
    inc hl
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc hl
    stop
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
    inc hl
    stop
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
    rra
    jr nz, jr_003_77be

jr_003_77be:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rra
    jr nz, jr_003_77c7

jr_003_77c7:
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
    rra
    jr nz, jr_003_77d6

jr_003_77d6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rra
    jr nz, jr_003_77df

jr_003_77df:
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
    dec e
    jr nz, jr_003_77ee

jr_003_77ee:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec e
    jr nz, jr_003_77f7

jr_003_77f7:
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
    dec e
    jr nz, jr_003_7806

jr_003_7806:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec e
    jr nz, jr_003_780f

jr_003_780f:
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
    inc e
    jr nz, jr_003_781e

jr_003_781e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    jr nz, jr_003_7827

jr_003_7827:
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
    inc e
    jr nz, jr_003_7836

jr_003_7836:
    dec e
    jr nz, jr_003_7839

jr_003_7839:
    ld e, d
    nop
    nop
    ld a, [de]
    jr nz, jr_003_783f

jr_003_783f:
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
    inc de
    stop
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
    ld [de], a
    stop
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
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
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
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
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
    ld hl, $0010
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
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
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
    ld hl, $0010
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
    dec de
    jr nz, jr_003_79fe

jr_003_79fe:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec de
    jr nz, jr_003_7a07

jr_003_7a07:
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
    dec de
    jr nz, jr_003_7a16

jr_003_7a16:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec de
    jr nz, jr_003_7a1f

jr_003_7a1f:
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
    ld a, [de]
    jr nz, jr_003_7a2e

jr_003_7a2e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    jr jr_003_7a56

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
    jr nz, jr_003_7a46

jr_003_7a46:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    dec de
    jr nz, jr_003_7a4f

jr_003_7a4f:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d

jr_003_7a56:
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    jr nz, jr_003_7a5e

jr_003_7a5e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    jr jr_003_7a86

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
    ld a, [de]
    jr nz, jr_003_7a76

jr_003_7a76:
    dec de
    jr nz, jr_003_7a79

jr_003_7a79:
    ld e, d
    nop
    nop
    jr jr_003_7a9e

    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d

jr_003_7a86:
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

jr_003_7a9e:
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
    ld de, $0010
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
    rrca
    stop
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
    ld c, $10
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
    inc e
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc e
    stop
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
    inc e
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc e
    stop
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
    inc e
    stop
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
    inc e
    stop
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
    inc e
    stop
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
    inc e
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc e
    stop
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
    inc e
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc e
    stop
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
    inc e
    stop
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
    ld a, [de]
    jr nz, jr_003_7c6e

jr_003_7c6e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    jr jr_003_7c96

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
    jr nz, jr_003_7c86

jr_003_7c86:
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

jr_003_7c96:
    nop
    nop
    ld e, d
    nop
    nop
    dec d
    jr nz, jr_003_7c9e

jr_003_7c9e:
    ld e, d
    nop
    nop
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
    rla
    jr nz, jr_003_7cb6

jr_003_7cb6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    jr jr_003_7cde

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
    add hl, de
    jr nz, jr_003_7cce

jr_003_7cce:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    jr nz, jr_003_7cd7

jr_003_7cd7:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d

jr_003_7cde:
    nop
    nop
    ld e, d
    nop
    nop
    dec de
    jr nz, jr_003_7ce6

jr_003_7ce6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc c
    stop
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

jr_003_7d9b:
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
    nop
    jr nz, jr_003_7dac

jr_003_7dac:
    ld l, h
    ld [hl], d
    ld l, h
    ld [hl], l
    ld l, h
    ld [hl], d
    db $ec
    db $76
    inc l
    ld a, c
    ld l, h
    ld a, e
    inc l
    ld [hl], e
    inc l
    db $76
    inc l
    ld [hl], e
    xor h
    ld [hl], a
    db $ec
    ld a, c
    inc l
    ld a, h
    db $ec
    ld [hl], e
    db $ec
    ld [hl], e
    db $ec
    ld [hl], e
    ld l, h
    ld a, b
    xor h
    ld a, d
    db $ec
    ld a, h
    xor h
    ld [hl], h
    xor h
    ld [hl], h
    xor h
    ld [hl], h
    xor h
    ld [hl], h
    xor h
    ld [hl], h
    xor h
    ld [hl], h
    nop
    nop
    or l
    add b
    nop
    add b
    sub [hl]
    add b
    nop
    nop
    add hl, bc
    ret nz

    nop
    jr nc, jr_003_7d9b

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
    nop
    ld b, b
    ld bc, $8080
    jr nz, jr_003_7e1f

jr_003_7e1f:
    ret nz

    add b
    jr nz, @+$05

    ret nz

    add b
    jr nz, jr_003_7e2b

    ret nz

    add b
    jr nz, jr_003_7e30

jr_003_7e2b:
    ret nz

    add b
    jr nz, jr_003_7e35

    ret nz

jr_003_7e30:
    nop
    jr nz, @+$09

    add b
    nop

jr_003_7e35:
    jr nz, jr_003_7e3f

    add b
    nop
    jr nz, jr_003_7e44

    add b
    nop
    jr nz, jr_003_7e49

jr_003_7e3f:
    add b
    nop
    jr nz, @+$0d

    add b

jr_003_7e44:
    nop
    jr nz, jr_003_7e53

    add b
    nop

jr_003_7e49:
    jr nz, jr_003_7e58

    add b
    nop
    jr nz, jr_003_7e5d

    add b
    nop
    jr nz, jr_003_7e62

jr_003_7e53:
    add b
    sub c
    nop
    rst $38
    nop

jr_003_7e58:
    nop
    nop
    nop
    nop
    or c

jr_003_7e5d:
    nop
    inc bc
    ld [$160c], sp

jr_003_7e62:
    dec de
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
    jr nz, jr_003_7e90

    jr nz, jr_003_7e92

    jr nz, jr_003_7e94

    sub h
    nop
    jr jr_003_7e90

    jr jr_003_7e92

    jr jr_003_7e94

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
    jr jr_003_7ea0

    jr jr_003_7ea2

    jr jr_003_7ea4

    or c
    add b
    jr jr_003_7ea8

jr_003_7e90:
    jr jr_003_7eaa

jr_003_7e92:
    jr jr_003_7eac

jr_003_7e94:
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

jr_003_7ea0:
    jr nz, jr_003_7ec2

jr_003_7ea2:
    jr nz, jr_003_7ec4

jr_003_7ea4:
    sub d
    ld b, b
    nop
    nop

jr_003_7ea8:
    nop
    nop

jr_003_7eaa:
    nop
    nop

jr_003_7eac:
    or e
    nop
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

jr_003_7ec2:
    inc b
    inc b

jr_003_7ec4:
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
    inc b
    ld l, e
    ld [hl], d
    xor h
    ld a, l
    cp b
    ld a, l
    call nz, $d07d
    ld a, l
    call c, $187d
    ld a, [hl]
    ld d, h
    ld a, [hl]
    ld c, e
    ld [hl], d
    call z, Call_000_257e
    ld [de], a
    inc b
    ld h, c
    inc d
    nop
    nop
    rst $38
    db $fc
    ld sp, $fcff
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
