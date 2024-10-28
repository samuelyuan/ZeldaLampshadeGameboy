_input_init:
    ld de, $0005
    push de
    ld de, $0000
    push de
    ld de, _JOYPADS
    push de
    call _memset
    add sp, $06
    ld hl, _LAST_JOY
    ld [hl], $00
    ld hl, _FRAME_JOY
    ld [hl], $00
    ld hl, _RECENT_JOY
    ld [hl], $00
    ld hl, _JOYPADS
    ld [hl], $01
    ret