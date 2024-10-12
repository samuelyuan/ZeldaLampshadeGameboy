SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

JTHouseInsideTileImage::
    db $89, $00
    INCBIN "gfx/image_004_4002.2bpp"

DimHouseInsideTileImage::
    db $81, $00
    INCBIN "gfx/image_004_4894.2bpp"

DimHouseOutsideTileImage::
    db $82, $00
    INCBIN "gfx/image_004_50a6.2bpp"

NgHeadquartersInsideTileImage::
    db $66, $00
    INCBIN "gfx/image_004_58c8.2bpp"

McdonaldsTileImage::
    db $84, $00
    INCBIN "gfx/image_004_5f2a.2bpp"

JRInsideTileImage::
    db $7f, $00
    INCBIN "gfx/image_004_676c.2bpp"

JROutsideTileImage::
    db $81, $00
    INCBIN "gfx/image_004_6f5e.2bpp"

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

    db $08, $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $22, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $1f, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $0e, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $0e, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $09, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $0e, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $09, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $0e, $20, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $09, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $0e, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $09, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $09, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $1a, $50, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $50, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00
    db $00, $1a, $50, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $50, $00
    db $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00
    db $00, $1a, $50, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $50, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00
    db $00, $1a, $50, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $50, $00
    db $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00, $00, $1a, $50, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $22, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00

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
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
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
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
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
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c12

jr_004_7c12:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c1e

jr_004_7c1e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c2a

jr_004_7c2a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c36

jr_004_7c36:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c42

jr_004_7c42:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c4e

jr_004_7c4e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c5a

jr_004_7c5a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c66

jr_004_7c66:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c72

jr_004_7c72:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c7e

jr_004_7c7e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c8a

jr_004_7c8a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c96

jr_004_7c96:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7ca2

jr_004_7ca2:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7cae

jr_004_7cae:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7cba

jr_004_7cba:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7cc6

jr_004_7cc6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
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
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
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

jr_004_7d6e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop

    db $8f, $77, $8f, $7a

    ld c, a
    ld a, e
    rst $08
    ld a, h

    db $4f, $78, $4f, $78

    rrca
    ld a, h
    rrca
    ld a, h

    db $0f, $79, $0f, $79

    rrca
    ld a, c
    rrca
    ld a, c

    db $cf, $79, $cf, $79

    rst $08
    ld a, c
    rst $08
    ld a, c

    db $00, $c0, $b3, $80

    nop

    db $40, $b4, $80

    nop
    nop
    add hl, bc
    ret nz

    nop
    jr nc, jr_004_7d6e

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
    add b
    jr nz, jr_004_7def

    ret nz

jr_004_7def:
    add b
    jr nz, jr_004_7df4

    ret nz

    add b

jr_004_7df4:
    jr nz, @+$05

    ret nz

    add b
    jr nz, jr_004_7dfe

    ret nz

    add b
    jr nz, jr_004_7e03

jr_004_7dfe:
    ret nz

    add b
    jr nz, jr_004_7e08

    ret nz

jr_004_7e03:
    nop
    jr nz, @+$09

    add b
    nop

jr_004_7e08:
    jr nz, jr_004_7e12

    add b
    nop
    jr nz, jr_004_7e17

    add b
    nop
    jr nz, jr_004_7e1c

jr_004_7e12:
    add b
    nop
    jr nz, @+$0d

    add b

jr_004_7e17:
    nop
    jr nz, jr_004_7e26

    add b
    nop

jr_004_7e1c:
    jr nz, jr_004_7e2b

    add b
    nop
    jr nz, jr_004_7e30

    add b
    nop
    jr nz, jr_004_7e35

jr_004_7e26:
    add b
    sub c
    ld [hl], b
    jr nz, jr_004_7e4b

jr_004_7e2b:
    jr nz, jr_004_7e4d

    jr nz, jr_004_7e4f

    sub c

jr_004_7e30:
    ld h, b
    rra
    rra
    rra
    rra

jr_004_7e35:
    rra
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
    jr nz, jr_004_7e63

    jr nz, jr_004_7e65

    jr nz, jr_004_7e67

    db $71, $00, $18, $18

jr_004_7e4b:
    jr jr_004_7e65

jr_004_7e4d:
    jr jr_004_7e67

jr_004_7e4f:
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
    jr jr_004_7e73

    jr jr_004_7e75

    jr jr_004_7e77

    or c
    add b
    jr jr_004_7e7b

jr_004_7e63:
    jr jr_004_7e7d

jr_004_7e65:
    jr jr_004_7e7f

jr_004_7e67:
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

jr_004_7e73:
    jr nz, jr_004_7e95

jr_004_7e75:
    jr nz, jr_004_7e97

jr_004_7e77:
    pop bc
    ld b, b
    db $10
    rrca

jr_004_7e7b:
    rrca
    rrca

jr_004_7e7d:
    rrca
    rrca

jr_004_7e7f:
    or c
    ld d, [hl]
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

jr_004_7e95:
    inc b
    inc b

jr_004_7e97:
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
    call z, $00cc
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

    db $03, $8e, $77, $8f, $7d, $97, $7d, $9f, $7d, $a7, $7d, $af, $7d, $eb, $7d, $27
    db $7e, $6e, $77, $9f, $7e, $ff, $e4, $00, $22, $01, $30, $d9, $a4, $22, $19, $00
    db $d9, $a6, $22, $29, $00, $d9, $aa, $22, $0f, $a0, $d9, $a8, $22, $00, $98, $d9
    db $ac, $22, $00, $e4, $d9, $ae, $22, $00, $d0, $d9, $b0, $22, $40, $00, $d9, $b2
    db $22, $07, $00, $d9, $b4, $22, $02, $00, $d9, $b6, $22, $4e, $20, $d9, $b8, $22
    db $00, $10, $da, $34, $22, $00, $08, $d9, $be, $22, $00, $01, $da, $1e, $0b, $00

    rst $38
