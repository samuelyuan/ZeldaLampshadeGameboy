_sfx_play_isr:
    ld hl, _SFX_PLAY_SAMPLE
    ld a, [hl+]
    ld e, a
    or [hl]
    ret z

    ld d, [hl]
    ld hl, _SFX_FRAME_SKIP
    xor a
    or [hl]
    jr z, jr_000_2377

    dec [hl]

jr_000_2375:
    ld e, a
    ret


jr_000_2377:
    ld h, d
    ld l, e
    ldh a, [$90]
    ld e, a
    ld a, [_SFX_PLAY_BANK]
    inc a
    jr z, jr_000_2375

    dec a
    ldh [$90], a
    ld [$2000], a
    ld d, $0f
    ld a, [hl]
    swap a
    and d
    ld [_SFX_FRAME_SKIP], a
    ld a, [hl+]
    and d
    ld d, a
    jp z, Jump_000_2427

Jump_000_2397:
    ld a, [hl+]
    ld b, a
    and $07
    cp $05
    jr c, jr_000_23f9

    cp $07
    jr z, jr_000_23f3

    xor a
    ld [$ff1a], a
    ld c, $30
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, b
    cp $06

Call_000_23dc:
    jr nz, jr_000_2423

    ld a, $80
    ldh [rNR30], a
    ld a, $fe
    ldh [rNR31], a
    ld a, $20
    ldh [rNR32], a
    xor a
    ldh [rNR33], a
    ld a, $c7
    ldh [rNR34], a
    jr jr_000_2423

jr_000_23f3:
    ld hl, $0000
    ld d, l
    jr jr_000_2428

jr_000_23f9:
    ld c, a
    add a
    add a
    add c
    add $10
    ld c, a
    sla b
    jr nc, jr_000_2406

    ld a, [hl+]
    ld [c], a

jr_000_2406:
    inc c
    sla b
    jr nc, jr_000_240d

    ld a, [hl+]
    ld [c], a

jr_000_240d:
    inc c
    sla b
    jr nc, jr_000_2414

    ld a, [hl+]
    ld [c], a

jr_000_2414:
    inc c
    sla b
    jr nc, jr_000_241b

    ld a, [hl+]
    ld [c], a

jr_000_241b:
    inc c
    sla b
    jr nc, jr_000_2422

    ld a, [hl+]
    ld [c], a

jr_000_2422:
    inc c

jr_000_2423:
    dec d
    jp nz, Jump_000_2397

Jump_000_2427:
    inc d

jr_000_2428:
    ld a, l
    ld [_SFX_PLAY_SAMPLE], a
    ld a, h
    ld [_SFX_PLAY_SAMPLE + 1], a
    ld a, e
    ldh [$90], a
    ld [$2000], a
    ld e, d
    ret