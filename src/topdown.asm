
_topdown_init:
    ; camera_offset_x = 0
    ld hl, _camera_offset_x
    ld [hl], $00
    ; camera_offset_y = 0
    ld hl, _camera_offset_y
    ld [hl], $00
    ; camera_deadzone_x = 0
    ld hl, _camera_deadzone_x
    ld [hl], $00
    ; camera_deadzone_y = 0
    ld hl, _camera_deadzone_y
    ld [hl], $00
    ; if (topdown_grid == 16) {
    ld a, [_TOPDOWN_GRID]
    sub $10
    jr nz, jr_005_7932

    ; PLAYER.pos.x = ((PLAYER.pos.x >> 8) << 8)
    ld hl, _ACTORS + 1
    ld a, [hl+]
    ld b, [hl]
    xor a
    ld hl, _ACTORS + 1
    ld [hl+], a
    ld [hl], b

    ; PLAYER.pos.y = ((PLAYER.pos.y >> 8) << 8) + 128
    ld hl, _ACTORS + 3
    ld a, [hl+]
    ld b, [hl]
    ld c, $00
    ld hl, $0080
    add hl, bc
    ld c, l
    ld b, h
    ld hl, _ACTORS + 3
    ld a, c
    ld [hl+], a
    ld [hl], b
    ret

jr_005_7932:
    ; } else {
    ; PLAYER.pos.x = ((PLAYER.pos.x >> 7) << 7)
    ld hl, _ACTORS + 1
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
    xor a
    rr b
    ld b, c
    rr b
    rra
    ld hl, _ACTORS + 1
    ld [hl+], a
    ld [hl], b
    ; PLAYER.pos.x = ((PLAYER.pos.y >> 7) << 7)
    ld hl, _ACTORS + 3
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
    xor a
    rr b
    ld b, c
    rr b
    rra
    ld hl, _ACTORS + 3
    ld [hl+], a
    ld [hl], b
    ; }
    ret

_topdown_update:
    add sp, -$05
    ; new_dir = DIR_NONE;
    ld hl, sp+$00
    ld [hl], $04
    ; // Is player on an 8x8px tile?
    ; if ((topdown_grid == 16 && ON_16PX_GRID(PLAYER.pos)) ||
    ld a, [_TOPDOWN_GRID]
    sub $10
    jr nz, jr_005_79d9

    ld hl, _ACTORS + 1
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
    ld a, c
    and $0f
    jr nz, jr_005_79d9

    ld hl, _ACTORS + 3
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
    ld a, c
    and $0f
    ld c, a
    ld b, $00
    ld a, c
    sub $08
    or b
    jr z, jr_005_7a19

jr_005_79d9:
    ; (topdown_grid == 8 && ON_8PX_GRID(PLAYER.pos))) {
    ld a, [_TOPDOWN_GRID]
    sub $08
    jp nz, Jump_005_7f8c

    ld hl, _ACTORS + 1
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
    ld a, c
    and $07
    jp nz, Jump_005_7f8c

    ld hl, _ACTORS + 3
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
    ld a, c
    and $07
    jp nz, Jump_005_7f8c

jr_005_7a19:
    ; // Player landed on an tile
    ; // so stop movement for now
    ; player_moving = FALSE;
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ; // Check for trigger collisions
    ; if (trigger_activate_at_intersection(&PLAYER.bounds, &PLAYER.pos, FALSE)) {
    xor a
    push af
    inc sp
    ld de, _ACTORS + 1
    push de
    ld de, $c0bf
    push de
    ld e, $06
    ld hl, $4d2e ; jumps to bank 6: 0x4d2e
    call RST_08
    add sp, $05
    ld a, e
    or a
    ; return;
    jp nz, Jump_005_7ffc

    ; // Check input to set player movement
    ; if (INPUT_RECENT_LEFT) {
    ld a, [_RECENT_JOY]
    ld hl, sp+$04
    ld [hl], a

    push hl
    bit 1, [hl]
    pop hl
    jr nz, jr_005_7a55

    ld hl, _FRAME_JOY
    ld c, [hl]
    ld hl, _RECENT_JOY
    ld a, [hl]
    or a
    jp nz, Jump_005_7b4a

    bit 1, c
    jp z, Jump_005_7b4a

jr_005_7a55:
    ; player_moving = TRUE;
    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ; new_dir = DIR_LEFT;
    ld hl, sp+$00
    ld [hl], $03
    ; // Check for collisions to left of player
    ; tile_start = (((PLAYER.pos.y >> 4) + PLAYER.bounds.top)    >> 3);
    ld hl, _ACTORS + 3
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
    ld e, a
    rlca
    sbc a
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ; tile_end   = (((PLAYER.pos.y >> 4) + PLAYER.bounds.bottom) >> 3) + 1;
    ld a, [$c0c2]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$02
    ld [hl+], a
    ; UBYTE tile_x = ((PLAYER.pos.x >> 4) + PLAYER.bounds.left) >> 3;
    ld de, _ACTORS + 1
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
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
    ld a, [$c0bf]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
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
    ld hl, sp+$03
    ld [hl], e

jr_005_7aee:
    ; while (tile_start != tile_end) {
    ld hl, sp+$02
    ld a, [hl]
    sub c
    jp z, Jump_005_7e7b

    ; if (tile_at(tile_x - 1, tile_start) & COLLISION_RIGHT) {
    ld hl, sp+$03
    ld a, [hl+]
    dec a
    ld [hl], a
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7b39

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7b39

    ; return ReadBankedUBYTE(collision_ptr + (ty * (UINT16)image_tile_width) + tx, collision_bank);
    ld hl, _COLLISION_BANK
    ld b, [hl]
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
    ld hl, sp+$04
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ; return (UBYTE)ReadBankedUWORD(ptr, bank);
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ; return ReadBankedUBYTE(collision_ptr + (ty * (UINT16)image_tile_width) + tx, collision_bank);
    jr jr_005_7b3b

jr_005_7b39:
    ; return COLLISION_ALL;
    ld e, $0f

jr_005_7b3b:
    ; if (tile_at(tile_x - 1, tile_start) & COLLISION_RIGHT) {
    bit 3, e
    jr z, jr_005_7b47

    ; player_moving = FALSE;
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ; break;
    jp Jump_005_7e7b


jr_005_7b47:
    ; tile_start++;
    inc c
    jr jr_005_7aee

Jump_005_7b4a:
    ; } else if (INPUT_RECENT_RIGHT) {
    push hl
    ld hl, sp+$06
    bit 0, [hl]
    pop hl
    jr nz, jr_005_7b5f

    ld hl, _RECENT_JOY
    ld a, [hl]
    or a
    jp nz, Jump_005_7c54

    bit 0, c
    jp z, Jump_005_7c54

jr_005_7b5f:
    ; player_moving = TRUE;
    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ; new_dir = DIR_RIGHT;
    ld hl, sp+$00
    ld [hl], $01
    ; tile_start = (((PLAYER.pos.y >> 4) + PLAYER.bounds.top)    >> 3);
    ld hl, _ACTORS + 3
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
    ld e, a
    rlca
    sbc a
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ; tile_end   = (((PLAYER.pos.y >> 4) + PLAYER.bounds.bottom) >> 3) + 1;
    ld a, [$c0c2]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$02
    ld [hl+], a
    ; UBYTE tile_x = ((PLAYER.pos.x >> 4) + PLAYER.bounds.right) >> 3;
    ld de, _ACTORS + 1
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
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
    ld a, [$c0c0]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
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
    ; while (tile_start != tile_end) {
    ld hl, sp+$03
    ld [hl], e

jr_005_7bf8:
    ld hl, sp+$02
    ld a, [hl]
    sub c
    jp z, Jump_005_7e7b

    ; if (tile_at(tile_x + 1, tile_start) & COLLISION_LEFT) {
    ld hl, sp+$03
    ld a, [hl+]
    inc a
    ; if ((tx < image_tile_width) && (ty < image_tile_height)) 
    ld [hl], a
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7c43

    ld a, c
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7c43

    ; return ReadBankedUBYTE(collision_ptr + (ty * (UINT16)image_tile_width) + tx, collision_bank);
    ld hl, _COLLISION_BANK
    ld b, [hl]
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
    ld hl, sp+$04
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
    jr jr_005_7c45

jr_005_7c43:
    ld e, $0f

jr_005_7c45:
    bit 2, e
    jr z, jr_005_7c51

    ld hl, _PLAYER_MOVING
    ld [hl], $00
    jp Jump_005_7e7b


jr_005_7c51:
    inc c
    jr jr_005_7bf8

Jump_005_7c54:
    ; } else if (INPUT_RECENT_UP) {
    push hl
    ld hl, sp+$06
    bit 2, [hl]
    pop hl
    jr nz, jr_005_7c69

    ld hl, _RECENT_JOY
    ld a, [hl]
    or a
    jp nz, Jump_005_7d69

    bit 2, c
    jp z, Jump_005_7d69

jr_005_7c69:
    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld hl, sp+$00
    ld [hl], $02
    ld hl, _ACTORS + 1
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
    ld e, a
    rlca
    sbc a
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
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
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$01
    ld [hl+], a
    inc hl
    ld de, _ACTORS + 3
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
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
    ld a, [$c0c1]
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
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
    ld hl, sp+$02
    ld [hl], e

jr_005_7d03:
    ld hl, sp+$01
    ld a, [hl]
    sub c
    jp z, Jump_005_7e7b

    ld hl, sp+$02
    ld a, [hl+]
    dec a
    ld [hl], a
    ld a, c
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7d58

    ld hl, sp+$03
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7d58

    ld a, [_COLLISION_BANK]
    ld hl, sp+$04
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$03
    ld a, [hl]
    ld b, $00
    push bc
    push de
    ld e, a
    ld d, b
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
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    jr jr_005_7d5a

jr_005_7d58:
    ld e, $0f

jr_005_7d5a:
    bit 1, e
    jr z, jr_005_7d66

    ld hl, _PLAYER_MOVING
    ld [hl], $00
    jp Jump_005_7e7b


jr_005_7d66:
    inc c
    jr jr_005_7d03

Jump_005_7d69:
    ; } else if (INPUT_RECENT_DOWN) {
    push hl
    ld hl, sp+$06
    bit 3, [hl]
    pop hl
    jr nz, jr_005_7d7d

    ld a, [_RECENT_JOY]
    or a
    jp nz, Jump_005_7e7b

    bit 3, c
    jp z, Jump_005_7e7b

jr_005_7d7d:
    ld hl, _PLAYER_MOVING
    ld [hl], $01
    ld hl, sp+$00
    ld [hl], $00
    ld hl, _ACTORS + 1
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
    ld e, a
    rlca
    sbc a
    ld hl, sp+$03
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
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
    ld hl, sp+$03
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
    ld a, e
    inc a
    ld hl, sp+$01
    ld [hl+], a
    inc hl
    ld de, _ACTORS + 3
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
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
    ld b, a
    rlca
    sbc a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
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
    ld hl, sp+$02
    ld [hl], e

jr_005_7e17:
    ld hl, sp+$01
    ld a, [hl]
    sub c
    jr z, jr_005_7e7b

    ld hl, sp+$02
    ld a, [hl+]
    inc a
    ld [hl], a
    ld a, c
    ld hl, _image_tile_width
    sub [hl]
    jr nc, jr_005_7e6c

    ld hl, sp+$03
    ld a, [hl]
    ld hl, _image_tile_height
    sub [hl]
    jr nc, jr_005_7e6c

    ld a, [_COLLISION_BANK]
    ld hl, sp+$04
    ld [hl], a
    ld hl, _image_tile_width
    ld e, [hl]
    ld d, $00
    ld hl, sp+$03
    ld a, [hl]
    ld b, $00
    push bc
    push de
    ld e, a
    ld d, b
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
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    jr jr_005_7e6e

jr_005_7e6c:
    ld a, $0f

jr_005_7e6e:
    rrca
    jr nc, jr_005_7e78

    ld hl, _PLAYER_MOVING
    ld [hl], $00
    jr jr_005_7e7b

jr_005_7e78:
    inc c
    jr jr_005_7e17

Jump_005_7e7b:
jr_005_7e7b:
    ld hl, sp+$00
    ld a, [hl]
    sub $04
    jr z, jr_005_7e9c

    ld a, [_PLAYER_MOVING]
    push af
    inc sp
    ld hl, sp+$01
    ld a, [hl]
    push af
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04
    jr jr_005_7ea9

jr_005_7e9c:
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4606
    call RST_08
    pop hl

jr_005_7ea9:
    ld a, [_GAME_TIME]
    and $01
    ld b, a
    ld c, $00
    ld a, b
    dec a
    or c
    jr nz, jr_005_7ed4

    xor a
    push af
    inc sp
    ld e, $01
    ld hl, $4887
    call RST_08
    inc sp
    ld a, d
    or e
    jr z, jr_005_7ed4

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_7ed4

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_005_7ed4:
    ld a, [_PLAYER_MOVING]
    or a
    jr z, jr_005_7f08

    xor a
    push af
    inc sp
    ld a, [_TOPDOWN_GRID]
    push af
    inc sp
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl
    ld a, d
    or e
    jr z, jr_005_7f08

    ld hl, $c509
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld bc, $c0c5
    ld de, $c0c4
    ld a, [de]
    ld [bc], a
    ld bc, $c0c6
    ld a, [de]
    inc a
    ld [bc], a
    ld hl, _PLAYER_MOVING
    ld [hl], $00

jr_005_7f08:
    ld a, [_FRAME_JOY]
    ld c, $00
    push af
    and $10
    ld e, a
    ld d, $00
    pop af
    and e
    ld l, a
    ld a, c
    and d
    or l
    jr z, jr_005_7f8c

    ld hl, _LAST_JOY
    ld c, [hl]
    ld b, $00
    ld a, c
    and e
    ld c, a
    ld a, b
    and d
    or c
    jr nz, jr_005_7f8c

    ld a, $01
    push af
    inc sp
    ld a, [_TOPDOWN_GRID]
    push af
    inc sp
    ld e, $01
    ld hl, $47a0
    call RST_08
    pop hl
    ld a, d
    or e
    jr z, jr_005_7f8c

    ld hl, $002f
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_005_7f8c

    ld bc, $c0be
    ld a, [bc]
    add $02
    and $03
    push de
    ld h, $00
    push hl
    inc sp
    push af
    inc sp
    push de
    ld e, $01
    ld hl, $4665
    call RST_08
    add sp, $04
    pop de
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ld hl, $0025
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_005_7f8c

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
    ld hl, $61bc
    call RST_08
    add sp, $08

Jump_005_7f8c:
jr_005_7f8c:
    ld a, [_PLAYER_MOVING]
    or a
    jr z, jr_005_7ffc

    ld a, [$c0c8]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c0be]
    ld hl, sp+$04
    ld [hl], a
    ld hl, _ACTORS + 1
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$04
    ld a, [hl]
    ld d, $00
    add a
    rl d
    ld e, a
    ld hl, $19c4
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [de]
    push bc
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, _ACTORS + 1
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _ACTORS + 3
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    inc de
    ld a, [de]
    push bc
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_3541
    pop hl
    pop bc
    ld l, e
    ld h, d
    add hl, bc
    ld c, l
    ld b, h
    ld hl, _ACTORS + 3
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_005_7ffc:
jr_005_7ffc:
    add sp, $05
    ret
