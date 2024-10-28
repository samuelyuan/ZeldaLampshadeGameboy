_input_update:
    ld bc, _JOYPADS + 1
    ld a, [bc]
    ld [_LAST_JOY], a
    call _joypad
    ld a, e
    ld hl, _FRAME_JOY
    ld [hl], a
    ld [bc], a
    ld a, [hl]
    and $0f
    ld e, a
    ld d, $00
    ld hl, _LAST_JOY
    ld a, [hl]
    and $0f
    ld b, a
    ld c, $00
    ld a, b
    sub e
    jr nz, jr_000_1703

    ld a, c
    sub d
    ret z

jr_000_1703:
    ld a, [hl]
    cpl
    ld hl, _FRAME_JOY
    and [hl]
    ld [_RECENT_JOY], a
    ret