    ld hl, sp+$04
    ld a, [hl]

_hUGETrackerRoutine:
    or a
    ret nz

    ld hl, _ROUTINE_QUEUE_HEAD
    inc [hl]
    ld a, [hl]
    and $03
    ld [hl], a
    ld hl, _ROUTINE_QUEUE_TAIL
    sub [hl]
    jr nz, jr_000_19eb

    ld hl, _ROUTINE_QUEUE_TAIL
    inc [hl]
    ld a, [hl]
    and $03
    ld [hl], a

jr_000_19eb:
    ld bc, $c623
    ld a, c
    ld hl, _ROUTINE_QUEUE_HEAD
    add [hl]
    ld c, a
    jr nc, jr_000_19f7

    inc b

jr_000_19f7:
    ld hl, sp+$02
    ld a, [hl]
    ld [bc], a
    ret


_music_events_update:
    add sp, -$03

jr_000_19fe:
    ld a, [_ROUTINE_QUEUE_HEAD]
    ld hl, _ROUTINE_QUEUE_TAIL
    sub [hl]
    jr z, jr_000_1a7b

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
    ld hl, sp+$00
    ld [hl], a
    ei
    ld a, [hl]
    and $03
    ld c, a
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    ld a, l
    add $29
    ld c, a
    ld a, h
    adc $c6
    ld hl, sp+$01
    ld [hl], c
    inc hl
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld a, b
    or c
    jr z, jr_000_1a7b

    ld hl, sp+$01
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    or l
    jr z, jr_000_1a51

    add hl, hl
    jr nc, jr_000_19fe

jr_000_1a51:
    ld hl, sp+$00
    ld a, [hl+]
    swap a
    and $0f
    ld e, a
    ld d, $00
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    ld a, [hl]
    push de
    ld h, $01
    push hl
    inc sp
    ld hl, sp+$04
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    push bc
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    jr jr_000_19fe

jr_000_1a7b:
    add sp, $03
    ret


_music_play_isr:
    ld a, [_SFX_PLAY_BANK]
    inc a
    jr z, jr_000_1abd

    ld a, [_MUSIC_MUTE_MASK]
    or a
    jr nz, jr_000_1a99

    ld a, [_MUSIC_GLOBAL_MUTE_MASK]
    ld hl, _MUSIC_EFFECTIVE_MUTE
    or [hl]
    ld [_hUGE_mute_mask], a
    ld hl, _MUSIC_MUTE_MASK
    ld [hl], $01

jr_000_1a99:
    call _sfx_play_isr
    ld a, e
    or a
    jr nz, jr_000_1abd

    ld a, [_MUSIC_GLOBAL_MUTE_MASK]
    ld [_hUGE_mute_mask], a
    ld hl, _hUGE_current_wave
    ld [hl], $64
    ld hl, _MUSIC_MUTE_MASK
    ld [hl], $00
    ld [_MUSIC_EFFECTIVE_MUTE], a
    ld hl, _MUSIC_SFX_PRIORITY
    ld [hl], $00
    ld hl, _SFX_PLAY_BANK
    ld [hl], $ff

jr_000_1abd:
    ld a, [_MUSIC_PLAY_ISR_PAUSE]
    or a
    ret nz

    ld a, [_MUSIC_CURRENT_TRACK_BANK]
    inc a
    ret z

    jr jr_000_1ac9

jr_000_1ac9:
    ld hl, _MUSIC_PLAY_ISR_COUNTER
    inc [hl]
    ld a, [hl]
    and $03
    ret nz

    ldh a, [$90]
    ld c, a
    ld hl, _MUSIC_CURRENT_TRACK_BANK
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    ld hl, _MUSIC_NEXT_TRACK + 1
    ld a, [hl-]
    or [hl]
    jr z, jr_000_1b17

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

Call_000_1af6:
    ld a, $c0
    ldh [rNR24], a
    ld a, $c0
    ldh [rNR14], a
    ld a, $ff
    ldh [rNR51], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [_MUSIC_CURRENT_TRACK_BANK]
    push bc
    push de
    call _hUGE_init
    pop hl
    pop bc
    xor a
    ld hl, _MUSIC_NEXT_TRACK
    ld [hl+], a
    ld [hl], a
    jr jr_000_1b1c

jr_000_1b17:
    push bc
    call hUGE_dosound
    pop bc

jr_000_1b1c:
    ld a, c
    ldh [$90], a
    ld hl, $2000
    ld [hl], c
    ret
