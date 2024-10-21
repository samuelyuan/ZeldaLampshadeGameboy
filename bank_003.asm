SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

_load_init:
    ld hl, _ACTORS_LEN
    ld [hl], $00
    ld hl, _PLAYER_SPRITE_LEN
    ld [hl], $00
    ld hl, _SCENE_STACK_PTR
    ld [hl], $3e
    inc hl
    ld [hl], $c5
    ret


    ld a, [bc]
    ld [c], a
    ld b, l

_load_bkg_tileset:
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
    call _ReadBankedUWORD
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
    call _SetBankedBkgData
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
    call _SetBankedBkgData
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
    call _SetBankedBkgData
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
    call _SetBankedBkgData
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
    call _SetBankedBkgData
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
    call _SetBankedSpriteData
    add sp, $05

Jump_003_40ed:
jr_003_40ed:
    inc sp
    ret

_load_background:
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
    call _MemcpyBanked
    add sp, $07
    pop bc
    ld hl, $0008
    add hl, bc
    ld a, [hl]
    ld [_image_bank], a
    ld hl, $0009
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld hl, _image_ptr
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $000b
    add hl, bc
    ld a, [hl]
    ld [_IMAGE_ATTR_BANK], a
    ld hl, $000c
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld hl, _IMAGE_ATTR_PTR
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [bc]
    ld [_image_tile_width], a
    ld e, c
    ld d, b
    inc de
    ld a, [de]
    ld [_image_tile_height], a
    ld hl, _image_tile_width
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
    ld [_SCROLL_X_MAX], a
    ld a, [$c535]
    adc $ff
    ld [_SCROLL_X_MAX + 1], a
    ld hl, _image_tile_height
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld e, l
    ld d, h
    ld hl, _IMAGE_HEIGHT
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [_IMAGE_HEIGHT]
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

_load_sprite:
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
    call _ReadBankedFarPtr
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
    call _ReadBankedUWORD
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
    call _SetBankedSpriteData
    add sp, $05
    pop de

jr_003_4209:
    add sp, $05
    ret

_load_bounds:
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
    call _MemcpyBanked
    add sp, $07
    ret

_do_load_palette:
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
    call _ReadBankedUWORD
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
    call _MemcpyBanked
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

_load_scene:
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
    call _MemcpyBanked
    add sp, $07
    pop bc
    ld de, _CURRENT_SCENE
    ld hl, sp+$5d
    ld a, [hl]
    ld [de], a
    ld hl, _CURRENT_SCENE + 1
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
    ld [_SCENE_TYPE], a
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
    ld hl, _ACTORS_LEN
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
    ld [_TRIGGERS_LEN], a
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
    ld [_PROJECTILES_LEN], a
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
    ld [_SPRITES_LEN], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000e
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld [_COLLISION_BANK], a
    ld hl, sp+$40
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000f
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld hl, _COLLISION_PTR
    ld [hl], c
    inc hl
    ld [hl], a
    ld e, $01
    ld hl, _ui_load_tiles ; bank 1
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
    ld hl, _load_background ; bank 3
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
    ld hl, _do_load_palette ; bank 3
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
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    ld [_DMG_palette], a
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
    ld de, _SprPalette
    push de
    ld e, $03
    ld hl, _do_load_palette ; bank 3
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
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$53
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$53
    ld a, [hl]
    ld [_DMG_palette + 1], a
    ld bc, _DMG_palette + 2
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
    ld de, _PARALLAX_ROWS
    push de
    call _memset1
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

    ld a, [_SCENE_TYPE]
    sub $05
    ld a, $02
    jr z, jr_003_44a8

    xor a

jr_003_44a8:
    ld [_scene_LCD_type], a
    jr jr_003_44b2

jr_003_44ad:
    ld hl, _scene_LCD_type
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
    call _memset1
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
    ld hl, _load_sprite ; bank 3
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
    ld hl, _load_bounds
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
    call _memset1
    add sp, $06
    ld de, $0010
    push de
    ld de, $0000
    push de
    ld de, $c0cb
    push de
    call _memset2
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
    ld a, [_SPRITES_LEN]
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
    call _ReadBankedFarPtr
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
    ld hl, _load_sprite
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
    call _memset1
    add sp, $06
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    xor a
    ld hl, _ACTORS_ACTIVE_HEAD
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _ACTORS_INACTIVE_HEAD
    ld [hl+], a
    ld [hl], a
    ld hl, _ACTORS
    res 0, [hl]
    ld hl, _ACTORS_ACTIVE_TAIL
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
    ld hl, _ACTORS_ACTIVE_TAIL
    ld a, [hl+]
    ld b, [hl]
    add $30
    ld c, a
    jr nc, jr_003_46e0

    inc b

jr_003_46e0:
    ld hl, _ACTORS_INACTIVE_HEAD
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
    ld hl, _ACTORS_ACTIVE_TAIL
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_003_4712:
    ld a, [_ACTORS_ACTIVE_TAIL]
    ld [_ACTORS_INACTIVE_HEAD], a
    ld a, [_ACTORS_ACTIVE_TAIL + 1]
    ld [_ACTORS_INACTIVE_HEAD + 1], a
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _activate_actor ; bank 1
    call RST_08
    pop hl
    ld a, [_ACTORS_LEN]
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
    ld hl, _ACTORS_LEN
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
    call _MemcpyBanked
    add sp, $07
    ld a, [_ACTORS_LEN]
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
    call _MemcpyBanked
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
    ld a, [_ACTORS_ACTIVE_HEAD]
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
    call _MemcpyBanked
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

_load_player:
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

load_emote:
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
    call _SetBankedSpriteData
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
    call _memset1
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

GraveyardTileImage::
    db $8c, $00
    INCBIN "gfx/bank003_graveyard_5031.2bpp" ; sprite sheet

LampshadeBossRoomTileImage::
    db $ba, $00
    INCBIN "gfx/bank003_lampshadeboss_58f3.2bpp" ; sprite sheet for lampshade boss

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

    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f

    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f

    db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f

    db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f

    db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f

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

    db $ca

    INCBIN "gfx/bank003_font_6593.2bpp" ; font

    ; 0x7243
    ld bc, $93ff
    ld h, h
    nop
    nop
    sub e
    ld h, l

ExplorationMusicStart:: ; 0x724b
    db $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19
    db $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19, $d0, $19
    db $0c, $1b, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $1e, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1f, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $27, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $28, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $2a, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $2b, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $0c, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $0c, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $13, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $13, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $18, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $18, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $16, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $16, $20, $00, $5a, $00, $00, $5a, $00
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
    db $00, $24, $b0, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $2d, $b0, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $24, $b0, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $2d, $b0, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $14, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $15, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1d, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $20, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $28, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $29, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $05, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $05, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $0c, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $0c, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $11, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $11, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $0f, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $0f, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $23, $10, $00, $5a, $00, $00, $5a, $00, $00, $23, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $23, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $23, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $23, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $23, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $23, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $23, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1f, $20, $00, $5a, $00, $00, $5a, $00, $00, $1f, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1f, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $1f, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1d, $20, $00, $5a, $00, $00, $5a, $00, $00, $1d, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1d, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $1d, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1c, $20, $00, $5a, $00, $00, $5a, $00, $00, $1a, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1c, $20, $00, $1d, $20, $00, $5a, $00
    db $00, $1a, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $13, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
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
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $12, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $21, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $21, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1b, $20, $00, $5a, $00, $00, $5a, $00, $00, $1b, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1b, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $1b, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1a, $20, $00, $5a, $00, $00, $5a, $00, $00, $18, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $15, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $1b, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1a, $20, $00, $5a, $00, $00, $5a, $00, $00, $18, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1a, $20, $00, $1b, $20, $00, $5a, $00
    db $00, $18, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $11, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $0f, $10, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $0e, $10, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1c, $10, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1c, $10, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $1a, $20, $00, $5a, $00, $00, $5a, $00, $00, $18, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $15, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $15, $20, $00, $5a, $00, $00, $5a, $00, $00, $16, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $17, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $18, $20, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
    db $19, $20, $00, $5a, $00, $00, $5a, $00, $00, $1a, $20, $00, $5a, $00, $00, $5a
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $1b, $20, $00, $5a, $00, $00, $5a, $00
    db $00, $0c, $10, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00
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
    db $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $5a, $00, $00, $00, $20
    db $00, $6c, $72, $6c, $75, $6c, $72, $ec, $76, $2c, $79, $6c, $7b, $2c, $73, $2c
    db $76, $2c, $73, $ac, $77, $ec, $79, $2c, $7c, $ec, $73, $ec, $73, $ec, $73, $6c
    db $78, $ac, $7a, $ec, $7c, $ac, $74, $ac, $74, $ac, $74, $ac, $74, $ac, $74, $ac
    db $74, $00, $00, $b5, $80, $00, $80, $96, $80, $00, $00, $09, $c0, $00, $30, $b0
    db $c0, $00, $70, $b0, $c0, $00, $b0, $b0, $c0, $00, $00, $b0, $80, $00, $40, $b0
    db $80, $00, $80, $b0, $80, $00, $c0, $b0, $80, $1c, $80, $b2, $c0, $19, $80, $b5
    db $80, $47, $00, $b7, $80, $15, $60, $b7, $c0, $00, $80, $00, $80, $00, $40, $01
    db $80, $80, $20, $00, $c0, $80, $20, $03, $c0, $80, $20, $04, $c0, $80, $20, $05
    db $c0, $80, $20, $06, $c0, $00, $20, $07, $80, $00, $20, $08, $80, $00, $20, $09
    db $80, $00, $20, $0a, $80, $00, $20, $0b, $80, $00, $20, $0c, $80, $00, $20, $0d
    db $80, $00, $20, $0e, $80, $00, $20, $0f, $80, $91, $00, $ff, $00, $00, $00, $00
    db $00, $b1, $00, $03, $08, $0c, $16, $1b, $1f, $91, $00, $1c, $1c, $1c, $1c, $1c
    db $1c, $92, $00, $20, $20, $20, $20, $20, $20, $94, $00, $18, $18, $18, $18, $18
    db $18, $94, $00, $10, $10, $10, $10, $10, $10, $b1, $00, $18, $18, $18, $18, $18
    db $18, $b1, $80, $18, $18, $18, $18, $18, $18, $b1, $80, $10, $0f, $0f, $0f, $0f
    db $0f, $91, $80, $20, $20, $20, $20, $20, $20, $92, $40, $00, $00, $00, $00, $00
    db $00, $b3, $00, $1b, $0e, $11, $fe, $00, $00, $b7, $00, $0d, $0b, $09, $07, $07
    db $07, $b7, $80, $08, $07, $06, $05, $04, $04, $00, $00, $00, $00, $00, $00, $00
    db $00, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88
    db $88, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00
    db $00, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $cc, $33, $33, $33, $33, $33, $33, $33
    db $33, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $55, $55, $55, $55, $55, $55, $55
    db $55, $88, $88, $88, $88, $88, $88, $88, $88, $77, $77, $77, $77, $77, $77, $77
    db $77, $ff, $ff, $cc, $cc, $ff, $ff, $cc, $cc, $00, $00, $33, $33, $00, $00, $33
    db $33, $fe, $dc, $ba, $98, $76, $54, $32, $10, $01, $23, $45, $67, $89, $ab, $cd
    db $ef, $ff, $ff, $ba, $98, $a9, $87, $32, $10, $34, $56, $45, $67, $bc, $de, $cd
    db $ef, $ff, $ee, $dd, $cc, $bb, $aa, $99, $88, $77, $66, $55, $44, $33, $22, $11
    db $00, $ff, $fe, $fd, $fc, $fb, $fa, $f9, $f8, $e7, $d6, $c5, $b4, $a3, $92, $81
    db $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00

ExplorationMusicRef:: ; 0x7fcc
    db $04, $6b, $72, $ac, $7d, $b8, $7d, $c4, $7d, $d0, $7d, $dc, $7d, $18, $7e, $54
    db $7e, $4b, $72, $cc, $7e

bank003_7fe1:
    db $25, $12, $04, $61, $14, $00, $00, $ff, $fc, $31, $ff, $fc, $14, $00, $01, $ff
    db $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $00
