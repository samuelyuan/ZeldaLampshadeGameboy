_ui_update:
    ld c, $00
    ld a, [_WIN_POS_Y]
    ld hl, _WIN_DEST_POS_Y
    sub [hl]
    jr z, jr_000_2525

    ld bc, $02a2
    ld a, c
    ld hl, _WIN_SPEED
    add [hl]
    ld c, a
    jr nc, jr_000_24f7

    inc b

jr_000_24f7:
    ld a, [bc]
    ld hl, _GAME_TIME
    and [hl]
    jr nz, jr_000_2523

    ld a, [_WIN_SPEED]
    or a
    jr nz, jr_000_2509

    ld bc, $0002
    jr jr_000_250c

jr_000_2509:
    ld bc, $0001

jr_000_250c:
    ld a, [_WIN_POS_Y]
    ld hl, _WIN_DEST_POS_Y
    sub [hl]
    jr nc, jr_000_251d

    ld hl, _WIN_POS_Y
    ld a, [hl]
    add c
    ld [hl], a
    jr jr_000_2523

jr_000_251d:
    ld hl, _WIN_POS_Y
    ld a, [hl]
    sub c
    ld [hl], a

jr_000_2523:
    ld c, $01

jr_000_2525:
    ld a, [_WIN_POS_X]
    ld hl, _WIN_DEST_POS_X
    sub [hl]
    jr z, jr_000_2568

    ld bc, $02a2
    ld a, c
    ld hl, _WIN_SPEED
    add [hl]
    ld c, a
    jr nc, jr_000_253a

    inc b

jr_000_253a:
    ld a, [bc]
    ld hl, _GAME_TIME
    and [hl]
    jr nz, jr_000_2566

    ld a, [$c920]
    or a
    jr nz, jr_000_254c

    ld bc, $0002
    jr jr_000_254f

jr_000_254c:
    ld bc, $0001

jr_000_254f:
    ld a, [_WIN_POS_X]
    ld hl, _WIN_DEST_POS_X
    sub [hl]
    jr nc, jr_000_2560

    ld hl, _WIN_POS_X
    ld a, [hl]
    add c
    ld [hl], a
    jr jr_000_2566

jr_000_2560:
    ld hl, _WIN_POS_X
    ld a, [hl]
    sub c
    ld [hl], a

jr_000_2566:
    ld c, $01

jr_000_2568:
    ld a, c
    or a
    ret nz

    ld a, [$c921]
    or a
    ret nz

    ld a, [_FRAME_JOY]
    and $30
    jr z, jr_000_257e

    ld a, [_LAST_JOY]
    and $30
    jr z, jr_000_2586

Call_000_257e:
jr_000_257e:
    ld a, [_GAME_TIME]
    ld hl, $c922
    and [hl]
    ret nz

jr_000_2586:
    ld e, $01
    ld hl, $5a1f
    call RST_08
    ld a, [$c929]
    or a
    jr nz, jr_000_259a

    ld a, [$c927]
    or a
    jr nz, jr_000_25a0

jr_000_259a:
    ld a, [$c921]
    or a
    jr z, jr_000_2586

jr_000_25a0:
    ld a, e
    or a
    ret z

    ld a, [$ca4b]
    inc a
    ret z

    ld hl, $ca4a
    ld c, [hl]
    ld hl, $ca4c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $ca4b
    ld b, [hl]
    ld a, $04
    ld hl, $c647
    sub [hl]
    ret c

    ld hl, _SFX_PLAY_BANK
    ld [hl], $ff
    ld hl, $c647
    ld [hl], $04
    ld a, [_MUSIC_EFFECTIVE_MUTE]
    ld l, a
    rrca
    jr nc, jr_000_25d5

    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR14], a

jr_000_25d5:
    bit 1, l
    jr z, jr_000_25e0

    xor a
    ldh [rNR22], a
    ld a, $c0
    ldh [rNR24], a

jr_000_25e0:
    bit 2, l
    jr z, jr_000_25e7

    xor a
    ldh [rNR32], a

jr_000_25e7:
    bit 3, l
    jr z, jr_000_25f2

    xor a
    ldh [rNR42], a
    ld a, $c0
    ldh [rNR44], a

jr_000_25f2:
    ld a, $ff
    ldh [rNR51], a
    ld hl, _MUSIC_EFFECTIVE_MUTE
    ld [hl], c
    ld hl, _SFX_PLAY_BANK
    ld [hl], $ff
    ld hl, _SFX_FRAME_SKIP
    ld [hl], $00
    ld hl, _SFX_PLAY_SAMPLE
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, _SFX_PLAY_BANK
    ld [hl], b
    ret