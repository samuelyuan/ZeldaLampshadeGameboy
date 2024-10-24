_isqrt:
    add sp, -$04
    ; m = 0x4000;
    ; y = 0;
    ld bc, $4000
    xor a
    ld hl, sp+$02
    ld [hl+], a
    ld [hl], a

jr_000_1878:
    ; while (m != 0) {
    ld a, b
    or c
    jr z, jr_000_18be

    ; b = y | m;    
    ld hl, sp+$02
    ld a, [hl+]
    or c
    ld e, a
    ld a, [hl]
    or b
    ld hl, sp+$00
    ld [hl], e
    inc hl
    ; y >>= 1;
    ld [hl+], a
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ; if (x >= b) {
    ld hl, sp+$06
    ld e, l
    ld d, h
    ld hl, sp+$00
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr c, jr_000_18b4

    ; x -= b;
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$07
    ld [hl-], a
    ; y |= m;
    ld [hl], e
    ld hl, sp+$02
    ld a, [hl]
    or c
    ld [hl+], a
    ld a, [hl]
    or b
    ld [hl], a

jr_000_18b4:
    ; m >>= 2;
    srl b
    rr c
    srl b
    rr c
    jr jr_000_1878

jr_000_18be:
    ; return (UBYTE)y;
    ld hl, sp+$02
    ld e, [hl]
    add sp, $04
    ret

_sine_wave:
    db $00, $03, $06, $09, $0c, $10, $13, $16, $19, $1c, $1f, $22, $25, $28, $2b, $2e
    db $31, $33, $36, $39, $3c, $3f, $41, $44, $47, $49, $4c, $4e, $51, $53, $55, $58
    db $5a, $5c, $5e, $60, $62, $64, $66, $68, $6a, $6b, $6d, $6f, $70, $71, $73, $74
    db $75, $76, $78, $79, $7a, $7a, $7b, $7c, $7d, $7d, $7e, $7e, $7e, $7f, $7f, $7f
    db $7f, $7f, $7f, $7f, $7e, $7e, $7e, $7d, $7d, $7c, $7b, $7a, $7a, $79, $78, $76
    db $75, $74, $73, $71, $70, $6f, $6d, $6b, $6a, $68, $66, $64, $62, $60, $5e, $5c
    db $5a, $58, $55, $53, $51, $4e, $4c, $49, $47, $44, $41, $3f, $3c, $39, $36, $33
    db $31, $2e, $2b, $28, $25, $22, $1f, $1c, $19, $16, $13, $10, $0c, $09, $06, $03
    db $00, $fd, $fa, $f7, $f4, $f0, $ed, $ea, $e7, $e4, $e1, $de, $db, $d8, $d5, $d2
    db $cf, $cd, $ca, $c7, $c4, $c1, $bf, $bc, $b9, $b7, $b4, $b2, $af, $ad, $ab, $a8
    db $a6, $a4, $a2, $a0, $9e, $9c, $9a, $98, $96, $95, $93, $91, $90, $8f, $8d, $8c
    db $8b, $8a, $88, $87, $86, $86, $85, $84, $83, $83, $82, $82, $82, $81, $81, $81
    db $81, $81, $81, $81, $82, $82, $82, $83, $83, $84, $85, $86, $86, $87, $88, $8a
    db $8b, $8c, $8d, $8f, $90, $91, $93, $95, $96, $98, $9a, $9c, $9e, $a0, $a2, $a4
    db $a6, $a8, $ab, $ad, $af, $b2, $b4, $b7, $b9, $bc, $bf, $c1, $c4, $c7, $ca, $cd
    db $cf, $d2, $d5, $d8, $db, $de, $e1, $e4, $e7, $ea, $ed, $f0, $f4, $f7, $fa, $fd

_dir_lookup:
    db $00, $01, $01, $00, $00, $ff, $ff, $00

_dir_angle_lookup:
    db $80, $40, $00, $c0