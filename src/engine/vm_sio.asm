; Load at bank 6 0x5433

_vm_sio_set_mode:
    ld hl, _exchange_state
    ld [hl], $0f
    ld hl, sp+$08
    ld a, [hl]
    ld hl, _link_operation_mode
    ld [hl], a
    sub $02
    jp z, _SIO_receive

    ret


    ret

_vm_sio_exchange:
    add sp, -$15
    ld a, [_link_operation_mode]
    or a
    jr nz, jr_006_5456

    ld hl, _exchange_state
    ld [hl], $0f
    jp Jump_006_579c


jr_006_5456:
    ld a, [_exchange_state]
    sub $0f
    jr nz, jr_006_5462

    ld hl, _exchange_state
    ld [hl], $00

jr_006_5462:
    ld a, [_exchange_state]
    ld hl, sp+$14
    ld [hl], a
    ld a, $20
    ld hl, sp+$21
    sub [hl]
    ld a, $00
    rla
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    rlca
    and $01
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$1c
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$1d
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    ld hl, sp+$05
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld a, [_exchange_state]
    or $02
    ld hl, sp+$06
    ld [hl], a
    ld a, [_exchange_state]
    or $04
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$20
    ld a, [hl]
    rlca
    and $01
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$1f
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$20
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$14
    ld a, [hl]
    and $01
    ld hl, sp+$0b
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0f
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    and $02
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$14
    ld a, [hl]
    and $04
    ld hl, sp+$11
    ld [hl+], a
    xor a
    ld [hl+], a
    inc hl
    ld a, [hl-]
    and $08
    ld [hl+], a
    ld [hl], $00
    ld a, [_link_operation_mode]
    dec a
    jr z, jr_006_550c

    ld a, [_link_operation_mode]
    sub $02
    jp z, Jump_006_5606

    jp Jump_006_575b


jr_006_550c:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_558a

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_551c

    ld hl, sp+$21
    ld [hl], $20

jr_006_551c:
    ld hl, $c819
    ld [hl], $00
    ld hl, $c81d
    ld [hl], $00
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_006_5540

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_006_554b

jr_006_5540:
    ld bc, $cb98
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h

jr_006_554b:
    ld hl, sp+$21
    ld e, [hl]
    ld d, $00
    push de
    push bc
    ld de, $c7f6
    push de
    call _memcpy
    add sp, $06
    ld hl, $c81b
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    ld hl, sp+$21
    ld a, [hl]
    ld [$c81a], a
    ld hl, $c61f
    ld [hl], $00
    push af
    inc sp
    call _SIO_send_byte
    inc sp
    ld a, [$c81a]
    or a
    ld a, $01
    jr z, jr_006_557d

    xor a

jr_006_557d:
    ld [$c81d], a
    ld hl, _exchange_state
    ld a, [hl]
    or $01
    ld [hl], a
    jp Jump_006_575b


jr_006_558a:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_55a0

    ld a, [$c81d]
    or a
    jp z, Jump_006_575b

    ld hl, sp+$06
    ld a, [hl]
    ld [_exchange_state], a
    jp Jump_006_575b


jr_006_55a0:
    ld hl, sp+$12
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_55b6

    ld a, [$c819]
    or a
    jp z, Jump_006_575b

    ld hl, sp+$07
    ld a, [hl]
    ld [_exchange_state], a
    jp Jump_006_575b


jr_006_55b6:
    ld hl, sp+$14
    ld a, [hl-]
    or [hl]
    jp nz, Jump_006_575b

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_55c7

    ld hl, sp+$21
    ld [hl], $20

jr_006_55c7:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_55e1

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_006_55ec

jr_006_55e1:
    ld bc, $cb98
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h

jr_006_55ec:
    ld hl, sp+$21
    ld e, [hl]
    ld d, $00
    push de
    ld de, $c7f6
    push de
    push bc
    call _memcpy
    add sp, $06
    ld hl, _exchange_state
    ld a, [hl]
    or $08
    ld [hl], a
    jp Jump_006_575b


Jump_006_5606:
    ld hl, sp+$12
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_561f

    ld hl, $c819
    ld [hl], $00
    ld hl, $c81d
    ld [hl], $00
    ld hl, sp+$07
    ld a, [hl]
    ld [_exchange_state], a
    jp Jump_006_575b


jr_006_561f:
    ld hl, sp+$14
    ld a, [hl-]
    or [hl]
    jp nz, Jump_006_56a5

    ld a, [$c819]
    or a
    jp z, Jump_006_575b

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_5637

    ld hl, sp+$21
    ld [hl], $20

jr_006_5637:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_006_565e

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$13
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$13
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$12
    ld [hl], a
    jr jr_006_5679

jr_006_565e:
    ld de, $cb98
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl-]
    dec hl
    ld [hl], a

jr_006_5679:
    ld hl, sp+$11
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$11
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld de, $c7f6
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _memcpy
    add sp, $06
    ld hl, _exchange_state
    ld a, [hl]
    or $08
    ld [hl], a
    jp Jump_006_575b


Jump_006_56a5:
    ld hl, sp+$0c
    ld a, [hl-]
    or [hl]
    jp nz, Jump_006_5749

    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_56b6

    ld hl, sp+$21
    ld [hl], $20

jr_006_56b6:
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_006_56dd

    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$13
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$13
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$12
    ld [hl], a
    jr jr_006_56f8

jr_006_56dd:
    ld de, $cb98
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl-]
    dec hl
    ld [hl], a

jr_006_56f8:
    ld hl, sp+$11
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$11
    ld [hl+], a
    ld [hl], $00
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    push de
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld de, $c7f6
    push de
    call _memcpy
    add sp, $06
    ld hl, $c81b
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    ld hl, sp+$21
    ld a, [hl]
    ld [$c81a], a
    ld hl, $c61f
    ld [hl], $00
    push af
    inc sp
    call _SIO_send_byte
    inc sp
    ld a, [$c81a]
    or a
    ld a, $01
    jr z, jr_006_573d

    xor a

jr_006_573d:
    ld [$c81d], a
    ld hl, _exchange_state
    ld a, [hl]
    or $01
    ld [hl], a
    jr jr_006_575b

Jump_006_5749:
    ld hl, sp+$10
    ld a, [hl-]
    or [hl]
    jr nz, jr_006_575b

    ld a, [$c81d]
    or a
    jr z, jr_006_575b

    ld hl, sp+$06
    ld a, [hl]
    ld [_exchange_state], a

Jump_006_575b:
jr_006_575b:
    ld a, [_exchange_state]
    sub $0f
    jr z, jr_006_579c

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld de, $0006
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld hl, sp+$14
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$13
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01

Jump_006_579c:
jr_006_579c:
    add sp, $15
    ret