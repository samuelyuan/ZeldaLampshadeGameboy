SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    INCLUDE "src/engine/events.asm"

    INCLUDE "src/engine/scroll.asm"

    INCLUDE "src/engine/vm_ui.asm"

OutsideShopTileImage::
    db $72, $00
    INCBIN "gfx/bank005_outsideshop_4d6b.2bpp"

BridgeTileImage::
    db $79, $00
    INCBIN "gfx/bank005_bridge_548d.2bpp"

RoomBeforeLampshadeBossTileImage::
    db $75, $00
    INCBIN "gfx/bank005_roombeforelampshadeboss_5c1f.2bpp"

TempleLightOutsideTileImage::
    db $74, $00
    INCBIN "gfx/bank005_templelightoutside_6371.2bpp"

_func_bank005_6ab1:
    ld hl, _camera_offset_x
    ld [hl], $00
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _camera_deadzone_x
    ld [hl], $08
    ld hl, _camera_deadzone_y
    ld [hl], $08
    ret

_func_bank005_6ac6:
    add sp, -$11
    ld hl, sp+$04
    xor a
    ld [hl+], a
    ld [hl], $04
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ld hl, _RECENT_JOY
    ld e, [hl]
    ld hl, _FRAME_JOY
    ld d, [hl]
    ld a, d
    and $02
    ld c, a
    ld b, $00
    ld a, d
    and $01
    ld hl, sp+$0b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    and $04
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    and $08
    ld [hl+], a
    ld [hl], $00
    bit 1, e
    jr nz, jr_005_6b03

    ld a, [_RECENT_JOY]
    or a
    jr nz, jr_005_6b09

    ld a, b
    or c
    jr z, jr_005_6b09

jr_005_6b03:
    ld hl, sp+$05
    ld [hl], $03
    jr jr_005_6b49

jr_005_6b09:
    bit 0, e
    jr nz, jr_005_6b19

    ld a, [_RECENT_JOY]
    or a
    jr nz, jr_005_6b1f

    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b1f

jr_005_6b19:
    ld hl, sp+$05
    ld [hl], $01
    jr jr_005_6b49

jr_005_6b1f:
    bit 2, e
    jr nz, jr_005_6b2f

    ld a, [_RECENT_JOY]
    or a
    jr nz, jr_005_6b35

    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b35

jr_005_6b2f:
    ld hl, sp+$05
    ld [hl], $02
    jr jr_005_6b49

jr_005_6b35:
    bit 3, e
    jr nz, jr_005_6b45

    ld a, [_RECENT_JOY]
    or a
    jr nz, jr_005_6b49

    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b49

jr_005_6b45:
    ld hl, sp+$05
    ld [hl], $00

jr_005_6b49:
    ld a, b
    or c
    jr z, jr_005_6b70

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b5e

    ld hl, sp+$04
    ld [hl], $e0
    jr jr_005_6bb9

jr_005_6b5e:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b6a

    ld hl, sp+$04
    ld [hl], $a0
    jr jr_005_6bb9

jr_005_6b6a:
    ld hl, sp+$04
    ld [hl], $c0
    jr jr_005_6bb9

jr_005_6b70:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b99

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b87

    ld hl, sp+$04
    ld [hl], $20
    jr jr_005_6bb9

jr_005_6b87:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6b93

    ld hl, sp+$04
    ld [hl], $60
    jr jr_005_6bb9

jr_005_6b93:
    ld hl, sp+$04
    ld [hl], $40
    jr jr_005_6bb9

jr_005_6b99:
    ld hl, sp+$0e
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6baa

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld hl, sp+$04
    ld [hl], $00
    jr jr_005_6bb9

jr_005_6baa:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr z, jr_005_6bb9

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld hl, sp+$04
    ld [hl], $80

jr_005_6bb9:
    ld a, [_PLAYER_MOVING]
    or a
    jp z, Jump_005_7115

    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], d
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$06
    ld [hl+], a
    ld a, d
    ld [hl-], a
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
    ld hl, $c0bc
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
    ld a, [$c0c8]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$10
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $18c4
    ld hl, sp+$04
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$0a
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0e
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
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
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
    ld a, [de]
    ld hl, sp+$0d
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl]
    add $40
    ld c, a
    ld hl, $18c4
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld hl, sp+$0a
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    ld hl, sp+$0b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0c
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
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld c, e
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c0bc
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
    ld a, [$c0c1]
    ld hl, sp+$0f
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld hl, sp+$0a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$10
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
    ld hl, sp+$11
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$10
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld [hl], c
    ld a, [$c0c2]
    ld hl, sp+$0f
    ld [hl], a
    ld a, [hl-]
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
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, c
    inc a
    ld [hl], a
    ld hl, sp+$06
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
    ld hl, sp+$0c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$04
    ld a, [hl]
    sub $80
    jp nc, Jump_005_6e99

    ld a, [$c0c0]
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
    ld hl, sp+$0f
    ld [hl], c

Jump_005_6dc6:
    ld hl, sp+$0e
    ld a, [hl+]
    inc hl
    sub [hl]
    jp z, Jump_005_6e50

    ld hl, sp+$0f
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_6e16

    ld hl, sp+$10
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_6e16

    ld hl, _COLLISION_BANK
    ld b, [hl]
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$10
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
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$0f
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_6e18

jr_005_6e16:
    ld e, $0f

jr_005_6e18:
    bit 2, e
    jr z, jr_005_6e4a

    ld hl, sp+$0f
    ld a, [hl]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, $c0c0
    ld l, [hl]
    push af
    ld a, l
    rlca
    sbc a
    ld h, a
    pop af
    sub l
    ld l, a
    ld a, c
    sbc h
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_6e50

jr_005_6e4a:
    ld hl, sp+$10
    inc [hl]
    jp Jump_005_6dc6


Jump_005_6e50:
jr_005_6e50:
    ld bc, $c0ba
    ld hl, $c534
    ld a, [hl+]
    add $f0
    ld e, a
    ld a, [hl]
    adc $ff
    ld d, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr c, jr_005_6e91

    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_005_6e91:
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jp Jump_005_6f51


Jump_005_6e99:
    ld a, [$c0bf]
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
    ld hl, sp+$10
    ld b, [hl]

jr_005_6eb7:
    ld hl, sp+$0e
    ld a, [hl]
    sub b
    jr z, jr_005_6f30

    ld a, c
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_6f00

    ld a, b
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_6f00

    ld a, [_COLLISION_BANK]
    ld hl, sp+$10
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld l, b
    ld h, $00
    push bc
    push de
    push hl
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld l, c
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$10
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_6f02

jr_005_6f00:
    ld e, $0f

jr_005_6f02:
    bit 3, e
    jr z, jr_005_6f2d

    ld l, c
    ld h, $00
    inc hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0bf]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    inc hl
    ld c, l
    ld b, h
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_6f30

jr_005_6f2d:
    inc b
    jr jr_005_6eb7

jr_005_6f30:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld hl, sp+$0f
    ld [hl], c
    inc hl
    ld [hl], a
    bit 7, [hl]
    jr z, jr_005_6f46

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a

jr_005_6f46:
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_6f51:
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
    ld a, [$c0bf]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$10
    ld [hl], e
    ld a, [$c0c0]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    inc a
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$08
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
    ld a, $40
    ld hl, sp+$04
    sub [hl]
    jp nc, Jump_005_7076

    ld a, [hl]
    sub $c0
    jp nc, Jump_005_7076

    ld a, [$c0c2]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$0e
    ld [hl], c

Jump_005_6fda:
    ld hl, sp+$0f
    ld a, [hl+]
    sub [hl]
    jp z, Jump_005_7063

    ld hl, sp+$10
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_702a

    ld hl, sp+$0e
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_702a

    ld hl, _COLLISION_BANK
    ld b, [hl]
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$0e
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
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$10
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    jr jr_005_702c

jr_005_702a:
    ld a, $0f

jr_005_702c:
    rrca
    jr nc, jr_005_705d

    ld hl, sp+$0e
    ld a, [hl]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, $c0c2
    ld l, [hl]
    push af
    ld a, l
    rlca
    sbc a
    ld h, a
    pop af
    sub l
    ld l, a
    ld a, c
    sbc h
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7063

jr_005_705d:
    ld hl, sp+$10
    inc [hl]
    jp Jump_005_6fda


Jump_005_7063:
jr_005_7063:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_005_7115


Jump_005_7076:
    ld a, [$c0c1]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld c, l

jr_005_708b:
    ld hl, sp+$0f
    ld a, [hl+]
    sub [hl]
    jr z, jr_005_7105

    ld hl, sp+$10
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_70d3

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_70d3

    ld hl, _COLLISION_BANK
    ld b, [hl]
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld l, c
    ld h, $00
    push bc
    push de
    push hl
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$10
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_70d5

jr_005_70d3:
    ld e, $0f

jr_005_70d5:
    bit 1, e
    jr z, jr_005_7100

    inc c
    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0c1]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    inc hl
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7105

jr_005_7100:
    ld hl, sp+$10
    inc [hl]
    jr jr_005_708b

jr_005_7105:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_7115:
    ld hl, sp+$05
    ld a, [hl]
    sub $04
    jr z, jr_005_7136

    ld a, [_PLAYER_MOVING]
    push af
    inc sp
    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, _actor_set_dir
    call RST_08
    add sp, $04
    jr jr_005_7143

jr_005_7136:
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl

jr_005_7143:
    ld de, $0000
    ld a, [_GAME_TIME]
    and $01
    ld b, a
    ld c, $00
    ld a, b
    dec a
    or c
    jr nz, jr_005_718a

    xor a
    push af
    inc sp
    ld de, $c0ba
    push de
    ld de, $c0bf
    push de
    ld e, $06
    ld hl, _trigger_activate_at_intersection
    call RST_08
    add sp, $05
    ld a, e
    or a
    jr nz, jr_005_71da

    xor a
    push af
    inc sp
    ld e, $01
    ld hl, _actor_overlapping_player
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_005_718a

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_718a

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_005_718a:
    ld a, [_FRAME_JOY]
    bit 4, a
    jr z, jr_005_71da

    ld a, [_LAST_JOY]
    bit 4, a
    jr nz, jr_005_71da

    ld a, d
    or e
    jr nz, jr_005_71a9

    ld hl, $0108
    push hl
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl

jr_005_71a9:
    ld a, d
    or e
    jr z, jr_005_71da

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_005_71da

    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_71da

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld de, $0000
    push de
    ld h, $01
    push hl
    inc sp
    ld de, $0000
    push de
    push bc
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08

jr_005_71da:
    add sp, $11
    ret


    ld hl, _camera_offset_x
    ld [hl], $00
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _camera_deadzone_x
    ld [hl], $00
    ld hl, _camera_deadzone_y
    ld [hl], $00
    ld a, [$c0be]
    ld [$d9bd], a
    sub $03
    jr nz, jr_005_7209

    ld hl, _camera_offset_x
    ld [hl], $30
    ld hl, $d9bb
    xor a
    ld [hl+], a
    ld [hl], $08
    jr jr_005_7273

jr_005_7209:
    ld a, [$d9bd]
    dec a
    jr nz, jr_005_7237

    ld hl, _camera_offset_x
    ld [hl], $c0
    ld hl, $c534
    ld a, [hl+]
    add $70
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $d9bb
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7273

jr_005_7237:
    ld a, [$d9bd]
    sub $02
    jr nz, jr_005_724d

    ld hl, _camera_offset_y
    ld [hl], $30
    ld hl, $d9bb
    ld a, $80
    ld [hl+], a
    ld [hl], $07
    jr jr_005_7273

jr_005_724d:
    ld hl, _camera_offset_y
    ld [hl], $d0
    ld hl, $c536
    ld a, [hl+]
    add $88
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $d9bb
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_005_7273:
    ld hl, $d9ba
    ld [hl], $00
    ret


    add sp, -$0d
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ld hl, $d9bd
    ld b, [hl]
    ld a, [_FRAME_JOY]
    bit 0, b
    jr z, jr_005_72a5

    bit 2, a
    jr z, jr_005_7298

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld b, $02
    jr jr_005_72bb

jr_005_7298:
    bit 3, a
    jr z, jr_005_72bb

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld b, $00
    jr jr_005_72bb

jr_005_72a5:
    bit 1, a
    jr z, jr_005_72b2

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld b, $03
    jr jr_005_72bb

jr_005_72b2:
    rrca
    jr nc, jr_005_72bb

    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld b, [hl]

jr_005_72bb:
    ld a, [$c0be]
    sub b
    jr z, jr_005_72d6

    ld a, [_PLAYER_MOVING]
    push af
    inc sp
    push bc
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04

jr_005_72d6:
    ld a, [_PLAYER_MOVING]
    or a
    jp z, Jump_005_7764

    ld hl, sp+$04
    ld a, l
    ld d, h
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], d
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$04
    ld a, l
    ld d, h
    ld hl, sp+$02
    ld [hl+], a
    ld a, d
    ld [hl-], a
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
    ld hl, $c0bc
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
    ld a, [$c0c8]
    ld hl, sp+$0a
    ld [hl], a
    ld a, [$c0be]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$01
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld hl, $19c4
    add hl, de
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    push bc
    ld hl, sp+$0c
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$0b
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
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    pop de
    push de
    inc de
    ld a, [de]
    push bc
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld hl, sp+$0b
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
    ld hl, $d9bd
    ld c, [hl]
    ld a, [$c0be]
    ld hl, sp+$0b
    ld [hl], a
    bit 0, c
    jp z, Jump_005_756b

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
    ld a, [$c0bf]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$0c
    ld [hl], e
    ld a, [$c0c0]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    inc a
    ld hl, sp+$0a
    ld [hl-], a
    dec hl
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
    ld hl, sp+$02
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0b
    ld a, [hl]
    or a
    jp nz, Jump_005_74c1

    ld a, [$c0c2]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$02
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
    ld hl, sp+$0b
    ld [hl], c

Jump_005_7424:
    ld hl, sp+$0a
    ld a, [hl+]
    inc hl
    sub [hl]
    jp z, Jump_005_74ae

    ld hl, sp+$0c
    ld a, [hl]
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7475

    ld hl, sp+$0b
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7475

    ld hl, _COLLISION_BANK
    ld b, [hl]
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$0b
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
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    jr jr_005_7477

jr_005_7475:
    ld a, $0f

jr_005_7477:
    rrca
    jr nc, jr_005_74a8

    ld hl, sp+$0b
    ld a, [hl]
    ld c, $00
    add a
    rl c
    add a
    rl c
    add a
    rl c
    ld hl, $c0c2
    ld l, [hl]
    push af
    ld a, l
    rlca
    sbc a
    ld h, a
    pop af
    sub l
    ld l, a
    ld a, c
    sbc h
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_74ae

jr_005_74a8:
    ld hl, sp+$0c
    inc [hl]
    jp Jump_005_7424


Jump_005_74ae:
jr_005_74ae:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_005_7764


Jump_005_74c1:
    ld a, [$c0c1]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$02
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
    ld hl, sp+$0c
    ld b, [hl]

jr_005_74df:
    ld hl, sp+$0a
    ld a, [hl]
    sub b
    jr z, jr_005_7558

    ld a, b
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7528

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7528

    ld a, [_COLLISION_BANK]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, _image_tile_width
    ld l, [hl]
    ld h, $00
    ld e, c
    ld d, $00
    push bc
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld l, b
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_752a

jr_005_7528:
    ld e, $0f

jr_005_752a:
    bit 1, e
    jr z, jr_005_7555

    inc c
    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0c1]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    inc hl
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7558

jr_005_7555:
    inc b
    jr jr_005_74df

jr_005_7558:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_005_7764


Jump_005_756b:
    ld hl, $c0bc
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
    ld a, [$c0c1]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$0a
    ld [hl], e
    ld a, [$c0c2]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    inc a
    ld hl, sp+$0c
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
    ld hl, sp+$0b
    ld a, [hl]
    dec a
    jp nz, Jump_005_76b6

    ld a, [$c0c0]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c
    ld hl, sp+$0a
    ld b, [hl]

jr_005_75ec:
    ld hl, sp+$0c
    ld a, [hl]
    sub b
    jr z, jr_005_7664

    ld a, c
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7635

    ld a, b
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7635

    ld a, [_COLLISION_BANK]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, _image_tile_width
    ld l, [hl]
    ld h, $00
    ld e, b
    ld d, $00
    push bc
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld l, c
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_7637

jr_005_7635:
    ld e, $0f

jr_005_7637:
    bit 2, e
    jr z, jr_005_7661

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    sub e
    ld l, a
    ld a, b
    sbc d
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    dec bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7664

jr_005_7661:
    inc b
    jr jr_005_75ec

jr_005_7664:
    ld hl, $c534
    ld a, [hl+]
    add $f0
    ld c, a
    ld a, [hl]
    adc $ff
    ld b, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_005_76a9

    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a

jr_005_76a9:
    ld de, $c0ba
    ld hl, sp+$0b
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jp Jump_005_7764


Jump_005_76b6:
    ld a, [$c0bf]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    srl h
    rr c
    srl h
    rr c
    srl h
    rr c
    ld hl, sp+$0a
    ld b, [hl]

jr_005_76ce:
    ld hl, sp+$0c
    ld a, [hl]
    sub b
    jr z, jr_005_7747

    ld a, c
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7717

    ld a, b
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7717

    ld a, [_COLLISION_BANK]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld l, b
    ld h, $00
    push bc
    push de
    push hl
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, _COLLISION_PTR
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld l, c
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_7719

jr_005_7717:
    ld e, $0f

jr_005_7719:
    bit 3, e
    jr z, jr_005_7744

    ld h, $00
    ld l, c
    inc hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld a, [$c0bf]
    ld l, a
    rlca
    sbc a
    ld e, a
    ld a, c
    sub l
    ld l, a
    ld a, b
    sbc e
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    inc hl
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_7747

jr_005_7744:
    inc b
    jr jr_005_76ce

jr_005_7747:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    bit 7, b
    jr z, jr_005_775a

    ld de, $0000
    jr jr_005_775c

jr_005_775a:
    ld e, c
    ld d, b

jr_005_775c:
    ld c, e
    ld b, d
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_7764:
    ld a, [$d9ba]
    or a
    jp nz, Jump_005_785e

    ld hl, $da34
    ld b, [hl]
    ld hl, $d9bd
    ld c, [hl]
    ld hl, sp+$09
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld de, $c0ba
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld l, c
    ld h, $00
    add hl, hl
    ld de, $19c4
    add hl, de
    ld a, [hl]
    push bc
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0a
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld hl, $19c5
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    push bc
    ld hl, sp+$0b
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $d9bb
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [$d9bd]
    dec a
    jr nz, jr_005_77f6

    ld hl, $c0bb
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_005_77f6

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_785e

jr_005_77f6:
    ld a, [$d9bd]
    sub $03
    jr nz, jr_005_781a

    ld hl, $c0bb
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr nc, jr_005_781a

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_785e

jr_005_781a:
    ld a, [$d9bd]
    or a
    jr nz, jr_005_783c

    ld hl, $c0bd
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_005_783c

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_005_785e

jr_005_783c:
    ld a, [$d9bd]
    sub $02
    jr nz, jr_005_785e

    ld hl, $c0bd
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, $d9bb
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr nc, jr_005_785e

    ld hl, $d9ba
    ld [hl], $01
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_785e:
jr_005_785e:
    ld a, [_GAME_TIME]
    and $01
    ld b, a
    ld c, $00
    ld a, b
    dec a
    or c
    jp nz, Jump_005_78f5

    xor a
    push af
    inc sp
    ld de, $c0ba
    push de
    ld de, $c0bf
    push de
    ld e, $06
    ld hl, _trigger_activate_at_intersection
    call RST_08
    add sp, $05
    ld a, e
    or a
    jr nz, jr_005_78f5

    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_005_78a5

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_78a5

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_005_78f5

jr_005_78a5:
    ld a, [_FRAME_JOY]
    bit 4, a
    jr z, jr_005_78f5

    ld a, [_LAST_JOY]
    bit 4, a
    jr nz, jr_005_78f5

    ld a, d
    or e
    jr nz, jr_005_78c4

    ld hl, $0108
    push hl
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl

jr_005_78c4:
    ld a, d
    or e
    jr z, jr_005_78f5

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_005_78f5

    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_78f5

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld de, $0000
    push de
    ld h, $01
    push hl
    inc sp
    ld de, $0000
    push de
    push bc
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08

Jump_005_78f5:
jr_005_78f5:
    add sp, $0d
    ret

    INCLUDE "src/engine/topdown.asm"

    db $ff
