; Loaded in bank 3 0x4000

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
    ld [_SCROLL_Y_MAX], a
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
    ld hl, _load_bkg_tileset
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
    call _memcpy
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
    ld hl, _projectiles_init
    call RST_08
    ld a, [_SCENE_TYPE]
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
    call _memcpy
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
    call _load_animations
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
    call _memcpy
    add sp, $06
    ld de, $0010
    push de
    ld de, $0000
    push de
    ld de, $c0cb
    push de
    call _memset
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
    ld a, [_SPRITES_LEN]
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
    call _memcpy
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
    ld hl, _load_sprite
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
    ld hl, _SPRITES_LEN
    ld h, [hl]
    ld l, b
    push hl
    ld b, a
    push bc
    call _IndexOfFarPtr
    add sp, $06
    ld a, e
    ld hl, _SPRITES_LEN
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
    call _load_animations
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
    ld a, [_SPRITES_LEN]
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
    call _IndexOfFarPtr
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
    ld hl, _SPRITES_LEN
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
    ld hl, _script_execute
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

_load_emote:
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