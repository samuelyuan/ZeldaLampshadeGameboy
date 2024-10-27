; Loaded at bank 6 0x4b7e

_trigger_reset:
    ld hl, _last_trigger_tx
    ld [hl], $00
    ld hl, _last_trigger_ty
    ld [hl], $00
    ld hl, _last_trigger
    ld [hl], $ff
    ret

_trigger_interact:
    ld bc, _triggers
    ld hl, sp+$06
    ld e, [hl]
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    ld a, [hl]
    rrca
    ret nc

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0001
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    ret

_trigger_activate_at:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr nz, jr_006_4be8

    dec hl
    dec hl
    ld a, [hl]
    ld hl, _last_trigger_tx
    sub [hl]
    jr nz, jr_006_4be8

    ld hl, sp+$07
    ld a, [hl]
    ld hl, _last_trigger_ty
    sub [hl]
    jr nz, jr_006_4be8

    ld e, a
    ret


jr_006_4be8:
    ld hl, sp+$07
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    push de
    ld e, $06
    ld hl, _trigger_at_tile
    call RST_08
    pop hl
    ld b, e
    ld hl, sp+$06
    ld a, [hl]
    ld [_last_trigger_tx], a
    ld hl, sp+$07
    ld a, [hl]
    ld [_last_trigger_ty], a
    ld a, b
    inc a
    jr z, jr_006_4c16

    push bc
    inc sp
    ld e, $06
    ld hl, _trigger_interact
    call RST_08
    inc sp
    ld e, $01
    ret


jr_006_4c16:
    ld e, $00
    ret

_trigger_at_intersection:
    add sp, -$09
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$08
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld e, c
    ld d, b
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, de
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    push hl
    ld a, l
    ld hl, sp+$02
    ld [hl], a
    pop hl
    ld l, c
    ld h, b
    inc hl
    ld a, [hl]
    ld l, a
    rlca
    sbc a
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
    ld hl, sp+$01
    ld [hl], e
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld e, a
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld l, c
    ld h, b
    inc hl
    inc hl
    ld a, [hl]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, de
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    ld l, a
    rlca
    sbc a
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
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld [hl], $00
    ld c, [hl]

jr_006_4ccd:
    ld a, [$da31]
    sub c
    jr z, jr_006_4d29

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    add $21
    ld e, a
    ld a, h
    adc $c8
    ld d, a
    ld a, [de]
    ld hl, sp+$05
    ld [hl], a
    ld l, e
    ld h, d
    inc hl
    push af
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld a, [hl+]
    ld [hl], a
    pop af
    ld l, e
    ld h, d
    inc hl
    inc hl
    ld l, [hl]
    add l
    dec a
    ld hl, sp+$08
    ld [hl-], a
    dec hl
    inc de
    inc de
    inc de
    ld a, [de]
    add [hl]
    inc hl
    inc hl
    ld b, a
    dec b
    ld a, [hl]
    ld hl, sp+$00
    sub [hl]
    jr c, jr_006_4d23

    inc hl
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jr c, jr_006_4d23

    ld a, b
    ld hl, sp+$02
    sub [hl]
    jr c, jr_006_4d23

    inc hl
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr c, jr_006_4d23

    ld hl, sp+$04
    ld e, [hl]
    jr jr_006_4d2b

jr_006_4d23:
    inc c
    ld hl, sp+$04
    ld [hl], c
    jr jr_006_4ccd

jr_006_4d29:
    ld e, $ff

jr_006_4d2b:
    add sp, $09
    ret

_trigger_activate_at_intersection:
    add sp, -$04
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $06
    ld hl, _trigger_at_intersection ; jumps to bank 6: 0x4c19
    call RST_08
    add sp, $04
    ld hl, sp+$00
    ld [hl], e
    ld c, $00
    ld a, [_last_trigger]
    ld hl, sp+$00
    sub [hl]
    ld a, $01
    jr z, jr_006_4d56

    xor a

jr_006_4d56:
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    or a
    jr nz, jr_006_4d6a

    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_006_4d6a

    ld e, $00
    jp Jump_006_4e6d


jr_006_4d6a:
    ld hl, sp+$00
    ld a, [hl]
    inc a
    ld a, $01
    jr z, jr_006_4d73

    xor a

jr_006_4d73:
    ld e, a
    ld hl, sp+$00
    ld a, [hl+]
    inc hl
    ld b, $00
    add a
    rl b
    add a
    rl b
    add a
    rl b
    ld [hl+], a
    ld [hl], b
    ld a, [_last_trigger]
    inc a
    jp z, Jump_006_4e22

    ld a, e
    or a
    jr nz, jr_006_4d97

    ld hl, sp+$01
    bit 0, [hl]
    jp nz, Jump_006_4e22

jr_006_4d97:
    bit 0, e
    jr nz, jr_006_4dd8

    ld de, _triggers
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    ld a, [hl]
    rrca
    jr nc, jr_006_4dd8

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0001
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    ld c, $01

jr_006_4dd8:
    ld de, _triggers
    ld hl, _last_trigger
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    bit 1, [hl]
    jr z, jr_006_4e19

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0002
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    ld c, $01

jr_006_4e19:
    ld hl, sp+$00
    ld a, [hl]
    ld [_last_trigger], a
    ld e, c
    jr jr_006_4e6d

Jump_006_4e22:
    ld hl, sp+$00
    ld a, [hl]
    ld [_last_trigger], a
    bit 0, e
    jr nz, jr_006_4e6b

    ld de, _triggers
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld hl, $0007
    add hl, de
    ld a, [hl]
    rrca
    jr nc, jr_006_4e6b

    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [bc]
    ld bc, $0001
    push bc
    ld h, $01
    push hl
    inc sp
    ld bc, $0000
    push bc
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    ld e, $01
    jr jr_006_4e6d

jr_006_4e6b:
    ld e, $00

Jump_006_4e6d:
jr_006_4e6d:
    add sp, $04
    ret

_trigger_at_tile:
    add sp, -$08
    ld hl, sp+$00
    ld [hl], $00
    ld c, [hl]

Jump_006_4e77:
    ld a, [_TRIGGERS_LEN]
    sub c
    jp z, Jump_006_4efb

    ld l, c
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, l
    add $21
    ld e, a
    ld a, h
    adc $c8
    ld d, a
    ld a, [de]
    ld b, a
    ld l, e
    ld h, d
    inc hl
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld l, e
    ld h, d
    inc hl
    inc hl
    ld a, [hl]
    add b
    dec a
    ld hl, sp+$02
    ld [hl-], a
    inc de
    inc de
    inc de
    ld a, [de]
    add [hl]
    inc hl
    inc hl
    dec a
    ld [hl], a
    ld hl, sp+$0e
    ld e, [hl]
    ld d, $00
    inc de
    ld hl, sp+$04
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$04
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_006_4ed1

    bit 7, d
    jr nz, jr_006_4ed6

    cp a
    jr jr_006_4ed6

jr_006_4ed1:
    bit 7, d
    jr z, jr_006_4ed6

    scf

jr_006_4ed6:
    jr c, jr_006_4ef4

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr c, jr_006_4ef4

    inc hl
    ld a, [hl]
    ld hl, sp+$01
    sub [hl]
    jr c, jr_006_4ef4

    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$0f
    sub [hl]
    jr c, jr_006_4ef4

    ld hl, sp+$00
    ld e, [hl]
    jr jr_006_4efd

jr_006_4ef4:
    inc c
    ld hl, sp+$00
    ld [hl], c
    jp Jump_006_4e77


Jump_006_4efb:
    ld e, $ff

jr_006_4efd:
    add sp, $08
    ret