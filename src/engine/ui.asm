; Load at bank 1 0x55ba

_ui_swap_tiles:
    ld hl, $dfe0
    ld de, $dff0
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [_TEXT_BKG_FILL]
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ret


_ui_print_make_mask_lr:
    ld hl, sp+$02
    ld a, [hl+]
    or a
    ld de, $ffff
    ret z

    ld e, a
    ld a, d

jr_001_560e:
    srl a
    dec e
    jr nz, jr_001_560e

    ld e, [hl]
    inc e
    jr jr_001_561b

jr_001_5617:
    scf
    rra
    rr d

jr_001_561b:
    dec e
    jr nz, jr_001_5617

    ld e, a
    ret


_ui_print_make_mask_rl:
    ld hl, sp+$02
    ld a, [hl+]
    or a
    ld de, $ffff
    ret z

    ld e, a
    ld a, d

jr_001_562a:
    sla a
    dec e
    jr nz, jr_001_562a

    ld e, [hl]
    inc e
    jr jr_001_5637

jr_001_5633:
    scf
    rla
    rl d

jr_001_5637:
    dec e
    jr nz, jr_001_5633

    ld e, a
    ret

_ui_init:
    ld hl, _VWF_DIRECTION
    ld [hl], $00
    ld hl, _VWF_CURRENT_FONT_IDX
    ld [hl], $00
    ld a, [_ui_fonts]
    ld [_VWF_CURRENT_FONT_BANK], a
    ld hl, _ui_fonts + 1
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
    ld hl, _TEXT_OPTIONS
    ld [hl], $00
    ld hl, _TEXT_IN_SPEED
    ld [hl], $00
    ld hl, _TEXT_OUT_SPEED
    ld [hl], $00
    ld hl, _TEXT_FF_JOYPAD
    ld [hl], $01
    ld hl, _TEXT_BKG_FILL
    ld [hl], $00
    xor a
    ld hl, $ca2a
    ld [hl+], a
    ld [hl], a
    ld hl, $ca34
    ld [hl], $00
    ld hl, $ca30
    ld [hl], $cc
    ld hl, $ca31
    ld [hl], $00
    ld hl, $ca32
    ld [hl], $cc
    ld hl, $ca33
    ld [hl], $00
    ld hl, _WIN_DEST_POS_Y
    ld [hl], $90
    ld hl, _WIN_POS_Y
    ld [hl], $90
    ld hl, _WIN_DEST_POS_X
    ld [hl], $00
    ld hl, _WIN_POS_X
    ld [hl], $00
    ld hl, _WIN_SPEED
    ld [hl], $01
    ld hl, _TEXT_DRAWN
    ld [hl], $01
    ld hl, _TEXT_DRAW_SPEED
    ld [hl], $01
    ld hl, _CURRENT_TEXT_SPEED
    ld [hl], $00
    call _GetWinAddr
    ld hl, _TEXT_RENDER_BASE_ADDR
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $0021
    add hl, de
    ld c, l
    ld a, h
    ld hl, $ca2e
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, $ca2c
    ld [hl], c
    inc hl
    ld [hl], a
    call _GetWinAddr
    ld hl, _TEXT_SCROLL_ADDR
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, _TEXT_SCROLL_WIDTH
    ld [hl], $14
    ld hl, _TEXT_SCROLL_HEIGHT
    ld [hl], $08
    ld hl, _TEXT_SCROLL_FILL
    ld [hl], $c9
    ld hl, _TEXT_SOUND_BANK
    ld [hl], $ff
    ld e, $01
    ld hl, _ui_load_tiles
    jp RST_08

_ui_load_tiles:
    ld b, $09
    push bc
    inc sp
    ld de, $5296
    push de
    ld a, $09
    cp a
    push af
    call _SetBankedBkgData
    add sp, $05
    ld b, $0a
    push bc
    inc sp
    ld de, $42bd ; CursorImage bank 0a 0x42bd
    push de
    ld hl, $01cb
    push hl
    call _SetBankedBkgData
    add sp, $05
    ld bc, $dfe0
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
    ld hl, $01c9
    push hl
    call _set_win_data
    add sp, $04
    ld e, c
    ld d, b
    ld hl, $0010
    push hl
    ld l, $ff
    push hl
    push de
    call _memset
    add sp, $06
    push bc
    ld hl, $01ca
    push hl
    call _set_win_data
    add sp, $04
    ret

_ui_draw_frame:
    ld hl, sp+$09
    ld a, [hl]
    or a
    ret z

    call _GetWinAddr
    ld hl, sp+$07
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
    ld hl, sp+$06
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    push bc
    ld hl, sp+$0a
    ld a, [hl]
    cp a
    push af
    push de
    call _ui_draw_frame_row
    add sp, $04
    pop bc
    ld hl, sp+$09
    dec [hl]
    ret z

    ld a, $01
    ld hl, sp+$09
    sub [hl]
    jr nc, jr_001_57b8

    ld e, [hl]
    dec e

jr_001_5795:
    ld a, e
    or a
    jr z, jr_001_57b8

    ld hl, $0020
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    ld d, b
    push bc
    push de
    ld hl, sp+$0c
    ld h, [hl]
    push hl
    inc sp
    ld h, $c3
    push hl
    inc sp
    ld e, a
    push de
    call _ui_draw_frame_row
    add sp, $04
    pop de
    pop bc
    dec e
    jr jr_001_5795

jr_001_57b8:
    ld hl, $0020
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$08
    ld h, [hl]
    ld l, $c6
    push hl
    push bc
    call _ui_draw_frame_row
    add sp, $04
    ret


_ui_print_reset:
    ld a, [$ca34]
    or a
    jr z, jr_001_57e5

    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    jr nz, jr_001_57e5

    ld [hl], $cc

jr_001_57e5:
    ld hl, $ca34
    ld [hl], $00
    ld hl, _TEXT_BKG_FILL
    ld c, [hl]
    ld b, $00
    ld de, $0020
    push de
    push bc
    ld de, $dfe0
    push de
    call _memset
    add sp, $06
    ret

_ui_set_start_tile:
    ld hl, sp+$06
    ld a, [hl]
    ld [$ca30], a
    ld [$ca32], a
    ld hl, sp+$07
    ld a, [hl]
    ld [$ca31], a
    ld [$ca33], a
    ld hl, $ca34
    ld [hl], $00
    ld hl, _TEXT_BKG_FILL
    ld c, [hl]
    ld b, $00
    ld de, $0020
    push de
    push bc
    ld de, $dfe0
    push de
    call _memset
    add sp, $06
    ret


_ui_print_render:
    add sp, -$03
    ld a, [_VWF_CURRENT_FONT_DESC]
    rrca
    jr nc, jr_001_5854

    ld hl, _VWF_CURRENT_FONT_BANK
    ld b, [hl]
    ld hl, _VWF_CURRENT_FONT_DESC + 2
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, _VWF_CURRENT_FONT_DESC + 1
    ld a, [de]
    push hl
    ld hl, sp+$07
    and [hl]
    pop hl
    ld e, a
    ld d, $00
    add hl, de
    push bc
    inc sp
    push hl
    call _ReadBankedUWORD
    add sp, $03
    jr jr_001_5857

jr_001_5854:
    ld hl, sp+$05
    ld e, [hl]

jr_001_5857:
    ld hl, sp+$00
    ld [hl], e
    ld hl, $ca3f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld e, $00
    ld h, e
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$01
    ld [hl], c
    inc hl
    ld [hl], a
    ld a, [_VWF_CURRENT_FONT_DESC]
    ld hl, _VWF_CURRENT_FONT_BANK
    ld c, [hl]
    bit 1, a
    jp z, Jump_001_59ce

    bit 2, a
    jr z, jr_001_5887

    ld a, [_TEXT_BKG_FILL]
    jr jr_001_5888

jr_001_5887:
    xor a

jr_001_5888:
    ld [_VWF_INVERSE_MAP], a
    ld hl, $ca3d
    ld a, [hl+]
    ld b, [hl]
    ld e, a
    ld d, b
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld c, e
    ld hl, sp+$00
    ld [hl], c
    ld a, [_VWF_DIRECTION]
    or a
    jr nz, jr_001_5906

    ld a, [$ca34]
    ld [_VWF_CURRENT_ROTATE], a
    push bc
    ld a, [$ca34]
    ld b, a
    push bc
    call _ui_print_make_mask_lr
    pop hl
    pop bc
    ld hl, _VWF_CURRENT_MASK
    ld [hl], e
    push bc
    push de
    ld a, [_VWF_CURRENT_FONT_BANK]
    push af
    inc sp
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $dfe0
    push hl
    call _ui_print_shift_char
    add sp, $05
    pop de
    pop bc
    ld hl, $ca34
    ld a, [hl]
    add c
    ld c, a
    ld a, $08
    cp c
    jp nc, Jump_001_596e

    sub [hl]
    or $80
    ld [_VWF_CURRENT_ROTATE], a
    ld hl, _VWF_CURRENT_MASK
    ld [hl], d
    ld a, [_VWF_CURRENT_FONT_BANK]
    push af
    inc sp
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $dff0
    push de
    call _ui_print_shift_char
    add sp, $05
    jr jr_001_596e

jr_001_5906:
    ld a, $08
    ld hl, $ca34
    sub [hl]
    ld e, a
    ld a, c
    sub e
    jr nc, jr_001_5915

    ld a, e
    sub c
    jr jr_001_5919

jr_001_5915:
    ld a, c
    sub e
    set 7, a

jr_001_5919:
    ld [_VWF_CURRENT_ROTATE], a
    ld a, [$ca34]
    push af
    inc sp
    ld hl, sp+$01
    ld a, [hl]
    push af
    inc sp
    call _ui_print_make_mask_rl
    pop hl
    ld hl, $ca35
    ld [hl], e
    push de
    ld a, [_VWF_CURRENT_FONT_BANK]
    push af
    inc sp
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    ld bc, $dfe0
    push bc
    call _ui_print_shift_char
    add sp, $05
    pop de
    ld a, [$ca34]
    ld hl, sp+$00
    add [hl]
    ld c, a
    ld a, $08
    sub c
    jr nc, jr_001_596e

    ld a, $10
    sub c
    ld [$ca36], a
    ld hl, $ca35
    ld [hl], d
    ld a, [_VWF_CURRENT_FONT_BANK]
    push af
    inc sp
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld de, $dff0
    push de
    call _ui_print_shift_char
    add sp, $05

Jump_001_596e:
jr_001_596e:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, $ca34
    add [hl]
    ld [hl], a
    ld de, $dfe0
    push de
    ld a, $01
    push af
    inc sp
    ld a, [$ca30]
    push af
    inc sp
    call _set_win_data
    add sp, $04
    ld a, $07
    ld hl, $ca34
    sub [hl]
    jr nc, jr_001_59ca

    call _ui_swap_tiles
    ld hl, $ca34
    ld a, [hl]
    add $f8
    ld [hl], a
    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    jr nz, jr_001_59ae

    ld [hl], $cc

jr_001_59ae:
    ld a, [$ca34]
    or a
    jr z, jr_001_59c6

    ld de, $dfe0
    push de
    ld a, $01
    push af
    inc sp
    ld a, [$ca30]
    push af
    inc sp
    call _set_win_data
    add sp, $04

jr_001_59c6:
    ld e, $01
    jr jr_001_5a1c

jr_001_59ca:
    ld e, $00
    jr jr_001_5a1c

Jump_001_59ce:
    ld a, [$ca34]
    or a
    jr z, jr_001_59ea

    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    ld a, [hl]
    or a
    jr nz, jr_001_59ea

    ld [hl], $cc

jr_001_59ea:
    ld a, c
    push af
    inc sp
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld a, $01
    push af
    inc sp
    ld a, [$ca30]
    push af
    inc sp
    call _SetBankedBkgData
    add sp, $05
    ld a, [$ca31]
    ld [$ca33], a
    ld a, [$ca30]
    ld [$ca32], a
    ld hl, $ca30
    inc [hl]
    jr nz, jr_001_5a15

    ld [hl], $cc

jr_001_5a15:
    ld hl, $ca34
    ld [hl], $00
    ld e, $01

jr_001_5a1c:
    add sp, $03
    ret


_ui_draw_text_buffer_char:
    dec sp
    dec sp
    ld a, [_TEXT_FF_JOYPAD]
    or a
    jr z, jr_001_5a3a

    ld a, [_FRAME_JOY]
    and $30
    jr z, jr_001_5a3a

    ld a, [_LAST_JOY]
    and $30
    jr nz, jr_001_5a3a

    ld hl, $c929
    ld [hl], $01

jr_001_5a3a:
    ld a, [$c929]
    or a
    jr nz, jr_001_5a4d

    ld hl, $c923
    ld a, [hl]
    or a
    jr z, jr_001_5a4d

    dec [hl]
    ld e, $00
    jp Jump_001_5e82


jr_001_5a4d:
    ld hl, $ca2b
    ld a, [hl-]
    or [hl]
    jr nz, jr_001_5ac0

    ld bc, $02a2
    ld a, c
    ld hl, _TEXT_DRAW_SPEED
    add [hl]
    ld c, a
    jr nc, jr_001_5a60

    inc b

jr_001_5a60:
    ld a, [bc]
    ld [_CURRENT_TEXT_SPEED], a
    ld a, [_VWF_CURRENT_FONT_IDX]
    ld [_TEXT_PALETTE + 1], a
    ld a, [_TEXT_BKG_FILL]
    ld [_TEXT_PALETTE + 2], a
    ld a, [_VWF_DIRECTION]
    ld [_TEXT_PALETTE + 3], a
    ld a, [_TEXT_FF_JOYPAD]
    ld [$ca51], a
    ld a, [_TEXT_DRAW_SPEED]
    ld [$ca52], a
    ld hl, $ca2a
    ld [hl], $2b
    inc hl
    ld [hl], $c9
    ld a, [_TEXT_OPTIONS]
    rrca
    jr c, jr_001_5abd

    ld a, [_TEXT_RENDER_BASE_ADDR]
    add $21
    ld [$ca2e], a
    ld a, [_TEXT_RENDER_BASE_ADDR + 1]
    adc $00
    ld [$ca2f], a
    ld a, [_VWF_DIRECTION]
    dec a
    jr nz, jr_001_5ab1

    ld hl, $ca2e
    ld a, [hl]
    add $11
    ld [hl+], a
    ld a, [hl]
    adc $00
    ld [hl], a

jr_001_5ab1:
    ld a, [$ca2e]
    ld [$ca2c], a
    ld a, [$ca2f]
    ld [$ca2d], a

jr_001_5abd:
    call _ui_print_reset

Jump_001_5ac0:
jr_001_5ac0:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld c, [hl]
    ld a, $0d
    sub c
    jp c, Jump_001_5e16

    ld b, $00
    ld hl, $5ad8
    add hl, bc
    add hl, bc
    add hl, bc
    jp hl


    jp Jump_001_5b02


    jp Jump_001_5b5c


    jp Jump_001_5b80


    jp Jump_001_5be6


    jp Jump_001_5c39


    jp Jump_001_5e0e


    jp Jump_001_5cbc


    jp Jump_001_5d2d


    jp Jump_001_5d56


    jp Jump_001_5e76


    jp Jump_001_5dec


    jp Jump_001_5e16


    jp Jump_001_5e16


    jp Jump_001_5d73


Jump_001_5b02:
    xor a
    ld hl, $ca2a
    ld [hl+], a
    ld [hl], a
    ld hl, $c921
    ld [hl], $01
    ld a, [$ca42]
    ld hl, $ca4e
    sub [hl]
    jr z, jr_001_5b3f

    ld hl, _VWF_CURRENT_FONT_IDX
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $05a1
    add hl, bc
    ld a, [hl+]
    ld b, a
    ld [_VWF_CURRENT_FONT_BANK], a
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    push bc
    inc sp
    ld de, $0008
    push de
    ld b, a
    push bc
    ld de, _VWF_CURRENT_FONT_DESC
    push de
    call _MemcpyBanked
    add sp, $07

jr_001_5b3f:
    ld a, [_TEXT_PALETTE + 2]
    ld [_TEXT_BKG_FILL], a
    ld a, [_TEXT_PALETTE + 3]
    ld [_VWF_DIRECTION], a
    ld a, [$ca51]
    ld [_TEXT_FF_JOYPAD], a
    ld a, [$ca52]
    ld [_TEXT_DRAW_SPEED], a
    ld e, $00
    jp Jump_001_5e82


Jump_001_5b5c:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5b64

    inc hl
    inc [hl]

jr_001_5b64:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    dec a
    and $07
    ld [_TEXT_DRAW_SPEED], a
    add $a2
    ld c, a
    ld a, $02
    adc $00
    ld b, a
    ld a, [bc]
    ld [$c922], a
    jp Jump_001_5e76


Jump_001_5b80:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5b88

    inc hl
    inc [hl]

jr_001_5b88:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    dec a
    ld hl, $ca4e
    ld [hl], a
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    ld bc, $05a1
    add hl, bc
    ld c, l
    ld b, h
    ld a, [_VWF_CURRENT_FONT_DESC]
    ld hl, sp+$01
    ld [hl], a
    ld a, [bc]
    ld [_VWF_CURRENT_FONT_BANK], a
    ld l, c
    ld h, b
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    ld de, $0008
    push de
    push bc
    ld de, _VWF_CURRENT_FONT_DESC
    push de
    call _MemcpyBanked
    add sp, $07
    ld hl, $ca34
    ld a, [hl]
    or a
    jp z, Jump_001_5e76

    push hl
    ld hl, sp+$03
    bit 1, [hl]
    pop hl
    jp z, Jump_001_5e76

    ld a, [_VWF_CURRENT_FONT_DESC]
    bit 1, a
    jp nz, Jump_001_5e76

    ld hl, $ca2c
    inc [hl]
    jp nz, Jump_001_5e76

    inc hl
    inc [hl]
    jp Jump_001_5e76


Jump_001_5be6:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5bee

    inc hl
    inc [hl]

jr_001_5bee:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld c, [hl]
    ld b, $00
    dec bc
    ld a, c
    ld hl, $ca43
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5c0c

    inc hl
    inc [hl]

jr_001_5c0c:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld l, [hl]
    ld h, $00
    dec hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld a, h
    ld hl, $ca2e
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, $ca2c
    ld [hl], c
    inc hl
    ld [hl], a
    ld a, [$ca34]
    or a
    jp z, Jump_001_5e76

    call _ui_print_reset
    jp Jump_001_5e76


Jump_001_5c39:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5c41

    inc hl
    inc [hl]

jr_001_5c41:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld c, [hl]
    ld e, c
    xor a
    ld d, a
    sub c
    bit 7, e
    jr z, jr_001_5c59

    bit 7, d
    jr nz, jr_001_5c5e

    cp a
    jr jr_001_5c5e

jr_001_5c59:
    bit 7, d
    jr z, jr_001_5c5e

    scf

jr_001_5c5e:
    jr nc, jr_001_5c61

    dec c

jr_001_5c61:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5c69

    inc hl
    inc [hl]

jr_001_5c69:
    ld hl, $ca2a
    ld l, [hl]
    ld a, [$ca2b]
    ld h, a
    ld l, [hl]
    ld e, l
    xor a
    ld d, a
    sub l
    bit 7, e
    jr z, jr_001_5c81

    bit 7, d
    jr nz, jr_001_5c86

    cp a
    jr jr_001_5c86

jr_001_5c81:
    bit 7, d
    jr z, jr_001_5c86

    scf

jr_001_5c86:
    jr nc, jr_001_5c89

    dec l

jr_001_5c89:
    ld a, c
    rlca
    sbc a
    ld b, a
    ld a, l
    rlca
    sbc a
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    ld hl, $ca2c
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, $ca2e
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $ca2c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$ca34]
    or a
    jp z, Jump_001_5e76

    call _ui_print_reset
    jp Jump_001_5e76


Jump_001_5cbc:
    ld hl, $c929
    ld a, [hl]
    or a
    jr z, jr_001_5cd0

    ld [hl], $00
    ld hl, _TEXT_FF_JOYPAD
    ld [hl], $00
    ld a, [_FRAME_JOY]
    ld [_LAST_JOY], a

jr_001_5cd0:
    ld a, [_TEXT_DRAW_SPEED]
    or a
    jr nz, jr_001_5ce2

    ld hl, $ca2a
    inc [hl]
    jp nz, Jump_001_5e76

    inc hl
    inc [hl]
    jp Jump_001_5e76


jr_001_5ce2:
    ld a, [_LAST_JOY]
    ld b, $00
    cpl
    ld c, a
    ld a, b
    cpl
    ld b, a
    ld a, [_FRAME_JOY]
    ld e, $00
    and c
    ld c, a
    ld a, e
    and b
    ld b, a
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5cfe

    inc hl
    inc [hl]

jr_001_5cfe:
    ld hl, $ca2a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, $00
    and c
    ld c, a
    ld a, e
    and b
    or c
    jr z, jr_001_5d1d

    ld a, [$ca51]
    ld [_TEXT_FF_JOYPAD], a
    ld a, [_FRAME_JOY]
    ld [_LAST_JOY], a
    jp Jump_001_5e76


jr_001_5d1d:
    ld hl, $ca2a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld e, $00
    jp Jump_001_5e82


Jump_001_5d2d:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5d35

    inc hl
    inc [hl]

jr_001_5d35:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    rrca
    jr nc, jr_001_5d46

    xor a
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], a
    jr jr_001_5d4d

jr_001_5d46:
    ld hl, sp+$00
    ld a, $ff
    ld [hl+], a
    xor a
    ld [hl], a

jr_001_5d4d:
    ld hl, sp+$00
    ld a, [hl]
    ld [_TEXT_BKG_FILL], a
    jp Jump_001_5e76


Jump_001_5d56:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5d5e

    inc hl
    inc [hl]

jr_001_5d5e:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    rrca
    jr nc, jr_001_5d6b

    xor a
    jr jr_001_5d6d

jr_001_5d6b:
    ld a, $01

jr_001_5d6d:
    ld [_VWF_DIRECTION], a
    jp Jump_001_5e76


Jump_001_5d73:
    ld hl, $ca2c
    ld a, [hl+]
    add $20
    ld c, a
    ld a, [hl]
    adc $00
    ld b, a
    ld hl, $ca45
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $ca48
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld a, l
    and $e0
    ld l, a
    dec hl
    ld a, l
    sub c
    ld a, h
    sbc b
    jr nc, jr_001_5dc8

    ld a, [$ca49]
    ld h, a
    ld a, [$ca48]
    ld l, a
    push hl
    ld a, [$ca47]
    push af
    inc sp
    ld hl, $ca45
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $09
    ld hl, $4268
    call RST_08
    add sp, $05
    ld a, [$ca2e]
    ld [$ca2c], a
    ld a, [$ca2f]
    ld [$ca2d], a
    jr jr_001_5ddf

jr_001_5dc8:
    ld hl, $ca2e
    ld a, [hl+]
    add $20
    ld c, a
    ld a, [hl]
    adc $00
    ld b, a
    ld hl, $ca2c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $ca2e
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_001_5ddf:
    ld a, [$ca34]
    or a
    jp z, Jump_001_5e76

    call _ui_print_reset
    jp Jump_001_5e76


Jump_001_5dec:
    ld hl, $ca2e
    ld a, [hl+]
    add $20
    ld c, a
    ld a, [hl]
    adc $00
    ld b, a
    ld hl, $ca2c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $ca2e
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$ca34]
    or a
    jr z, jr_001_5e76

    call _ui_print_reset
    jr jr_001_5e76

Jump_001_5e0e:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5e16

    inc hl
    inc [hl]

Jump_001_5e16:
jr_001_5e16:
    ld hl, $ca2a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    push af
    inc sp
    call _ui_print_render
    inc sp
    ld a, e
    or a
    jr z, jr_001_5e53

    ld a, [$ca32]
    ld hl, $ca2c
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call Call_000_022e
    add sp, $03
    ld a, [_VWF_DIRECTION]
    or a
    jr nz, jr_001_5e48

    ld hl, $ca2c
    inc [hl]
    jr nz, jr_001_5e53

    inc hl
    inc [hl]
    jr jr_001_5e53

jr_001_5e48:
    ld hl, $ca2c
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_001_5e53:
    ld a, [$ca34]
    or a
    jr z, jr_001_5e6a

    ld a, [$ca30]
    ld hl, $ca2c
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call Call_000_022e
    add sp, $03

jr_001_5e6a:
    ld hl, $ca2a
    inc [hl]
    jr nz, jr_001_5e72

    inc hl
    inc [hl]

jr_001_5e72:
    ld e, $01
    jr jr_001_5e82

Jump_001_5e76:
jr_001_5e76:
    ld hl, $ca2a
    inc [hl]
    jp nz, Jump_001_5ac0

    inc hl
    inc [hl]
    jp Jump_001_5ac0


Jump_001_5e82:
jr_001_5e82:
    inc sp
    inc sp
    ret

_ui_run_menu:
    add sp, -$1a
    ld hl, sp+$23
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    push hl
    bit 2, [hl]
    pop hl
    jr z, jr_001_5e98

    ld hl, sp+$25
    ld c, [hl]
    jr jr_001_5e9b

jr_001_5e98:
    ld bc, $0001

jr_001_5e9b:
    ld hl, sp+$07
    ld [hl], c
    ld c, [hl]
    ld b, $00
    dec bc
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$20
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$08
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$22
    ld a, [hl]
    push af
    inc sp
    ld hl, $0006
    push hl
    push bc
    push de
    call _MemcpyBanked
    add sp, $07
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $cb
    ld l, b
    push hl
    push af
    inc sp
    call Call_000_023d
    add sp, $03
    ld hl, sp+$06
    ld a, [hl]
    and $02
    ld hl, sp+$0c
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$12
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$11
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$14
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$13
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$16
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$15
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$17
    ld [hl], a

Jump_001_5f58:
    call _input_update
    call _ui_update
    ld c, $c0
    ldh a, [$92]
    sub c
    jr nz, jr_001_5f6c

    ld hl, $da35
    ld [hl], $df
    jr jr_001_5f71

jr_001_5f6c:
    ld hl, $da35
    ld [hl], $c0

jr_001_5f71:
    ld hl, _allocated_hardware_sprites
    ld [hl], $00
    call _camera_update
    ld e, $05
    ld hl, _scroll_update
    call RST_08
    call _actors_update
    call _projectiles_render
    ld a, $28
    push af
    inc sp
    ld a, [_allocated_hardware_sprites]
    push af
    inc sp
    call _hide_sprites_range
    pop hl
    ld a, [___render_shadow_OAM]
    ldh [$92], a
    ld hl, _GAME_TIME
    inc [hl]
    call _wait_vbl_done
    ld a, [_FRAME_JOY]
    ld hl, sp+$18
    ld [hl], a
    ld a, [_LAST_JOY]
    ld hl, sp+$19
    ld [hl], a
    push hl
    dec hl
    bit 2, [hl]
    pop hl
    jr z, jr_001_5fc7

    push hl
    ld hl, sp+$1b
    bit 2, [hl]
    pop hl
    jr nz, jr_001_5fc7

    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jp Jump_001_606a


jr_001_5fc7:
    push hl
    ld hl, sp+$1a
    bit 3, [hl]
    pop hl
    jr z, jr_001_5fe3

    push hl
    ld hl, sp+$1b
    bit 3, [hl]
    pop hl
    jr nz, jr_001_5fe3

    ld hl, sp+$12
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jp Jump_001_606a


jr_001_5fe3:
    push hl
    ld hl, sp+$1a
    bit 1, [hl]
    pop hl
    jr z, jr_001_5ffe

    push hl
    ld hl, sp+$1b
    bit 1, [hl]
    pop hl
    jr nz, jr_001_5ffe

    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jr jr_001_606a

jr_001_5ffe:
    push hl
    ld hl, sp+$1a
    bit 0, [hl]
    pop hl
    jr z, jr_001_6019

    push hl
    ld hl, sp+$1b
    bit 0, [hl]
    pop hl
    jr nz, jr_001_6019

    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$19
    ld [hl], a
    jr jr_001_606a

jr_001_6019:
    push hl
    ld hl, sp+$1a
    bit 4, [hl]
    pop hl
    jr z, jr_001_604d

    push hl
    ld hl, sp+$1b
    bit 4, [hl]
    pop hl
    jr nz, jr_001_604d

    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$24
    sub [hl]
    jr nz, jr_001_603f

    ld hl, sp+$06
    ld a, [hl]
    and $01
    jr z, jr_001_603f

    xor a
    ld hl, sp+$18
    ld [hl+], a
    ld [hl], a
    jr jr_001_6047

jr_001_603f:
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$18
    ld [hl+], a
    ld [hl], $00

jr_001_6047:
    ld hl, sp+$18
    ld e, [hl]
    jp Jump_001_60db


jr_001_604d:
    push hl
    ld hl, sp+$1a
    bit 5, [hl]
    pop hl
    jp z, Jump_001_5f58

    push hl
    ld hl, sp+$1b
    bit 5, [hl]
    pop hl
    jp nz, Jump_001_5f58

    ld hl, sp+$0d
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_5f58

    ld e, $00
    jr jr_001_60db

Jump_001_606a:
jr_001_606a:
    ld hl, sp+$19
    ld a, [hl]
    or a
    jp z, Jump_001_5f58

    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $c4
    ld l, b
    push hl
    push af
    inc sp
    call Call_000_023d
    add sp, $03
    ld hl, sp+$19
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$20
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    add $fa
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    ld hl, sp+$16
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$22
    ld a, [hl]
    push af
    inc sp
    ld hl, $0006
    push hl
    push bc
    push de
    call _MemcpyBanked
    add sp, $07
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $cb
    ld l, b
    push hl
    push af
    inc sp
    call Call_000_023d
    add sp, $03
    jp Jump_001_5f58


Jump_001_60db:
jr_001_60db:
    add sp, $1a
    ret

_ui_run_modal:
    add sp, -$03
    ld hl, sp+$09
    ld c, [hl]
    ld a, c
    and $01
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], $00

Jump_001_60eb:
    ld b, $00
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jr z, jr_001_6107

    ld a, [_WIN_POS_X]
    ld hl, _WIN_DEST_POS_X
    sub [hl]
    jr nz, jr_001_6105

    ld a, [_WIN_POS_Y]
    ld hl, _WIN_DEST_POS_Y
    sub [hl]
    jr z, jr_001_6107

jr_001_6105:
    ld b, $01

jr_001_6107:
    bit 1, c
    jr z, jr_001_6113

    ld a, [_TEXT_DRAWN]
    or a
    jr nz, jr_001_6113

    ld b, $01

jr_001_6113:
    ld a, [_FRAME_JOY]
    ld hl, sp+$02
    ld [hl], a
    ld hl, _LAST_JOY
    ld a, [hl]
    bit 2, c
    jr z, jr_001_612f

    push hl
    ld hl, sp+$04
    bit 4, [hl]
    pop hl
    jr z, jr_001_612d

    bit 4, a
    jr z, jr_001_612f

jr_001_612d:
    ld b, $01

jr_001_612f:
    bit 3, c
    jr z, jr_001_6141

    push hl
    ld hl, sp+$04
    bit 5, [hl]
    pop hl
    jr z, jr_001_613f

    bit 5, a
    jr z, jr_001_6141

jr_001_613f:
    ld b, $01

jr_001_6141:
    bit 4, c
    jr z, jr_001_6153

    ld a, [_FRAME_JOY]
    or a
    jr z, jr_001_6151

    ld a, [_LAST_JOY]
    or a
    jr z, jr_001_6153

jr_001_6151:
    ld b, $01

jr_001_6153:
    ld a, b
    or a
    jr z, jr_001_61aa

    push bc
    call _ui_update
    pop bc
    ld e, $c0
    ldh a, [$92]
    sub e
    jr nz, jr_001_616a

    ld hl, $da35
    ld [hl], $df
    jr jr_001_616f

jr_001_616a:
    ld hl, $da35
    ld [hl], $c0

jr_001_616f:
    ld hl, _allocated_hardware_sprites
    ld [hl], $00
    push bc
    call _camera_update
    ld e, $05
    ld hl, _scroll_update
    call RST_08
    call _actors_update
    call _projectiles_render
    pop bc
    ld a, $28
    push af
    inc sp
    ld a, [_allocated_hardware_sprites]
    push af
    inc sp
    call _hide_sprites_range
    pop hl
    ld a, [___render_shadow_OAM]
    ldh [$92], a
    ld hl, _GAME_TIME
    inc [hl]
    call _wait_vbl_done
    push bc
    call _input_update
    pop bc
    ld a, b
    or a
    jp nz, Jump_001_60eb

jr_001_61aa:
    add sp, $03
    ret