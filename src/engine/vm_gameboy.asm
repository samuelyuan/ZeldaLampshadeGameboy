; Loaded at bank 6 0x4f00

_vm_set_sprites_visible:
    ld hl, sp+$08
    ld a, [hl]
    ld [_HIDE_SPRITES], a
    or a
    jr z, jr_006_4f10

    ldh a, [rLCDC]
    or $02
    ldh [rLCDC], a
    ret


jr_006_4f10:
    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a
    ret

_vm_input_wait:
    ld a, [_FRAME_JOY]
    ld hl, _LAST_JOY
    sub [hl]
    jr z, jr_006_4f27

    ld a, [_FRAME_JOY]
    ld hl, sp+$08
    and [hl]
    ret nz

jr_006_4f27:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    dec de
    dec de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_context_prepare:
    ld bc, _INPUT_EVENTS
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $07
    ld l, a
    ld h, $00
    ld e, l
    ld d, h
    add hl, hl
    add hl, hl
    add hl, de
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    inc de
    inc de
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    inc bc
    inc bc
    inc bc
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_input_attach:
    ld bc, _INPUT_SLOTS
    ld hl, sp+$08
    ld e, [hl]

jr_006_4f71:
    ld a, e
    or a
    ret z

    bit 0, e
    jr z, jr_006_4f7c

    ld hl, sp+$09
    ld a, [hl]
    ld [bc], a

jr_006_4f7c:
    srl e
    inc bc
    jr jr_006_4f71

_vm_input_detach:
    ld bc, _INPUT_SLOTS
    ld hl, sp+$08
    ld e, [hl]

jr_006_4f87:
    ld a, e
    or a
    ret z

    bit 0, e
    jr z, jr_006_4f90

    xor a
    ld [bc], a

jr_006_4f90:
    srl e
    inc bc
    jr jr_006_4f87

_vm_input_get:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_4fb1

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
    jr jr_006_4fb5

jr_006_4fb1:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_006_4fb5:
    ld c, l
    ld b, h
    ld hl, sp+$0a
    ld e, [hl]
    ld hl, $c617
    ld d, $00
    add hl, de
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_fade:
    ld hl, sp+$08
    ld b, [hl]
    ld a, b
    and $01
    ld c, $00
    bit 1, b
    jr z, jr_006_4fe8

    or c
    jr z, jr_006_4fe0

    ld e, $07
    ld hl, _fade_in_modal
    jp RST_08


jr_006_4fe0:
    ld e, $07
    ld hl, _fade_in
    jp RST_08


jr_006_4fe8:
    or c
    jr z, jr_006_4ff3

    ld e, $07
    ld hl, _fade_out_modal
    jp RST_08


jr_006_4ff3:
    ld e, $07
    ld hl, _fade_out
    jp RST_08

_vm_timer_prepare:
    ld bc, $c5f0
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    ld e, l
    ld d, h
    add hl, hl
    add hl, hl
    add hl, de
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    inc de
    inc de
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    inc bc
    inc bc
    inc bc
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_timer_set:
    ld bc, $c604
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$09
    ld a, [hl]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret

_vm_timer_stop:
    ld bc, $c604
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    add hl, hl
    add hl, bc
    ld [hl], $00
    ret

_vm_timer_reset:
    ld bc, $c604
    ld hl, sp+$08
    ld a, [hl]
    dec a
    ld e, a
    rlca
    ld a, e
    and $03
    ld l, a
    ld h, $00
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    inc bc
    ld a, [hl]
    ld [bc], a
    ret

_vm_get_tile_xy:
    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$0f
    bit 7, [hl]
    jr z, jr_006_5092

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_5096

jr_006_5092:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_006_5096:
    ld a, l
    ld c, h
    ld hl, sp+$02
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_50b4

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_006_50b9

jr_006_50b4:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_006_50b9:
    ld b, h
    ld hl, sp+$04
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$12
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_50d6

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_50da

jr_006_50d6:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_006_50da:
    ld a, [hl]
    push af
    inc sp
    ld a, [$c532]
    push af
    inc sp
    call Call_000_355d
    pop hl
    ld c, e
    ld b, d
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld h, $00
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c529
    ld d, [hl]
    ld a, c
    ld hl, $c52a
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    push de
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    ld c, e
    ld b, $00
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $06
    ret

_vm_replace_tile:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$12
    bit 7, [hl]
    jr z, jr_006_5149

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_514d

jr_006_5149:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_006_514d:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_516e

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_006_5173

jr_006_516e:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_006_5173:
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0e
    ld h, [hl]
    push hl
    inc sp
    push bc
    ld hl, sp+$16
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _SetBankedBkgData
    add sp, $09
    ret

_vm_poll:
    add sp, -$07
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$10
    bit 7, [hl]
    jr z, jr_006_51da

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_006_51de

jr_006_51da:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_006_51de:
    ld a, l
    ld c, h
    ld hl, sp+$04
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_51fc

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_006_5201

jr_006_51fc:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_006_5201:
    ld b, h
    ld hl, sp+$13
    ld e, [hl]
    bit 0, e
    jr z, jr_006_5229

    ld a, [_FRAME_JOY]
    ld hl, _LAST_JOY
    sub [hl]
    jr z, jr_006_5229

    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, $01
    ld [hl+], a
    ld [hl], $00
    ld hl, _FRAME_JOY
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jr jr_006_5276

jr_006_5229:
    bit 1, e
    jr z, jr_006_5253

    push bc
    ld e, $09
    ld hl, $4219
    call RST_08
    ld a, e
    pop bc
    ld hl, sp+$06
    ld [hl], a
    or a
    jr z, jr_006_5253

    dec hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, $02
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$06
    ld e, [hl]
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jr jr_006_5276

jr_006_5253:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    add $fa
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_006_5276:
    add sp, $07
    ret

_vm_set_sprite_mode:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_5286

    ldh a, [rLCDC]
    or $04
    ldh [rLCDC], a
    ret


jr_006_5286:
    ldh a, [rLCDC]
    and $fb
    ldh [rLCDC], a
    ret

_vm_replace_tile_xy:
    add sp, -$03
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_52ab

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
    jr jr_006_52af

jr_006_52ab:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_006_52af:
    ld c, [hl]
    push bc
    ld hl, sp+$0e
    ld a, [hl]
    push af
    inc sp
    ld a, [$c532]
    push af
    inc sp
    call Call_000_355d
    pop hl
    pop bc
    ld hl, sp+$0b
    ld a, [hl]
    ld b, $00
    add e
    ld e, a
    ld a, b
    adc d
    ld d, a
    ld hl, $c529
    ld b, [hl]
    ld a, e
    ld hl, $c52a
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld b, e
    ld hl, sp+$00
    ld [hl], b
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, c
    ld h, $00
    inc de
    inc de
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld c, l
    ld e, h
    ld a, [$c53c]
    sub $05
    jr nz, jr_006_5355

    ld a, b
    sub $80
    jr nc, jr_006_532f

    ld a, $09
    ld hl, sp+$0c
    sub [hl]
    jr nc, jr_006_5310

    ld hl, sp+$01
    xor a
    ld [hl+], a
    ld [hl], $80
    jr jr_006_5316

jr_006_5310:
    ld hl, sp+$01
    xor a
    ld [hl+], a
    ld [hl], $90

jr_006_5316:
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    ld d, h
    push de
    ld e, a
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    pop de
    ld b, l
    ld a, h
    ld l, b
    jr jr_006_5340

jr_006_532f:
    ld a, b
    ld b, $00
    add $80
    ld l, a
    ld a, b
    adc $ff
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, h
    add $88

jr_006_5340:
    ld b, e
    ld e, l
    ld hl, sp+$0d
    ld h, [hl]
    push hl
    inc sp
    ld hl, $0010
    push hl
    push bc
    ld d, a
    push de
    call _MemcpyVRAMBanked
    add sp, $07
    jr jr_006_5368

jr_006_5355:
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    ld d, e
    ld e, c
    push de
    ld a, $01
    push af
    inc sp
    push bc
    inc sp
    call _SetBankedBkgData
    add sp, $05

jr_006_5368:
    add sp, $03
    ret

_vm_rumble:
    ld hl, _current_ram_bank
    ld c, [hl]
    res 5, c
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_5382

    set 5, c
    ld hl, _current_ram_bank
    ld [hl], c
    ld hl, $4000
    ld [hl], c
    ret

jr_006_5382:
    ld hl, _current_ram_bank
    ld [hl], c
    ld hl, $4000
    ld [hl], c
    ret

_vm_load_tileset:
    ld hl, sp+$0a
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0c
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    call _SetBankedBkgData
    add sp, $05
    ret


    add sp, -$09
    ld hl, sp+$11
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_006_53bf

    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    jr jr_006_53c4

jr_006_53bf:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_006_53c4:
    ld b, h
    ld a, [bc]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$04
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$13
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
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$06
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$08
    ld [hl], a
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$06
    ld a, [hl+]
    inc hl
    ld h, [hl]
    push hl
    inc sp
    push bc
    push af
    inc sp
    ld hl, sp+$07
    ld a, [hl]
    push af
    inc sp
    call _SetBankedBkgData
    add sp, $0e
    ret