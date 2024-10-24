SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

    INCLUDE "src/engine/core.asm"

    INCLUDE "src/engine/gbprinter.asm"

    INCLUDE "src/engine/load_save.asm"

    ld hl, $c919
    ld [hl], $00
    ld hl, $c91a
    ld [hl], $00
    ld hl, $c91b
    ld [hl], $ff
    ret


    ld bc, $c821
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
    ld hl, $61bc
    call RST_08
    add sp, $08
    ret


    ld hl, sp+$08
    ld a, [hl]
    or a
    jr nz, jr_006_4be8

    dec hl
    dec hl
    ld a, [hl]
    ld hl, $c919
    sub [hl]
    jr nz, jr_006_4be8

    ld hl, sp+$07
    ld a, [hl]
    ld hl, $c91a
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
    ld hl, $4e70
    call RST_08
    pop hl
    ld b, e
    ld hl, sp+$06
    ld a, [hl]
    ld [$c919], a
    ld hl, sp+$07
    ld a, [hl]
    ld [$c91a], a
    ld a, b
    inc a
    jr z, jr_006_4c16

    push bc
    inc sp
    ld e, $06
    ld hl, $4b8e
    call RST_08
    inc sp
    ld e, $01
    ret


jr_006_4c16:
    ld e, $00
    ret

_func_bank006_4c19:
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

_func_bank006_4d2e:
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
    ld hl, _func_bank006_4c19 ; jumps to bank 6: 0x4c19
    call RST_08
    add sp, $04
    ld hl, sp+$00
    ld [hl], e
    ld c, $00
    ld a, [$c91b]
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
    ld a, [$c91b]
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

    ld de, $c821
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
    ld de, $c821
    ld hl, $c91b
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
    ld [$c91b], a
    ld e, c
    jr jr_006_4e6d

Jump_006_4e22:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c91b], a
    bit 0, e
    jr nz, jr_006_4e6b

    ld de, $c821
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


    add sp, -$08
    ld hl, sp+$00
    ld [hl], $00
    ld c, [hl]

Jump_006_4e77:
    ld a, [$da31]
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

    INCLUDE "src/engine/vm_gameboy.asm"

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

DimDialogue:: ; bank 6: 0x579f
    INCLUDE "src/scripts/dim.asm"

LampshadeBossApproachMessage:: ; 0x59ef message when you press button next to boss
    db $25
    db $40, $00

    db "Yikes!!!", $00

    db $47, $03, $01, $04, $14, $00, $00
    db $45, $ff, $0e, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $45, $fe, $12, $00
    db $44, $03, $01
    db $00

JTHouseOutsideTileImage::
    db $6c, $00
    INCBIN "gfx/bank006_jthouseoutside_5a16.2bpp"

WellTileImage::
    db $6d, $00
    INCBIN "gfx/bank006_well_60d8.2bpp"

NgHeadquartersOutsideTileImage::
    db $70, $00
    INCBIN "gfx/bank006_ngheadquartersoutside_67aa.2bpp"

DefeatedLampshadeBossScreenTileImage::
    db $4e, $00
    INCBIN "gfx/bank006_defeatedlampshadeboss_6eac.2bpp"

TempleLightInsideTileImage::
    db $6f, $00
    INCBIN "gfx/bank006_templelightinside_738e.2bpp"

GameFinishedScreenTileImage::
    db $58, $00
    INCBIN "gfx/bank006_gamefinished_7a80.2bpp"
