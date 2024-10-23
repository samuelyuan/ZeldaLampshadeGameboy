_vm_print_detect:
    dec sp
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_42c2

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_009_42c6

jr_009_42c2:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_009_42c6:
    ld c, l
    ld b, h
    ldh a, [rIE]
    ld hl, sp+$00
    ld [hl], a
    ld a, [hl]
    res 3, a
    push af
    inc sp
    call _set_interrupts
    inc sp
    push bc
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, _gbprinter_detect
    call RST_08
    inc sp
    pop bc
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$00
    ld a, [hl]
    push af
    inc sp
    call _set_interrupts
    pop hl
    ret

_vm_print_overlay:
    dec sp
    ld hl, sp+$09
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_4314

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_009_4318

jr_009_4314:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_009_4318:
    ld c, l
    ld b, h
    ldh a, [rIE]
    ld hl, sp+$00
    ld [hl], a
    ld a, [hl]
    res 3, a
    push af
    inc sp
    call _set_interrupts
    inc sp
    push bc
    ld hl, sp+$0f
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    push de
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, _gbprinter_print_overlay
    call RST_08
    add sp, $03
    pop bc
    ld d, $00
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$00
    ld a, [hl]
    push af
    inc sp
    call _set_interrupts
    pop hl
    ret