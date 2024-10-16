SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

    xor a
    ld hl, $c501
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c4fd
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c4ff
    ld [hl+], a
    ld [hl], a
    ld hl, $c507
    ld [hl], $00
    ld hl, $c508
    ld [hl], $00
    xor a
    ld hl, $c509
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, $c50b
    ld [hl+], a
    ld [hl], a
    ld de, $0444
    push de
    ld de, $0000
    push de
    ld de, $c0b9
    push de
    call Call_000_37b0
    add sp, $06
    ret


    ld [bc], a
    ld bc, $ff00
    cp $fd
    db $fc
    ei
    ld a, [$fcfb]
    db $fd
    cp $ff
    nop
    nop
    nop
    nop
    rlca
    nop
    ld [$0702], sp
    add b
    nop
    nop
    nop

    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl
    ld hl, $c0b9
    res 2, [hl]
    res 3, [hl]
    ret


    add sp, -$08
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop bc
    push bc
    ld l, c
    ld h, b
    ld a, [hl]
    and $01
    ld hl, sp+$07
    ld [hl], a
    or a
    jp z, Jump_001_41d8

    ld hl, sp+$00
    ld a, [hl]
    sub $b9
    jr nz, jr_001_4096

    inc hl
    ld a, [hl]
    sub $c0
    jp z, Jump_001_41d8

    jr jr_001_4096

jr_001_4096:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$07
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    res 0, [hl]
    pop de
    push de
    ld hl, $0030
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
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    push de
    ld hl, $0032
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4115

    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_4115

    ld de, $0030
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
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
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl+], a
    ld e, c
    ld d, b
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
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
    jr jr_001_414e

jr_001_4115:
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4137

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld e, l
    ld d, h
    xor a
    ld [de], a
    inc de
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, $c4fd
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_414e

jr_001_4137:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_4148

    ld de, $0030
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    jr jr_001_414e

jr_001_4148:
    xor a
    ld hl, $c4fd
    ld [hl+], a
    ld [hl], a

jr_001_414e:
    xor a
    ld [bc], a
    inc bc
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $c501
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4172

    ld a, [hl+]
    ld b, [hl]
    add $32
    ld c, a
    jr nc, jr_001_416b

    inc b

jr_001_416b:
    ld hl, sp+$00
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a

jr_001_4172:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c501], a
    ld hl, sp+$01
    ld a, [hl]
    ld [$c502], a
    pop de
    push de
    ld hl, $002b
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
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push hl
    bit 7, [hl]
    pop hl
    jr nz, jr_001_41ab

    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, $6301
    call RST_08
    inc sp

jr_001_41ab:
    pop de
    push de
    ld hl, $002d
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
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push hl
    bit 7, [hl]
    pop hl
    jr nz, jr_001_41d8

    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, $6367
    call RST_08
    inc sp

Jump_001_41d8:
jr_001_41d8:
    add sp, $08
    ret


    add sp, -$08
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl]
    and $01
    jp nz, Jump_001_4317

    ld l, c
    ld h, b
    ld a, [hl]
    swap a
    rlca
    jp c, Jump_001_4317

    ld l, c
    ld h, b
    set 0, [hl]
    push bc
    push bc
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl
    pop bc
    ld hl, $0030
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0032
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4272

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    or l
    jr z, jr_001_4272

    ld de, $0030
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    ld [de], a
    pop de
    push de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
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
    jr jr_001_42ad

jr_001_4272:
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4291

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld e, l
    ld d, h
    xor a
    ld [de], a
    inc de
    ld [de], a
    pop de
    push de
    ld a, [de]
    ld hl, $c501
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_42ad

jr_001_4291:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    or l
    jr z, jr_001_42a7

    ld de, $0030
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    jr jr_001_42ad

jr_001_42a7:
    xor a
    ld hl, $c501
    ld [hl+], a
    ld [hl], a

jr_001_42ad:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld [hl+], a
    ld [hl], a
    pop de
    push de
    ld hl, $c4fd
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    or [hl]
    jr z, jr_001_42cd

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_001_42cd:
    ld hl, $c4fd
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $002b
    add hl, bc
    ld e, l
    ld d, h
    xor a
    ld [hl+], a
    ld [hl], $80
    ld hl, $0028
    add hl, bc
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    or a
    jr z, jr_001_430f

    inc hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $0029
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    push bc
    xor a
    push af
    inc sp
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $06
    pop bc

jr_001_430f:
    ld hl, $002d
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], $80

Jump_001_4317:
    add sp, $08
    ret


    add sp, -$06
    ld a, [$c501]
    ld [$c515], a
    ld a, [$c502]
    ld [$c516], a

Jump_001_4328:
    ld hl, $c516
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_440e

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    inc hl
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
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$05
    ld [hl], e
    ld hl, $0030
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jp nz, Jump_001_43ff

    ld l, c
    ld h, b
    inc hl
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
    ld hl, sp+$02
    ld a, c
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$04
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_001_43b6

    bit 7, d
    jr nz, jr_001_43bb

    cp a
    jr jr_001_43bb

jr_001_43b6:
    bit 7, d
    jr z, jr_001_43bb

    scf

jr_001_43bb:
    jr nc, jr_001_43ff

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0017
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_001_43db

    bit 7, d
    jr nz, jr_001_43e0

    cp a
    jr jr_001_43e0

jr_001_43db:
    bit 7, d
    jr z, jr_001_43e0

    scf

jr_001_43e0:
    jr nc, jr_001_43ff

    pop bc
    push bc
    push bc
    ld hl, $c515
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, $41db
    call RST_08
    pop hl
    pop bc
    ld hl, $c515
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_001_4328


Jump_001_43ff:
jr_001_43ff:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c515], a
    ld hl, sp+$01
    ld a, [hl]
    ld [$c516], a
    jp Jump_001_4328


Jump_001_440e:
    add sp, $06
    ret


    add sp, -$07
    ld a, [$c501]
    ld [$c517], a
    ld a, [$c502]
    ld [$c518], a

Jump_001_441f:
    ld hl, $c518
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_455f

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    inc hl
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
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
    ld [hl], e
    ld l, c
    ld h, b
    inc hl
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
    pop de
    push de
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
    ld hl, sp+$02
    ld [hl], e
    ld hl, sp+$05
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
    ld hl, $0007
    add hl, bc
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
    ld hl, sp+$05
    ld [hl], e
    pop de
    push de
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, $0008
    add hl, bc
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
    ld hl, sp+$06
    ld [hl], e
    ld hl, $0030
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr c, jr_001_4556

    inc hl
    ld a, [hl]
    ld hl, sp+$0d
    sub [hl]
    jr c, jr_001_4556

    inc hl
    ld e, [hl]
    ld d, $00
    ld hl, $0015
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$03
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
    jr z, jr_001_452c

    bit 7, d
    jr nz, jr_001_4531

    cp a
    jr jr_001_4531

jr_001_452c:
    bit 7, d
    jr z, jr_001_4531

    scf

jr_001_4531:
    jr c, jr_001_4556

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr c, jr_001_4556

    push bc
    ld hl, $c517
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, $41db
    call RST_08
    pop hl
    pop bc
    ld hl, $c517
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_001_441f


jr_001_4556:
    ld hl, $c517
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_001_441f


Jump_001_455f:
    add sp, $07
    ret


    add sp, -$05
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$04
    ld [hl], a
    ld hl, $000d
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_001_459c

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr z, jr_001_45b3

jr_001_459c:
    ld hl, $000b
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0d
    ld a, [hl]
    ld [bc], a
    pop de
    push de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0e
    ld a, [hl]
    ld [de], a

jr_001_45b3:
    add sp, $05
    ret


    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, $000b
    add hl, de
    pop de
    inc sp
    inc sp
    push hl
    ld hl, $000c
    add hl, de
    ld c, [hl]
    ld hl, $000d
    add hl, de
    ld e, [hl]
    ld d, $00
    ld l, c
    ld h, $00
    ld a, e
    sub l
    ld b, a
    ld a, d
    sbc h
    ld hl, sp+$0a
    ld e, [hl]
    ld d, $00
    push bc
    ld l, b
    ld h, a
    push hl
    push de
    call Call_000_389d
    add sp, $04
    pop bc
    ld a, e
    add c
    ld c, a
    pop hl
    push hl
    ld [hl], c
    inc sp
    inc sp
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000b
    add hl, bc
    ld e, [hl]
    ld hl, $000c
    add hl, bc
    ld c, [hl]
    ld a, e
    sub c
    ld e, a
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld e, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    sla e
    ld d, $00
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
    add sp, $04
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld a, [hl]
    add $04
    ld e, a
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    sla e
    ld d, $00
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
    add sp, $04
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld a, [hl+]
    ld [de], a
    ld a, [hl]
    or a
    jr z, jr_001_46a1

    dec hl
    ld a, [hl]
    add $04
    ld e, a
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    sla e
    ld d, $00
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
    add sp, $04
    ret


jr_001_46a1:
    ld hl, sp+$08
    ld e, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    ld d, l
    sla e
    ld l, d
    ld d, $00
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
    add sp, $04
    ret


    add sp, -$04
    ld a, [$c4fd]
    ld hl, sp+$00
    ld [hl], a
    ld a, [$c4fe]
    ld hl, sp+$01
    ld [hl], a

Jump_001_46d8:
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_479a

    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr nz, jr_001_46f4

    ld hl, sp+$00
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    swap a
    rrca
    and $01
    jp z, Jump_001_4786

jr_001_46f4:
    pop bc
    push bc
    inc bc
    ld l, c
    ld h, b
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
    ld hl, sp+$03
    ld [hl], e
    ld l, c
    ld h, b
    inc hl
    inc hl
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
    ld hl, sp+$0b
    ld a, [hl]
    sub c
    jr z, jr_001_4755

    ld b, $00
    inc bc
    ld hl, sp+$0b
    ld e, [hl]
    ld d, $00
    ld a, e
    sub c
    jr nz, jr_001_4786

    ld a, d
    sub b
    jr nz, jr_001_4786

jr_001_4755:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$03
    sub [hl]
    jr z, jr_001_4782

    ld hl, sp+$03
    ld c, [hl]
    ld b, $00
    ld e, c
    ld d, b
    inc de
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl]
    sub e
    jr nz, jr_001_4776

    inc hl
    ld a, [hl]
    sub d
    jr z, jr_001_4782

jr_001_4776:
    dec bc
    ld hl, sp+$02
    ld a, [hl]
    sub c
    jr nz, jr_001_4786

    inc hl
    ld a, [hl]
    sub b
    jr nz, jr_001_4786

jr_001_4782:
    pop de
    push de
    jr jr_001_479d

Jump_001_4786:
jr_001_4786:
    pop de
    push de
    ld hl, $0030
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_46d8


Jump_001_479a:
    ld de, $0000

jr_001_479d:
    add sp, $04
    ret


    add sp, -$0c
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], d
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$04
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld hl, sp+$12
    ld c, [hl]
    ld b, $00
    ld a, c
    add a
    rl b
    add a
    rl b
    add a
    rl b
    add a
    rl b
    ld hl, sp+$06
    ld [hl+], a
    ld [hl], b
    ld a, [$c0be]
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld hl, $19c4
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
    ld e, a
    rlca
    sbc a
    ld d, a
    push bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld hl, sp+$0a
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
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc de
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    push bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld hl, sp+$0a
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
    ld de, $c0b9
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$13
    ld a, [hl]
    push af
    inc sp
    push de
    push bc
    ld de, $c0bf
    push de
    ld e, $01
    ld hl, $4b20
    call RST_08
    add sp, $13
    ret


    add sp, -$10
    ld de, $c0eb
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

Jump_001_4893:
jr_001_4893:
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_4b1a

    pop de
    push de
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl]
    or a
    jr nz, jr_001_48d5

    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    swap a
    rrca
    and $01
    jr nz, jr_001_48d5

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_4893

jr_001_48d5:
    pop de
    push de
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl], a
    pop de
    push de
    ld hl, $0006
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl+], a
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
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld hl, sp+$0e
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
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
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_001_49a9

    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld a, [bc]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld a, [$c0bf]
    ld hl, sp+$0e
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
    ld hl, sp+$08
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
    ld [hl], a
    ld hl, sp+$0a
    ld e, l
    ld d, h
    ld hl, sp+$0e
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_001_49b0

jr_001_49a9:
    ld hl, sp+$0f
    ld [hl], $00
    jp Jump_001_4b01


jr_001_49b0:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
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
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
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
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
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
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$0e
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
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
    ld hl, sp+$0f
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0e
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
    ld [hl], a
    ld hl, sp+$0e
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr c, jr_001_4af7

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
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
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    ld a, [$c0c1]
    ld hl, sp+$0f
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$09
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
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$0c
    ld e, l
    ld d, h
    ld hl, sp+$0e
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_001_4afd

jr_001_4af7:
    ld hl, sp+$0f
    ld [hl], $00
    jr jr_001_4b01

jr_001_4afd:
    ld hl, sp+$0f
    ld [hl], $01

Jump_001_4b01:
jr_001_4b01:
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr z, jr_001_4b0b

    pop de
    push de
    jr jr_001_4b1d

jr_001_4b0b:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_4893


Jump_001_4b1a:
    ld de, $0000

jr_001_4b1d:
    add sp, $10
    ret


    add sp, -$17
    ld hl, sp+$00
    ld [hl], $b9
    inc hl
    ld [hl], $c0
    ld hl, sp+$1f
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$20
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
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$02
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
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ld hl, sp+$0c
    ld [hl], a

Jump_001_4b82:
jr_001_4b82:
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_4d39

    pop de
    push de
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0f
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$00
    sub [hl]
    jr nz, jr_001_4ba9

    ld hl, sp+$22
    ld a, [hl]
    ld hl, sp+$01
    sub [hl]
    jr z, jr_001_4bbd

jr_001_4ba9:
    ld hl, sp+$23
    ld a, [hl]
    or a
    jr nz, jr_001_4bcb

    ld hl, sp+$00
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    swap a
    rrca
    and $01
    jr nz, jr_001_4bcb

jr_001_4bbd:
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_4b82

jr_001_4bcb:
    pop de
    push de
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$13
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$12
    ld [hl], a
    pop de
    push de
    ld hl, $0006
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$11
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$10
    ld [hl+], a
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
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld hl, sp+$13
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$17
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$16
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
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$15
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr c, jr_001_4c80

    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc de
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$17
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$15
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_001_4c84

jr_001_4c80:
    xor a
    jp Jump_001_4d23


jr_001_4c84:
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
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
    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    inc de
    inc de
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
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
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
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
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$15
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$13
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_001_4d1e

    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, [hl]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$15
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    sub e
    ld a, b
    sbc d
    jr nc, jr_001_4d21

jr_001_4d1e:
    xor a
    jr jr_001_4d23

jr_001_4d21:
    ld a, $01

Jump_001_4d23:
jr_001_4d23:
    or a
    jr z, jr_001_4d2a

    pop de
    push de
    jr jr_001_4d3c

jr_001_4d2a:
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_4b82


Jump_001_4d39:
    ld de, $0000

jr_001_4d3c:
    add sp, $17
    ret


    dec sp
    ld a, [$c508]
    or a
    jr nz, jr_001_4dba

    ld hl, $c50a
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4dba

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $002f
    add hl, bc
    ld c, [hl]
    ld a, c
    or a
    jr z, jr_001_4dc2

    ld a, [$c0de]
    ld hl, sp+$00
    ld [hl], a
    or a
    jr z, jr_001_4d84

    ld b, $00
    ld hl, $c0df
    ld a, [hl+]
    ld h, [hl]
    ld e, a
    ld d, h
    push bc
    ld a, $01
    push af
    inc sp
    ld bc, $0000
    push bc
    push de
    ld hl, sp+$07
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $08

jr_001_4d84:
    ld hl, $c509
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0025
    add hl, de
    ld b, [hl]
    ld a, b
    or a
    jr z, jr_001_4db3

    ld hl, $0026
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $0000
    push de
    ld a, $01
    push af
    inc sp
    ld de, $0000
    push de
    push hl
    push bc
    inc sp
    ld e, $02
    ld hl, $61bc
    call RST_08
    add sp, $08

jr_001_4db3:
    ld hl, $c508
    ld [hl], $14
    jr jr_001_4dc2

jr_001_4dba:
    ld hl, $c508
    ld a, [hl]
    or a
    jr z, jr_001_4dc2

    dec [hl]

jr_001_4dc2:
    xor a
    ld hl, $c509
    ld [hl+], a
    ld [hl], a
    inc sp
    ret


    add sp, -$10
    ld hl, sp+$16
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$17
    ld a, [hl]
    ld hl, sp+$0d
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
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$1c
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$1d
    ld a, [hl]
    ld hl, sp+$09
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
    ld hl, sp+$18
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$07
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
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0a
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
    ld hl, sp+$1e
    ld a, [hl]
    dec a
    jr z, jr_001_4e9a

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    sub $02
    jp z, Jump_001_50a7

    ld hl, sp+$1e
    ld a, [hl]
    sub $03
    jp z, Jump_001_52b9

    ld hl, sp+$1e
    ld a, [hl]
    sub $04
    jp z, Jump_001_5428

    jp Jump_001_55b2


jr_001_4e9a:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$0d
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
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$09
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
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$09
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
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
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$07
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
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    inc sp
    inc sp
    push hl
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a

Jump_001_4f9f:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_001_4fb0

    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jp z, Jump_001_509f

jr_001_4fb0:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl-]
    dec hl
    ld [hl], a

Jump_001_4fba:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$06
    sub [hl]
    jr nz, jr_001_4fcb

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jp z, Jump_001_5087

jr_001_4fcb:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$02
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_501c

    ld hl, sp+$02
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_501c

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$02
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
    ld hl, sp+$03
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
    ld hl, sp+$03
    ld [hl], e
    jr jr_001_5020

jr_001_501c:
    ld hl, sp+$03
    ld [hl], $0f

jr_001_5020:
    push hl
    ld hl, sp+$05
    bit 3, [hl]
    pop hl
    jr z, jr_001_507c

    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld a, $07

jr_001_5042:
    ld hl, sp+$0c
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_5042

    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld a, $04

jr_001_5059:
    ld hl, sp+$0e
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_5059

    dec hl
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
    ld hl, sp+$0b
    ld [hl-], a
    ld [hl], e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


jr_001_507c:
    ld hl, sp+$06
    inc [hl]
    jp nz, Jump_001_4fba

    inc hl
    inc [hl]
    jp Jump_001_4fba


Jump_001_5087:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    jp Jump_001_4f9f


Jump_001_509f:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


Jump_001_50a7:
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
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
    pop de
    push de
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$09
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
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$09
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
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
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$07
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
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    inc sp
    inc sp
    push hl
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a

Jump_001_51b3:
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_001_51c4

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jp z, Jump_001_52b1

jr_001_51c4:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl-]
    dec hl
    ld [hl], a

Jump_001_51ce:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$06
    sub [hl]
    jr nz, jr_001_51df

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jp z, Jump_001_529b

jr_001_51df:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$02
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_5230

    ld hl, sp+$02
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_5230

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$02
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
    ld hl, sp+$03
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
    ld hl, sp+$03
    ld [hl], e
    jr jr_001_5234

jr_001_5230:
    ld hl, sp+$03
    ld [hl], $0f

jr_001_5234:
    push hl
    ld hl, sp+$05
    bit 2, [hl]
    pop hl
    jr z, jr_001_5290

    ld a, $07

jr_001_523e:
    ld hl, sp+$0e
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_523e

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    inc hl
    ld d, a
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld a, $04

jr_001_526e:
    ld hl, sp+$0c
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_526e

    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$0b
    ld [hl-], a
    ld [hl], e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


jr_001_5290:
    ld hl, sp+$06
    inc [hl]
    jp nz, Jump_001_51ce

    inc hl
    inc [hl]
    jp Jump_001_51ce


Jump_001_529b:
    ld hl, sp+$04
    inc [hl]
    jr nz, jr_001_52a2

    inc hl
    inc [hl]

jr_001_52a2:
    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    jp Jump_001_51b3


Jump_001_52b1:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


Jump_001_52b9:
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
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$02
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
    ld hl, sp+$08
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
    ld de, $0001
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld hl, sp+$05
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$06
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
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
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
    inc bc
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_001_5359:
    ld hl, sp+$04
    ld a, [hl]
    sub e
    jr nz, jr_001_5365

    inc hl
    ld a, [hl]
    sub d
    jp z, Jump_001_5420

jr_001_5365:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a

Jump_001_5371:
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr nz, jr_001_5382

    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$0f
    sub [hl]
    jp z, Jump_001_5417

jr_001_5382:
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_53de

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_53de

    ld a, [$c52f]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, $c532
    ld c, [hl]
    ld b, $00
    ld hl, sp+$0d
    ld a, [hl-]
    ld [hl+], a
    xor a
    ld [hl-], a
    push de
    push bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    pop de
    ld a, c
    ld hl, $c530
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, sp+$0a
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    push de
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    push bc
    call Call_000_1307
    add sp, $03
    ld c, e
    pop de
    ld hl, sp+$0d
    ld [hl], c
    jr jr_001_53e2

jr_001_53de:
    ld hl, sp+$0d
    ld [hl], $0f

jr_001_53e2:
    push hl
    ld hl, sp+$0f
    bit 1, [hl]
    pop hl
    jr z, jr_001_540c

    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    xor a
    rr b
    ld b, c
    rr b
    rra
    ld c, a
    pop de
    push de
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, c
    sub l
    ld e, a
    ld a, b
    sbc h
    ld d, a
    jp Jump_001_55b7


jr_001_540c:
    ld hl, sp+$0e
    inc [hl]
    jp nz, Jump_001_5371

    inc hl
    inc [hl]
    jp Jump_001_5371


Jump_001_5417:
    dec de
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d
    jp Jump_001_5359


Jump_001_5420:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


Jump_001_5428:
    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$02
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
    ld hl, sp+$08
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
    inc bc
    ld hl, sp+$04
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$0c
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
    inc de
    ld hl, sp+$06
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_001_54bb:
    ld hl, sp+$04
    ld a, [hl]
    sub e
    jr nz, jr_001_54c7

    inc hl
    ld a, [hl]
    sub d
    jp z, Jump_001_55ab

jr_001_54c7:
    ld hl, sp+$0e
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_001_54cc:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr nz, jr_001_54dd

    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0f
    sub [hl]
    jp z, Jump_001_55a2

jr_001_54dd:
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_5564

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_5564

    ld a, [$c52f]
    ld hl, sp+$09
    ld [hl], a
    ld a, [$c532]
    ld hl, sp+$0a
    ld [hl+], a
    xor a
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl+], a
    ld [hl], $00
    push bc
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$12
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_3569
    add sp, $04
    ld hl, sp+$10
    ld a, e
    ld [hl+], a
    ld [hl], d
    pop de
    pop bc
    push de
    ld hl, sp+$0e
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
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl-], a
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
    ld l, [hl]
    ld h, $00
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
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_1307
    add sp, $03
    ld l, e
    pop de
    ld a, l
    jr jr_001_5566

jr_001_5564:
    ld a, $0f

jr_001_5566:
    rrca
    jr nc, jr_001_5597

    ld hl, sp+$02
    ld a, [hl+]
    ld c, [hl]
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    pop de
    push de
    push af
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    inc hl
    pop af
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    sub l
    ld e, a
    ld a, c
    sbc h
    ld d, a
    jr jr_001_55b7

jr_001_5597:
    ld hl, sp+$0e
    inc [hl]
    jp nz, Jump_001_54cc

    inc hl
    inc [hl]
    jp Jump_001_54cc


Jump_001_55a2:
    inc de
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d
    jp Jump_001_54bb


Jump_001_55ab:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jr jr_001_55b7

Jump_001_55b2:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_001_55b7:
jr_001_55b7:
    add sp, $10
    ret


Call_001_55ba:
    ld hl, $dfe0
    ld de, $dff0
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
    ld [hl+], a
    inc de
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
    ld [hl+], a
    inc de
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
    ld [hl+], a
    inc de
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
    ld [hl+], a
    inc de
    ld a, [$c92a]
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ret


Call_001_5604:
    ld hl, sp+$02
    ld a, [hl+]
    or a
    ld de, $ffff
    ret z

    ld e, a
    ld a, d

jr_001_560e:
    srl a
    dec e
    jr nz, jr_001_560e

    ld e, [hl]
    inc e
    jr jr_001_561b

jr_001_5617:
    scf
    rra
    rr d

jr_001_561b:
    dec e
    jr nz, jr_001_5617

    ld e, a
    ret


Call_001_5620:
    ld hl, sp+$02
    ld a, [hl+]
    or a
    ld de, $ffff
    ret z

    ld e, a
    ld a, d

jr_001_562a:
    sla a
    dec e
    jr nz, jr_001_562a

    ld e, [hl]
    inc e
    jr jr_001_5637

jr_001_5633:
    scf
    rla
    rl d

jr_001_5637:
    dec e
    jr nz, jr_001_5633

    ld e, a
    ret


    ld hl, $ca38
    ld [hl], $00
    ld hl, $ca42
    ld [hl], $00
    ld a, [$05a1]
    ld [$ca41], a
    ld hl, $05a2
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
    ld hl, $c924
    ld [hl], $00
    ld hl, $c925
    ld [hl], $00
    ld hl, $c926
    ld [hl], $00
    ld hl, $c928
    ld [hl], $01
    ld hl, $c92a
    ld [hl], $00
    xor a
    ld hl, $ca2a
    ld [hl+], a
    ld [hl], a
    ld hl, $ca34
    ld [hl], $00
    ld hl, $ca30
    ld [hl], $cc
    ld hl, $ca31
    ld [hl], $00
    ld hl, $ca32
    ld [hl], $cc
    ld hl, $ca33
    ld [hl], $00
    ld hl, $c91f
    ld [hl], $90
    ld hl, $c91e
    ld [hl], $90
    ld hl, $c91d
    ld [hl], $00
    ld hl, $c91c
    ld [hl], $00
    ld hl, $c920
    ld [hl], $01
    ld hl, $c921
    ld [hl], $01
    ld hl, $c927
    ld [hl], $01
    ld hl, $c922
    ld [hl], $00
    call Call_000_0265
    ld hl, $ca43
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $0021
    add hl, de
    ld c, l
    ld a, h
    ld hl, $ca2e
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, $ca2c
    ld [hl], c
    inc hl
    ld [hl], a
    call Call_000_0265
    ld hl, $ca45
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $ca47
    ld [hl], $14
    ld hl, $ca48
    ld [hl], $08
    ld hl, $ca49
    ld [hl], $c9
    ld hl, $ca4b
    ld [hl], $ff
    ld e, $01
    ld hl, $5705
    jp RST_08


    ld b, $09
    push bc
    inc sp
    ld de, $5296
    push de
    ld a, $09
    cp a
    push af
    call Call_000_1270
    add sp, $05
    ld b, $0a
    push bc
    inc sp
    ld de, $42bd
    push de
    ld hl, $01cb
    push hl
    call Call_000_1270
    add sp, $05
    ld bc, $dfe0
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
    ld hl, $01c9
    push hl
    call Call_000_35b7
    add sp, $04
    ld e, c
    ld d, b
    ld hl, $0010
    push hl
    ld l, $ff
    push hl
    push de
    call Call_000_37b0
    add sp, $06
    push bc
    ld hl, $01ca
    push hl
    call Call_000_35b7
    add sp, $04
    ret


    ld hl, sp+$09
    ld a, [hl]
    or a
    ret z

    call Call_000_0265
    ld hl, sp+$07
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
    ld hl, sp+$06
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    push bc
    ld hl, sp+$0a
    ld a, [hl]
    cp a
    push af
    push de
    call Call_000_032d
    add sp, $04
    pop bc
    ld hl, sp+$09
    dec [hl]
    ret z

    ld a, $01
    ld hl, sp+$09
    sub [hl]
    jr nc, jr_001_57b8

    ld e, [hl]
    dec e

jr_001_5795:
    ld a, e
    or a
    jr z, jr_001_57b8

    ld hl, $0020
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    ld d, b
    push bc
    push de
    ld hl, sp+$0c
    ld h, [hl]
    push hl
    inc sp
    ld h, $c3
    push hl
    inc sp
    ld e, a
    push de
    call Call_000_032d
    add sp, $04
    pop de
    pop bc
    dec e
    jr jr_001_5795

jr_001_57b8:
    ld hl, $0020
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld h, [hl]
    ld l, $c6
    push hl
    push bc
    call Call_000_032d
    add sp, $04
    ret


Call_001_57cb:
    ld a, [$ca34]
    or a
    jr z, jr_001_57e5

    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    jr nz, jr_001_57e5

    ld [hl], $cc

jr_001_57e5:
    ld hl, $ca34
    ld [hl], $00
    ld hl, $c92a
    ld c, [hl]
    ld b, $00
    ld de, $0020
    push de
    push bc
    ld de, $dfe0
    push de
    call Call_000_37b0
    add sp, $06
    ret


    ld hl, sp+$06
    ld a, [hl]
    ld [$ca30], a
    ld [$ca32], a
    ld hl, sp+$07
    ld a, [hl]
    ld [$ca31], a
    ld [$ca33], a
    ld hl, $ca34
    ld [hl], $00
    ld hl, $c92a
    ld c, [hl]
    ld b, $00
    ld de, $0020
    push de
    push bc
    ld de, $dfe0
    push de
    call Call_000_37b0
    add sp, $06
    ret


Call_001_582b:
    add sp, -$03
    ld a, [$ca39]
    rrca
    jr nc, jr_001_5854

    ld hl, $ca41
    ld b, [hl]
    ld hl, $ca3b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $ca3a
    ld a, [de]
    push hl
    ld hl, sp+$07
    and [hl]
    pop hl
    ld e, a
    ld d, $00
    add hl, de
    push bc
    inc sp
    push hl
    call Call_000_1307
    add sp, $03
    jr jr_001_5857

jr_001_5854:
    ld hl, sp+$05
    ld e, [hl]

jr_001_5857:
    ld hl, sp+$00
    ld [hl], e
    ld hl, $ca3f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld e, $00
    ld h, e
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$01
    ld [hl], c
    inc hl
    ld [hl], a
    ld a, [$ca39]
    ld hl, $ca41
    ld c, [hl]
    bit 1, a
    jp z, Jump_001_59ce

    bit 2, a
    jr z, jr_001_5887

    ld a, [$c92a]
    jr jr_001_5888

jr_001_5887:
    xor a

jr_001_5888:
    ld [$ca37], a
    ld hl, $ca3d
    ld a, [hl+]
    ld b, [hl]
    ld e, a
    ld d, b
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    push af
    inc sp
    push de
    call Call_000_1307
    add sp, $03
    ld c, e
    ld hl, sp+$00
    ld [hl], c
    ld a, [$ca38]
    or a
    jr nz, jr_001_5906

    ld a, [$ca34]
    ld [$ca36], a
    push bc
    ld a, [$ca34]
    ld b, a
    push bc
    call Call_001_5604
    pop hl
    pop bc
    ld hl, $ca35
    ld [hl], e
    push bc
    push de
    ld a, [$ca41]
    push af
    inc sp
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $dfe0
    push hl
    call Call_000_02aa
    add sp, $05
    pop de
    pop bc
    ld hl, $ca34
    ld a, [hl]
    add c
    ld c, a
    ld a, $08
    cp c
    jp nc, Jump_001_596e

    sub [hl]
    or $80
    ld [$ca36], a
    ld hl, $ca35
    ld [hl], d
    ld a, [$ca41]
    push af
    inc sp
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $dff0
    push de
    call Call_000_02aa
    add sp, $05
    jr jr_001_596e

jr_001_5906:
    ld a, $08
    ld hl, $ca34
    sub [hl]
    ld e, a
    ld a, c
    sub e
    jr nc, jr_001_5915

    ld a, e
    sub c
    jr jr_001_5919

jr_001_5915:
    ld a, c
    sub e
    set 7, a

jr_001_5919:
    ld [$ca36], a
    ld a, [$ca34]
    push af
    inc sp
    ld hl, sp+$01
    ld a, [hl]
    push af
    inc sp
    call Call_001_5620
    pop hl
    ld hl, $ca35
    ld [hl], e
    push de
    ld a, [$ca41]
    push af
    inc sp
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    ld bc, $dfe0
    push bc
    call Call_000_02aa
    add sp, $05
    pop de
    ld a, [$ca34]
    ld hl, sp+$00
    add [hl]
    ld c, a
    ld a, $08
    sub c
    jr nc, jr_001_596e

    ld a, $10
    sub c
    ld [$ca36], a
    ld hl, $ca35
    ld [hl], d
    ld a, [$ca41]
    push af
    inc sp
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $dff0
    push de
    call Call_000_02aa
    add sp, $05

Jump_001_596e:
jr_001_596e:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, $ca34
    add [hl]
    ld [hl], a
    ld de, $dfe0
    push de
    ld a, $01
    push af
    inc sp
    ld a, [$ca30]
    push af
    inc sp
    call Call_000_35b7
    add sp, $04
    ld a, $07
    ld hl, $ca34
    sub [hl]
    jr nc, jr_001_59ca

    call Call_001_55ba
    ld hl, $ca34
    ld a, [hl]
    add $f8
    ld [hl], a
    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    jr nz, jr_001_59ae

    ld [hl], $cc

jr_001_59ae:
    ld a, [$ca34]
    or a
    jr z, jr_001_59c6

    ld de, $dfe0
    push de
    ld a, $01
    push af
    inc sp
    ld a, [$ca30]
    push af
    inc sp
    call Call_000_35b7
    add sp, $04

jr_001_59c6:
    ld e, $01
    jr jr_001_5a1c

jr_001_59ca:
    ld e, $00
    jr jr_001_5a1c

Jump_001_59ce:
    ld a, [$ca34]
    or a
    jr z, jr_001_59ea

    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    ld a, [hl]
    or a
    jr nz, jr_001_59ea

    ld [hl], $cc

jr_001_59ea:
    ld a, c
    push af
    inc sp
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld a, $01
    push af
    inc sp
    ld a, [$ca30]
    push af
    inc sp
    call Call_000_1270
    add sp, $05
    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    jr nz, jr_001_5a15

    ld [hl], $cc

jr_001_5a15:
    ld hl, $ca34
    ld [hl], $00
    ld e, $01

jr_001_5a1c:
    add sp, $03
    ret


    dec sp
    dec sp
    ld a, [$c928]
    or a
    jr z, jr_001_5a3a

    ld a, [$c61b]
    and $30
    jr z, jr_001_5a3a

    ld a, [$c61c]
    and $30
    jr nz, jr_001_5a3a

    ld hl, $c929
    ld [hl], $01

jr_001_5a3a:
    ld a, [$c929]
    or a
    jr nz, jr_001_5a4d

    ld hl, $c923
    ld a, [hl]
    or a
    jr z, jr_001_5a4d

    dec [hl]
    ld e, $00
    jp Jump_001_5e82


jr_001_5a4d:
    ld hl, $ca2b
    ld a, [hl-]
    or [hl]
    jr nz, jr_001_5ac0

    ld bc, $02a2
    ld a, c
    ld hl, $c927
    add [hl]
    ld c, a
    jr nc, jr_001_5a60

    inc b

jr_001_5a60:
    ld a, [bc]
    ld [$c922], a
    ld a, [$ca42]
    ld [$ca4e], a
    ld a, [$c92a]
    ld [$ca4f], a
    ld a, [$ca38]
    ld [$ca50], a
    ld a, [$c928]
    ld [$ca51], a
    ld a, [$c927]
    ld [$ca52], a
    ld hl, $ca2a
    ld [hl], $2b
    inc hl
    ld [hl], $c9
    ld a, [$c924]
    rrca
    jr c, jr_001_5abd

    ld a, [$ca43]
    add $21
    ld [$ca2e], a
    ld a, [$ca44]
    adc $00
    ld [$ca2f], a
    ld a, [$ca38]
    dec a
    jr nz, jr_001_5ab1

    ld hl, $ca2e
    ld a, [hl]
    add $11
    ld [hl+], a
    ld a, [hl]
    adc $00
    ld [hl], a

jr_001_5ab1:
    ld a, [$ca2e]
    ld [$ca2c], a
    ld a, [$ca2f]
    ld [$ca2d], a

jr_001_5abd:
    call Call_001_57cb

Jump_001_5ac0:
jr_001_5ac0:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld c, [hl]
    ld a, $0d
    sub c
    jp c, Jump_001_5e16

    ld b, $00
    ld hl, $5ad8
    add hl, bc
    add hl, bc
    add hl, bc
    jp hl


    jp Jump_001_5b02


    jp Jump_001_5b5c


    jp Jump_001_5b80


    jp Jump_001_5be6


    jp Jump_001_5c39


    jp Jump_001_5e0e


    jp Jump_001_5cbc


    jp Jump_001_5d2d


    jp Jump_001_5d56


    jp Jump_001_5e76


    jp Jump_001_5dec


    jp Jump_001_5e16


    jp Jump_001_5e16


    jp Jump_001_5d73


Jump_001_5b02:
    xor a
    ld hl, $ca2a
    ld [hl+], a
    ld [hl], a
    ld hl, $c921
    ld [hl], $01
    ld a, [$ca42]
    ld hl, $ca4e
    sub [hl]
    jr z, jr_001_5b3f

    ld hl, $ca42
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $05a1
    add hl, bc
    ld a, [hl+]
    ld b, a
    ld [$ca41], a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    push bc
    inc sp
    ld de, $0008
    push de
    ld b, a
    push bc
    ld de, $ca39
    push de
    call Call_000_1323
    add sp, $07

jr_001_5b3f:
    ld a, [$ca4f]
    ld [$c92a], a
    ld a, [$ca50]
    ld [$ca38], a
    ld a, [$ca51]
    ld [$c928], a
    ld a, [$ca52]
    ld [$c927], a
    ld e, $00
    jp Jump_001_5e82


Jump_001_5b5c:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5b64

    inc hl
    inc [hl]

jr_001_5b64:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    dec a
    and $07
    ld [$c927], a
    add $a2
    ld c, a
    ld a, $02
    adc $00
    ld b, a
    ld a, [bc]
    ld [$c922], a
    jp Jump_001_5e76


Jump_001_5b80:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5b88

    inc hl
    inc [hl]

jr_001_5b88:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    dec a
    ld hl, $ca4e
    ld [hl], a
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    ld bc, $05a1
    add hl, bc
    ld c, l
    ld b, h
    ld a, [$ca39]
    ld hl, sp+$01
    ld [hl], a
    ld a, [bc]
    ld [$ca41], a
    ld l, c
    ld h, b
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    ld de, $0008
    push de
    push bc
    ld de, $ca39
    push de
    call Call_000_1323
    add sp, $07
    ld hl, $ca34
    ld a, [hl]
    or a
    jp z, Jump_001_5e76

    push hl
    ld hl, sp+$03
    bit 1, [hl]
    pop hl
    jp z, Jump_001_5e76

    ld a, [$ca39]
    bit 1, a
    jp nz, Jump_001_5e76

    ld hl, $ca2c
    inc [hl]
    jp nz, Jump_001_5e76

    inc hl
    inc [hl]
    jp Jump_001_5e76


Jump_001_5be6:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5bee

    inc hl
    inc [hl]

jr_001_5bee:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld c, [hl]
    ld b, $00
    dec bc
    ld a, c
    ld hl, $ca43
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5c0c

    inc hl
    inc [hl]

jr_001_5c0c:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld l, [hl]
    ld h, $00
    dec hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, $ca2e
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, $ca2c
    ld [hl], c
    inc hl
    ld [hl], a
    ld a, [$ca34]
    or a
    jp z, Jump_001_5e76

    call Call_001_57cb
    jp Jump_001_5e76


Jump_001_5c39:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5c41

    inc hl
    inc [hl]

jr_001_5c41:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld c, [hl]
    ld e, c
    xor a
    ld d, a
    sub c
    bit 7, e
    jr z, jr_001_5c59

    bit 7, d
    jr nz, jr_001_5c5e

    cp a
    jr jr_001_5c5e

jr_001_5c59:
    bit 7, d
    jr z, jr_001_5c5e

    scf

jr_001_5c5e:
    jr nc, jr_001_5c61

    dec c

jr_001_5c61:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5c69

    inc hl
    inc [hl]

jr_001_5c69:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld l, [hl]
    ld e, l
    xor a
    ld d, a
    sub l
    bit 7, e
    jr z, jr_001_5c81

    bit 7, d
    jr nz, jr_001_5c86

    cp a
    jr jr_001_5c86

jr_001_5c81:
    bit 7, d
    jr z, jr_001_5c86

    scf

jr_001_5c86:
    jr nc, jr_001_5c89

    dec l

jr_001_5c89:
    ld a, c
    rlca
    sbc a
    ld b, a
    ld a, l
    rlca
    sbc a
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    ld hl, $ca2c
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, $ca2e
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $ca2c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$ca34]
    or a
    jp z, Jump_001_5e76

    call Call_001_57cb
    jp Jump_001_5e76


Jump_001_5cbc:
    ld hl, $c929
    ld a, [hl]
    or a
    jr z, jr_001_5cd0

    ld [hl], $00
    ld hl, $c928
    ld [hl], $00
    ld a, [$c61b]
    ld [$c61c], a

jr_001_5cd0:
    ld a, [$c927]
    or a
    jr nz, jr_001_5ce2

    ld hl, $ca2a
    inc [hl]
    jp nz, Jump_001_5e76

    inc hl
    inc [hl]
    jp Jump_001_5e76


jr_001_5ce2:
    ld a, [$c61c]
    ld b, $00
    cpl
    ld c, a
    ld a, b
    cpl
    ld b, a
    ld a, [$c61b]
    ld e, $00
    and c
    ld c, a
    ld a, e
    and b
    ld b, a
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5cfe

    inc hl
    inc [hl]

jr_001_5cfe:
    ld hl, $ca2a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, $00
    and c
    ld c, a
    ld a, e
    and b
    or c
    jr z, jr_001_5d1d

    ld a, [$ca51]
    ld [$c928], a
    ld a, [$c61b]
    ld [$c61c], a
    jp Jump_001_5e76


jr_001_5d1d:
    ld hl, $ca2a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld e, $00
    jp Jump_001_5e82


Jump_001_5d2d:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5d35

    inc hl
    inc [hl]

jr_001_5d35:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    rrca
    jr nc, jr_001_5d46

    xor a
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], a
    jr jr_001_5d4d

jr_001_5d46:
    ld hl, sp+$00
    ld a, $ff
    ld [hl+], a
    xor a
    ld [hl], a

jr_001_5d4d:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c92a], a
    jp Jump_001_5e76


Jump_001_5d56:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5d5e

    inc hl
    inc [hl]

jr_001_5d5e:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    rrca
    jr nc, jr_001_5d6b

    xor a
    jr jr_001_5d6d

jr_001_5d6b:
    ld a, $01

jr_001_5d6d:
    ld [$ca38], a
    jp Jump_001_5e76


Jump_001_5d73:
    ld hl, $ca2c
    ld a, [hl+]
    add $20
    ld c, a
    ld a, [hl]
    adc $00
    ld b, a
    ld hl, $ca45
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $ca48
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld a, l
    and $e0
    ld l, a
    dec hl
    ld a, l
    sub c
    ld a, h
    sbc b
    jr nc, jr_001_5dc8

    ld a, [$ca49]
    ld h, a
    ld a, [$ca48]
    ld l, a
    push hl
    ld a, [$ca47]
    push af
    inc sp
    ld hl, $ca45
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $09
    ld hl, $4268
    call RST_08
    add sp, $05
    ld a, [$ca2e]
    ld [$ca2c], a
    ld a, [$ca2f]
    ld [$ca2d], a
    jr jr_001_5ddf

jr_001_5dc8:
    ld hl, $ca2e
    ld a, [hl+]
    add $20
    ld c, a
    ld a, [hl]
    adc $00
    ld b, a
    ld hl, $ca2c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $ca2e
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_001_5ddf:
    ld a, [$ca34]
    or a
    jp z, Jump_001_5e76

    call Call_001_57cb
    jp Jump_001_5e76


Jump_001_5dec:
    ld hl, $ca2e
    ld a, [hl+]
    add $20
    ld c, a
    ld a, [hl]
    adc $00
    ld b, a
    ld hl, $ca2c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $ca2e
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$ca34]
    or a
    jr z, jr_001_5e76

    call Call_001_57cb
    jr jr_001_5e76

Jump_001_5e0e:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5e16

    inc hl
    inc [hl]

Jump_001_5e16:
jr_001_5e16:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    push af
    inc sp
    call Call_001_582b
    inc sp
    ld a, e
    or a
    jr z, jr_001_5e53

    ld a, [$ca32]
    ld hl, $ca2c
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call Call_000_022e
    add sp, $03
    ld a, [$ca38]
    or a
    jr nz, jr_001_5e48

    ld hl, $ca2c
    inc [hl]
    jr nz, jr_001_5e53

    inc hl
    inc [hl]
    jr jr_001_5e53

jr_001_5e48:
    ld hl, $ca2c
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_001_5e53:
    ld a, [$ca34]
    or a
    jr z, jr_001_5e6a

    ld a, [$ca30]
    ld hl, $ca2c
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call Call_000_022e
    add sp, $03

jr_001_5e6a:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5e72

    inc hl
    inc [hl]

jr_001_5e72:
    ld e, $01
    jr jr_001_5e82

Jump_001_5e76:
jr_001_5e76:
    ld hl, $ca2a
    inc [hl]
    jp nz, Jump_001_5ac0

    inc hl
    inc [hl]
    jp Jump_001_5ac0


Jump_001_5e82:
jr_001_5e82:
    inc sp
    inc sp
    ret


    add sp, -$1a
    ld hl, sp+$23
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    push hl
    bit 2, [hl]
    pop hl
    jr z, jr_001_5e98

    ld hl, sp+$25
    ld c, [hl]
    jr jr_001_5e9b

jr_001_5e98:
    ld bc, $0001

jr_001_5e9b:
    ld hl, sp+$07
    ld [hl], c
    ld c, [hl]
    ld b, $00
    dec bc
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$20
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$08
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$22
    ld a, [hl]
    push af
    inc sp
    ld hl, $0006
    push hl
    push bc
    push de
    call Call_000_1323
    add sp, $07
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $cb
    ld l, b
    push hl
    push af
    inc sp
    call Call_000_023d
    add sp, $03
    ld hl, sp+$06
    ld a, [hl]
    and $02
    ld hl, sp+$0c
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
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
    ld hl, $0005
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$14
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$13
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$16
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$15
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$17
    ld [hl], a

Jump_001_5f58:
    call Call_000_16dd
    call Call_000_24e0
    ld c, $c0
    ldh a, [$92]
    sub c
    jr nz, jr_001_5f6c

    ld hl, $da35
    ld [hl], $df
    jr jr_001_5f71

jr_001_5f6c:
    ld hl, $da35
    ld [hl], $c0

jr_001_5f71:
    ld hl, $c50e
    ld [hl], $00
    call Call_000_13f1
    ld e, $05
    ld hl, $40ca
    call RST_08
    call Call_000_0e73
    call Call_000_2000
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
    ld hl, $da1f
    inc [hl]
    call Call_000_0e35
    ld a, [$c61b]
    ld hl, sp+$18
    ld [hl], a
    ld a, [$c61c]
    ld hl, sp+$19
    ld [hl], a
    push hl
    dec hl
    bit 2, [hl]
    pop hl
    jr z, jr_001_5fc7

    push hl
    ld hl, sp+$1b
    bit 2, [hl]
    pop hl
    jr nz, jr_001_5fc7

    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jp Jump_001_606a


jr_001_5fc7:
    push hl
    ld hl, sp+$1a
    bit 3, [hl]
    pop hl
    jr z, jr_001_5fe3

    push hl
    ld hl, sp+$1b
    bit 3, [hl]
    pop hl
    jr nz, jr_001_5fe3

    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jp Jump_001_606a


jr_001_5fe3:
    push hl
    ld hl, sp+$1a
    bit 1, [hl]
    pop hl
    jr z, jr_001_5ffe

    push hl
    ld hl, sp+$1b
    bit 1, [hl]
    pop hl
    jr nz, jr_001_5ffe

    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jr jr_001_606a

jr_001_5ffe:
    push hl
    ld hl, sp+$1a
    bit 0, [hl]
    pop hl
    jr z, jr_001_6019

    push hl
    ld hl, sp+$1b
    bit 0, [hl]
    pop hl
    jr nz, jr_001_6019

    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jr jr_001_606a

jr_001_6019:
    push hl
    ld hl, sp+$1a
    bit 4, [hl]
    pop hl
    jr z, jr_001_604d

    push hl
    ld hl, sp+$1b
    bit 4, [hl]
    pop hl
    jr nz, jr_001_604d

    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$24
    sub [hl]
    jr nz, jr_001_603f

    ld hl, sp+$06
    ld a, [hl]
    and $01
    jr z, jr_001_603f

    xor a
    ld hl, sp+$18
    ld [hl+], a
    ld [hl], a
    jr jr_001_6047

jr_001_603f:
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$18
    ld [hl+], a
    ld [hl], $00

jr_001_6047:
    ld hl, sp+$18
    ld e, [hl]
    jp Jump_001_60db


jr_001_604d:
    push hl
    ld hl, sp+$1a
    bit 5, [hl]
    pop hl
    jp z, Jump_001_5f58

    push hl
    ld hl, sp+$1b
    bit 5, [hl]
    pop hl
    jp nz, Jump_001_5f58

    ld hl, sp+$0d
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_5f58

    ld e, $00
    jr jr_001_60db

Jump_001_606a:
jr_001_606a:
    ld hl, sp+$19
    ld a, [hl]
    or a
    jp z, Jump_001_5f58

    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $c4
    ld l, b
    push hl
    push af
    inc sp
    call Call_000_023d
    add sp, $03
    ld hl, sp+$19
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$20
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    add $fa
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    ld hl, sp+$16
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$22
    ld a, [hl]
    push af
    inc sp
    ld hl, $0006
    push hl
    push bc
    push de
    call Call_000_1323
    add sp, $07
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $cb
    ld l, b
    push hl
    push af
    inc sp
    call Call_000_023d
    add sp, $03
    jp Jump_001_5f58


Jump_001_60db:
jr_001_60db:
    add sp, $1a
    ret


    add sp, -$03
    ld hl, sp+$09
    ld c, [hl]
    ld a, c
    and $01
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], $00

Jump_001_60eb:
    ld b, $00
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jr z, jr_001_6107

    ld a, [$c91c]
    ld hl, $c91d
    sub [hl]
    jr nz, jr_001_6105

    ld a, [$c91e]
    ld hl, $c91f
    sub [hl]
    jr z, jr_001_6107

jr_001_6105:
    ld b, $01

jr_001_6107:
    bit 1, c
    jr z, jr_001_6113

    ld a, [$c921]
    or a
    jr nz, jr_001_6113

    ld b, $01

jr_001_6113:
    ld a, [$c61b]
    ld hl, sp+$02
    ld [hl], a
    ld hl, $c61c
    ld a, [hl]
    bit 2, c
    jr z, jr_001_612f

    push hl
    ld hl, sp+$04
    bit 4, [hl]
    pop hl
    jr z, jr_001_612d

    bit 4, a
    jr z, jr_001_612f

jr_001_612d:
    ld b, $01

jr_001_612f:
    bit 3, c
    jr z, jr_001_6141

    push hl
    ld hl, sp+$04
    bit 5, [hl]
    pop hl
    jr z, jr_001_613f

    bit 5, a
    jr z, jr_001_6141

jr_001_613f:
    ld b, $01

jr_001_6141:
    bit 4, c
    jr z, jr_001_6153

    ld a, [$c61b]
    or a
    jr z, jr_001_6151

    ld a, [$c61c]
    or a
    jr z, jr_001_6153

jr_001_6151:
    ld b, $01

jr_001_6153:
    ld a, b
    or a
    jr z, jr_001_61aa

    push bc
    call Call_000_24e0
    pop bc
    ld e, $c0
    ldh a, [$92]
    sub e
    jr nz, jr_001_616a

    ld hl, $da35
    ld [hl], $df
    jr jr_001_616f

jr_001_616a:
    ld hl, $da35
    ld [hl], $c0

jr_001_616f:
    ld hl, $c50e
    ld [hl], $00
    push bc
    call Call_000_13f1
    ld e, $05
    ld hl, $40ca
    call RST_08
    call Call_000_0e73
    call Call_000_2000
    pop bc
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
    ld hl, $da1f
    inc [hl]
    call Call_000_0e35
    push bc
    call Call_000_16dd
    pop bc
    ld a, b
    or a
    jp nz, Jump_001_60eb

jr_001_61aa:
    add sp, $03
    ret

    ; bank 1 0x61ad
    db $25, $40, $00
    db "Welcome To Hyscule", $00
    
    db $47, $03, $01, $04, $14, $00, $00, $45, $ff, $0e
    db $00, $41, $ff, $00, $44, $07, $01, $45, $fe, $12, $00, $44, $03, $01, $00
    
PcWorldTileImage:: ; 0x61dc
    db $7a, $00
    INCBIN "gfx/bank001_pcworld_61de.2bpp"

TitlescreenTileImage:: ; 0x697e
    db $68, $01
    INCBIN "gfx/bank001_title_6980.2bpp" ; 0x6980 title screen
