_HandleCrash_banked:
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
    ld hl, _font_data

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

_font_data:
    db $00, $90, $f8, $ff, $00, $00, $92, $f8, $ff, $00, $d0, $92, $08, $ff, $ff, $ff
    db $ff, $c3, $ff, $ff, $ff, $00, $00, $93, $50, $ff, $cf, $a7, $33, $33, $33, $97
    db $cf, $ff, $cf, $8f, $0f, $cf, $cf, $cf, $03, $ff, $87, $33, $e7, $cf, $9f, $3f
    db $03, $ff, $87, $73, $f3, $c7, $f3, $73, $87, $ff, $c7, $a7, $67, $03, $e7, $e7
    db $e7, $ff, $03, $3f, $3f, $87, $f3, $33, $87, $ff, $87, $33, $3f, $07, $33, $33
    db $87, $ff, $03, $f3, $f3, $e7, $e7, $cf, $cf, $ff, $87, $33, $33, $87, $33, $33
    db $87, $ff, $87, $33, $33, $83, $f3, $33, $87, $00, $a0, $93, $08, $ff, $ff, $9f
    db $9f, $ff, $9f, $9f, $ff, $00, $10, $94, $42, $ff, $cf, $b7, $7b, $7b, $03, $7b
    db $7b, $ff, $07, $7b, $7b, $07, $7b, $7b, $07, $ff, $c3, $bf, $7f, $7f, $7f, $bf
    db $c3, $ff, $0f, $77, $7b, $7b, $7b, $77, $0f, $ff, $03, $7f, $7f, $03, $7f, $7f
    db $03, $ff, $03, $7f, $7f, $03, $7f, $7f, $7f, $ff, $83, $7f, $7f, $43, $7b, $7b
    db $87, $ff, $7b, $7b, $7b, $03, $7b, $7b, $7b, $ff, $83, $fb, $ef, $02, $83, $ff
    db $fa, $fb, $0a, $07, $ff, $7b, $77, $6f, $5f, $1f, $6f, $73, $ff, $fa, $7f, $13
    db $03, $ff, $7b, $33, $4b, $7b, $7b, $7b, $7b, $ff, $7b, $3b, $5b, $6b, $73, $7b
    db $7b, $ff, $87, $fb, $7b, $23, $87, $ff, $07, $7b, $7b, $07, $7f, $7f, $7f, $ff
    db $87, $7b, $7b, $7b, $5b, $67, $93, $ff, $07, $7b, $7b, $07, $6f, $77, $7b, $ff
    db $83, $7f, $7f, $87, $fb, $7b, $87, $ff, $01, $fa, $ef, $01, $ff, $fa, $7b, $02
    db $87, $ff, $fb, $7b, $22, $b7, $cf, $ff, $7b, $7b, $7b, $7b, $4b, $33, $7b, $ff
    db $7b, $7b, $b7, $cf, $b7, $7b, $7b, $ff, $bb, $bb, $bb, $d7, $ef, $ef, $ef, $ff
    db $03, $fb, $f7, $ef, $df, $bf, $03, $00, $00, $00

.header:
    db "KERNEL PANIC PLEASE"
    db "SEND A CLEAR PIC OF"
    db "THIS SCREEN TO DEVS"
    db " AF:"
    db "  MODEL:"
    db " BC:"
    db "   DE:"
    db " HL:"
.viewStr:
    db "  VIEW:"
.spStr:
    db " SP:"
.hwRegsStrs:
    db " LCDC:"
    db " K1:"
    db " IE:"
    db "  BANK:"
    db "R"
    dw $ff90
    db "V"
    dw $9dbb
    db "W"
    db $70, $ff
    db " "