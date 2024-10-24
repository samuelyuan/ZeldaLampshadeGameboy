
__vm_sgb_transfer:
    dec sp
    ldh a, [$90]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    inc de
    inc de
    ld a, [de]
    ldh [$90], a
    ld a, [de]
    ld [$2000], a
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call _sgb_transfer
    pop hl
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl]
    and $03
    ld e, a
    ld d, $00
    ld a, e
    add a
    rl d
    add a
    rl d
    add a
    rl d
    add a
    rl d
    add l
    ld e, a
    ld a, d
    adc h
    ld d, a
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$00
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    inc sp
    ret
