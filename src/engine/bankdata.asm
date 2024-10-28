_SetBankedBkgData:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$06
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    pop bc
    call _set_win_data
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ld h, b
    ld l, c
    jp hl

_SetBankedSpriteData:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$06
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    pop bc
    call set_sprite_data
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ld h, b
    ld l, c
    jp hl

_SetBankedBkgTiles:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$08
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    pop bc
    call _set_bkg_tiles
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ld h, b
    ld l, c
    jp hl


_SetBankedWinTiles:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$08
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    pop bc
    call _set_win_tiles
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ld h, b
    ld l, c
    jp hl


_ReadBankedFarPtr:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$06
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ret


_ReadBankedUWORD:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$04
    ld a, [hl-]
    ldh [$90], a
    ld [$2000], a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ret


_MemcpyBanked:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$08
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    pop bc
    call _memcpy
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ld h, b
    ld l, c
    jp hl

_MemcpyVRAMBanked:
    ldh a, [$90]
    ld [$c519], a
    ld hl, sp+$08
    ld a, [hl]
    ldh [$90], a
    ld [$2000], a
    pop bc
    call Call_000_3705
    ld a, [$c519]
    ldh [$90], a
    ld [$2000], a
    ld h, b
    ld l, c
    jp hl

_IndexOfFarPtr:
    add sp, -$0b
    ld hl, sp+$03
    ld [hl], $00
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$04
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a

jr_000_1383:
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$08
    sub [hl]
    jr z, jr_000_13eb

    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0f
    ld a, [hl]
    push af
    inc sp
    push bc
    push de
    call _ReadBankedFarPtr
    add sp, $05
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld e, [hl]
    inc hl
    ld d, [hl]
    push af
    ld a, [de]
    ld c, a
    pop af
    sub c
    jr nz, jr_000_13cf

    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    ld a, [hl+]
    ld h, [hl]
    sub c
    jr nz, jr_000_13cf

    ld a, h
    sub b
    jr nz, jr_000_13cf

    ld hl, sp+$03
    ld e, [hl]
    jr jr_000_13ee

jr_000_13cf:
    ld hl, sp+$08
    inc [hl]
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl], a
    jr jr_000_1383

jr_000_13eb:
    ld hl, sp+$10
    ld e, [hl]

jr_000_13ee:
    add sp, $0b
    ret