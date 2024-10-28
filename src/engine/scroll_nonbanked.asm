_scroll_load_pending_row:
    ldh a, [$90]
    ld c, a
    ld hl, _pending_w_i
    ld a, [hl]
    sub $07
    jr nc, jr_000_2182

    ld b, [hl]
    xor a
    jr jr_000_2185

jr_000_2182:
    ld b, $07
    xor a

jr_000_2185:
    ld hl, $c529
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    push bc
    ld a, [$c532]
    push af
    inc sp
    ld hl, $c52a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld a, $01
    push af
    inc sp
    push bc
    inc sp
    ld a, [$c7e6]
    ld h, a
    ld a, [$c7e5]
    ld l, a
    push hl
    call _set_bkg_submap
    add sp, $07
    pop bc
    ld hl, $c7e5
    ld a, [hl]
    add b
    ld [hl], a
    ld hl, $c7e7
    ld a, [hl]
    sub b
    ld [hl], a
    ld a, c
    ldh [$90], a
    ld hl, $2000
    ld [hl], c
    ret


Call_000_21c6:
    ldh a, [$90]
    ld c, a
    ld hl, $c529
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    ld a, $17
    ld hl, $c532
    sub [hl]
    jr nc, jr_000_21e0

    ld a, $17
    jr jr_000_21e3

jr_000_21e0:
    ld a, [$c532]

jr_000_21e3:
    push bc
    ld hl, $c532
    ld h, [hl]
    push hl
    inc sp
    ld hl, $c52a
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld h, $01
    push hl
    inc sp
    push af
    inc sp
    ld hl, sp+$0a
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call _set_bkg_submap
    add sp, $07
    pop bc
    ld a, c
    ldh [$90], a
    ld hl, $2000
    ld [hl], c
    ret


Call_000_220b:
    ldh a, [$90]
    ld c, a
    ld hl, $c529
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    push bc
    ld a, [$c532]
    push af
    inc sp
    ld hl, $c52a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$09
    ld a, [hl-]
    ld d, a
    ld e, $01
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call _set_bkg_submap

Jump_000_2234:
    add sp, $07
    pop bc
    ld a, c
    ldh [$90], a
    ld hl, $2000
    ld [hl], c
    ret


_scroll_load_pending_col:
    ldh a, [$90]
    ld c, a
    ld hl, _pending_h_i
    ld a, [hl]
    sub $07
    jr nc, jr_000_224e

    ld b, [hl]
    xor a
    jr jr_000_2251

jr_000_224e:
    ld b, $07
    xor a

jr_000_2251:
    ld hl, _image_bank
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    push bc
    ld a, [_image_tile_width]
    push af
    inc sp
    ld hl, _image_ptr
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld c, $01
    push bc
    ld a, [_pending_h_y]
    ld h, a
    ld a, [_pending_h_x]
    ld l, a
    push hl
    call _set_bkg_submap
    add sp, $07
    pop bc
    ld hl, _pending_h_y
    ld a, [hl]
    add b
    ld [hl], a
    ld hl, _pending_h_i
    ld a, [hl]
    sub b
    ld [hl], a
    ld a, c
    ldh [$90], a
    ld hl, $2000
    ld [hl], c
    ret