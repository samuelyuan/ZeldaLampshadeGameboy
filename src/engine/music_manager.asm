
_music_init_driver:
    ld hl, _MUSIC_CURRENT_TRACK_BANK
    ld [hl], $ff
    ld hl, _SFX_PLAY_BANK
    ld [hl], $ff
    xor a
    ld hl, _SFX_PLAY_SAMPLE
    ld [hl+], a
    ld [hl], a
    ld a, $80
    ldh [rNR52], a
    ld a, $ff
    ldh [rNR51], a
    ld a, $77
    ldh [rNR50], a
    xor a
    ldh [rNR42], a
    xor a
    ldh [rNR32], a
    xor a
    ldh [rNR22], a
    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR44], a
    ld a, $c0
    ldh [rNR24], a
    ld a, $c0
    ldh [rNR14], a
    ld a, $ff
    ldh [rNR51], a
    ld hl, _MUSIC_MUTE_MASK
    ld [hl], $00
    ld hl, _MUSIC_EFFECTIVE_MUTE
    ld [hl], $00
    ld hl, _MUSIC_PLAY_ISR_COUNTER
    ld [hl], $00
    ld hl, _MUSIC_PLAY_ISR_PAUSE
    ld [hl], $00
    ld hl, _MUSIC_GLOBAL_MUTE_MASK
    ld [hl], $00
    ld hl, _MUSIC_SFX_PRIORITY
    ld [hl], $00
    ret

_music_init_events:
    ld hl, sp+$06
    ld a, [hl]
    or a
    jr z, jr_009_41fb

    ld c, $00

jr_009_41e5:
    ld a, c
    sub $04
    jr nc, jr_009_420c

    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld de, _MUSIC_EVENTS
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    inc c
    jr jr_009_41e5

jr_009_41fb:
    ld de, $0014
    push de
    ld de, $0000
    push de
    ld de, _MUSIC_EVENTS
    push de
    call _memset
    add sp, $06

jr_009_420c:
    di
    ld hl, _ROUTINE_QUEUE_TAIL
    ld [hl], $00
    ld hl, _ROUTINE_QUEUE_HEAD
    ld [hl], $00
    ei
    ret

_music_events_poll:
    ld a, [_ROUTINE_QUEUE_HEAD]
    ld hl, _ROUTINE_QUEUE_TAIL
    sub [hl]
    jr z, jr_009_4240

    di
    ld hl, _ROUTINE_QUEUE_TAIL
    inc [hl]
    ld a, [hl]
    and $03
    ld [hl], a
    add $23
    ld c, a
    ld a, $c6
    adc $00
    ld b, a
    ld a, [bc]
    ld c, a
    ei
    ld a, c
    and $04
    ld b, a
    ld a, c
    and $f0
    or b
    ld e, a
    ret


jr_009_4240:
    ld e, $00
    ret

_music_pause:
    ld hl, sp+$02
    ld a, [hl]
    ld [_MUSIC_PLAY_ISR_PAUSE], a
    or a
    ret z

    xor a
    ldh [rNR42], a
    xor a
    ldh [rNR32], a
    xor a
    ldh [rNR22], a
    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR44], a
    ld a, $c0
    ldh [rNR24], a
    ld a, $c0
    ldh [rNR14], a
    ld a, $ff
    ldh [rNR51], a
    ret
