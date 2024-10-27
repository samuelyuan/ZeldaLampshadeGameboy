; Loaded in bank 9 0x43e0

; void vm_sin_scale(SCRIPT_CTX * THIS, INT16 idx, INT16 idx_angle, UBYTE accuracy) OLDCALL BANKED {
_vm_sin_scale:
    add sp, -$04
    ; INT16 * res = VM_REF_TO_PTR(idx);
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
    jr z, jr_009_4410

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
    jr jr_009_4414

jr_009_4410:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_009_4414:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ; INT16 * angle = VM_REF_TO_PTR(idx_angle);
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_4435

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
    jr jr_009_443a

jr_009_4435:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_009_443a:
    ld b, h
    ; *res = (*res * (SIN(*angle) >> (7 - accuracy))) >> accuracy;
    pop de
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [bc]
    ld c, a
    ld hl, _sine_wave
    ld b, $00
    add hl, bc
    ld c, [hl]
    ld hl, sp+$10
    ld e, [hl]
    ld a, $07
    sub e
    ld b, a
    inc b
    jr jr_009_4459

jr_009_4457:
    sra c

jr_009_4459:
    dec b
    jr nz, jr_009_4457

    ld a, c
    rlca
    sbc a
    ld b, a
    push de
    push bc
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    pop de
    inc e
    jr jr_009_4477

jr_009_4473:
    sra b
    rr c

jr_009_4477:
    dec e
    jr nz, jr_009_4473

    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ; }
    add sp, $04
    ret

; void vm_cos_scale(SCRIPT_CTX * THIS, INT16 idx, INT16 idx_angle, UBYTE accuracy) OLDCALL BANKED {
_vm_cos_scale:
    add sp, -$04
    ; INT16 * res = VM_REF_TO_PTR(idx);
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
    jr z, jr_009_44b2

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
    jr jr_009_44b6

jr_009_44b2:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_009_44b6:
    ld a, l
    ld c, h
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], c
    ; INT16 * angle = VM_REF_TO_PTR(idx_angle);
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_009_44d7

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
    jr jr_009_44dc

jr_009_44d7:
    ld hl, _SCRIPT_MEMORY
    add hl, bc
    ld c, l

jr_009_44dc:
    ld b, h
    ; *res = (*res * (COS(*angle) >> (7 - accuracy))) >> accuracy;
    pop de
    push de
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [bc]
    add $40
    ld c, a
    ld hl, _sine_wave
    ld b, $00
    add hl, bc
    ld c, [hl]
    ld hl, sp+$10
    ld e, [hl]
    ld a, $07
    sub e
    ld b, a
    inc b
    jr jr_009_44fd

jr_009_44fb:
    sra c

jr_009_44fd:
    dec b
    jr nz, jr_009_44fb

    ld a, c
    rlca
    sbc a
    ld b, a
    push de
    push bc
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    pop de
    inc e
    jr jr_009_451b

jr_009_4517:
    sra b
    rr c

jr_009_451b:
    dec e
    jr nz, jr_009_4517

    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b
    ; }
    add sp, $04
    ret