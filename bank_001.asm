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

Jump_001_4135:
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

Jump_001_4a30:
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

Jump_001_603c:
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


    dec h
    ld b, b
    nop
    ld d, a
    ld h, l
    ld l, h
    ld h, e
    ld l, a

jr_001_61b5:
    ld l, l
    ld h, l
    jr nz, @+$56

    ld l, a
    jr nz, jr_001_6204

    ld a, c
    ld [hl], e
    ld h, e
    ld [hl], l
    ld l, h
    ld h, l
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
    ld bc, $7a00
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    jr nz, jr_001_61b5

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

Call_001_6201:
    nop
    nop
    nop

jr_001_6204:
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

jr_001_6284:
    rst $38
    nop

jr_001_6286:
    nop
    rst $38

jr_001_6288:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_001_628e:
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
    jr c, jr_001_6284

    jr c, jr_001_6286

    jr c, jr_001_6288

    jr c, jr_001_62ca

    ld hl, sp-$1d
    jr c, jr_001_628e

    jr c, @-$1b

    jr c, jr_001_6286

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
    jr c, jr_001_6306

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_001_62ca:
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

jr_001_6306:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
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
    inc a
    rst $38
    ld h, $ff
    dec h
    rst $38
    inc h
    rst $38
    db $e4
    rst $38
    and h
    rst $38
    cp h
    db $e3
    cp [hl]
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    add c
    rst $38
    add c
    rst $38
    add c
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
    jr c, jr_001_637f

jr_001_637f:
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
    rst $38
    nop
    rst $38
    nop
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
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
    pop hl
    cp a
    ldh [$bf], a
    rst $38
    cp a
    rst $38
    add b
    add b
    rst $38
    rst $38
    rst $38
    sub d
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    rst $38
    add c
    rst $38
    add c
    rst $38
    ld bc, $ff01
    rst $38
    rst $38
    ld c, c
    rst $38
    rst $38
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
    rst $38
    rst $38
    cp a
    ret nz

    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    ret nz

    cp a
    add b
    rst $38
    cp a
    rst $38
    rst $38
    rst $38
    db $fd
    inc bc
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $fd03
    ld bc, $fdff
    rst $38
    rst $38
    ld a, a
    rst $18
    ldh [$b0], a
    rst $08
    and b
    rst $18
    and b
    rst $18
    ldh [$9f], a
    ldh [$9f], a
    ldh a, [$8f]
    rst $38
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
    rst $38
    cp $fb
    rlca
    dec c
    di
    dec b
    ei
    dec b
    ei
    rlca
    ld sp, hl
    rlca
    ld sp, hl
    rlca
    ld sp, hl
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

jr_001_6480:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_001_6480

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
    jr jr_001_64b7

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
    cp a
    rst $38
    and a
    rst $20
    cp a
    push hl
    and a
    push hl
    and a

jr_001_64b7:
    push hl
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    push hl
    rst $20
    db $fd
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
    rst $38
    cp a
    ret nz

    ret c

    ldh [$bf], a
    rst $38
    call $cdf4
    db $f4
    cp a
    rst $38
    rst $10
    ld sp, hl
    rst $38
    ld a, a
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    db $dd
    ld b, h
    db $dd
    ld b, h
    rst $38
    rst $38
    rst $38
    ld de, $ffff
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    cp e
    ld [hl+], a
    cp e
    ld [hl+], a
    rst $38
    rst $38
    rst $38
    adc b
    rst $38
    rst $38
    db $fd
    inc bc
    dec de
    rlca
    db $fd
    rst $38
    di
    ld c, a
    di
    ld c, a
    db $fd
    rst $38
    di
    rra
    rst $38
    db $fc
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

jr_001_6578:
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
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
    ld a, [$ff0e]
    rst $38
    rst $38
    ld bc, $ffff
    jr nz, jr_001_6578

    and b
    ld h, b
    and b
    ld h, b
    ret nz

    ret nz

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
    jr jr_001_65e5

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
    and a
    rst $20
    cp a
    rst $20
    and h
    rst $20
    and h

jr_001_65e5:
    rst $20
    and h
    rst $20
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    db $fd
    rst $38
    push hl
    rst $20
    db $fd
    and a
    push hl
    and a
    push hl
    and a
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
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

jr_001_6612:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_001_6612

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

jr_001_67f5:
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
    jr c, jr_001_67f5

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

jr_001_6841:
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

jr_001_6854:
    and l
    sbc e

jr_001_6856:
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a

jr_001_685c:
    xor c
    sub a

jr_001_685e:
    db $ec
    or a

jr_001_6860:
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
    jr c, jr_001_6854

    jr c, jr_001_6856

    jr c, jr_001_6898

    ld hl, sp-$1d
    jr c, jr_001_685c

    jr c, jr_001_685e

    jr c, jr_001_6860

    jr c, jr_001_6841

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

jr_001_6898:
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
    jr nz, jr_001_68ea

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

jr_001_68ea:
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
    ld l, b
    ld bc, $0030
    ld h, b
    nop
    ld h, b
    nop
    ld b, d
    nop
    add $00
    call nz, $8d00
    nop
    adc c
    nop
    stop
    jr nz, jr_001_6995

    ld b, b

jr_001_6995:
    dec bc
    ld b, b
    inc de
    add b
    scf
    add b
    daa
    nop
    ld l, a
    nop
    ld l, a
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
    rst $38
    nop
    rst $38
    ld [$0400], sp
    add b
    ld [bc], a
    ret nc

    ld [bc], a
    ret z

    ld bc, $01ec
    db $e4
    nop
    or $00
    or $0c
    nop
    ld b, $00
    ld b, $00
    ld b, d
    nop
    ld h, e
    nop
    inc hl
    nop
    or c
    nop
    sub c
    nop
    adc b
    nop
    ld [de], a
    nop
    ld d, $01
    inc d
    ld bc, HeaderTitle
    inc h
    dec bc
    inc h
    dec bc
    jr nz, jr_001_6aeb

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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_001_6aeb:
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

jr_001_6b78:
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
    ld de, $4800
    nop
    ld l, b
    add b
    jr z, jr_001_6b78

    inc l
    add b
    inc h
    ret nc

    inc h
    ret nc

    inc b
    ret c

    ld b, b
    dec de
    ld b, b
    dec de
    ld b, b
    rra
    ld b, b
    rra
    ld b, b
    ccf
    nop
    ccf
    add b
    ccf
    add b
    ccf
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
    rst $38
    inc bc
    db $fc
    ld b, $f9
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
    ld hl, sp+$07
    inc e
    db $e3
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
    rra
    ldh [$38], a
    rst $00
    ldh a, [rIF]
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    db $fc
    sbc a
    ld h, b
    db $f4
    dec bc
    ld a, [de]
    push hl
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
    ld h, e
    sbc h
    inc d
    db $eb
    ld bc, $00fe
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ret nz

    ccf
    ld hl, sp+$07
    sbc h
    ld h, e
    adc a
    ld [hl], b
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
    rst $38
    nop
    rst $38
    ld [bc], a
    ret c

    ld [bc], a
    ret c

    ld [bc], a
    ld hl, sp+$02
    ld hl, sp+$02
    db $fc
    nop
    db $fc
    ld bc, $01fc
    db $fc
    add b
    ccf
    add b
    ccf
    add b
    ld a, a
    add b
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_001_6d68:
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
    ld a, b
    add a
    rst $08
    jr nc, jr_001_6d68

    inc d
    ld e, h
    and e
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, b
    add a
    db $ec
    inc de
    add a
    ld a, b
    jp Jump_000_003c


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, $c1
    rst $30
    ld [$3fc0], sp
    dec e
    ld [c], a
    ccf
    ret nz

    dec [hl]
    jp z, $db24

    ld l, d
    sub l
    call nc, $f72b

jr_001_6dad:
    ld [$26d9], sp
    xor a
    ld d, b
    db $10

jr_001_6db3:
    rst $28
    add c
    ld a, [hl]
    nop
    rst $38
    nop
    rst $38
    add b
    ld a, a
    nop

jr_001_6dbd:
    rst $38
    add sp, $17
    ret z

    scf
    add b
    ld a, a
    and b
    ld e, a
    ld b, b
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, a
    rst $38
    nop

jr_001_6dd1:
    rst $38
    jr nz, jr_001_6db3

    jr jr_001_6dbd

    ld c, $f1
    xor l
    ld d, d
    ld [hl], d
    adc l
    jr nc, jr_001_6dad

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
    rst $38
    rst $38
    rst $38
    dec de
    db $e4
    ld a, h
    add e
    ld [hl-], a
    call $bf40
    jr z, jr_001_6dd1

    inc b
    ei
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    ld a, h
    add e
    rlca
    ld hl, sp+$0c
    di
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rra
    ldh [$2e], a
    pop de
    ld de, $00ee
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    or a
    ld c, b
    jp z, Jump_001_4135

    cp [hl]
    inc b
    ei
    ld [bc], a
    db $fd
    inc bc
    db $fc
    rst $38
    rst $38
    nop
    rst $38
    add b
    ld a, a
    ret nz

    ccf
    ldh [$1f], a
    ldh [$1f], a
    ret nz

    ccf
    ldh [$1f], a
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

jr_001_6e4b:
    rst $38
    nop
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
    rst $38
    nop
    rst $38
    ld bc, $01fc
    db $fc
    ld bc, $01fe
    cp $00
    cp $00

jr_001_6e7b:
    cp $00
    cp $00
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
    rst $38
    add hl, de
    and $3f
    ret nz

    cpl
    ret nc

    ld [hl+], a
    db $dd
    jr nc, jr_001_6e7b

    inc [hl]
    rr e
    db $e4
    rst $08
    jr nc, jr_001_6e4b

    ld h, b
    inc de
    db $e3
    scf
    jp $47a7


    ld l, a
    add a
    ld c, a
    adc a
    rst $18
    ld c, $ff
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ldh [$c0], a
    rst $18
    add b
    or d
    dec c
    ld l, b
    rla
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    ld bc, $fffe
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rrca
    rrca
    rst $18
    rrca
    sbc a
    rra
    cp a
    ccf
    db $fc
    inc bc
    ld b, $01
    ld a, [$faf1]
    pop af
    or $f1
    db $e4
    db $e3
    rst $28
    ret nz

    ret nz

    ret nz

    ld b, c
    pop bc
    ld d, l
    push de
    ld [hl], a
    rst $30
    ld [hl], a
    rst $30
    ld [hl], a
    rst $30
    ld a, a
    rst $38
    rst $38
    nop
    nop
    nop
    ld [hl], h
    ld [hl], h
    ld [hl], l
    ld [hl], l
    inc b
    inc b
    ld [hl], l
    ld [hl], l
    ld [hl], h
    ld [hl], h
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    ld a, l
    ld a, l
    db $fd
    db $fd
    ld a, l
    ld a, l
    db $fd
    db $fd
    ld a, h
    ld a, h
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    add $c6
    db $dd
    db $dd
    push bc
    push bc
    db $dd
    db $dd
    ld b, [hl]
    ld b, [hl]
    rst $38
    rst $38
    pop af
    ld c, $1b
    inc b
    ld sp, $f731
    rst $30
    sub c
    sub c
    rst $10
    rst $10
    ld sp, $ff31
    rst $38
    rst $38
    nop
    nop
    nop
    ld [hl], h
    ld [hl], h
    dec [hl]
    dec [hl]
    ld d, l
    ld d, l
    ld h, l
    ld h, l
    ld [hl], h
    ld [hl], h
    rst $38
    rst $38
    db $fc
    inc bc

jr_001_6f5e:
    rlca
    nop
    ccf
    ccf
    sbc $de
    sbc $de
    sbc $de
    ccf
    ccf
    rst $38
    rst $38
    nop
    rst $38
    ld bc, $18fe
    jr jr_001_6f5e

    db $eb
    add sp, -$18
    db $eb
    db $eb
    dec de
    dec de
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    jp $febc


    nop
    cp l
    ld b, b
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

    ccf
    jr nz, jr_001_6fbd

    ret nc

    rrca
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

jr_001_6fae:
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

jr_001_6fb8:
    nop
    rst $38
    nop
    rst $38
    nop

jr_001_6fbd:
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
    add hl, de
    and $0e
    pop af
    inc bc
    db $fc
    inc bc
    db $fc
    ld bc, $01fe
    cp $03
    db $fc
    inc bc
    db $fc
    sbc h
    jr jr_001_6fae

    db $10
    ld [hl], $21
    ld c, h
    inc bc
    jr @+$09

    ldh a, [rIF]
    ret nz

    ccf
    nop
    rst $38
    call z, $a033
    ld e, a
    ret nz

    ccf
    ld b, b
    cp a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    db $fc
    ld [bc], a
    db $fc
    ld b, $f8
    inc c
    ldh a, [$09]
    pop af
    dec de
    pop hl
    inc sp
    jp $c727


    ccf
    dec sp
    ld a, a
    ld [hl], a
    rst $38
    ld h, a
    xor $ee
    adc $cc
    sbc h
    sbc h
    add hl, de
    jr jr_001_706a

    jr nc, jr_001_6fb8

    add a
    or e
    inc bc
    add hl, sp
    ld bc, $116d
    push bc
    add hl, sp
    add l
    ld a, c
    add l
    ld a, c
    dec b
    ld sp, hl
    rst $38
    rst $38
    rst $38
    rst $38
    ld hl, sp-$08
    ei
    ld hl, sp-$06
    ld sp, hl
    ld a, [$faf9]
    ld sp, hl
    ld a, [$fef9]
    cp $fe
    cp $3e
    ld e, $9e
    ld c, $ce
    ld c, $6e
    add [hl]
    ld h, $c6
    ld [hl], $c2
    rst $38
    rst $38
    ld a, a
    ld a, a
    ccf
    ccf
    cp a
    ccf
    cp a
    ccf

jr_001_706a:
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    jp z, $9bc4

    add h
    ld sp, $600e
    rra
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld b, b
    ccf
    ld a, a
    ld a, a
    ccf
    ccf
    sbc a
    rra
    rst $18
    rra
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld sp, hl
    ldh a, [$fe]
    db $fc
    ccf
    ld e, $0f
    rrca
    ld h, a
    rlca
    ld [hl], e
    inc bc
    ld e, e
    ld hl, $3149
    add c
    ld a, [hl]
    pop bc
    ld a, $60
    rra
    or b
    rrca
    ret nc

    adc a
    ret c

    rst $00
    add sp, -$39
    db $ed
    ld [c], a
    ld a, [hl]
    ld a, $3f
    ld e, $9f
    rra
    ld e, a
    sbc a
    sbc a
    rra
    cp a
    rra
    cp a
    ccf
    ccf
    ccf
    jp z, Jump_001_4a30

    jr nc, jr_001_712f

    db $10
    ld a, [hl+]
    db $10
    xor l
    db $10
    or [hl]
    adc b
    sub e
    adc h
    ret nc

    adc a
    jr z, jr_001_70d9

    xor b
    rlca
    ld l, b
    rlca
    xor b
    rlca
    ret c

jr_001_70d9:
    rlca
    jr nc, jr_001_70eb

    ldh [$1f], a
    jp Jump_000_003c


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

jr_001_70eb:
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

jr_001_710f:
    rst $38
    nop

jr_001_7111:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_001_7117:
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
    db $fc
    rrca
    ldh a, [rNR24]
    and $14
    db $eb
    jr jr_001_7111

    ld c, $f1
    inc e
    db $e3
    ld [hl], c

jr_001_712f:
    adc [hl]
    nop
    rst $38
    ld b, b
    cp a
    ldh a, [rIF]
    jr nz, jr_001_7117

    ld d, d
    xor l
    inc c
    di
    inc b
    ei
    ret nc

    cpl
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    db $fc
    dec b
    ld a, [$f00e]
    ld b, $f8
    inc c
    ldh a, [$6e]
    add [hl]
    call z, $980c
    jr jr_001_710f

    jr jr_001_7192

    add hl, sp
    ld a, a
    ld a, a
    rst $38
    ld a, a
    add $c6
    ld [hl-], a
    ld sp, $6166
    ld l, h
    ld b, e
    ret z

    rst $00
    sbc b
    add a
    or b
    rrca
    jr nz, jr_001_718d

    ld h, b
    rra
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    ld a, [$faf9]
    ld sp, hl
    ei
    ld hl, sp-$05
    ld hl, sp-$06
    ld hl, sp-$08
    ld hl, sp-$01

jr_001_718d:
    rst $38
    rst $38
    rst $38
    ld [hl], d
    add d

jr_001_7192:
    jp c, $8800

    nop
    inc l
    jr nz, jr_001_7208

    ld h, b
    db $eb
    db $e4
    add sp, -$19
    add sp, -$19
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
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
    ccf
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld e, a
    sbc a
    ld c, l
    ld sp, $3845
    ld b, h
    jr c, jr_001_721d

    jr c, jr_001_721b

    inc a
    ld b, d
    inc a
    ld b, d
    inc a
    ld b, d
    inc a
    push af
    ld [c], a
    push af
    ld a, [c]
    or $f0
    ld a, [$faf0]
    ld hl, sp-$08
    ld hl, sp-$07
    ld hl, sp-$07
    ld sp, hl
    ld a, a
    ccf
    ld a, a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    rst $30
    ld h, a
    rst $20
    db $e3
    db $eb
    db $e3
    db $eb
    set 3, e
    ret


Jump_001_7200:
    ret c

    rst $00
    ret z

    rst $00
    add sp, -$39
    db $ec
    db $e3

jr_001_7208:
    db $e4
    db $e3
    db $f4
    db $e3
    db $f4

jr_001_720d:
    di
    or $f1
    rst $18
    jr nz, @+$7e

    add e
    and e
    ld e, h
    nop
    rst $38
    nop
    rst $38
    nop

jr_001_721b:
    rst $38
    nop

jr_001_721d:
    rst $38
    nop
    rst $38
    ldh a, [rIF]
    cp b
    ld b, a
    ld l, h
    sub e
    rst $00
    jr c, jr_001_724a

    sbc $03
    db $fc
    nop
    rst $38
    ld b, $f9
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add b
    ld a, a
    ret nz

    ccf
    ld h, b
    sbc a
    jr nc, jr_001_720d

    jr nc, @-$2f

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

jr_001_724a:
    nop
    rst $38
    nop
    rst $38
    nop

jr_001_724f:
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

jr_001_725f:
    rst $38
    adc $31
    ld hl, sp+$07
    ld l, h
    sub e
    jr jr_001_724f

    ld [hl], b
    adc a
    ld b, d
    cp l
    ret c

    daa
    db $ec
    inc de
    ld h, c
    sbc [hl]
    ld b, $f9
    nop
    rst $38
    ld bc, $00fe
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld hl, $09de
    pop af
    dec de
    pop hl
    inc de
    db $e3
    scf
    rst $00
    and $06
    ld c, h

jr_001_728b:
    adc h
    ret c

    ld [$1898], sp
    adc $84
    adc h
    adc h
    ld sp, hl
    ld hl, sp-$05
    ldh a, [$72]
    ld [hl], c
    ld h, [hl]
    ld h, c
    ld l, h
    ld b, e
    ret z

    rst $00
    ret nz

    ccf
    add b
    ld a, a
    add b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    jr nz, jr_001_728b

    nop
    rst $38
    ld bc, $05fe
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    dec b
    ld sp, hl
    ld hl, sp-$08
    ld a, [$fbf8]
    ld hl, sp-$05
    ld hl, sp-$06
    ld sp, hl
    ld a, [$faf9]
    ld sp, hl
    ld a, [$ebf9]
    db $e4
    ld l, a
    ld h, b
    inc l
    jr nz, jr_001_725f

    nop
    jp z, Jump_001_7200

    add d
    ld [hl], $c2
    ld h, $c6
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    ld b, b
    ccf
    ld b, e
    inc a
    ld b, a
    jr c, jr_001_733b

    jr c, @+$4f

    jr nc, @+$4b

    ld sp, $215b
    ld d, e
    inc hl
    ld e, a
    sbc a
    rst $18
    rra
    rst $18
    rra
    ld e, a
    rra
    ld e, a
    rra
    ld e, a
    rra
    ld e, a
    rra
    ld e, a
    rra
    ld b, d
    inc a
    ld b, [hl]
    jr c, jr_001_7359

jr_001_7315:
    jr c, jr_001_735c

    jr c, jr_001_7366

    ld sp, $3149
    ld e, e
    ld hl, $0373
    ld sp, hl
    ld sp, hl
    ei
    ld sp, hl
    ei
    ei
    ei
    di
    rst $30
    di
    rst $30
    rst $30
    rst $30
    and $ee
    and $dd
    reti


    pop bc
    add c
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    nop
    ld a, [hl]

jr_001_733b:
    nop
    ld b, d
    inc a
    ld b, d
    inc a
    ld a, [c]
    pop af
    ld a, [$fbf1]
    ld hl, sp-$07
    ld hl, sp-$03
    ld hl, sp-$03
    db $fc
    db $fc
    ld a, h
    ld a, [hl]
    ld a, h
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $8ffe

jr_001_7359:
    ld [hl], b
    ld hl, sp+$07

jr_001_735c:
    ldh a, [rIF]
    cp $01
    nop
    rst $38
    inc h
    db $db
    dec de
    db $e4

jr_001_7366:
    rst $00
    jr c, jr_001_7315

    ld d, e
    ld hl, sp+$07
    nop
    rst $38
    add b
    ld a, a
    ld h, b
    sbc a
    ret nz

    ccf
    add b
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
    ld bc, $03fe
    db $fc
    rlca
    ld hl, sp+$06
    ld sp, hl
    dec c
    ld a, [c]
    ld c, $f1
    ld a, b
    add a
    db $10
    rst $28
    add sp, $17
    ret nz

    ccf
    ld h, b
    sbc a
    ld bc, $01fe
    cp $02
    db $fd
    ld bc, $03fe
    db $fc
    ld b, $f8
    inc b
    ld hl, sp+$0d
    ldh a, [rNR24]
    pop hl
    inc de
    db $e3
    scf
    jp Jump_000_3030


    ld [hl], c
    ld sp, $6363
    and $e6
    add $c4
    call z, $f9cc
    sbc b
    ei
    or b
    sbc h
    add e
    cp c
    ld b, $2c
    inc de
    ld h, b
    rra
    ret nz

    ccf
    add $39
    add c
    ld a, [hl]
    db $10
    rst $28
    ld [bc], a
    db $fd
    ld bc, $00fe
    rst $38
    nop
    rst $38
    nop
    rst $38
    add b
    ld a, a
    ld bc, $03fe
    db $fc
    push bc
    add hl, sp
    adc l
    ld [hl], c
    add hl, de
    pop hl
    inc sp
    jp $8767


    rst $08

jr_001_73fb:
    rrca
    sbc h
    jr jr_001_7438

    jr c, jr_001_73fb

    ld sp, hl
    ld a, [$fbf9]
    ld hl, sp-$08
    ld hl, sp-$01
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    ld l, [hl]
    add [hl]
    adc $0e
    sbc [hl]
    ld c, $3e
    ld e, $fe
    cp $fe
    cp $00
    nop
    rst $38
    nop
    cp a
    ccf
    cp a
    ccf
    cp a
    ccf
    ccf
    ccf
    ld a, a
    ld a, a
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    ld [hl], a
    inc bc
    ld h, a
    rlca
    ld l, a
    rlca
    rrca
    rrca

jr_001_7438:
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    ld e, a
    rra
    ld e, a
    rra
    ld e, a
    rra
    rra
    rra
    ccf
    ccf
    ld a, a
    ld a, a
    nop
    nop
    rst $38
    nop
    ld h, a
    rlca
    rrca
    rrca
    ccf
    rra
    rst $38
    cp $fe
    db $fc
    db $fc
    ldh a, [rP1]
    nop
    rst $38
    nop
    xor $ce
    sbc $8c
    sbc h
    inc e
    inc a
    inc e
    ld a, [hl]
    ld a, [hl]
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    pop bc
    ld a, $83
    ld a, h
    add [hl]
    ld a, b
    call z, Call_001_7930
    ld bc, $0333
    jr nc, jr_001_747e

jr_001_747e:
    rst $38
    nop
    ld a, [hl]
    ld a, [hl]
    ld a, a
    ld a, [hl]
    ld a, a
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    jp Jump_001_603c


    rra
    jr nc, jr_001_74a5

    sbc b
    rlca
    call z, $e683
    pop bc
    ld b, $01
    db $fc
    inc bc
    ret nz

    ccf
    ld a, b
    add a
    inc c

jr_001_74a5:
    di
    inc b
    ei
    inc b
    ei
    inc c
    di
    jr @-$17

    ld [hl], b
    adc a
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

jr_001_74c1:
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
    ld a, [bc]
    push af
    ld [$0df7], sp
    ld a, [c]
    rlca
    ld hl, sp+$01
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    jr nz, jr_001_74c1

    ret nz

    ccf
    jp nz, Jump_000_163d

    jp hl


    call z, $fc33
    inc bc
    ld c, $f1
    inc bc
    db $fc
    ld h, a
    add a
    ld c, a
    adc a
    rst $18
    rrca
    sbc a
    rra
    cp a
    rra
    cp a
    rra
    ret nz

    nop
    rst $38
    nop
    ld a, [c]
    pop hl
    and $e1
    rst $28
    ret nz

    ldh [$c0], a
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    ld b, $f8
    inc c
    ldh a, [$f9]
    ld bc, $0303
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    ld a, e
    ld [hl], c
    di
    pop af
    rst $30
    pop hl
    push hl
    db $e3
    db $ed
    jp $c7c9


    add hl, de
    rlca
    pop af
    rrca
    rst $38
    rst $38
    adc l
    adc l
    call c, $addc
    xor l
    adc l
    adc l
    dec h
    dec h
    rst $38
    rst $38
    adc h
    adc h
    rst $38
    rst $38
    ret nc

    ret nc

    rst $10
    rst $10
    ld d, a
    ld d, a
    sub a
    sub a
    ret nc

    ret nc

    rst $38
    rst $38
    ld [hl], a
    ld [hl], a
    rst $38
    rst $38
    ld hl, sp-$08
    ld a, d
    ld a, d
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    cp $fe
    rst $38
    rst $38
    ld h, e
    ld h, e
    rst $38
    rst $38
    ld l, $2e
    xor [hl]
    xor [hl]
    ldh [$e0], a
    xor $ee
    xor $ee
    rst $38
    rst $38
    jp $ffc3


    rst $38
    adc a
    adc a
    cp a
    cp a
    adc a
    adc a
    cp a
    cp a
    adc a
    adc a
    rst $38
    rst $38
    jr jr_001_75a8

    rst $38
    rst $38
    cp h
    cp h
    cp [hl]
    cp [hl]
    cp l
    cp l
    cp h
    cp h
    adc c
    adc c
    rst $38
    rst $38
    call c, $ffdf
    rst $38
    ld l, [hl]
    ld l, [hl]
    db $e4
    db $e4
    ld l, d
    ld l, d

jr_001_75a8:
    ld l, [hl]
    ld l, [hl]
    ld l, $2e
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    adc h
    adc h
    xor e
    xor e
    adc h

jr_001_75b7:
    adc h
    cp a
    cp a
    cp b
    cp b
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    ld l, $2e
    xor $ee
    ld h, b
    ld h, b
    xor [hl]
    xor [hl]
    ld l, [hl]
    ld l, [hl]
    rst $38
    rst $38
    jr jr_001_75b7

    rst $38
    rst $38
    add $c6
    xor $ee
    sub $d6
    add $c6
    sub d
    sub d
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    jr jr_001_75fc

    db $eb
    db $eb
    add sp, -$18
    db $eb
    db $eb
    jr jr_001_7604

    rst $38
    rst $38
    nop
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38

jr_001_75fc:
    add b
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    ld a, a

jr_001_7604:
    nop
    ld a, a
    nop
    ld e, a
    nop
    ld e, a
    nop
    rra
    add b
    rrca
    add b
    cpl
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
    rra

jr_001_7631:
    ldh [rSB], a
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
    add e
    ld a, h
    ldh a, [rIF]
    ccf
    ret nz

    rlca
    ld hl, sp+$00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    jr nz, jr_001_7631

    rlca
    ld hl, sp-$01
    nop
    db $fc
    inc bc
    nop
    rst $38
    nop
    ld hl, sp+$07
    ret nz

    ccf
    nop
    inc b
    ei
    ldh [$1f], a
    rst $38
    nop
    rra
    ldh [rP1], a
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $fdff
    inc bc
    rst $38
    ld bc, $1de3
    ld bc, $00ff
    nop
    rst $38
    nop
    rst $38
    nop
    ld [hl], l
    ld [hl], l
    ld [hl], h
    ld [hl], h
    ld [hl], l
    ld [hl], l
    adc l
    adc l
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    di
    di
    ld [hl], l
    ld [hl], l
    or $f6
    rst $30
    rst $30
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld e, l
    ld e, l
    ld e, l
    ld e, l
    ld e, l
    ld e, l
    ld h, e
    ld h, e
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    db $dd
    db $dd
    db $dd
    db $dd
    jp $d9c3


    reti


    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, l
    ld a, l
    ld a, [de]
    ld a, [de]
    ld a, b
    ld a, b
    ld [de], a
    ld [de], a
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    db $dd
    sbc $df
    call c, $dcdf
    ld b, [hl]
    ld b, l
    db $fc
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ldh a, [rIF]
    ret nz

    ccf
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ld hl, sp+$07
    cp $01
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld b, b
    rrca
    ld b, b
    rrca
    ld b, b
    rra
    ld h, b
    rla
    jr nz, jr_001_7761

    jr nz, jr_001_7753

    jr nz, jr_001_7755

    jr nc, jr_001_7753

    nop
    rst $38
    nop

jr_001_7753:
    rst $38
    nop

jr_001_7755:
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

jr_001_7761:
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
    db $fc
    ld bc, $01fc
    ld hl, sp+$03
    ld hl, sp+$03
    ld hl, sp+$03
    ld hl, sp+$03
    ld hl, sp+$77
    rrca
    rst $18
    ccf
    cp b
    ld a, h
    ld hl, sp+$78
    ld a, c
    ld sp, hl
    ld hl, sp-$07
    ld hl, sp-$08
    ld hl, sp-$04
    rst $38
    rst $38
    rst $28
    rst $38
    nop
    jr z, jr_001_77af

    call $edcd
    db $fd
    db $fd
    dec a
    ld a, l
    dec c

jr_001_77af:
    dec e
    rst $38
    rst $38
    rst $38
    rst $38
    ld [bc], a
    add $92
    ld a, [$baba]
    cp [hl]
    cp [hl]
    cp [hl]
    cp [hl]
    and d
    or d
    rst $38
    rst $38
    rst $38
    rst $38
    ld h, b
    add sp, $28
    ld l, l
    dec c
    xor l
    adc l
    call $edcd
    db $ed
    db $ed
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    add d
    sbc [hl]
    cp a
    cp a
    cp a
    cp a
    cp a
    sbc a
    cp a
    add e
    add a
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    ld sp, $6e24
    ld l, [hl]
    ld l, [hl]
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    rst $38
    rst $38
    rst $38
    rst $38
    add d
    add $92
    cp d
    cp d
    cp d
    cp d
    cp d
    sub d
    cp d
    add d
    add d
    rst $38
    rst $38
    rst $38
    rst $38
    ld l, b
    db $ec
    add hl, hl
    ld l, e
    dec bc
    xor e
    adc e
    set 1, e
    db $eb
    db $eb
    db $eb
    rst $38
    rst $38
    rst $38
    rst $38
    jr nz, jr_001_7876

    inc sp
    or e
    or e
    or e
    di
    di
    di
    di
    ldh a, [$f0]
    xor $f1
    ei
    db $fc
    dec e
    ld a, $bf
    cp [hl]
    cp $ff
    rst $38
    rst $38
    ld a, a
    rst $38
    ld a, a
    ld a, a
    nop
    rst $38
    nop
    rst $38
    add b
    ld a, a
    add b
    ld a, a
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    ccf
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

jr_001_7876:
    nop
    cp $00
    cp $00
    cp $00
    cp $00
    db $fd
    db $10
    inc bc
    db $10
    inc bc
    sbc b
    ld bc, $0188
    adc h
    ld bc, $0084
    ld b, [hl]
    nop
    ld b, d
    nop
    nop
    ld a, [hl]
    nop
    ld a, [hl]
    nop
    cp a
    nop
    sbc l
    nop
    ld c, [hl]
    nop
    ld h, [hl]
    nop
    inc hl
    nop
    stop
    rst $28
    nop
    rst $30
    nop
    ld [hl], a
    nop
    ld [hl], e
    nop
    cp e
    nop
    dec e
    nop
    dec e
    nop
    adc a
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
    inc bc
    ld hl, sp+$03
    ld hl, sp+$03
    ld hl, sp+$01
    db $fc
    ld bc, $00fc
    cp $00
    rst $38
    nop
    rst $38
    cp $ff
    ei
    rst $38
    ld a, c
    ei
    ld hl, sp+$79
    cp b
    ld a, d
    db $db
    ccf
    ld [hl], a
    rrca
    ccf
    add b
    dec c
    dec c
    adc l
    call $cdcd
    ld [$008d], sp
    jr @+$01

    rst $38
    rst $38
    rst $38
    rst $38
    nop
    or d
    cp d
    cp d
    cp d
    cp d
    cp d
    sub d
    cp d
    ld [bc], a
    add $ff
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    db $ed
    db $ed
    db $ed
    db $ed
    db $ed
    db $ed
    add sp, -$13
    ldh [$e8], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    sbc a
    cp a
    cp a
    cp a
    cp a
    cp a
    cp [hl]
    cp a
    inc a
    cp [hl]
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    ld l, a
    ld l, a
    ld l, a
    ld l, a
    ld l, [hl]
    ld l, [hl]
    inc h
    ld l, [hl]
    nop
    ld sp, $ffff
    rst $38
    rst $38
    rst $38
    nop

Call_001_7930:
    sub d
    cp d
    cp d
    cp d
    cp d
    cp d
    cp d
    cp d
    cp d
    cp d
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    db $eb
    db $eb
    db $eb
    db $eb
    db $eb
    db $eb
    jp hl


    db $eb
    add sp, -$14
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    di
    di
    di
    di
    or e
    or e
    inc sp
    or e
    jr nz, @+$62

    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    ld a, a
    rst $38
    rst $38
    rst $38
    cp $ff
    cp a
    cp [hl]
    dec e
    ld a, $fb
    db $fc
    xor $f1
    db $fc
    inc bc
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    ccf
    add b
    ld a, a
    add b
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
    rst $38
    nop
    rst $38
    nop
    ld [hl], h
    nop
    inc [hl]
    ld bc, $0130
    cp b
    ld bc, $03b8
    cp b
    inc bc
    jr nc, @+$03

    jr nz, jr_001_79ee

    nop
    dec b
    nop
    inc b
    nop
    ld b, $00
    ld [bc], a
    nop
    inc bc
    nop
    ld bc, $8000
    nop
    ld [$0600], sp
    nop
    xor e
    nop
    dec d
    nop
    ld e, l
    nop
    ld c, [hl]
    nop
    and a
    nop
    or a
    nop
    nop
    dec bc
    nop
    inc bc
    nop
    dec b
    nop
    ld [bc], a
    sub b
    nop
    ret c

    nop
    db $ed
    nop

jr_001_79ee:
    cp $00
    nop
    ld a, a
    nop
    rst $38
    nop
    cp a
    nop
    cp a
    nop
    rra
    nop
    rra
    nop
    rrca
    add b
    rlca
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
    rra
    ldh [rP1], a
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
    rst $38
    rst $38
    nop
    nop
    rst $38
    ld h, b
    sbc a
    ret nz

    ccf
    ldh [$1f], a
    ld a, a
    add b
    nop
    rst $38
    nop
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
    rst $38
    nop
    nop
    rst $38
    nop
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
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    ld b, $f9
    inc bc
    db $fc
    rlca
    ld hl, sp-$02
    ld bc, $ff00
    nop
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
    rst $38
    ldh a, [rIF]
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
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    nop
    db $ec
    nop
    jp z, $c400

    nop
    ret nz

    nop
    add h
    ld de, $0980
    add b
    ld bc, $0110
    jr nz, @+$06

    nop
    ld c, $20
    adc $00
    adc d
    nop
    ld e, d
    nop
    sub d
    nop
    add b
    nop
    add b
    nop
    ld b, b
    nop
    ld b, b
    nop
    and b
    nop
    and b
    nop
    ldh a, [rP1]
    ld d, b
    nop
    inc hl
    nop
    add hl, hl
    nop
    inc b
    nop
    ld [de], a
    nop
    add hl, de
    nop
    ld [$0c00], sp
    nop
    ld b, $00
    rst $28
    nop
    or a
    nop
    cp a
    nop
    db $dd
    nop
    ld c, h
    nop
    xor [hl]
    nop
    and $00
    inc sp
    nop
    ld b, b
    inc bc
    nop
    inc bc
    add b
    dec d
    add b
    ld a, [bc]
    ret nz

    rlca
    ld b, b
    rlca
    ld h, b
    inc bc
    ld [hl], b
    inc bc
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rrca
    rst $38
    ld [$09f8], sp
    ld sp, hl
    add hl, bc
    ld sp, hl
    nop
    db $db
    nop
    adc l
    nop
    ld b, d
    nop
    add h
    rst $28
    rst $38
    jr c, jr_001_7b74

    sbc c
    sbc c
    sbc c
    sbc c
    nop
    rst $38
    nop
    rst $18
    nop
    ld l, a

jr_001_7b66:
    nop
    ld c, a
    rst $28
    rst $28
    jr c, jr_001_7b84

    sbc c
    sbc c
    sbc b
    sbc b
    nop
    rst $38
    nop
    rst $38

jr_001_7b74:
    nop
    rst $38

jr_001_7b76:
    nop
    rst $38
    rst $30
    rst $38
    inc e
    jr jr_001_7b76

    ld sp, hl
    inc l
    jr c, jr_001_7b81

jr_001_7b81:
    rst $38
    nop
    rst $38

jr_001_7b84:
    nop
    rst $38
    nop
    rst $38
    rst $20
    rst $38
    inc a
    jr jr_001_7b66

    reti


    ld l, h
    jr c, jr_001_7b91

jr_001_7b91:
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr nc, @+$21

    ret nc

    rst $18
    ld h, b
    ccf
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    inc c
    ld hl, sp+$09
    ld sp, hl
    inc c
    ld hl, sp+$00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $28
    rst $38
    jr c, jr_001_7bd4

    reti


    reti


    ld l, c
    add hl, sp
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $e3
    rst $38
    ld [hl], $1c
    sbc h
    sbc b
    sbc c
    sbc c
    nop
    rst $38
    nop
    rst $38

jr_001_7bd4:
    nop
    rst $38
    nop
    rst $38
    rst $18
    rst $38
    ld a, b
    jr nc, jr_001_7c10

    ld de, $9393
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    rst $38
    rst $38
    ld h, b
    jr nz, jr_001_7c14

    daa
    ldh [$e0], a
    nop
    rst $18
    nop
    push de
    nop
    adc c
    nop
    add c
    ldh [$c2], a
    ld d, b
    ld b, b
    db $e4
    pop bc
    xor b
    add b
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

jr_001_7c10:
    nop
    rst $38
    nop
    rst $28

jr_001_7c14:
    nop
    rst $28
    nop
    cp $00
    xor $00
    db $dd
    nop
    sbc $00
    call nc, $0011
    dec bc
    ld b, b
    dec e
    ld b, b
    rra
    add b
    rla
    add b
    dec [hl]
    nop
    inc sp
    nop
    ld sp, $f200
    nop
    or d
    nop
    halt
    rst $20
    nop
    ld h, a
    nop
    add $00
    call z, $8a00
    nop
    ret z

    nop
    ld l, b
    nop
    ld h, h
    nop
    ld [hl], $00
    or d
    nop
    ld e, e
    nop
    dec a
    nop
    ld c, [hl]
    nop
    add e
    nop
    pop bc
    nop
    ld b, b
    nop
    ld h, b
    nop
    jr nc, jr_001_7c5a

jr_001_7c5a:
    ld a, [hl-]
    nop
    sbc l
    nop
    adc $00
    add hl, bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld bc, $b800
    ld bc, $00fc
    cp [hl]
    nop
    rst $18
    nop
    rst $38
    nop
    halt
    dec sp
    nop
    sbc a
    nop
    ld [$09f8], sp
    ld sp, hl
    add hl, bc
    ld a, c
    rrca
    rra
    add b
    dec c
    ldh [rSC], a
    ldh a, [rP1]
    cp b
    inc b
    jr c, jr_001_7caa

    jp hl


    jp hl


    add hl, bc
    ret


    rrca
    ld l, a
    inc bc
    jr nz, jr_001_7c9c

    or b

jr_001_7c9c:
    ld bc, $2290
    ld [$2929], sp
    add hl, sp
    add hl, de
    sbc b
    sbc b
    rst $38
    rst $38
    ld [hl], d
    nop

jr_001_7caa:
    ld a, [$ff00]
    nop

jr_001_7cae:
    rst $28
    nop
    rst $28
    rst $38
    ld sp, hl
    ld sp, hl
    inc e
    jr jr_001_7cae

    rst $38
    nop
    ld l, $00
    dec d
    nop
    ld a, [bc]
    add b
    db $10
    sbc a
    sbc a
    sbc c
    sbc c
    inc a
    jr jr_001_7cae

    rst $30
    nop
    rst $30
    nop
    ld l, e
    nop
    scf
    nop
    ld e, e
    sub b
    sbc a
    sub b
    sbc a
    jr nc, jr_001_7cf5

    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rrca
    rst $38
    add hl, bc
    ld sp, hl
    inc c
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
    sbc b
    sbc b
    sbc c
    sbc c
    add hl, sp

jr_001_7cf5:
    add hl, de
    rst $28
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add hl, sp
    add hl, de
    add sp, -$08
    add hl, bc
    ld sp, hl
    rrca
    rst $38
    nop
    cp $00
    cp $00
    cp $00
    db $fd
    sub e
    sub e
    inc de
    ld de, $9098
    rst $38
    rst $38
    nop
    ldh a, [rP1]
    ld a, [c]
    nop
    db $e4
    nop
    ldh [$e7], a

jr_001_7d21:
    rst $20
    daa
    daa
    ld h, b
    jr nz, @+$01

    rst $38
    ld a, h
    nop
    ld hl, sp+$00
    cp b
    nop
    inc sp
    nop
    db $f4
    add c
    add sp, -$3d
    ld e, b
    ld b, c
    ldh a, [$c3]
    jr nc, jr_001_7d3d

    ld h, b
    ld b, $e0

jr_001_7d3d:
    inc b
    ret nz

    add hl, bc
    nop
    db $fd
    nop
    rst $38
    nop
    db $fd
    nop
    dec a
    nop
    ld [hl], l
    nop
    ld a, e
    nop
    push hl
    nop
    rlc b
    sub a
    nop
    and [hl]
    nop
    sub [hl]
    nop
    inc h
    nop
    ld c, b
    ld bc, $01a4
    ret z

    inc bc
    add b
    ld h, d
    nop
    ld h, c
    nop
    ldh [rP1], a
    ret


    nop
    ret z

    nop
    ret


    nop
    adc h
    nop
    adc h
    nop
    sub h
    nop
    ld [$8000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and a
    nop
    ld [hl], e
    nop
    ld sp, $1800
    add b
    inc d
    add b
    ld a, [de]
    ret nz

    add hl, bc
    ld b, b
    inc c
    jr nz, jr_001_7e00

    nop
    push af
    nop
    jp c, $e500

    nop
    ld [hl], c
    nop
    jr c, jr_001_7d9c

jr_001_7d9c:
    inc e
    nop
    add [hl]
    jr nz, jr_001_7d21

    nop
    ret nz

    nop
    ldh [rP1], a
    ld a, b
    nop
    sub [hl]
    nop
    rlc b
    ld [hl], h
    nop
    ld e, $00
    rst $08
    nop
    ld l, a
    nop

jr_001_7db4:
    scf
    nop
    dec de
    nop

jr_001_7db8:
    dec b
    nop
    add b
    nop
    ret nz

    nop
    nop
    nop
    add sp, $02
    db $e4
    ld bc, $00b2
    ret c

    nop
    and h
    nop
    ld a, [c]
    nop
    jr c, jr_001_7dce

jr_001_7dce:
    inc c
    nop
    ld [hl+], a
    ld [hl+], a
    ld e, l
    ld e, l
    or d
    or d
    xor [hl]
    xor [hl]
    xor [hl]
    xor [hl]
    or d
    or d
    ld e, l
    ld e, l
    ld [hl+], a

jr_001_7ddf:
    ld [hl+], a
    ld c, $0e
    pop af
    ld de, $a4e4
    db $fc
    cp h
    pop af
    sub c
    rst $20
    and a
    ldh [rNR41], a
    rra
    rra
    jr c, @+$3a

    rst $00
    ld b, h
    sub e
    sub e
    sub e
    sub e
    sub e
    sub d
    sub e
    sub e
    rst $00
    push bc
    jr c, jr_001_7e38

jr_001_7e00:
    ld [hl], c
    ld [hl], c
    adc [hl]
    adc d
    inc h
    inc h
    rst $20
    rst $20
    adc a
    adc e
    inc a
    inc a
    ld b, $06
    ld sp, hl
    ld sp, hl
    ret nz

    ret nz

    ccf
    jr nz, jr_001_7db4

    sub b
    ccf
    jr nz, jr_001_7db8

    sub b
    sbc a
    sub b
    ccf
    jr nz, jr_001_7ddf

    ret nz

    nop
    nop
    rst $38
    nop
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    rst $38
    nop
    nop
    nop
    ld a, b
    ld a, b
    add a
    add l
    ld [hl-], a
    ld [hl-], a
    ld a, $3e

jr_001_7e38:
    ld a, $3e
    ld [hl-], a
    ld [hl-], a
    add a
    add l
    ld a, b
    ld a, b
    pop af
    pop af
    ld c, $0a
    ld h, h
    ld h, h
    ld a, h
    ld a, h
    ld a, h
    ld a, h
    ld h, h
    ld h, h
    ld c, $0a
    pop af
    pop af
    ldh [$e0], a
    rra
    db $10
    rst $08
    ret z

    rst $38
    ld hl, sp-$71
    adc b
    rst $08
    ret z

    rra
    db $10
    ldh [$e0], a
    nop
    nop
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    nop
    nop
    add b
    rra
    nop
    dec sp
    nop
    ld d, [hl]
    add b
    inc h
    ld bc, $1348
    add b
    cpl
    nop
    ld [hl], e
    nop
    nop
    rlc b
    ld [de], a
    ld b, b
    dec b
    ld b, b
    ld [bc], a
    add b
    inc b
    add b
    ld [de], a
    nop
    inc c
    nop
    jr jr_001_7e94

    nop
    ld c, $80

jr_001_7e94:
    ld d, $00
    inc l
    nop
    ld a, [de]
    nop
    dec a
    nop
    ld a, d
    nop
    or b
    nop
    inc e
    nop
    jr jr_001_7ea4

jr_001_7ea4:
    sbc b
    nop
    jr nc, jr_001_7ea8

jr_001_7ea8:
    or b
    nop
    jr nz, jr_001_7eac

jr_001_7eac:
    nop
    nop
    nop
    nop
    ld bc, $0100
    nop
    inc bc
    nop
    inc bc
    nop
    ld b, $00
    inc b
    nop
    ld [$0000], sp
    nop
    add $00
    ld [c], a
    nop
    ld [hl], e
    nop
    add hl, hl
    nop
    inc d
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld b, e
    jr jr_001_7ef4

    inc c
    db $10
    ld b, $88
    inc bc
    call nz, Call_001_6201
    nop
    pop af
    nop
    ld a, b
    nop
    nop
    nop
    add b
    nop
    ld h, b
    nop
    db $10
    add b
    inc c
    ldh [$03], a
    ldh a, [$80]
    ld a, [hl-]
    ld b, b
    dec e
    ld h, b
    nop
    jr c, jr_001_7ef4

jr_001_7ef4:
    ld e, $00
    rrca
    nop
    inc b
    nop
    ld bc, $c000
    nop
    ld d, b
    nop
    ld b, [hl]
    nop
    inc hl
    nop
    ld de, $8800
    nop
    ldh [rP1], a
    jr nc, jr_001_7f0c

jr_001_7f0c:
    adc h
    nop
    ld h, e
    nop
    nop
    jr nz, jr_001_7f13

jr_001_7f13:
    db $10
    add b
    inc c
    ldh [$03], a
    ld a, b
    ld bc, $0036
    dec bc
    nop
    inc e
    nop
    rrca
    nop
    inc bc
    nop
    ld bc, $0020
    jr jr_001_7f29

jr_001_7f29:
    add $00
    ld a, c
    nop
    ccf
    ret nz

    rrca
    inc bc
    nop
    add c
    nop
    ldh [rP1], a
    ld a, b
    nop
    inc e
    nop
    rlca
    ret nz

    ld bc, $00f0
    db $fc
    sbc b
    ld bc, $00cc
    halt
    ccf
    nop
    rrca
    nop
    add e
    nop
    ldh a, [rP1]
    ccf
    nop
    nop
    db $eb
    nop
    pop af
    nop
    ld a, h
    nop
    rra
    add b
    rlca
    ldh [rP1], a
    ld a, h
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
    rrca
    nop
    ret nz

    nop
    ld a, h
    inc bc
    nop
    ldh [rP1], a
    nop
    db $fc
    nop
    ldh a, [rP1]
    add a
    nop
    db $fc
    nop
    nop
    inc bc
    nop
    db $fc
    nop
    nop
    rrca
    rrca
    nop
    ld a, [hl-]
    nop
    dec b
    nop
    dec bc
    nop
    inc a
    nop
    ldh [rTMA], a
    nop
    ccf
    nop
    rst $38
    ld b, b
    nop
    add b
    nop
    ld bc, $0004
    jr z, jr_001_7f99

jr_001_7f99:
    ld d, l
    nop
    xor a
    nop
    ld a, h
    inc bc
    ret nz

    ld [hl], c
    nop
    and d
    nop
    ld b, c
    nop
    inc bc
    nop
    inc d
    ret nz

    ld [$0080], sp
    nop
    add b
    nop
    ld a, [hl]
    nop
    db $fc
    nop
    ld hl, sp+$01
    jr nc, jr_001_7fba

    ld h, b
    inc bc

jr_001_7fba:
    add b
    ld c, $00
    jr c, jr_001_7fbf

jr_001_7fbf:
    ret nz

    ld bc, $0378
    or b
    dec b
    ld h, b
    dec bc
    ret nz

    ld b, $80
    ld [$2600], sp
    nop
    call c, $e000
    nop
    ret nz

    nop
    add b
    nop
    jr nz, jr_001_7fd8

jr_001_7fd8:
    ld b, b
    nop
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
    nop
