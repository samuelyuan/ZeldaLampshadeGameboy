; Load at bank 5 0x4000
; events_init and timer_init are BANKED in bank 5
; events_update and timer_update are NONBANKED

_events_init:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_005_401d

    ld c, $00

jr_005_4008:
    ld a, c
    sub $08
    ret nc

    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, _INPUT_EVENTS
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    inc c
    jr jr_005_4008

jr_005_401d:
    ld de, $0008
    push de
    ld de, $0000
    push de
    ld de, _INPUT_SLOTS
    push de
    call _memset
    add sp, $06
    ld de, $0028
    push de
    ld de, $0000
    push de
    ld de, _INPUT_EVENTS
    push de
    call _memset
    add sp, $06
    ret

_timers_init:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_005_405d

    ld c, $00

jr_005_4048:
    ld a, c
    sub $04
    ret z

    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, _TIMER_EVENTS
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    inc c
    jr jr_005_4048

jr_005_405d:
    ld de, $0008
    push de
    ld de, $0000
    push de
    ld de, _TIMER_VALUES
    push de
    call _memset
    add sp, $06
    ld de, $0014
    push de
    ld de, $0000
    push de
    ld de, _TIMER_EVENTS
    push de
    call _memset
    add sp, $06
    ret