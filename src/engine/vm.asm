; Loaded in bank 2 0x5324

_vm_call:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
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
    ld hl, sp+$02
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
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld hl, sp+$0c
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    add sp, $04
    ret

_vm_ret:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
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
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_002_53c2

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_53c2:
    add sp, $04
    ret

_vm_call_far:
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
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $0002
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld e, l
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    inc bc
    inc bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop bc
    push bc
    inc bc
    inc bc
    ld a, [bc]
    ld hl, sp+$04
    ld [hl+], a
    xor a
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    pop de
    push de
    ld hl, sp+$0f
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    dec hl
    ld [de], a
    ld a, [hl]
    ld [bc], a
    add sp, $06
    ret

_vm_ret_far:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
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
    pop de
    push de
    inc de
    inc de
    ld a, [bc]
    ld [de], a
    dec bc
    dec bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr z, jr_002_54ae

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_54ae:
    add sp, $04
    ret

_vm_push:
    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld b, [hl]
    add $08
    ld c, a
    jr nc, jr_002_54bd

    inc b

jr_002_54bd:
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    push de
    inc de
    inc de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    pop de
    push de
    ld hl, sp+$0a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc sp
    inc sp
    ret

_vm_pop:
    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    inc sp
    inc sp
    push hl
    ld hl, sp+$0a
    ld a, [hl]
    or a
    jr z, jr_002_5507

    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
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
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5507:
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    inc sp
    inc sp
    ret

_vm_loop:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
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
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5552

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
    ld b, h
    jr jr_002_555a

jr_002_5552:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld e, l
    ld d, h
    ld c, e
    ld b, d

jr_002_555a:
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld l, [hl]
    or l
    jr z, jr_002_5579

    pop de
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    dec de
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    jr jr_002_55a0

jr_002_5579:
    ld hl, sp+$10
    ld a, [hl]
    or a
    jr z, jr_002_55a0

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$10
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_55a0:
    add sp, $04
    ret

_vm_jump:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret

_wait_frames:
    add sp, -$06
    ld hl, sp+$0e
    ld a, [hl]
    or a
    jr z, jr_002_55ce

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

jr_002_55ce:
    ld a, [$c0a3]
    ld hl, sp+$00
    ld [hl], a
    ld a, [$c0a4]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$03
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
    pop de
    push de
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld hl, sp+$05
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$04
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_002_5621

    dec hl
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld e, $00
    jr jr_002_5623

jr_002_5621:
    ld e, $01

jr_002_5623:
    add sp, $06
    ret

_vm_invoke:
    add sp, -$0d
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$19
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
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$1a
    bit 7, [hl]
    jr z, jr_002_5665

    ld hl, sp+$04
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
    ld a, h
    jr jr_002_566b

jr_002_5665:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld a, h
    ld c, l

jr_002_566b:
    ld hl, sp+$06
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0007
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$00
    ld a, [hl]
    sub c
    jr nz, jr_002_56c0

    inc hl
    ld a, [hl]
    sub b
    jr nz, jr_002_56c0

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl], a
    ld hl, sp+$15
    ld a, [hl]
    ld hl, sp+$0c
    sub [hl]
    jr z, jr_002_56d5

jr_002_56c0:
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$15
    ld a, [hl]
    ld [de], a
    ld d, $01
    jr jr_002_56d7

jr_002_56d5:
    ld d, $00

jr_002_56d7:
    ld hl, $da07
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$15
    ld a, [hl]
    ld [$da09], a
    ld bc, $3623
    ld hl, sp+$13
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    push af
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    push hl
    push de
    inc sp
    ld d, a
    push de
    ld l, c
    ld h, b
    call Call_000_376c
    add sp, $05
    ld a, e
    or a
    jr z, jr_002_5737

    ld hl, sp+$18
    ld a, [hl]
    or a
    jr z, jr_002_5726

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$18
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$04
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5726:
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld [hl+], a
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    jr jr_002_574f

jr_002_5737:
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
    add $f9
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

jr_002_574f:
    add sp, $0d
    ret

_vm_join:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5786

    ld hl, $0008
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    jr jr_002_578c

jr_002_5786:
    ld de, _SCRIPT_MEMORY
    pop hl
    push hl
    add hl, de

jr_002_578c:
    ld a, [hl+]
    ld h, [hl]
    xor a
    or h
    jr nz, jr_002_57a8

    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    add $fd
    ld e, a
    ld a, h
    adc $ff
    ld d, a
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $0010
    add hl, bc
    ld [hl], $01

jr_002_57a8:
    add sp, $04
    ret

_vm_terminate:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_57c7

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
    jr jr_002_57cb

jr_002_57c7:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_57cb:
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_terminate
    call RST_08
    inc sp
    ret

_vm_if:
    add sp, -$09
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
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
    ld hl, sp+$13
    bit 7, [hl]
    jr z, jr_002_581b

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
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_002_5828

jr_002_581b:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_002_5828:
    ld hl, sp+$14
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5845

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
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    jr jr_002_584c

jr_002_5845:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_584c:
    ld hl, sp+$06
    ld [hl], $00
    ld a, $06
    ld hl, sp+$11
    sub [hl]
    jp c, Jump_002_58e6

    ld hl, sp+$04
    ld a, [hl]
    sub c
    jr nz, jr_002_5865

    inc hl
    ld a, [hl]
    sub b
    ld a, $01
    jr z, jr_002_5866

jr_002_5865:
    xor a

jr_002_5866:
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_002_587c

    bit 7, d
    jr nz, jr_002_5881

    cp a
    jr jr_002_5881

jr_002_587c:
    bit 7, d
    jr z, jr_002_5881

    scf

jr_002_5881:
    ld a, $00
    rla
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$04
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_002_589b

    bit 7, d
    jr nz, jr_002_58a0

    cp a
    jr jr_002_58a0

jr_002_589b:
    bit 7, d
    jr z, jr_002_58a0

    scf

jr_002_58a0:
    ld a, $00
    rla
    ld c, a
    ld hl, sp+$11
    ld e, [hl]
    ld d, $00
    ld hl, $58af
    add hl, de
    add hl, de
    jp hl


    jr jr_002_58e6

    jr jr_002_58bd

    jr jr_002_58c3

    jr jr_002_58ca

    jr jr_002_58d2

    jr jr_002_58d7

    jr jr_002_58e0

jr_002_58bd:
    ld hl, sp+$07
    ld a, [hl-]
    ld [hl], a
    jr jr_002_58e6

jr_002_58c3:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    ld [hl], a
    jr jr_002_58e6

jr_002_58ca:
    ld a, c
    xor $01
    ld hl, sp+$06
    ld [hl], a
    jr jr_002_58e6

jr_002_58d2:
    ld hl, sp+$06
    ld [hl], c
    jr jr_002_58e6

jr_002_58d7:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    xor $01
    ld [hl], a
    jr jr_002_58e6

jr_002_58e0:
    ld hl, sp+$07
    ld a, [hl-]
    xor $01
    ld [hl], a

Jump_002_58e6:
jr_002_58e6:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_002_58f5

    pop de
    push de
    ld hl, sp+$16
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_58f5:
    ld hl, sp+$18
    ld a, [hl]
    or a
    jr z, jr_002_5919

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$18
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5919:
    add sp, $09
    ret

_vm_if_const:
    add sp, -$07
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    pop de
    push de
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
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_002_5959

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
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    jr jr_002_5960

jr_002_5959:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_5960:
    ld hl, sp+$04
    ld [hl], $00
    ld a, $06
    ld hl, sp+$0f
    sub [hl]
    jp c, Jump_002_59fa

    ld hl, sp+$12
    ld a, [hl]
    sub c
    jr nz, jr_002_5979

    inc hl
    ld a, [hl]
    sub b
    ld a, $01
    jr z, jr_002_597a

jr_002_5979:
    xor a

jr_002_597a:
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$12
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_002_5991

    bit 7, d
    jr nz, jr_002_5996

    cp a
    jr jr_002_5996

jr_002_5991:
    bit 7, d
    jr z, jr_002_5996

    scf

jr_002_5996:
    ld a, $00
    rla
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$12
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_002_59af

    bit 7, d
    jr nz, jr_002_59b4

    cp a
    jr jr_002_59b4

jr_002_59af:
    bit 7, d
    jr z, jr_002_59b4

    scf

jr_002_59b4:
    ld a, $00
    rla
    ld c, a
    ld hl, sp+$0f
    ld e, [hl]
    ld d, $00
    ld hl, $59c3
    add hl, de
    add hl, de
    jp hl


    jr jr_002_59fa

    jr jr_002_59d1

    jr jr_002_59d7

    jr jr_002_59de

    jr jr_002_59e6

    jr jr_002_59eb

    jr jr_002_59f4

jr_002_59d1:
    ld hl, sp+$05
    ld a, [hl-]
    ld [hl], a
    jr jr_002_59fa

jr_002_59d7:
    ld hl, sp+$06
    ld a, [hl-]
    dec hl
    ld [hl], a
    jr jr_002_59fa

jr_002_59de:
    ld a, c
    xor $01
    ld hl, sp+$04
    ld [hl], a
    jr jr_002_59fa

jr_002_59e6:
    ld hl, sp+$04
    ld [hl], c
    jr jr_002_59fa

jr_002_59eb:
    ld hl, sp+$06
    ld a, [hl-]
    dec hl
    xor $01
    ld [hl], a
    jr jr_002_59fa

jr_002_59f4:
    ld hl, sp+$05
    ld a, [hl-]
    xor $01
    ld [hl], a

Jump_002_59fa:
jr_002_59fa:
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_002_5a09

    pop de
    push de
    ld hl, sp+$14
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_5a09:
    ld hl, sp+$16
    ld a, [hl]
    or a
    jr z, jr_002_5a2d

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$16
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld a, c
    sub l
    ld c, a
    ld a, b
    sbc h
    ld b, a
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_5a2d:
    add sp, $07
    ret

_vm_push_value:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5a5e

    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_5a64

jr_002_5a5e:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5a64:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
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
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret

_vm_push_value_ind:
    add sp, -$04
    ld hl, sp+$0a
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
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5ab1

    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_5ab7

jr_002_5ab1:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5ab7:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0c
    ld a, c
    ld [hl+], a
    ld [hl], b
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5ad3

    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    jr jr_002_5ad9

jr_002_5ad3:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5ad9:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
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
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret

_vm_push_reference:
    add sp, -$04
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5b30

    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, c
    sub $98
    ld c, a
    ld a, b
    sbc $cb
    ld b, a
    srl b
    rr c
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, [hl]
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    jr jr_002_5b35

jr_002_5b30:
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_5b35:
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
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc bc
    inc bc
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret

_vm_reserve:
    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld b, [hl]
    add $08
    ld c, a
    jr nc, jr_002_5b5a

    inc b

jr_002_5b5a:
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl]
    ld e, a
    rlca
    sbc a
    ld d, a
    sla e
    rl d
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    inc sp
    inc sp
    ret

_vm_set:
    add sp, -$04
    ld hl, sp+$0a
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
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5ba8

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5bb3

jr_002_5ba8:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5bb3:
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5bca

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5bce

jr_002_5bca:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5bce:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret

_vm_set_const:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5bfa

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
    ld c, l
    ld b, h
    jr jr_002_5c00

jr_002_5bfa:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5c00:
    ld hl, sp+$0a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret

_vm_get_tlocal:
    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
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
    ld [hl], a
    ld hl, sp+$0f
    bit 7, [hl]
    jr z, jr_002_5c49

    ld hl, sp+$04
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
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5c54

jr_002_5c49:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d

jr_002_5c54:
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5c6e

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5c87

jr_002_5c6e:
    pop de
    push de
    ld hl, $000a
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

jr_002_5c87:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $06
    ret

_vm_test_terminate:
    ld hl, sp+$08
    ld a, [hl]
    rrca
    jr nc, jr_002_5c9e

    call _wait_vbl_done

jr_002_5c9e:
    ld b, b
    ret


    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], $01
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5cca

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
    ld c, l
    ld b, h
    jr jr_002_5cd0

jr_002_5cca:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5cd0:
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5cfd

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
    ld c, l
    ld b, h
    jr jr_002_5d03

jr_002_5cfd:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5d03:
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret


    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5d38

    ld hl, sp+$08
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
    jr jr_002_5d43

jr_002_5d38:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$00
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5d43:
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    inc sp
    inc sp
    ret


    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5d73

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
    ld c, l
    ld b, h
    jr jr_002_5d79

jr_002_5d73:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5d79:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [bc]
    ld [de], a
    ret


    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5d9f

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
    ld c, l
    ld b, h
    jr jr_002_5da5

jr_002_5d9f:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5da5:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [bc]
    ld [de], a
    ret


    dec sp
    dec sp
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5dcd

    ld hl, sp+$08
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
    ld b, h
    jr jr_002_5dd3

jr_002_5dcd:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld b, h

jr_002_5dd3:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    inc sp
    inc sp
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld [bc], a
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret

_vm_init_rng:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5e1e

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
    ld c, l
    jr jr_002_5e23

jr_002_5e1e:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_002_5e23:
    ld l, c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call _initrand
    pop hl
    ret

_vm_rand:
    add sp, -$04
    call _randw
    ld a, e
    ld hl, sp+$12
    and [hl]
    inc hl
    ld c, a
    ld a, d
    and [hl]
    ld b, a
    ld hl, sp+$10
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_002_5e50

    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld b, a
    ld c, e

jr_002_5e50:
    ld hl, sp+$10
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_002_5e65

    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld b, a
    ld c, e

jr_002_5e65:
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5e9a

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h
    jr jr_002_5ea2

jr_002_5e9a:
    ld de, _SCRIPT_MEMORY
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h

jr_002_5ea2:
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    add sp, $04
    ret

_vm_lock:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0011
    add hl, bc
    inc [hl]
    ld hl, _VM_LOCK_STATE
    inc [hl]
    ret

_vm_unlock:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0011
    add hl, bc
    ld a, [hl]
    or a
    ret z

    dec a
    ld [hl], a
    ld hl, _VM_LOCK_STATE
    dec [hl]
    ret

_vm_raise:
    dec sp
    dec sp
    ld hl, sp+$0a
    ld a, [hl]
    ld [_VM_EXCEPTION_CODE], a
    ld hl, sp+$0b
    ld a, [hl]
    ld [_VM_EXCEPTION_PARAMS_LENGTH], a
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    inc de
    inc de
    ld a, [de]
    ld [_VM_EXCEPTION_PARAMS_BANK], a
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld e, [hl]
    ld d, a
    ld hl, _VM_EXCEPTION_PARAMS_OFFSET
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    push de
    ld hl, sp+$0b
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    inc sp
    inc sp
    ret

_vm_set_indirect:
    add sp, -$04
    ld hl, sp+$0a
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
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5f3c

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5f40

jr_002_5f3c:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5f40:
    ld a, [hl+]
    ld h, [hl]
    ld c, a
    ld b, h
    sla c
    rl b
    bit 7, h
    jr z, jr_002_5f5d

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5f68

jr_002_5f5d:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5f68:
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5f7f

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5f83

jr_002_5f7f:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5f83:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret

_vm_get_indirect:
    add sp, -$04
    ld hl, sp+$0a
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
    ld hl, sp+$0d
    bit 7, [hl]
    jr z, jr_002_5fbe

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a
    jr jr_002_5fc9

jr_002_5fbe:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l
    ld a, h
    ld hl, sp+$02
    ld [hl], c
    inc hl
    ld [hl], a

jr_002_5fc9:
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_5fe0

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5fe4

jr_002_5fe0:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5fe4:
    ld a, [hl+]
    ld h, [hl]
    ld c, a
    ld b, h
    sla c
    rl b
    bit 7, h
    jr z, jr_002_5ffa

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_002_5ffe

jr_002_5ffa:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_5ffe:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret

_vm_poll_loaded:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_6028

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
    jr jr_002_602c

jr_002_6028:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_602c:
    push hl
    ld a, [$cb91]
    pop hl
    ld c, $00
    ld [hl+], a
    ld [hl], c
    ld hl, $cb91
    ld [hl], $00
    ret

_vm_memset:
    dec sp
    dec sp
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_606a

    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_002_606e

jr_002_606a:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_002_606e:
    ld c, l
    ld b, h
    pop de
    push de
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    push bc
    call _memset
    add sp, $08
    ret

_vm_memcpy:
    add sp, -$06
    ld hl, sp+$12
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$01
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$10
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
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_002_60c4

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
    ld a, h
    jr jr_002_60ca

jr_002_60c4:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld a, h
    ld c, l

jr_002_60ca:
    ld hl, sp+$04
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_002_60ea

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
    jr jr_002_60ef

jr_002_60ea:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_002_60ef:
    ld b, h
    pop de
    push de
    push de
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    push bc
    call _memcpy
    add sp, $0c
    ret

_script_runner_init:
    add sp, -$05
    ld hl, sp+$0b
    ld a, [hl]
    or a
    jr z, jr_002_612a

    ld de, $0e00
    push de
    ld de, $0000
    push de
    ld de, _SCRIPT_MEMORY
    push de
    call _memset
    add sp, $06
    ld de, $0130
    push de
    ld de, $0000
    push de
    ld de, $ca58
    push de
    call _memset
    add sp, $06

jr_002_612a:
    ld bc, $d198
    ld hl, $cb8a
    ld a, $58
    ld [hl+], a
    ld [hl], $ca
    xor a
    ld hl, $cb88
    ld [hl+], a
    ld [hl], a
    ld de, $0000
    ld hl, sp+$02
    ld a, $75
    ld [hl+], a
    ld a, $cb
    ld [hl+], a
    ld [hl], $10

jr_002_6148:
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_002_619d

    dec hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    inc hl
    inc hl
    inc hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000a
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$04
    ld a, [hl]
    ld [de], a
    ld hl, $0080
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl-]
    dec hl
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0013
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$03
    ld [hl-], a
    ld a, e
    ld [hl+], a
    inc hl
    pop de
    push de
    dec [hl]
    jr jr_002_6148

jr_002_619d:
    ld hl, _VM_LOCK_STATE
    ld [hl], $00
    ld hl, $cb91
    ld [hl], $00
    xor a
    ld hl, $cb8c
    ld [hl+], a
    ld [hl], a
    ld a, [$cb88]
    ld [$cb8e], a
    ld a, [$cb89]
    ld [$cb8f], a
    add sp, $05
    ret

_script_execute:
    add sp, -$09
    ld hl, _FREE_CTXS + 1
    ld a, [hl-]
    or [hl]
    jr nz, jr_002_61cb

    ld de, $0000
    jp Jump_002_62fe


jr_002_61cb:
    ld hl, _FREE_CTXS
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc sp
    inc sp
    push bc
    ld hl, $0003
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, _FREE_CTXS
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld e, c
    ld d, b
    ld hl, sp+$10
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    dec hl
    ld [de], a
    ld e, c
    ld d, b
    inc de
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $0008
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, $000a
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$07
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$07
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $000d
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$12
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    or [hl]
    jr z, jr_002_6247

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, bc
    ld a, [hl]
    ld hl, sp+$07
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a

jr_002_6247:
    ld hl, $000f
    add hl, bc
    ld [hl], $00
    ld hl, $0011
    add hl, bc
    ld [hl], $00
    ld hl, $0012
    add hl, bc
    ld [hl], $00
    ld hl, $0007
    add hl, bc
    ld [hl], $00
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld [hl+], a
    ld [hl], a
    ld hl, $cb89
    ld a, [hl-]
    or [hl]
    jr z, jr_002_6293

    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_002_6271:
    inc bc
    inc bc
    inc bc
    ld hl, sp+$07
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    or c
    jr nz, jr_002_6271

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$00
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jr jr_002_6299

jr_002_6293:
    ld hl, $cb88
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_002_6299:
    ld hl, sp+$14
    ld a, [hl]
    or a
    jr z, jr_002_62fc

    ld hl, sp+$14
    ld a, l
    ld d, h
    ld hl, sp+$07
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$14
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a

jr_002_62be:
    ld hl, sp+$08
    ld a, [hl]
    or a
    jr z, jr_002_62fc

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    ld b, a
    inc bc
    inc bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    dec bc
    dec bc
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    dec [hl]
    jr jr_002_62be

jr_002_62fc:
    pop de
    push de

Jump_002_62fe:
    add sp, $09
    ret

_script_terminate:
    ld a, [_FIRST_CTX]
    ld [$d998], a
    ld a, [_FIRST_CTX + 1]
    ld [$d999], a

jr_002_630d:
    ld hl, $d999
    ld a, [hl-]
    or [hl]
    jr z, jr_002_6364

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    ld e, [hl]
    ld hl, sp+$06
    ld a, [hl]
    sub e
    jr nz, jr_002_6355

    ld hl, $000d
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, b
    or c
    jr z, jr_002_6347

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
    ld hl, $d998
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000d
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], a

jr_002_6347:
    ld hl, $d998
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000f
    add hl, bc
    ld [hl], $01
    ld e, [hl]
    ret


jr_002_6355:
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $d998
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_002_630d

jr_002_6364:
    ld e, $00
    ret

_script_detach_hthread:
    ld a, [_FIRST_CTX]
    ld [$d99a], a
    ld a, [_FIRST_CTX + 1]
    ld [$d99b], a

jr_002_6373:
    ld hl, $d99b
    ld a, [hl-]
    or [hl]
    jr z, jr_002_63a1

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    ld e, [hl]
    ld hl, sp+$06
    ld a, [hl]
    sub e
    jr nz, jr_002_6392

    ld hl, $000d
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], a
    ld e, $01
    ret


jr_002_6392:
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $d99a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_002_6373

jr_002_63a1:
    ld e, $00
    ret