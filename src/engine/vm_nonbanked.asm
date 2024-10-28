_vm_switch:
    add sp, -$0a
    ld hl, sp+$10
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
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$13
    bit 7, [hl]
    jr z, jr_000_28eb

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_000_28f8

jr_000_28eb:
    ld hl, $cb98
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_000_28f8:
    ld hl, sp+$15
    ld a, [hl]
    or a
    jr z, jr_000_291e

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$15
    ld e, [hl]
    ld d, $00
    ld l, e
    ld h, d
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    inc hl
    ld [hl], b

jr_000_291e:
    ldh a, [$90]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$04
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a

jr_000_294e:
    ld hl, sp+$09
    ld a, [hl]
    or a
    jr z, jr_000_299b

    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nz, jr_000_298f

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$08
    sub [hl]
    jr nz, jr_000_298f

    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$02
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    jr jr_000_29b2

jr_000_298f:
    inc bc
    inc bc
    ld hl, sp+$05
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$09
    dec [hl]
    jr jr_000_294e

jr_000_299b:
    ld hl, sp+$02
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    ld hl, sp+$05
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_000_29b2:
    add sp, $0a
    ret

_vm_beginthread:
    add sp, -$10
    ld hl, sp+$1b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_000_29d3

    ld hl, sp+$16
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_000_29d7

jr_000_29d3:
    ld hl, $cb98
    add hl, bc

jr_000_29d7:
    xor a
    push af
    inc sp
    push hl
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    push de
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    push de
    ld hl, sp+$1d
    ld a, [hl]
    or a
    jp z, Jump_000_2ad7

    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_2ad7

    inc hl
    inc hl
    ldh a, [$90]
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$17
    ld a, [hl]
    ld hl, sp+$04
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld hl, sp+$1d
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$1c
    ld a, [hl]
    ld hl, sp+$06
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld de, $cb98
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$09
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl], a

jr_000_2a57:
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr z, jr_000_2acd

    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [hl+]
    bit 7, [hl]
    jr z, jr_000_2a81

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    jr jr_000_2a8a

jr_000_2a81:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]

jr_000_2a8a:
    ld hl, sp+$0b
    ld [hl], c
    inc hl
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0d
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc de
    inc de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0f
    dec [hl]
    jr jr_000_2a57

jr_000_2acd:
    ld hl, sp+$02
    ld a, [hl]
    ldh [$90], a
    ld de, $2000

Jump_000_2ad5:
    ld a, [hl]
    ld [de], a

Jump_000_2ad7:
    add sp, $10
    ret

_vm_rpn:
    add sp, -$0d
    ldh a, [$90]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$02
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
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
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

Jump_000_2b15:
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, sp+$01
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
    ld a, [de]
    ld [hl], a
    bit 7, [hl]
    jp z, Jump_000_2d43

    ld a, [hl]
    sub $fb
    jr z, jr_000_2b60

    ld hl, sp+$0c
    ld a, [hl]
    sub $fc
    jp z, Jump_000_2bca

    ld hl, sp+$0c
    ld a, [hl]
    sub $fd
    jp z, Jump_000_2c53

    ld hl, sp+$0c
    ld a, [hl]
    sub $fe
    jp z, Jump_000_2cbb

    ld hl, sp+$0c
    ld a, [hl]
    inc a
    jp z, Jump_000_2cf0

    jp Jump_000_2d21


jr_000_2b60:
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    bit 7, b
    jr z, jr_000_2b87

    sla c
    rl b
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$0d
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0c
    ld [hl], a
    jr jr_000_2b96

jr_000_2b87:
    sla c
    rl b
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$0b
    ld [hl], c
    inc hl
    ld [hl], a

jr_000_2b96:
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    dec bc
    dec bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld l, c
    ld h, b
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
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_2bca:
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    bit 7, b
    jr z, jr_000_2be9

    sla c
    rl b
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_000_2bf2

jr_000_2be9:
    ld l, c
    ld h, b
    add hl, hl
    ld de, $cb98
    add hl, de
    ld c, l
    ld b, h

jr_000_2bf2:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$09
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    bit 7, b
    jr z, jr_000_2c1d

    sla c
    rl b
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$0d
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0c
    ld [hl], a
    jr jr_000_2c2c

jr_000_2c1d:
    ld a, c
    add a
    rl b
    add $98
    ld c, a
    ld a, b
    adc $cb
    ld hl, sp+$0b
    ld [hl], c
    inc hl
    ld [hl], a

jr_000_2c2c:
    ld hl, sp+$0b
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
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2d2e


Jump_000_2c53:
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$09
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    bit 7, b
    jr z, jr_000_2c86

    sla c
    rl b
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$0d
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0c
    ld [hl], a
    jr jr_000_2c95

jr_000_2c86:
    ld a, c
    add a
    rl b
    add $98
    ld c, a
    ld a, b
    adc $cb
    ld hl, sp+$0b
    ld [hl], c
    inc hl
    ld [hl], a

jr_000_2c95:
    ld hl, sp+$0b
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
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_2d2e

Jump_000_2cbb:
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
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
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_2d2e

Jump_000_2cf0:
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, sp+$01
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
    ld a, [de]
    ld c, a
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, c
    rlca
    sbc a
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_000_2d2e

Jump_000_2d21:
    ld hl, sp+$00
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    jp Jump_000_3219


Jump_000_2d2e:
jr_000_2d2e:
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_2d43:
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld de, $0004
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld hl, sp+$08
    ld [hl-], a
    ld a, e
    ld [hl+], a
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl+], a
    inc hl
    ld a, [hl]
    dec a
    jp z, Jump_000_2ed5

    ld hl, sp+$0c
    ld a, [hl]
    sub $02
    jp z, Jump_000_2f01

    ld hl, sp+$0c
    ld a, [hl]
    sub $03
    jp z, Jump_000_2f3b

    ld hl, sp+$0c
    ld a, [hl]
    sub $04
    jp z, Jump_000_2f77

    ld hl, sp+$0c
    ld a, [hl]
    sub $05
    jp z, Jump_000_2fb1

    ld hl, sp+$0c
    ld a, [hl]
    sub $06
    jp z, Jump_000_2fed

    ld hl, sp+$0c
    ld a, [hl]
    sub $07
    jp z, Jump_000_301b

    ld hl, sp+$0c
    ld a, [hl]
    sub $08
    jp z, Jump_000_3047

    ld hl, sp+$0c
    ld a, [hl]
    sub $09
    jp z, Jump_000_307c

    ld hl, sp+$0c
    ld a, [hl]
    sub $25
    jp z, Jump_000_2eae

    ld hl, sp+$0c
    ld a, [hl]
    sub $26
    jp z, Jump_000_3097

    ld hl, sp+$0c
    ld a, [hl]
    sub $2a
    jp z, Jump_000_2e60

    ld hl, sp+$0c
    ld a, [hl]
    sub $2b
    jr z, jr_000_2e1b

    ld hl, sp+$0c
    ld a, [hl]
    sub $2d
    jr z, jr_000_2e3c

    ld hl, sp+$0c
    ld a, [hl]
    sub $2f
    jp z, Jump_000_2e87

    ld hl, sp+$0c
    ld a, [hl]
    sub $40
    jp z, Jump_000_31a6

    ld hl, sp+$0c
    ld a, [hl]
    sub $4d
    jp z, Jump_000_315b

    ld hl, sp+$0c
    ld a, [hl]
    sub $51
    jp z, Jump_000_31db

    ld hl, sp+$0c
    ld a, [hl]
    sub $5e
    jp z, Jump_000_30df

    ld hl, sp+$0c
    ld a, [hl]
    sub $6d
    jp z, Jump_000_3103

    ld hl, sp+$0c
    ld a, [hl]
    sub $7c
    jp z, Jump_000_30bb

    ld hl, sp+$0c
    ld a, [hl]
    sub $7e
    jp z, Jump_000_31c2

    jp Jump_000_31f8


jr_000_2e1b:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
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
    ld b, h
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


jr_000_2e3c:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2e60:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    push hl
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2e87:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    push hl
    push bc
    call Call_000_388c
    add sp, $04
    ld c, e
    ld b, d
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2eae:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    push hl
    push bc
    call _modsint
    add sp, $04
    ld c, e
    ld b, d
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2ed5:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, l
    sub c
    jr nz, jr_000_2ef2

    ld a, h
    sub b
    ld a, $01
    jr z, jr_000_2ef3

jr_000_2ef2:
    xor a

jr_000_2ef3:
    ld c, a
    ld b, $00
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2f01:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, h
    ld d, b
    ld a, c
    sub l
    ld a, b
    sbc h
    bit 7, e
    jr z, jr_000_2f25

    bit 7, d
    jr nz, jr_000_2f2a

    cp a
    jr jr_000_2f2a

jr_000_2f25:
    bit 7, d
    jr z, jr_000_2f2a

    scf

jr_000_2f2a:
    ld a, $00
    rla
    ld c, a
    ld b, $00
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2f3b:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, b
    ld d, h
    ld a, l
    sub c
    ld a, h
    sbc b
    bit 7, e
    jr z, jr_000_2f5f

    bit 7, d
    jr nz, jr_000_2f64

    cp a
    jr jr_000_2f64

jr_000_2f5f:
    bit 7, d
    jr z, jr_000_2f64

    scf

jr_000_2f64:
    ld a, $00
    rla
    xor $01
    ld c, a
    ld b, $00
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2f77:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, b
    ld d, h
    ld a, l
    sub c
    ld a, h
    sbc b
    bit 7, e
    jr z, jr_000_2f9b

    bit 7, d
    jr nz, jr_000_2fa0

    cp a
    jr jr_000_2fa0

jr_000_2f9b:
    bit 7, d
    jr z, jr_000_2fa0

    scf

jr_000_2fa0:
    ld a, $00
    rla
    ld c, a
    ld b, $00
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2fb1:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, h
    ld d, b
    ld a, c
    sub l
    ld a, b
    sbc h
    bit 7, e
    jr z, jr_000_2fd5

    bit 7, d
    jr nz, jr_000_2fda

    cp a
    jr jr_000_2fda

jr_000_2fd5:
    bit 7, d
    jr z, jr_000_2fda

    scf

jr_000_2fda:
    ld a, $00
    rla
    xor $01
    ld c, a
    ld b, $00
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_2fed:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, l
    sub c
    jr nz, jr_000_300a

    ld a, h
    sub b
    ld a, $01
    jr z, jr_000_300b

jr_000_300a:
    xor a

jr_000_300b:
    xor $01
    ld c, a
    ld b, $00
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_301b:
    ld hl, sp+$07
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    or l
    jr z, jr_000_3037

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_000_3030:
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    or l
    jr nz, jr_000_303b

jr_000_3037:
    ld e, $00
    jr jr_000_303d

jr_000_303b:
    ld e, $01

jr_000_303d:
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jp Jump_000_3204


Jump_000_3047:
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    or c
    jr nz, jr_000_306d

    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    or c
    jr nz, jr_000_306d

    ld c, a
    jr jr_000_306f

jr_000_306d:
    ld c, $01

jr_000_306f:
    ld b, $00
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_307c:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    or c
    sub $01
    ld a, $00
    rla
    ld c, a
    ld b, $00
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_3097:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    push af
    ld a, c
    and l
    ld c, a
    pop af
    and b
    ld b, a
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_30bb:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, c
    or l
    ld c, a
    ld a, b
    or h
    ld b, a
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_30df:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    push af
    ld a, c
    xor l
    ld c, a
    pop af
    xor b
    ld b, a
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_3204


Jump_000_3103:
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, h
    ld d, b
    ld a, c
    sub l
    ld a, b
    sbc h
    bit 7, e
    jr z, jr_000_3133

    bit 7, d
    jr nz, jr_000_3138

    cp a
    jr jr_000_3138

jr_000_3133:
    bit 7, d
    jr z, jr_000_3138

    scf

jr_000_3138:
    jr nc, jr_000_3141

    ld hl, sp+$09
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_314c

jr_000_3141:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_000_314c:
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jp Jump_000_3204


Jump_000_315b:
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, b
    ld d, h
    ld a, l
    sub c
    ld a, h
    sbc b
    bit 7, e
    jr z, jr_000_318b

    bit 7, d
    jr nz, jr_000_3190

    cp a
    jr jr_000_3190

jr_000_318b:
    bit 7, d
    jr z, jr_000_3190

    scf

jr_000_3190:
    jr c, jr_000_319c

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a

jr_000_319c:
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_3204

Jump_000_31a6:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    push bc
    call _abs
    pop hl
    ld c, e
    ld b, d
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_31c2:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    push af
    ld a, c
    cpl
    ld c, a
    pop af
    cpl
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_31db:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    push bc
    call _isqrt
    pop hl
    ld c, e
    ld b, $00
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_31f8:
    ld hl, sp+$00
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    jr jr_000_3219

Jump_000_3204:
jr_000_3204:
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    dec bc
    dec bc
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2b15


Jump_000_3219:
jr_000_3219:
    add sp, $0d
    ret

_vm_get_far:
    add sp, -$03
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_000_3241

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    add c
    ld c, a
    ld a, l
    adc b
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_000_324c

jr_000_3241:
    ld hl, $cb98
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], a

jr_000_324c:
    ldh a, [$90]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl-]
    ld [de], a
    ld a, [hl]
    or a
    jr nz, jr_000_326a

    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    ld c, a
    ld b, $00
    jr jr_000_3274

jr_000_326a:
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_000_3274:
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$02
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    add sp, $03
    ret

_vm_call_native:
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call RST_08
    add sp, $02
    ret

_VM_STEP:
Call_000_3299:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ldh a, [$90]
    push af
    ld a, e
    ldh [$90], a
    ld [$2000], a
    ld a, [hl+]
    ld e, a
    or a
    jr z, jr_000_3300

    push bc
    push hl
    ld h, $00
    ld l, e
    add hl, hl
    add hl, hl
    dec hl
    ld de, $035f
    add hl, de
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld [$cb97], a
    ld a, [hl-]
    ld b, a
    ld c, [hl]
    pop hl
    ld d, e
    srl d
    jr nc, jr_000_32d1

    ld a, [hl+]

Jump_000_32cf:
    push af
    inc sp

jr_000_32d1:
    jr z, jr_000_32dc

jr_000_32d3:
    ld a, [hl+]
    push af
    inc sp
    ld a, [hl+]
    push af
    inc sp
    dec d
    jr nz, jr_000_32d3

jr_000_32dc:
    push bc
    ld b, h
    ld c, l
    ld hl, sp+$08
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld c, l
    ld a, h
    inc hl
    ld [hl], b
    ld b, a
    pop hl
    push bc
    push de
    push de
    ld a, [$cb97]
    ldh [$90], a
    ld [$2000], a
    rst $20
    pop hl
    add hl, sp
    ld sp, hl
    add sp, $04
    pop bc
    ld e, $01

jr_000_3300:
    pop af
    ldh [$90], a
    ld [$2000], a
    ret


_script_runner_update: ; 0x3307
    dec sp
    dec sp
    ld a, [$cb90]
    or a
    jr nz, jr_000_3320

    ld hl, $cb8c
    ld [hl+], a
    ld [hl], a
    ld a, [$cb88]
    ld [$cb8e], a
    ld a, [$cb89]
    ld [$cb8f], a

jr_000_3320:
    ld hl, $d99c

Call_000_3323:
    ld [hl], $01
    ld hl, $d99d
    ld [hl], $10

Jump_000_332a:
    ld hl, $cb8f
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_345b

    ld hl, $cb92
    ld [hl], $00
    ld hl, $cb8e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $00
    ld hl, $cb8e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000f
    add hl, bc
    ld a, [hl]
    or a
    jr nz, jr_000_3367

    ld hl, $cb8e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_3299
    pop hl
    ld a, e
    ld hl, $cb8e
    ld c, [hl]
    inc hl
    ld b, [hl]
    or a
    jp nz, Jump_000_340f

jr_000_3367:
    ld hl, $0011
    add hl, bc
    ld e, [hl]
    ld hl, $cb90
    ld a, [hl]
    sub e
    ld [hl], a
    ld hl, $000d
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, b
    or c
    jr z, jr_000_338a

    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    set 7, d
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a

jr_000_338a:
    ld hl, $cb8d
    ld a, [hl-]
    or [hl]
    jr z, jr_000_33ad

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    inc sp
    inc sp
    push bc
    ld hl, $cb8e
    ld l, [hl]
    ld a, [$cb8f]
    ld h, a
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_000_33ad:
    ld hl, $cb8e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, [$cb88]
    ld hl, $cb8e
    sub [hl]
    jr nz, jr_000_33d2

    ld a, [$cb89]
    ld hl, $cb8f
    sub [hl]
    jr nz, jr_000_33d2

    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $cb88
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_000_33d2:
    ld hl, $cb8a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld a, [$cb8e]
    ld [$cb8a], a
    ld a, [$cb8f]
    ld [$cb8b], a
    ld hl, $cb8d
    ld a, [hl-]
    or [hl]
    jr z, jr_000_3400

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $cb8e
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_000_332a


jr_000_3400:
    ld a, [$cb88]
    ld [$cb8e], a
    ld a, [$cb89]
    ld [$cb8f], a
    jp Jump_000_332a


Jump_000_340f:
    ld a, [$cb92]
    or a
    jr z, jr_000_3419

    ld e, $03
    jr jr_000_346f

jr_000_3419:
    ld hl, $0010
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    or a
    jr nz, jr_000_3434

    ld a, [$d99d]
    ld hl, sp+$01
    ld [hl], a
    ld hl, $d99d
    dec [hl]
    ld hl, sp+$01
    ld a, [hl]
    or a
    jp nz, Jump_000_332a

jr_000_3434:
    ld a, [$cb90]
    or a
    jr nz, jr_000_345b

    ld a, [de]
    ld hl, $d99c
    and [hl]
    ld [hl], a
    ld hl, $cb8c
    ld a, c
    ld [hl+], a
    ld [hl], b
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $cb8e
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $d99d
    ld [hl], $10
    jp Jump_000_332a


Jump_000_345b:
jr_000_345b:
    ld hl, $cb89
    ld a, [hl-]
    or [hl]
    jr nz, jr_000_3465

    ld e, a
    jr jr_000_346f

jr_000_3465:
    ld a, [$d99c]
    or a
    ld e, $01
    jr nz, jr_000_346f

    ld e, $02

jr_000_346f:
    inc sp
    inc sp
    ret