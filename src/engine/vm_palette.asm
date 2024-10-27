; Load at bank 8 0x4000

_vm_load_palette:
    add sp, -$0c
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$01
    ld [hl+], a
    pop bc
    push bc
    inc bc
    inc bc
    ld a, [bc]
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld a, [hl]
    and $01
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    and $02
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    and $04
    ld hl, sp+$05
    ld [hl], a
    pop de
    push de
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_008_4053

    ld de, $dfa0
    ld hl, sp+$0a
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_008_405b

jr_008_4053:
    ld de, $c64b
    ld hl, sp+$0a
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_008_405b:
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$08
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$09
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], $00

Jump_008_4072:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jp z, Jump_008_414c

    push hl
    bit 0, [hl]
    pop hl
    jp z, Jump_008_413a

    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld a, [_IS_CGB]
    or a
    jr nz, jr_008_4099

    ld a, $01
    ld hl, sp+$0b
    sub [hl]
    jr nc, jr_008_40b4

jr_008_4099:
    ld e, c
    ld d, b
    push bc
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    ld hl, $0008
    push hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call _MemcpyBanked
    add sp, $07
    pop bc
    jr jr_008_4127

jr_008_40b4:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0b
    ld a, [hl]
    or a
    jr z, jr_008_40c7

    ld hl, sp+$0b
    ld a, [hl]
    dec a
    jr z, jr_008_4109

    jr jr_008_4127

jr_008_40c7:
    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$06
    ld [hl], e
    ld a, [hl+]
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_008_40ef

    inc hl
    inc hl
    ld de, _DMG_palette
    ld a, [hl]
    ld [de], a
    ld hl, sp+$03
    ld a, [hl]
    or a
    jr z, jr_008_40ef

    ld hl, sp+$06
    ld a, [hl]
    ldh [rBGP], a

jr_008_40ef:
    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_008_4127

    inc hl
    inc hl
    ld de, _DMG_palette + 1
    ld a, [hl]
    ld [de], a
    ld hl, sp+$03
    ld a, [hl]
    or a
    jr z, jr_008_4127

    ld hl, sp+$07
    ld a, [hl]
    ldh [rOBP0], a
    jr jr_008_4127

jr_008_4109:
    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_008_4127

    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, _DMG_palette + 2
    ld [hl], e
    ld hl, sp+$03
    ld a, [hl]
    or a
    jr z, jr_008_4127

    ld a, e
    ldh [rOBP1], a

jr_008_4127:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl], a

Jump_008_413a:
    ld hl, $0008
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0b
    inc [hl]
    ld hl, sp+$08
    ld a, [hl]
    srl a
    ld [hl], a
    jp Jump_008_4072


Jump_008_414c:
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $0c
    ret