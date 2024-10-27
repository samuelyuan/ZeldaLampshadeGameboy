; Loaded in bank 9 0x434f

_vm_save_clear:
    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, $4a9f
    call RST_08
    inc sp
    ret

_vm_save_peek:
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
    jr z, jr_009_4384

    pop de
    push de

Jump_009_437c:
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_009_4388

jr_009_4384:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_009_4388:
    ld a, l
    ld c, h
    ld hl, sp+$02
    ld [hl+], a
    ld [hl], c
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_43a6

    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    ld c, l
    jr jr_009_43ab

jr_009_43a6:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_009_43ab:
    ld b, h
    ld hl, sp+$11
    bit 7, [hl]
    jr z, jr_009_43b6

    dec hl
    xor a
    ld [hl+], a
    ld [hl], a

jr_009_43b6:
    push bc
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$1a
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, $4ad0
    call RST_08
    add sp, $07
    ld c, e
    ld b, $00
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    add sp, $04
    ret