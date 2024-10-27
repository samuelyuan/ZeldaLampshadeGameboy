_actors_init:
    xor a
    ld hl, _ACTORS_INACTIVE_HEAD
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _ACTORS_ACTIVE_HEAD
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _ACTORS_ACTIVE_TAIL
    ld [hl+], a
    ld [hl], a
    ld hl, _PLAYER_MOVING
    ld [hl], $00
    ld hl, _PLAYER_IFRAMES
    ld [hl], $00
    xor a
    ld hl, _PLAYER_COLLISION_ACTOR
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _EMOTE_ACTOR
    ld [hl+], a
    ld [hl], a
    ld de, $0444
    push de
    ld de, $0000
    push de
    ld de, _ACTORS
    push de
    call _memset
    add sp, $06
    ret

; const BYTE emote_offsets[] = {2, 1, 0, -1, -2, -3, -4, -5, -6, -5, -4, -3, -2, -1, 0};
_emote_offsets:
    db $02, $01, $00, $ff, $fe, $fd, $fc, $fb, $fa, $fb, $fc, $fd, $fe, $ff, $00

; const metasprite_t emote_metasprite[]  = {
;    {0, 0, 0, 7}, {0, 8, 2, 7}, {metasprite_end}
; };
_emote_metasprite:
    db $00, $00, $00, $07, $00, $08, $02, $07, $80, $00, $00, $00

_player_init:
    ld de, _ACTORS
    push de
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl
    ld hl, $c0b9
    res 2, [hl]
    res 3, [hl]
    ret

_deactivate_actor:
    add sp, -$08
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop bc
    push bc
    ld l, c
    ld h, b
    ld a, [hl]
    and $01
    ld hl, sp+$07
    ld [hl], a
    or a
    jp z, Jump_001_41d8

    ld hl, sp+$00
    ld a, [hl]
    sub $b9
    jr nz, jr_001_4096

    inc hl
    ld a, [hl]
    sub $c0
    jp z, Jump_001_41d8

    jr jr_001_4096

jr_001_4096:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$07
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    res 0, [hl]
    pop de
    push de
    ld hl, $0030
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    push de
    ld hl, $0032
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4115

    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_4115

    ld de, $0030
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl+], a
    ld e, c
    ld d, b
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jr jr_001_414e

jr_001_4115:
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4137

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld e, l
    ld d, h
    xor a
    ld [de], a
    inc de
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, $c4fd
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_414e

jr_001_4137:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_001_4148

    ld de, $0030
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    jr jr_001_414e

jr_001_4148:
    xor a
    ld hl, $c4fd
    ld [hl+], a
    ld [hl], a

jr_001_414e:
    xor a
    ld [bc], a
    inc bc
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, _ACTORS_INACTIVE_HEAD
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4172

    ld a, [hl+]
    ld b, [hl]
    add $32
    ld c, a
    jr nc, jr_001_416b

    inc b

jr_001_416b:
    ld hl, sp+$00
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a

jr_001_4172:
    ld hl, sp+$00
    ld a, [hl]
    ld [_ACTORS_INACTIVE_HEAD], a
    ld hl, sp+$01
    ld a, [hl]
    ld [_ACTORS_INACTIVE_HEAD + 1], a
    pop de
    push de
    ld hl, $002b
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push hl
    bit 7, [hl]
    pop hl
    jr nz, jr_001_41ab

    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_terminate
    call RST_08
    inc sp

jr_001_41ab:
    pop de
    push de
    ld hl, $002d
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push hl
    bit 7, [hl]
    pop hl
    jr nz, jr_001_41d8

    ld hl, sp+$06
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_detach_hthread
    call RST_08
    inc sp

Jump_001_41d8:
jr_001_41d8:
    add sp, $08
    ret

_activate_actor:
    add sp, -$08
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    ld a, [hl]
    and $01
    jp nz, Jump_001_4317

    ld l, c
    ld h, b
    ld a, [hl]
    swap a
    rlca
    jp c, Jump_001_4317

    ld l, c
    ld h, b
    set 0, [hl]
    push bc
    push bc
    ld e, $01
    ld hl, _actor_set_anim_idle
    call RST_08
    pop hl
    pop bc
    ld hl, $0030
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0032
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4272

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    or l
    jr z, jr_001_4272

    ld de, $0030
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$06
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    ld [de], a
    pop de
    push de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jr jr_001_42ad

jr_001_4272:
    ld hl, sp+$07
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4291

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld e, l
    ld d, h
    xor a
    ld [de], a
    inc de
    ld [de], a
    pop de
    push de
    ld a, [de]
    ld hl, _ACTORS_INACTIVE_HEAD
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_42ad

jr_001_4291:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    or l
    jr z, jr_001_42a7

    ld de, $0030
    add hl, de
    xor a
    ld [hl+], a
    ld [hl], a
    jr jr_001_42ad

jr_001_42a7:
    xor a
    ld hl, _ACTORS_INACTIVE_HEAD
    ld [hl+], a
    ld [hl], a

jr_001_42ad:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld [hl+], a
    ld [hl], a
    pop de
    push de
    ld hl, $c4fd
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    or [hl]
    jr z, jr_001_42cd

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0032
    add hl, de
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_001_42cd:
    ld hl, $c4fd
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $002b
    add hl, bc
    ld e, l
    ld d, h
    xor a
    ld [hl+], a
    ld [hl], $80
    ld hl, $0028
    add hl, bc
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    or a
    jr z, jr_001_430f

    inc hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, $0029
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    push bc
    xor a
    push af
    inc sp
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $06
    pop bc

jr_001_430f:
    ld hl, $002d
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], $80

Jump_001_4317:
    add sp, $08
    ret

_activate_actors_in_row:
    add sp, -$06
    ld a, [_ACTORS_INACTIVE_HEAD]
    ld [$c515], a
    ld a, [_ACTORS_INACTIVE_HEAD + 1]
    ld [$c516], a

Jump_001_4328:
    ld hl, $c516
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_440e

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld e, a
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$05
    ld [hl], e
    ld hl, $0030
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jp nz, Jump_001_43ff

    ld l, c
    ld h, b
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$02
    ld a, c
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$04
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_001_43b6

    bit 7, d
    jr nz, jr_001_43bb

    cp a
    jr jr_001_43bb

jr_001_43b6:
    bit 7, d
    jr z, jr_001_43bb

    scf

jr_001_43bb:
    jr nc, jr_001_43ff

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0017
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_001_43db

    bit 7, d
    jr nz, jr_001_43e0

    cp a
    jr jr_001_43e0

jr_001_43db:
    bit 7, d
    jr z, jr_001_43e0

    scf

jr_001_43e0:
    jr nc, jr_001_43ff

    pop bc
    push bc
    push bc
    ld hl, $c515
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _activate_actor
    call RST_08
    pop hl
    pop bc
    ld hl, $c515
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_001_4328


Jump_001_43ff:
jr_001_43ff:
    ld hl, sp+$00
    ld a, [hl]
    ld [$c515], a
    ld hl, sp+$01
    ld a, [hl]
    ld [$c516], a
    jp Jump_001_4328


Jump_001_440e:
    add sp, $06
    ret

_activate_actors_in_col:
    add sp, -$07
    ld a, [_ACTORS_INACTIVE_HEAD]
    ld [$c517], a
    ld a, [_ACTORS_INACTIVE_HEAD + 1]
    ld [$c518], a

Jump_001_441f:
    ld hl, $c518
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_455f

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    inc hl
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld [hl], e
    ld l, c
    ld h, b
    inc hl
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
    pop de
    push de
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$02
    ld [hl], e
    ld hl, sp+$05
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, $0007
    add hl, bc
    ld a, [hl]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, de
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$05
    ld [hl], e
    pop de
    push de
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, $0008
    add hl, bc
    ld a, [hl]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, de
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$06
    ld [hl], e
    ld hl, $0030
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr c, jr_001_4556

    inc hl
    ld a, [hl]
    ld hl, sp+$0d
    sub [hl]
    jr c, jr_001_4556

    inc hl
    ld e, [hl]
    ld d, $00
    ld hl, $0015
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$03
    ld e, l
    ld d, h
    ld hl, sp+$05
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_001_452c

    bit 7, d
    jr nz, jr_001_4531

    cp a
    jr jr_001_4531

jr_001_452c:
    bit 7, d
    jr z, jr_001_4531

    scf

jr_001_4531:
    jr c, jr_001_4556

    ld hl, sp+$02
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr c, jr_001_4556

    push bc
    ld hl, $c517
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _activate_actor
    call RST_08
    pop hl
    pop bc
    ld hl, $c517
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_001_441f


jr_001_4556:
    ld hl, $c517
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_001_441f


Jump_001_455f:
    add sp, $07
    ret

_actor_set_frames:
    add sp, -$05
    ld hl, sp+$0b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    inc sp
    inc sp
    ld e, l
    ld d, h
    push de
    ld a, [de]
    ld hl, sp+$04
    ld [hl], a
    ld hl, $000d
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_001_459c

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr z, jr_001_45b3

jr_001_459c:
    ld hl, $000b
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0d
    ld a, [hl]
    ld [bc], a
    pop de
    push de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0e
    ld a, [hl]
    ld [de], a

jr_001_45b3:
    add sp, $05
    ret

_actor_set_frame_offset:
    dec sp
    dec sp
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, $000b
    add hl, de
    pop de
    inc sp
    inc sp
    push hl
    ld hl, $000c
    add hl, de
    ld c, [hl]
    ld hl, $000d
    add hl, de
    ld e, [hl]
    ld d, $00
    ld l, c
    ld h, $00
    ld a, e
    sub l
    ld b, a
    ld a, d
    sbc h
    ld hl, sp+$0a
    ld e, [hl]
    ld d, $00
    push bc
    ld l, b
    ld h, a
    push hl
    push de
    call _modsint
    add sp, $04
    pop bc
    ld a, e
    add c
    ld c, a
    pop hl
    push hl
    ld [hl], c
    inc sp
    inc sp
    ret

_actor_get_frame_offset:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $000b
    add hl, bc
    ld e, [hl]
    ld hl, $000c
    add hl, bc
    ld c, [hl]
    ld a, e
    sub c
    ld e, a
    ret

_actor_set_anim_idle:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld e, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    sla e
    ld d, $00
    add hl, de
    ld e, l
    ld d, h
    inc de
    ld a, [de]
    inc a
    ld d, [hl]
    push af
    inc sp
    push de
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ret

_actor_set_anim_moving:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld a, [hl]
    add $04
    ld e, a
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    sla e
    ld d, $00
    add hl, de
    ld e, l
    ld d, h
    inc de
    ld a, [de]
    inc a
    ld d, [hl]
    push af
    inc sp
    push de
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ret

_actor_set_dir:
    ld hl, sp+$06
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld a, [hl+]
    ld [de], a
    ld a, [hl]
    or a
    jr z, jr_001_46a1

    dec hl
    ld a, [hl]
    add $04
    ld e, a
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    sla e
    ld d, $00
    add hl, de
    ld e, l
    ld d, h
    inc de
    ld a, [de]
    inc a
    ld d, [hl]
    push af
    inc sp
    push de
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ret


jr_001_46a1:
    ld hl, sp+$08
    ld e, [hl]
    ld hl, $0010
    add hl, bc
    ld [hl], e
    ld hl, $0012
    add hl, bc
    ld d, l
    sla e
    ld l, d
    ld d, $00
    add hl, de
    ld e, l
    ld d, h
    inc de
    ld a, [de]
    inc a
    ld d, [hl]
    push af
    inc sp
    push de
    inc sp
    push bc
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ret

_actor_at_tile:
    add sp, -$04
    ld a, [_ACTORS_ACTIVE_HEAD]
    ld hl, sp+$00
    ld [hl], a
    ld a, [_ACTORS_ACTIVE_HEAD + 1]
    ld hl, sp+$01
    ld [hl], a

Jump_001_46d8:
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_479a

    ld hl, sp+$0c
    ld a, [hl]
    or a
    jr nz, jr_001_46f4

    ld hl, sp+$00
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    swap a
    rrca
    and $01
    jp z, Jump_001_4786

jr_001_46f4:
    pop bc
    push bc
    inc bc
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld e, a
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    ld hl, sp+$03
    ld [hl], e
    ld l, c
    ld h, b
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$0b
    ld a, [hl]
    sub c
    jr z, jr_001_4755

    ld b, $00
    inc bc
    ld hl, sp+$0b
    ld e, [hl]
    ld d, $00
    ld a, e
    sub c
    jr nz, jr_001_4786

    ld a, d
    sub b
    jr nz, jr_001_4786

jr_001_4755:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$03
    sub [hl]
    jr z, jr_001_4782

    ld hl, sp+$03
    ld c, [hl]
    ld b, $00
    ld e, c
    ld d, b
    inc de
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl]
    sub e
    jr nz, jr_001_4776

    inc hl
    ld a, [hl]
    sub d
    jr z, jr_001_4782

jr_001_4776:
    dec bc
    ld hl, sp+$02
    ld a, [hl]
    sub c
    jr nz, jr_001_4786

    inc hl
    ld a, [hl]
    sub b
    jr nz, jr_001_4786

jr_001_4782:
    pop de
    push de
    jr jr_001_479d

Jump_001_4786:
jr_001_4786:
    pop de
    push de
    ld hl, $0030
    add hl, de
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_46d8


Jump_001_479a:
    ld de, $0000

jr_001_479d:
    add sp, $04
    ret

_actor_in_front_of_player:
    add sp, -$0c
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], d
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$04
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld hl, sp+$12
    ld c, [hl]
    ld b, $00
    ld a, c
    add a
    rl b
    add a
    rl b
    add a
    rl b
    add a
    rl b
    ld hl, sp+$06
    ld [hl+], a
    ld [hl], b
    ld a, [$c0be]
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    ld e, [hl]
    ld d, $00
    sla e
    rl d
    ld hl, $19c4
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    push bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc de
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    push bc
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld de, $c0b9
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$13
    ld a, [hl]
    push af
    inc sp
    push de
    push bc
    ld de, $c0bf
    push de
    ld e, $01
    ld hl, _actor_overlapping_bb
    call RST_08
    add sp, $13
    ret

_actor_overlapping_player:
    add sp, -$10
    ld de, $c0eb
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

Jump_001_4893:
jr_001_4893:
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_4b1a

    pop de
    push de
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$16
    ld a, [hl]
    or a
    jr nz, jr_001_48d5

    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    swap a
    rrca
    and $01
    jr nz, jr_001_48d5

    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_4893

jr_001_48d5:
    pop de
    push de
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl], a
    pop de
    push de
    ld hl, $0006
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld hl, sp+$0e
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_001_49a9

    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld a, [bc]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld a, [$c0bf]
    ld hl, sp+$0e
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$08
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
    ld hl, sp+$0a
    ld e, l
    ld d, h
    ld hl, sp+$0e
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_001_49b0

jr_001_49a9:
    ld hl, sp+$0f
    ld [hl], $00
    jp Jump_001_4b01


jr_001_49b0:
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld de, $c0bc
    ld a, [de]
    ld hl, sp+$0e
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [$c0c2]
    ld hl, sp+$0f
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
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
    ld hl, sp+$0e
    ld e, l
    ld d, h
    ld hl, sp+$08
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr c, jr_001_4af7

    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    ld a, [$c0c1]
    ld hl, sp+$0f
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$09
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
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$0c
    ld e, l
    ld d, h
    ld hl, sp+$0e
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_001_4afd

jr_001_4af7:
    ld hl, sp+$0f
    ld [hl], $00
    jr jr_001_4b01

jr_001_4afd:
    ld hl, sp+$0f
    ld [hl], $01

Jump_001_4b01:
jr_001_4b01:
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr z, jr_001_4b0b

    pop de
    push de
    jr jr_001_4b1d

jr_001_4b0b:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_4893


Jump_001_4b1a:
    ld de, $0000

jr_001_4b1d:
    add sp, $10
    ret

_actor_overlapping_bb:
    add sp, -$17
    ld hl, sp+$00
    ld [hl], $b9
    inc hl
    ld [hl], $c0
    ld hl, sp+$1f
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$20
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$1d
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    ld hl, sp+$05
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$08
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$07
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    ld hl, sp+$0c
    ld [hl], a

Jump_001_4b82:
jr_001_4b82:
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_001_4d39

    pop de
    push de
    ld hl, $0032
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0f
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$21
    ld a, [hl]
    ld hl, sp+$00
    sub [hl]
    jr nz, jr_001_4ba9

    ld hl, sp+$22
    ld a, [hl]
    ld hl, sp+$01
    sub [hl]
    jr z, jr_001_4bbd

jr_001_4ba9:
    ld hl, sp+$23
    ld a, [hl]
    or a
    jr nz, jr_001_4bcb

    ld hl, sp+$00
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    swap a
    rrca
    and $01
    jr nz, jr_001_4bcb

jr_001_4bbd:
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jr jr_001_4b82

jr_001_4bcb:
    pop de
    push de
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$13
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$12
    ld [hl], a
    pop de
    push de
    ld hl, $0006
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$11
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$10
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    dec hl
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld hl, sp+$13
    ld [hl], c
    inc hl
    ld [hl], b
    ld d, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$17
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$15
    ld a, e
    sub [hl]
    inc hl
    ld a, d
    sbc [hl]
    jr c, jr_001_4c80

    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc de
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$17
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$15
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_001_4c84

jr_001_4c80:
    xor a
    jp Jump_001_4d23


jr_001_4c84:
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    inc de
    inc de
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$15
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$14
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$15
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl-], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$13
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    jr c, jr_001_4d1e

    ld hl, sp+$0f
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$0c
    ld a, [hl]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$15
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    ld a, c
    sub e
    ld a, b
    sbc d
    jr nc, jr_001_4d21

jr_001_4d1e:
    xor a
    jr jr_001_4d23

jr_001_4d21:
    ld a, $01

Jump_001_4d23:
jr_001_4d23:
    or a
    jr z, jr_001_4d2a

    pop de
    push de
    jr jr_001_4d3c

jr_001_4d2a:
    ld hl, sp+$0d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_4b82


Jump_001_4d39:
    ld de, $0000

jr_001_4d3c:
    add sp, $17
    ret

_actor_handle_player_collision:
    dec sp
    ld a, [$c508]
    or a
    jr nz, jr_001_4dba

    ld hl, $c50a
    ld a, [hl-]
    or [hl]
    jr z, jr_001_4dba

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $002f
    add hl, bc
    ld c, [hl]
    ld a, c
    or a
    jr z, jr_001_4dc2

    ld a, [$c0de]
    ld hl, sp+$00
    ld [hl], a
    or a
    jr z, jr_001_4d84

    ld b, $00
    ld hl, $c0df
    ld a, [hl+]
    ld h, [hl]
    ld e, a
    ld d, h
    push bc
    ld a, $01
    push af
    inc sp
    ld bc, $0000
    push bc
    push de
    ld hl, sp+$07
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08

jr_001_4d84:
    ld hl, $c509
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0025
    add hl, de
    ld b, [hl]
    ld a, b
    or a
    jr z, jr_001_4db3

    ld hl, $0026
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $0000
    push de
    ld a, $01
    push af
    inc sp
    ld de, $0000
    push de
    push hl
    push bc
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08

jr_001_4db3:
    ld hl, $c508
    ld [hl], $14
    jr jr_001_4dc2

jr_001_4dba:
    ld hl, $c508
    ld a, [hl]
    or a
    jr z, jr_001_4dc2

    dec [hl]

jr_001_4dc2:
    xor a
    ld hl, $c509
    ld [hl+], a
    ld [hl], a
    inc sp
    ret

_check_collision_in_direction:
    add sp, -$10
    ld hl, sp+$16
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$17
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$1c
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$1d
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld hl, sp+$18
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0002
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    dec a
    jr z, jr_001_4e9a

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    sub $02
    jp z, Jump_001_50a7

    ld hl, sp+$1e
    ld a, [hl]
    sub $03
    jp z, Jump_001_52b9

    ld hl, sp+$1e
    ld a, [hl]
    sub $04
    jp z, Jump_001_5428

    jp Jump_001_55b2


jr_001_4e9a:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    inc sp
    inc sp
    push hl
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$0b
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$09
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    inc sp
    inc sp
    push hl
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a

Jump_001_4f9f:
    ld hl, sp+$0a
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_001_4fb0

    ld hl, sp+$0b
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jp z, Jump_001_509f

jr_001_4fb0:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl-]
    dec hl
    ld [hl], a

Jump_001_4fba:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$06
    sub [hl]
    jr nz, jr_001_4fcb

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jp z, Jump_001_5087

jr_001_4fcb:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$02
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_501c

    ld hl, sp+$02
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_501c

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$02
    ld a, [hl]
    ld c, $00
    push bc
    push de
    ld e, a
    ld d, c
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$03
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$03
    ld [hl], e
    jr jr_001_5020

jr_001_501c:
    ld hl, sp+$03
    ld [hl], $0f

jr_001_5020:
    push hl
    ld hl, sp+$05
    bit 3, [hl]
    pop hl
    jr z, jr_001_507c

    ld hl, sp+$0c
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
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld a, $07

jr_001_5042:
    ld hl, sp+$0c
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_5042

    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl], a
    ld a, $04

jr_001_5059:
    ld hl, sp+$0e
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_5059

    dec hl
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$0b
    ld [hl-], a
    ld [hl], e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


jr_001_507c:
    ld hl, sp+$06
    inc [hl]
    jp nz, Jump_001_4fba

    inc hl
    inc [hl]
    jp Jump_001_4fba


Jump_001_5087:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    jp Jump_001_4f9f


Jump_001_509f:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


Jump_001_50a7:
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    pop hl
    push hl
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl], a
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    pop de
    push de
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$09
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$09
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$0a
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$09
    ld [hl], a
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
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
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl]
    ld hl, sp+$07
    ld [hl], a
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    inc hl
    srl [hl]
    dec hl
    rr [hl]
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    inc sp
    inc sp
    push hl
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a

Jump_001_51b3:
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_001_51c4

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$05
    sub [hl]
    jp z, Jump_001_52b1

jr_001_51c4:
    ld hl, sp+$08
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$09
    ld a, [hl-]
    dec hl
    ld [hl], a

Jump_001_51ce:
    ld hl, sp+$00
    ld a, [hl]
    ld hl, sp+$06
    sub [hl]
    jr nz, jr_001_51df

    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$07
    sub [hl]
    jp z, Jump_001_529b

jr_001_51df:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$02
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_5230

    ld hl, sp+$02
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_5230

    ld hl, $c52f
    ld b, [hl]
    ld hl, $c532
    ld e, [hl]
    ld d, $00
    ld hl, sp+$02
    ld a, [hl]
    ld c, $00
    push bc
    push de
    ld e, a
    ld d, c
    push de
    call Call_000_3569
    add sp, $04
    pop bc
    ld a, e
    ld hl, $c530
    add [hl]
    inc hl
    ld e, a
    ld a, d
    adc [hl]
    ld d, a
    ld hl, sp+$03
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    push bc
    inc sp
    push de
    call _ReadBankedUWORD
    add sp, $03
    ld hl, sp+$03
    ld [hl], e
    jr jr_001_5234

jr_001_5230:
    ld hl, sp+$03
    ld [hl], $0f

jr_001_5234:
    push hl
    ld hl, sp+$05
    bit 2, [hl]
    pop hl
    jr z, jr_001_5290

    ld a, $07

jr_001_523e:
    ld hl, sp+$0e
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_523e

    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    inc hl
    ld d, a
    ld a, [de]
    ld [hl], a
    ld a, [hl-]
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
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
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld a, $04

jr_001_526e:
    ld hl, sp+$0c
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_001_526e

    inc hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$0b
    ld [hl-], a
    ld [hl], e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


jr_001_5290:
    ld hl, sp+$06
    inc [hl]
    jp nz, Jump_001_51ce

    inc hl
    inc [hl]
    jp Jump_001_51ce


Jump_001_529b:
    ld hl, sp+$04
    inc [hl]
    jr nz, jr_001_52a2

    inc hl
    inc [hl]

jr_001_52a2:
    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    jp Jump_001_51b3


Jump_001_52b1:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


Jump_001_52b9:
    ld hl, sp+$02
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl-]
    dec hl
    ld [hl+], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld de, $0001
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld hl, sp+$05
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$06
    ld a, c
    ld [hl+], a
    ld [hl], b
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    inc bc
    ld hl, sp+$08
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_001_5359:
    ld hl, sp+$04
    ld a, [hl]
    sub e
    jr nz, jr_001_5365

    inc hl
    ld a, [hl]
    sub d
    jp z, Jump_001_5420

jr_001_5365:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a

Jump_001_5371:
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr nz, jr_001_5382

    ld hl, sp+$09
    ld a, [hl]
    ld hl, sp+$0f
    sub [hl]
    jp z, Jump_001_5417

jr_001_5382:
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_53de

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_53de

    ld a, [$c52f]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, $c532
    ld c, [hl]
    ld b, $00
    ld hl, sp+$0d
    ld a, [hl-]
    ld [hl+], a
    xor a
    ld [hl-], a
    push de
    push bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_000_3569
    add sp, $04
    ld c, e
    ld b, d
    pop de
    ld a, c
    ld hl, $c530
    add [hl]
    inc hl
    ld c, a
    ld a, b
    adc [hl]
    ld b, a
    ld hl, sp+$0a
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    push de
    ld hl, sp+$0d
    ld a, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    ld c, e
    pop de
    ld hl, sp+$0d
    ld [hl], c
    jr jr_001_53e2

jr_001_53de:
    ld hl, sp+$0d
    ld [hl], $0f

jr_001_53e2:
    push hl
    ld hl, sp+$0f
    bit 1, [hl]
    pop hl
    jr z, jr_001_540c

    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    xor a
    rr b
    ld b, c
    rr b
    rra
    ld c, a
    pop de
    push de
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld a, c
    sub l
    ld e, a
    ld a, b
    sbc h
    ld d, a
    jp Jump_001_55b7


jr_001_540c:
    ld hl, sp+$0e
    inc [hl]
    jp nz, Jump_001_5371

    inc hl
    inc [hl]
    jp Jump_001_5371


Jump_001_5417:
    dec de
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d
    jp Jump_001_5359


Jump_001_5420:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jp Jump_001_55b7


Jump_001_5428:
    ld hl, sp+$04
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    inc bc
    ld hl, sp+$04
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    sra b
    rr c
    sra b
    rr c
    sra b
    rr c
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld d, h
    srl d
    rr e
    srl d
    rr e
    srl d
    rr e
    inc de
    ld hl, sp+$06
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_001_54bb:
    ld hl, sp+$04
    ld a, [hl]
    sub e
    jr nz, jr_001_54c7

    inc hl
    ld a, [hl]
    sub d
    jp z, Jump_001_55ab

jr_001_54c7:
    ld hl, sp+$0e
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_001_54cc:
    ld hl, sp+$06
    ld a, [hl]
    ld hl, sp+$0e
    sub [hl]
    jr nz, jr_001_54dd

    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$0f
    sub [hl]
    jp z, Jump_001_55a2

jr_001_54dd:
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, $c532
    sub [hl]
    jr nc, jr_001_5564

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, $c533
    sub [hl]
    jr nc, jr_001_5564

    ld a, [$c52f]
    ld hl, sp+$09
    ld [hl], a
    ld a, [$c532]
    ld hl, sp+$0a
    ld [hl+], a
    xor a
    ld [hl+], a
    inc hl
    ld a, [hl-]
    ld [hl+], a
    ld [hl], $00
    push bc
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$12
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call Call_000_3569
    add sp, $04
    ld hl, sp+$10
    ld a, e
    ld [hl+], a
    ld [hl], d
    pop de
    pop bc
    push de
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $c530
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    pop de
    push hl
    ld a, l
    ld hl, sp+$0c
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0b
    ld [hl-], a
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$0a
    ld l, [hl]
    ld h, $00
    add hl, de
    pop de
    push hl
    ld a, l
    ld hl, sp+$0e
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0d
    ld [hl], a
    push de
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call _ReadBankedUWORD
    add sp, $03
    ld l, e
    pop de
    ld a, l
    jr jr_001_5566

jr_001_5564:
    ld a, $0f

jr_001_5566:
    rrca
    jr nc, jr_001_5597

    ld hl, sp+$02
    ld a, [hl+]
    ld c, [hl]
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    add a
    rl c
    pop de
    push de
    push af
    ld a, [de]
    ld l, a
    rlca
    sbc a
    ld h, a
    inc hl
    pop af
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    sub l
    ld e, a
    ld a, c
    sbc h
    ld d, a
    jr jr_001_55b7

jr_001_5597:
    ld hl, sp+$0e
    inc [hl]
    jp nz, Jump_001_54cc

    inc hl
    inc [hl]
    jp Jump_001_54cc


Jump_001_55a2:
    inc de
    ld hl, sp+$02
    ld a, e
    ld [hl+], a
    ld [hl], d
    jp Jump_001_54bb


Jump_001_55ab:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    jr jr_001_55b7

Jump_001_55b2:
    ld hl, sp+$1c
    ld a, [hl+]
    ld e, a
    ld d, [hl]

Jump_001_55b7:
jr_001_55b7:
    add sp, $10
    ret