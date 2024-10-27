; Load at bank 9 0x4526

_vm_music_play:
    dec sp
    dec sp
    ld hl, $c646
    ld [hl], $00
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld a, [hl-]
    dec hl
    ld b, a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld e, c
    ld d, b
    ld a, [hl+]
    ld [hl], a
    ld a, [_MUSIC_CURRENT_TRACK_BANK]
    ld hl, sp+$00
    sub [hl]
    jr nz, jr_009_4550

    ld hl, _MUSIC_CURRENT_TRACK
    ld a, [hl]
    sub c
    jr nz, jr_009_4550

    inc hl
    ld a, [hl]
    sub b
    jr z, jr_009_4567

jr_009_4550:
    ld hl, _MUSIC_CURRENT_TRACK_BANK
    ld [hl], $ff
    ld hl, _MUSIC_CURRENT_TRACK
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, _MUSIC_NEXT_TRACK
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$01
    ld a, [hl]
    ld [_MUSIC_CURRENT_TRACK_BANK], a

jr_009_4567:
    inc sp
    inc sp
    ret

_vm_music_stop:
    ld hl, _MUSIC_CURRENT_TRACK_BANK
    ld [hl], $ff
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

_vm_music_mute:
    ld hl, sp+$08
    ld a, [hl]
    ld [_MUSIC_GLOBAL_MUTE_MASK], a
    ld [$d9de], a
    ld c, a
    rrca
    jr nc, jr_009_45a0

    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR14], a

jr_009_45a0:
    bit 1, c
    jr z, jr_009_45ab

    xor a
    ldh [rNR22], a
    ld a, $c0
    ldh [rNR24], a

jr_009_45ab:
    bit 2, c
    jr z, jr_009_45b2

    xor a
    ldh [rNR32], a

jr_009_45b2:
    bit 3, c
    jr z, jr_009_45bd

    xor a
    ldh [rNR42], a
    ld a, $c0
    ldh [rNR44], a

jr_009_45bd:
    ld a, $ff
    ldh [rNR51], a
    ret

_vm_music_routine:
    ld bc, _MUSIC_EVENTS
    ld hl, sp+$08
    ld a, [hl]
    and $03
    ld l, a
    ld h, $00
    ld e, l
    ld d, h
    add hl, hl
    add hl, hl
    add hl, de
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    inc de
    inc de
    ld hl, sp+$09
    ld a, [hl+]
    ld [de], a
    inc bc
    inc bc
    inc bc
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ret

_vm_music_setpos:
    ld hl, sp+$08
    ld a, [hl]
    push af
    inc sp
    call Call_000_05fc
    inc sp
    ret

_vm_sound_mastervol:
    ld hl, sp+$08
    ld a, [hl]
    ldh [rNR50], a
    ret

_vm_sfx_play:
    dec sp
    dec sp
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl-]
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec hl
    dec hl
    ld c, [hl]
    ld hl, sp+$01
    ld [hl-], a
    ld a, [hl]
    ld hl, _MUSIC_SFX_PRIORITY
    sub [hl]
    jr c, jr_009_4669

    ld hl, _SFX_PLAY_BANK
    ld [hl], $ff
    ld hl, sp+$00
    ld a, [hl]
    ld [_MUSIC_SFX_PRIORITY], a
    ld a, [$c63f]
    ld b, a
    rrca
    jr nc, jr_009_462e

    xor a
    ldh [rNR12], a
    ld a, $c0
    ldh [rNR14], a

jr_009_462e:
    bit 1, b
    jr z, jr_009_4639

    xor a
    ldh [rNR22], a
    ld a, $c0
    ldh [rNR24], a

jr_009_4639:
    bit 2, b
    jr z, jr_009_4640

    xor a
    ldh [rNR32], a

jr_009_4640:
    bit 3, b
    jr z, jr_009_464b

    xor a
    ldh [rNR42], a
    ld a, $c0
    ldh [rNR44], a

jr_009_464b:
    ld a, $ff
    ldh [rNR51], a
    ld hl, sp+$01
    ld a, [hl]
    ld [$c63f], a
    ld hl, _SFX_PLAY_BANK
    ld [hl], $ff
    ld hl, $c7f4
    ld [hl], $00
    ld hl, _SFX_PLAY_SAMPLE
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, _SFX_PLAY_BANK
    ld [hl], c

jr_009_4669:
    inc sp
    inc sp
    ret