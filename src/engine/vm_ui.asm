_vm_display_text:
    ld a, [_FRAME_JOY]
    ld [_LAST_JOY], a
    ld hl, sp+$08
    ld a, [hl]
    ld [_TEXT_OPTIONS], a
    ld hl, $c929
    ld [hl], $00
    ld hl, $c923
    ld [hl], $00
    ld hl, _TEXT_DRAWN
    ld [hl], $00
    ld hl, sp+$09
    ld a, [hl]
    cp $34
    ret nc

    add $cc
    ld h, $00
    push hl
    inc sp
    push af
    inc sp
    ld e, $01
    ld hl, _ui_set_start_tile
    call RST_08
    pop hl
    ret

_vm_switch_text_layer:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_005_47db

    call _GetWinAddr
    ld hl, _TEXT_RENDER_BASE_ADDR
    ld a, e
    ld [hl+], a
    ld [hl], d
    ret


jr_005_47db:
    call _GetBkgAddr
    ld hl, _TEXT_RENDER_BASE_ADDR
    ld a, e
    ld [hl+], a
    ld [hl], d
    ret

_vm_overlay_setpos:
    ld hl, sp+$09
    ld a, [hl-]
    add a
    add a
    add a
    ld c, a
    ld a, [hl]
    add a
    add a
    add a
    ld hl, _WIN_DEST_POS_Y
    ld [hl], c
    ld hl, _WIN_POS_Y
    ld [hl], c
    ld [_WIN_DEST_POS_X], a
    ld [_WIN_POS_X], a
    ret

_vm_overlay_wait:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_005_4813

    inc hl
    ld a, [hl]
    push af
    inc sp
    ld e, $01
    ld hl, _ui_run_modal
    call RST_08
    inc sp
    ret


jr_005_4813:
    ld c, $00
    ld hl, sp+$09
    ld b, [hl]
    bit 0, b
    jr z, jr_005_4830

    ld a, [_WIN_POS_X]
    ld hl, _WIN_DEST_POS_X
    sub [hl]
    jr nz, jr_005_482e

    ld a, [_WIN_POS_Y]
    ld hl, _WIN_DEST_POS_Y
    sub [hl]
    jr z, jr_005_4830

jr_005_482e:
    ld c, $01

jr_005_4830:
    bit 1, b
    jr z, jr_005_483c

    ld a, [_TEXT_DRAWN]
    or a
    jr nz, jr_005_483c

    ld c, $01

jr_005_483c:
    ld a, [_FRAME_JOY]
    ld hl, _LAST_JOY
    ld e, [hl]
    bit 2, b
    jr z, jr_005_4851

    bit 4, a
    jr z, jr_005_484f

    bit 4, e
    jr z, jr_005_4851

jr_005_484f:
    ld c, $01

jr_005_4851:
    bit 3, b
    jr z, jr_005_485f

    bit 5, a
    jr z, jr_005_485d

    bit 5, e
    jr z, jr_005_485f

jr_005_485d:
    ld c, $01

jr_005_485f:
    bit 4, b
    jr z, jr_005_4871

    ld a, [_FRAME_JOY]
    or a
    jr z, jr_005_486f

    ld a, [_LAST_JOY]
    or a
    jr z, jr_005_4871

jr_005_486f:
    ld c, $01

jr_005_4871:
    ld a, c
    or a
    ret z

    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    add $fd
    ld e, a
    ld a, h
    adc $ff
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_overlay_move_to:
    ld hl, sp+$0a
    ld a, [hl]
    inc a
    jr nz, jr_005_489e

    ld a, [_TEXT_IN_SPEED]
    ld hl, sp+$0a
    ld [hl], a
    jr jr_005_48ab

jr_005_489e:
    ld hl, sp+$0a
    ld a, [hl]
    sub $fe
    jr nz, jr_005_48ab

    ld a, [_TEXT_OUT_SPEED]
    ld hl, sp+$0a
    ld [hl], a

jr_005_48ab:
    ld hl, sp+$0a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    add a
    add a
    add a
    ld b, a
    ld a, [hl]
    add a
    add a
    add a
    ld e, a
    ld hl, _WIN_DEST_POS_Y
    ld [hl], b
    ld hl, _WIN_DEST_POS_X
    ld [hl], e
    ld a, c
    sub $fd
    jr nz, jr_005_48cf

    ld hl, _WIN_POS_Y
    ld [hl], b
    ld hl, _WIN_POS_X
    ld [hl], e
    ret


jr_005_48cf:
    ld hl, _WIN_SPEED
    ld [hl], c
    ret

_vm_overlay_set_scroll:
    call _GetWinAddr
    ld hl, sp+$09
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld e, l
    ld d, h
    ld hl, _TEXT_SCROLL_ADDR
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0a
    ld a, [hl]
    ld [_TEXT_SCROLL_WIDTH], a
    ld hl, sp+$0b
    ld a, [hl]
    ld [_TEXT_SCROLL_HEIGHT], a
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_4909

    ld bc, $00c9
    jr jr_005_490c

jr_005_4909:
    ld bc, $00ca

jr_005_490c:
    ld hl, _TEXT_SCROLL_FILL
    ld [hl], c
    ret

_vm_overlay_clear:
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_491b

    xor a
    ld l, a
    jr jr_005_491f

jr_005_491b:
    ld a, $ff
    ld l, $00

jr_005_491f:
    ld [_TEXT_BKG_FILL], a
    ld hl, sp+$0d
    ld a, [hl]
    push af
    and $02
    ld c, a
    ld b, $00
    pop af
    rrca
    jr nc, jr_005_4976

    push bc
    ld hl, sp+$0d
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    ld e, $01
    ld hl, _ui_draw_frame
    call RST_08
    add sp, $04
    pop bc
    ld a, b
    or c
    ret z

    ld hl, sp+$0b
    ld a, [hl-]
    ld d, a
    dec d
    dec d
    ld a, [hl-]
    ld c, a
    dec c
    dec c
    ld a, [hl-]
    inc a
    ld b, [hl]
    inc b
    ld hl, sp+$0c
    ld h, [hl]
    push hl
    inc sp
    push de
    inc sp
    ld h, c
    push hl
    inc sp
    push af
    inc sp
    push bc
    inc sp
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $05
    ld hl, _vm_overlay_set_scroll ; bank 5
    call RST_08
    add sp, $07
    ret


jr_005_4976:
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_4981

    ld de, $00c9
    jr jr_005_4984

jr_005_4981:
    ld de, $00ca

jr_005_4984:
    ld a, e
    push af
    inc sp
    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call _fill_win_rect
    add sp, $05
    ld a, b
    or c
    ret z

    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    dec hl
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $05
    ld hl, _vm_overlay_set_scroll
    call RST_08
    add sp, $07
    ret

_vm_overlay_show:
    ld hl, sp+$08
    ld a, [hl]
    sub $14
    jr nc, jr_005_49ed

    inc hl
    ld a, [hl]
    sub $12
    jr nc, jr_005_49ed

    ld a, $12
    sub [hl]
    dec hl
    ld b, a
    ld a, $14
    sub [hl]
    ld hl, sp+$0b
    ld h, [hl]
    push hl
    inc sp
    ld hl, sp+$0b
    ld h, [hl]
    ld l, b
    push hl
    push af
    inc sp
    xor a
    rrca
    push af
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $05
    ld hl, _vm_overlay_clear
    call RST_08
    add sp, $08

jr_005_49ed:
    ld hl, sp+$09
    ld a, [hl-]
    add a
    add a
    add a
    ld c, a
    ld a, [hl]
    add a
    add a
    add a
    ld hl, _WIN_DEST_POS_Y
    ld [hl], c
    ld hl, _WIN_POS_Y
    ld [hl], c
    ld [_WIN_DEST_POS_X], a
    ld [_WIN_POS_X], a
    ret

_vm_choice:
    add sp, -$09
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_005_4a3d

    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$09
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$08
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
    jr jr_005_4a41

jr_005_4a3d:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_005_4a41:
    ld a, l
    ld c, h
    ld hl, sp+$07
    ld [hl+], a
    ld a, c
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    or a
    jp z, Jump_005_4af2

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$07
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$07
    ld e, l
    ld d, h
    ld hl, sp+$04
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_005_4a86

    bit 7, d
    jr nz, jr_005_4a8b

    cp a
    jr jr_005_4a8b

jr_005_4a86:
    bit 7, d
    jr z, jr_005_4a8b

    scf

jr_005_4a8b:
    ld a, $00
    rla
    ld hl, sp+$06
    ld [hl], a
    or a
    jr z, jr_005_4a9a

    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    jr jr_005_4a9f

jr_005_4a9a:
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_005_4a9f:
    ld a, c
    sub $01
    ld a, b
    rla
    ccf
    rra
    sbc $80
    jr nc, jr_005_4ab3

    ld hl, sp+$07
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl], a
    jr jr_005_4ac4

jr_005_4ab3:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr nz, jr_005_4ac4

    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$07
    ld [hl-], a
    dec hl
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a

jr_005_4ac4:
    ld hl, sp+$07
    ld c, [hl]
    pop de
    push de
    inc de
    inc de
    ld a, [de]
    ld b, a
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    ld d, a
    ld a, c
    push af
    inc sp
    ld hl, sp+$15
    ld a, [hl-]
    push af
    inc sp
    ld a, [hl]
    push af
    inc sp
    push bc
    inc sp
    push de
    ld e, $01
    ld hl, _ui_run_menu
    call RST_08
    add sp, $06
    ld c, e
    ld b, $00
    jr jr_005_4af5

Jump_005_4af2:
    ld bc, $0000

jr_005_4af5:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld a, [de]
    ld hl, sp+$07
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$14
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $09
    ret

_vm_set_font:
    ld hl, sp+$08
    ld c, [hl]
    ld hl, _VWF_CURRENT_FONT_IDX
    ld [hl], c
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    ld bc, $05a1
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld [_VWF_CURRENT_FONT_BANK], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [_VWF_CURRENT_FONT_BANK]
    push af
    inc sp
    ld de, $0008
    push de
    push bc
    ld de, _VWF_CURRENT_FONT_DESC
    push de
    call _MemcpyBanked
    add sp, $07
    ret

_vm_overlay_scroll:
    call _GetWinAddr
    ld hl, sp+$09
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_005_4b76

    ld de, $00c9
    jr jr_005_4b79

jr_005_4b76:
    ld de, $00ca

jr_005_4b79:
    ld a, e
    push af
    inc sp
    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    push bc
    ld e, $09
    ld hl, _scroll_rect
    call RST_08
    add sp, $05
    ret

_vm_overlay_set_submap:
    ld a, [_image_tile_width]
    push af
    inc sp
    ld hl, sp+$0e
    ld a, [hl]
    push af
    inc sp
    call Call_000_355d
    pop hl
    ld hl, sp+$0c
    ld a, [hl]
    ld b, $00
    add e
    ld c, a
    ld a, b
    adc d
    ld b, a
    ld a, c
    ld hl, _image_ptr
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, sp+$0b
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    ld a, [_image_tile_width]
    ld h, a
    ld a, [_image_bank]
    ld l, a
    push hl
    push bc
    call Call_000_22da
    add sp, $08
    ret

_vm_overlay_set_submap_ex:
    add sp, -$03
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_005_4be9

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_005_4bed

jr_005_4be9:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_005_4bed:
    ld c, l
    ld b, h
    ld hl, $000a
    add hl, bc
    ld a, [hl]
    push bc
    ld hl, _image_tile_width
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call Call_000_355d
    pop hl
    pop bc
    ld hl, $0008
    add hl, bc
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0006
    add hl, bc
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, $0004
    add hl, bc
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld l, c
    ld h, b
    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld a, [bc]
    ld c, a
    ld hl, _image_ptr
    ld a, [hl+]
    add e
    ld e, a
    ld a, [hl]
    adc d
    ld d, a
    ld hl, sp+$00
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    push af
    inc sp
    ld b, [hl]
    push bc
    ld a, [_image_tile_width]
    ld h, a
    ld a, [_image_bank]
    ld l, a
    push hl
    push de
    call Call_000_22da
    add sp, $0b
    ret

_vm_overlay_set_map:
    add sp, -$0c
    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$16
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$17
    bit 7, [hl]
    jr z, jr_005_4c7a

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_005_4c7e

jr_005_4c7a:
    ld hl, $cb98
    add hl, bc

jr_005_4c7e:
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$18
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_005_4c9c

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_005_4ca0

jr_005_4c9c:
    ld hl, $cb98
    add hl, bc

jr_005_4ca0:
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld hl, sp+$05
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$06
    ld a, e
    ld [hl-], a
    ld e, c
    ld d, b
    inc de
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$07
    ld [hl], e
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$09
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$15
    bit 7, [hl]
    jr z, jr_005_4cfe

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    jr jr_005_4d09

jr_005_4cfe:
    ld de, $cb98
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h

jr_005_4d09:
    ld a, [de]
    ld [_MAP_TILE_OFFSET], a
    ld hl, $0008
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$05
    ld a, [hl]
    push af
    inc sp
    push de
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _ReadBankedFarPtr
    add sp, $05
    ld a, [bc]
    ld l, c
    ld h, b
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    ld hl, sp+$0a
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    dec hl
    ld e, a
    push de
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call _SetBankedWinTiles
    add sp, $07
    ld hl, _MAP_TILE_OFFSET
    ld [hl], $00
    add sp, $0c
    ret

_vm_set_text_sound:
    ld hl, sp+$08
    ld a, [hl]
    ld [_TEXT_SOUND_BANK], a
    ld hl, sp+$09
    ld a, [hl]
    ld [_TEXT_SOUND_DATA], a
    ld hl, sp+$0a
    ld a, [hl]
    ld [_TEXT_SOUND_DATA + 1], a
    ld hl, sp+$0b
    ld a, [hl]
    ld [_TEXT_SOUND_MASK], a
    ret