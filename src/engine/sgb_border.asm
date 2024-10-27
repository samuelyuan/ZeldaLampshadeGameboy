; Load at bank 7 0x4523

_set_sgb_border:
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
    call _memset
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
    call _sgb_transfer
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
    call _set_bkg_tiles
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
    call _memset
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
    call _SetBankedBkgData
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
    call _sgb_transfer
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
    call _SetBankedBkgData
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
    call _sgb_transfer
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
    call _SetBankedBkgData
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
    call _sgb_transfer
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
    call _SetBankedBkgData
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
    call _SetBankedBkgData
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
    call _sgb_transfer
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
    call _memset
    add sp, $06
    push bc
    xor a
    inc a
    push af
    call _set_bkg_data
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
    call _fill_bkg_rect
    add sp, $05
    ld a, $b9
    ld [bc], a
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
    call _sgb_transfer
    pop hl
    add sp, $1f
    ret