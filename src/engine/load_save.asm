_data_init:
    dec sp
    dec sp
    ld hl, $0000
    ld [hl], $0a
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld [hl], a
    ld [$4000], a
    ld hl, $c621
    ld a, $04
    ld [hl+], a
    xor a
    ld [hl], a
    ld bc, _save_points

jr_006_47bf:
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    ld l, [hl]
    or l
    jr z, jr_006_47eb

    ld l, c
    ld h, b
    inc hl
    inc hl
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $c621
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    ld e, l
    ld d, h
    ld hl, $c621
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    inc bc
    inc bc
    jr jr_006_47bf

jr_006_47eb:
    inc sp
    inc sp
    ret

_save_points:
    ; script memory
    dw _SCRIPT_MEMORY, $0e00
    ; VM contexts
    dw _CTXS, $0130
    dw _FIRST_CTX, $0002
    dw _FREE_CTXS, $0002
    dw _OLD_EXECUTING_CTX, $0002
    dw _EXECUTING_CTX, $0002
    dw _VM_LOCK_STATE, $0001,
    ; input events
    dw _INPUT_EVENTS, $0028, 
    dw _INPUT_SLOTS, $0008,
    ; timer
    dw _TIMER_EVENTS, $0014
    dw _TIMER_VALUES, $0008
    ; music
    dw _MUSIC_CURRENT_TRACK_BANK, $0001
    dw _MUSIC_CURRENT_TRACK, $0002
    dw _MUSIC_EVENTS, $0014
    ; scene
    dw _CURRENT_SCENE, $0003
    ; actors
    dw _ACTORS, $0444
    dw _ACTORS_ACTIVE_HEAD, $0002
    dw _ACTORS_INACTIVE_HEAD, $0002
    dw _PLAYER_MOVING, $0001
    dw _PLAYER_COLLISION_ACTOR, $0002
    ; system
    dw _RAND_SEED, $0002
    ; terminator
    dw $0000, $0000

_data_slot_address:
    add sp, -$05
    ld bc, $0000
    xor a
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], a
    ld de, $0000
    ld hl, sp+$04
    ld [hl], $00

jr_006_4857:
    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nc, jr_006_4898

    ld a, c
    ld hl, $c621
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    xor a
    sub [hl]
    inc hl
    ld a, $20
    sbc [hl]
    jr nc, jr_006_4893

    inc de
    inc sp
    inc sp
    push de
    ld a, e
    sub $03
    ld a, d
    sbc $00
    jr c, jr_006_4890

    ld de, $0000
    jr jr_006_48a7

jr_006_4890:
    ld bc, $0000

jr_006_4893:
    ld hl, sp+$04
    inc [hl]
    jr jr_006_4857

jr_006_4898:
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$00
    ld a, [hl]
    ld [de], a
    ld hl, $a000
    add hl, bc
    ld e, l
    ld d, h

jr_006_48a7:
    add sp, $05
    ret

_data_save:
    add sp, -$0d
    ld hl, sp+$00
    push hl
    ld hl, sp+$15
    ld a, [hl]
    push af
    inc sp
    call _data_slot_address
    add sp, $03
    ld hl, sp+$0b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, [hl-]
    or [hl]
    jp z, Jump_006_498d

    ld hl, sp+$00
    ld c, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld b, a
    ld a, c
    and $0f
    or b
    ld [hl], a
    ld [$4000], a
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0593
    ld d, h
    ld e, l
    ld hl, sp+$07
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], $ee
    inc hl
    ld [hl], $47

jr_006_490f:
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$01
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jr z, jr_006_498d

    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$0b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _memcpy
    add sp, $06
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$07
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0d
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0c
    ld [hl], a
    jr jr_006_490f

Jump_006_498d:
jr_006_498d:
    add sp, $0d
    ret

_data_load:
    add sp, -$0b
    ld hl, sp+$04
    push hl
    ld hl, sp+$13
    ld a, [hl]
    push af
    inc sp
    call _data_slot_address
    add sp, $03
    ld c, e
    ld b, d
    ld a, b
    or c
    jr nz, jr_006_49a9

    ld e, a
    jp Jump_006_4a9c


jr_006_49a9:
    ld hl, sp+$04
    ld d, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld e, a
    ld a, d
    and $0f
    or e
    ld [hl], a
    ld [$4000], a
    ld l, c
    ld h, b
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0593
    ld d, h
    ld e, l
    ld hl, sp+$07
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nz, jr_006_49fe

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$08
    sub [hl]
    jr nz, jr_006_49fe

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$09
    sub [hl]
    jr nz, jr_006_49fe

    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$0a
    sub [hl]
    jr z, jr_006_4a03

jr_006_49fe:
    ld e, $00
    jp Jump_006_4a9c


jr_006_4a03:
    inc bc
    inc bc
    inc bc
    inc bc
    ld hl, sp+$09
    ld [hl], $ee
    inc hl
    ld [hl], $47

jr_006_4a0e:
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jr z, jr_006_4a6a

    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$09
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$08
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    ld e, c
    ld d, b
    push hl
    push de
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _memcpy
    add sp, $06
    ld hl, sp+$07
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
    ld b, h
    ld hl, sp+$09
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0004
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0a
    ld [hl], a
    jr jr_006_4a0e

jr_006_4a6a:
    ld a, [_MUSIC_CURRENT_TRACK_BANK]
    inc a
    jr z, jr_006_4a7e

    ld a, [_MUSIC_CURRENT_TRACK]
    ld [_MUSIC_NEXT_TRACK], a
    ld a, [_MUSIC_CURRENT_TRACK + 1]
    ld [_MUSIC_NEXT_TRACK + 1], a
    jr jr_006_4a9a

jr_006_4a7e:
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

jr_006_4a9a:
    ld e, $01

Jump_006_4a9c:
    add sp, $0b
    ret

_data_clear:
    dec sp
    ld hl, sp+$00
    push hl
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    call _data_slot_address
    add sp, $03
    ld c, e
    ld a, d
    ld b, a
    or e
    jr z, jr_006_4ace

    ld hl, sp+$00
    ld e, [hl]
    ld a, [$c820]
    and $f0
    ld l, a
    ld a, e
    and $0f
    or l
    ld [$c820], a
    ld [$4000], a
    xor a
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a

jr_006_4ace:
    inc sp
    ret

_data_peek:
    add sp, -$09
    ld hl, sp+$00
    push hl
    ld hl, sp+$11
    ld a, [hl]
    push af
    inc sp
    call _data_slot_address
    add sp, $03
    ld c, e
    ld b, d
    ld a, b
    or c
    jr nz, jr_006_4ae9

    ld e, a
    jp Jump_006_4b7b


jr_006_4ae9:
    ld hl, sp+$00
    ld d, [hl]
    ld hl, $c820
    ld a, [hl]
    and $f0
    ld e, a
    ld a, d
    and $0f
    or e
    ld [hl], a
    ld [$4000], a
    ld l, c
    ld h, b
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$01
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0593
    ld d, h
    ld e, l
    ld hl, sp+$05
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jr nz, jr_006_4b3e

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$06
    sub [hl]
    jr nz, jr_006_4b3e

    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jr nz, jr_006_4b3e

    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$08
    sub [hl]
    jr z, jr_006_4b42

jr_006_4b3e:
    ld e, $00
    jr jr_006_4b7b

jr_006_4b42:
    ld hl, sp+$13
    ld a, [hl-]
    or [hl]
    jr z, jr_006_4b79

    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$13
    ld a, [hl]
    ld hl, sp+$08
    ld [hl-], a
    sla [hl]
    inc hl
    rl [hl]
    inc bc
    inc bc
    inc bc
    inc bc
    ld hl, sp+$10
    ld a, [hl+]
    ld e, [hl]
    add a
    rl e
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    ld hl, sp+$14
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push bc
    push de
    call _memcpy
    add sp, $06

jr_006_4b79:
    ld e, $01

Jump_006_4b7b:
jr_006_4b7b:
    add sp, $09
    ret