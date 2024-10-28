
_vm_camera_move_to:
    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_007_4792

    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_007_4796

jr_007_4792:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_007_4796:
    ld c, l
    ld b, h
    ld hl, _camera_settings
    ld a, [hl]
    and $fc
    ld [hl], a
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld a, [_camera_x]
    ld hl, sp+$02
    sub [hl]
    jr nz, jr_007_47e1

    ld a, [$c51b]
    ld hl, sp+$03
    sub [hl]
    jr nz, jr_007_47e1

    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [_camera_y]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_007_47e1

    ld a, [$c51d]
    ld hl, sp+$05
    sub [hl]
    jr nz, jr_007_47e1

    ld hl, sp+$11
    ld a, [hl]
    and $03
    ld hl, _camera_settings
    ld c, [hl]
    or c
    ld [hl], a
    jp Jump_007_48a4


jr_007_47e1:
    ld a, [_GAME_TIME]
    ld hl, sp+$10
    and [hl]
    jp nz, Jump_007_4890

    ld hl, sp+$02
    ld e, l
    ld d, h
    ld hl, _camera_x
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4804

    bit 7, d
    jr nz, jr_007_4809

    cp a
    jr jr_007_4809

jr_007_4804:
    bit 7, d
    jr z, jr_007_4809

    scf

jr_007_4809:
    jr nc, jr_007_4818

    ld hl, _camera_x
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_007_483f

jr_007_4818:
    ld de, _camera_x
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4830

    bit 7, d
    jr nz, jr_007_4835

    cp a
    jr jr_007_4835

jr_007_4830:
    bit 7, d
    jr z, jr_007_4835

    scf

jr_007_4835:
    jr nc, jr_007_483f

    ld hl, _camera_x
    inc [hl]
    jr nz, jr_007_483f

    inc hl
    inc [hl]

jr_007_483f:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, _camera_y
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4859

    bit 7, d
    jr nz, jr_007_485e

    cp a
    jr jr_007_485e

jr_007_4859:
    bit 7, d
    jr z, jr_007_485e

    scf

jr_007_485e:
    jr nc, jr_007_486d

    ld hl, _camera_y
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_007_4890

jr_007_486d:
    ld hl, _camera_y
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_007_4881

    bit 7, d
    jr nz, jr_007_4886

    cp a
    jr jr_007_4886

jr_007_4881:
    bit 7, d
    jr z, jr_007_4886

    scf

jr_007_4886:
    jr nc, jr_007_4890

    ld hl, _camera_y
    inc [hl]
    jr nz, jr_007_4890

    inc hl
    inc [hl]

Jump_007_4890:
jr_007_4890:
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    add $fb
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_007_48a4:
    add sp, $06
    ret

_vm_camera_set_pos:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_007_48c3

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_007_48c7

jr_007_48c3:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_007_48c7:
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, _camera_x
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, _camera_y
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, _camera_settings
    ld a, [hl]
    and $fc
    ld [hl], a
    ld e, $05
    ld hl, _scroll_update
    jp RST_08

_camera_shake_frames:
    add sp, -$07
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr z, jr_007_490d

    dec hl
    dec hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0a3
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a

jr_007_490d:
    ld a, [$c0a3]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c0a4]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$05
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld c, a
    ld h, [hl]
    ld l, c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_007_49d7

    inc bc
    inc bc
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    bit 0, [hl]
    jr z, jr_007_4997

    push bc
    call _randw
    ld a, e
    pop bc
    and $0f
    ld hl, sp+$06
    ld [hl], a
    ld e, [hl]
    ld a, $0a
    ld d, a
    sub [hl]
    bit 7, e
    jr z, jr_007_4982

    bit 7, d
    jr nz, jr_007_4987

    cp a
    jr jr_007_4987

jr_007_4982:
    bit 7, d
    jr z, jr_007_4987

    scf

jr_007_4987:
    jr nc, jr_007_498f

    ld hl, sp+$06
    ld a, [hl]
    add $f6
    ld [hl], a

jr_007_498f:
    ld hl, sp+$06
    ld a, [hl]
    add $fb
    ld [_SCROLL_OFFSET_X], a

jr_007_4997:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    bit 1, c
    jr z, jr_007_49c8

    call _randw
    ld a, e
    and $0f
    ld c, a
    ld e, c
    ld a, $0a
    ld d, a
    sub c
    bit 7, e
    jr z, jr_007_49b7

    bit 7, d
    jr nz, jr_007_49bc

    cp a
    jr jr_007_49bc

jr_007_49b7:
    bit 7, d
    jr z, jr_007_49bc

    scf

jr_007_49bc:
    jr nc, jr_007_49c2

    ld a, c
    add $f6
    ld c, a

jr_007_49c2:
    ld a, c
    add $fb
    ld [_SCROLL_OFFSET_Y], a

jr_007_49c8:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld e, $00
    jr jr_007_49e3

jr_007_49d7:
    ld hl, _SCROLL_OFFSET_Y
    ld [hl], $00
    ld hl, _SCROLL_OFFSET_X
    ld [hl], $00
    ld e, $01

jr_007_49e3:
    add sp, $07
    ret