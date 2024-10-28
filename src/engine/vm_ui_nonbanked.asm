
_vm_load_text:
    add sp, -$10
    ldh a, [$90]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$17
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
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$18
    ld a, [hl]
    ld e, $00
    add a
    rl e
    ld l, a
    ld h, e
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0e
    ld [hl], $2b
    inc hl
    ld [hl], $c9
    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl], a

Jump_000_26ba:
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl-], a
    dec hl
    ld a, [hl]
    or a
    jp z, Jump_000_2894

    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    sub $25
    jp nz, Jump_000_2855

    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld c, l
    ld b, h
    sla c
    rl b
    bit 7, h
    jr z, jr_000_2716

    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_000_271a

jr_000_2716:
    ld hl, $cb98
    add hl, bc

jr_000_271a:
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$03
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    ld e, a
    ld l, c
    ld h, b
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld a, e
    cp $25
    jp z, Jump_000_2830

    sub $44
    jr z, jr_000_275e

    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    ld a, e
    cp $63
    jp z, Jump_000_27e8

    cp $64
    jr z, jr_000_27a6

    cp $66
    jp z, Jump_000_2817

    sub $74
    jp z, Jump_000_27fd

    jp Jump_000_2835


jr_000_275e:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, [bc]
    add $d0
    ld [$ca54], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $09
    ld hl, $48fb
    call RST_08
    add sp, $04
    ld a, [$ca38]
    or a
    jr z, jr_000_2791

    push de
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_35ef
    pop hl
    pop de

jr_000_2791:
    ld d, $00
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    jp Jump_000_2878


jr_000_27a6:
    ld hl, $ca54
    ld [hl], $00
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $09
    ld hl, $48fb
    call RST_08
    add sp, $04
    ld a, [$ca38]
    or a
    jr z, jr_000_27d3

    push de
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_35ef
    pop hl
    pop de

jr_000_27d3:
    ld d, $00
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    jp Jump_000_2878


Jump_000_27e8:
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    jr jr_000_2878

Jump_000_27fd:
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [hl]
    inc a
    inc a
    ld [de], a
    inc de
    ld hl, sp+$0e
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_000_2878

Jump_000_2817:
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $02
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, [hl]
    inc a
    ld [de], a
    inc de
    ld hl, sp+$0e
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_000_2878

Jump_000_2830:
    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]

Jump_000_2835:
    ld e, c
    ld d, b
    dec de
    ld a, [de]
    ld c, a
    inc de
    ld hl, sp+$03
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    jp Jump_000_26ba


Jump_000_2855:
    ld hl, sp+$07
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    jp Jump_000_26ba


Jump_000_2878:
jr_000_2878:
    inc bc
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    jp Jump_000_26ba


Jump_000_2894:
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$00
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl+]
    ld [de], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    add sp, $10
    ret