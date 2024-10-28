; Loaded at bank 0 0x1b61

_projectiles_update:
    add sp, -$09
    ld a, [_projectiles_active_head]
    ld [_projectiles_inactive_head + 3], a
    ld a, [_projectiles_active_head + 1]
    ld [_projectile + 1], a
    xor a
    ld hl, _prev_projectile
    ld [hl+], a
    ld [hl], a
    ldh a, [$90]
    ld [_save_bank], a

Jump_000_1b7a:
    ld hl, $c7d1
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_1ff2

    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    ld a, [$c7d1]
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0013
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
    or a
    jr nz, jr_000_1bfe

    dec hl
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$07
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c7d3
    ld a, [hl-]
    or [hl]
    jr z, jr_000_1bc9

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_1bcf

jr_000_1bc9:
    ld hl, _projectiles_active_head
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_000_1bcf:
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0023
    add hl, bc
    ld c, l
    ld b, h
    ld hl, _projectiles_inactive_head
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld a, [_projectile ]
    ld [_projectiles_inactive_head], a
    ld a, [$c7d1]
    ld [$c7ce], a
    ld hl, sp+$07
    ld a, [hl]
    ld [_projectile ], a
    ld hl, sp+$08
    ld a, [hl]
    ld [$c7d1], a
    jp Jump_000_1b7a


jr_000_1bfe:
    ld c, a
    dec c
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $001d
    add hl, bc
    ld a, [hl]
    ld hl, _GAME_TIME
    and [hl]
    jr nz, jr_000_1c4f

    ld hl, $0009
    add hl, bc
    inc [hl]
    ld a, [hl]
    ld hl, _projectile 
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$07
    ld [hl], a
    ld hl, $000b
    add hl, de
    ld a, [hl]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    sub [hl]
    jr nz, jr_000_1c4f

    ld l, e
    ld h, d
    ld a, [hl]
    and $01
    jr nz, jr_000_1c4a

    ld hl, $000a
    add hl, de
    ld a, [hl]
    ld [bc], a
    jr jr_000_1c4f

jr_000_1c4a:
    ld hl, sp+$07
    ld a, [hl]
    dec a
    ld [bc], a

jr_000_1c4f:
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    inc hl
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
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
    ld hl, $0005
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0003
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
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
    ld hl, $0007
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld b, a
    ld c, e
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _GAME_TIME
    ld c, [hl]
    ld a, [_projectile ]
    ld hl, sp+$07
    ld [hl], a
    ld a, [$c7d1]
    ld hl, sp+$08
    ld [hl], a
    bit 0, c
    jp nz, Jump_000_1e2a

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$05
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl], a
    xor a
    push af
    inc sp
    ld de, $0000
    push de
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld e, $01
    ld hl, _actor_overlapping_bb
    call RST_08
    add sp, $07
    ld hl, sp+$07
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$07
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$08
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld a, [_projectile ]
    ld hl, sp+$07
    ld [hl], a
    ld a, [$c7d1]
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_1e2a

    pop de
    push de
    ld hl, $002f
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0022
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    and c
    jp z, Jump_000_1e2a

    pop de
    push de
    ld hl, $0025
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$02
    ld [hl], a
    ld a, [hl]
    or a
    jr z, jr_000_1dbc

    pop de
    push de
    ld hl, $002d
    add hl, de
    ld c, l
    ld b, h
    inc hl
    ld a, [hl-]
    ld l, [hl]
    rlca
    jr nc, jr_000_1dbc

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0021
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$03
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld [hl], b
    pop de
    push de
    ld hl, $0026
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
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, $01
    push af
    inc sp
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08

jr_000_1dbc:
    ld a, [_projectile ]
    ld hl, sp+$07
    ld [hl], a
    ld a, [$c7d1]
    ld hl, sp+$08
    ld [hl-], a
    ld a, [hl+]
    ld c, [hl]
    ld l, a
    ld h, c
    ld a, [hl]
    rrca
    and $01
    jr nz, jr_000_1e2a

    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$07
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c7d3
    ld a, [hl-]
    or [hl]
    jr z, jr_000_1df6

    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_000_1dfc

jr_000_1df6:
    ld hl, _projectiles_active_head
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_000_1dfc:
    ld hl, _projectile 
    ld a, [hl+]
    ld b, [hl]
    add $23
    ld c, a
    jr nc, jr_000_1e07

    inc b

jr_000_1e07:
    ld hl, _projectiles_inactive_head
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld a, [_projectile ]
    ld [_projectiles_inactive_head], a
    ld a, [$c7d1]
    ld [$c7ce], a
    ld hl, sp+$07
    ld a, [hl]
    ld [_projectile ], a
    ld hl, sp+$08
    ld a, [hl]
    ld [$c7d1], a
    jp Jump_000_1b7a


Jump_000_1e2a:
jr_000_1e2a:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
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
    ld a, [hl+]
    ld [hl], a
    ld hl, _DRAW_SCROLL_X
    ld c, [hl]
    ld hl, sp+$06
    ld a, [hl-]
    dec hl
    sub c
    add $08
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0003
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
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
    ld a, [hl+]
    ld [hl], a
    ld hl, $c7da
    ld c, [hl]
    ld hl, sp+$06
    ld a, [hl-]
    sub c
    add $08
    ld [hl-], a
    ld a, $a0
    sub [hl]
    jr c, jr_000_1eb6

    inc hl
    ld a, $90
    sub [hl]
    jp nc, Jump_000_1f56

jr_000_1eb6:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$01
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, $c7d3
    ld a, [hl-]
    or [hl]
    jr z, jr_000_1f07

    ld a, [hl]

Jump_000_1ee1:
    ld hl, sp+$05
    ld [hl], a
    ld a, [$c7d3]
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
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
    ld hl, sp+$01
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jr jr_000_1f13

jr_000_1f07:
    ld hl, sp+$01
    ld a, [hl]
    ld [_projectiles_active_head], a
    ld hl, sp+$02
    ld a, [hl]
    ld [$c7cc], a

jr_000_1f13:
    ld a, [_projectile ]
    ld hl, sp+$05
    ld [hl], a
    ld a, [$c7d1]
    ld hl, sp+$06
    ld [hl-], a

Jump_000_1f1f:
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
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
    ld hl, _projectiles_inactive_head
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [_projectile ]
    ld [_projectiles_inactive_head], a
    ld a, [$c7d1]
    ld [$c7ce], a
    ld hl, sp+$03
    ld a, [hl]
    ld [_projectile ], a
    ld hl, sp+$04
    ld a, [hl]
    ld [$c7d1], a
    jp Jump_000_1b7a


Jump_000_1f56:
    ld hl, sp+$07
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0011
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [_allocated_hardware_sprites]
    ld hl, sp+$06
    ld [hl], a
    ld hl, $0014
    add hl, bc
    ld a, [hl]
    ld [$da1d], a
    ld l, e
    ld h, d
    inc hl
    inc hl
    inc hl
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0009
    add hl, bc
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
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
    ld a, [hl-]
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl]
    ld [$da1b], a
    ld hl, sp+$08
    ld a, [hl]
    ld [$da1c], a
    ld hl, sp+$05
    ld a, [hl-]
    ld d, a
    ld a, [hl+]
    inc hl
    ld e, a
    push de
    ld a, [hl]
    push af
    inc sp
    call _move_metasprite
    add sp, $03
    ld a, e
    ld hl, _allocated_hardware_sprites
    add [hl]
    ld [hl], a
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, _prev_projectile
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, _projectile 
    ld [hl+], a
    inc de
    ld a, [de]

Call_000_1fee:
    ld [hl], a
    jp Jump_000_1b7a


Jump_000_1ff2:
    ld hl, _save_bank
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    add sp, $09
    ret


_projectiles_render:
    add sp, -$07
    ld a, [_projectiles_active_head]
    ld [_projectile], a
    ld a, [_projectiles_active_head + 1]
    ld [_projectile + 1], a
    xor a
    ld hl, _prev_projectile
    ld [hl+], a
    ld [hl], a
    ldh a, [$90]
    ld [_save_bank], a

Jump_000_2019:
    ld hl, _projectile + 1
    ld a, [hl-]
    or [hl]
    jp z, Jump_000_2165

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld l, c
    ld h, b
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    ld hl, _DRAW_SCROLL_X
    ld e, [hl]
    sub e
    add $08
    ld hl, sp+$02
    ld [hl], a
    ld l, c
    ld h, b
    inc hl
    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    srl h
    rr l
    ld a, l
    ld hl, _DRAW_SCROLL_Y
    ld e, [hl]
    sub e
    add $08
    ld hl, sp+$03
    ld [hl-], a
    ld a, $a0
    sub [hl]
    jr c, jr_000_2073

    inc hl
    ld a, $90
    sub [hl]
    jr nc, jr_000_20d1

jr_000_2073:
    ld hl, $0023
    add hl, bc
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
    ld c, a
    ld b, [hl]
    ld hl, _prev_projectile + 1
    ld a, [hl-]
    or [hl]
    jr z, jr_000_209d

    ld a, [hl+]
    ld d, [hl]
    add $23
    ld e, a
    jr nc, jr_000_2094

    inc d

jr_000_2094:
    ld hl, sp+$05
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    jr jr_000_20a9

jr_000_209d:
    ld hl, sp+$05
    ld a, [hl]
    ld [_projectiles_active_head], a
    ld hl, sp+$06
    ld a, [hl]
    ld [_projectiles_active_head + 1], a

jr_000_20a9:
    ld hl, _projectile 
    ld a, [hl+]
    ld d, [hl]
    add $23
    ld e, a
    jr nc, jr_000_20b4

    inc d

jr_000_20b4:
    ld hl, _projectiles_inactive_head
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, [_projectile ]
    ld [_projectiles_inactive_head], a
    ld a, [$c7d1]
    ld [$c7ce], a
    ld hl, _projectile 
    ld a, c
    ld [hl+], a
    ld [hl], b
    jp Jump_000_2019


jr_000_20d1:
    ld hl, $0010
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ldh [$90], a
    ld a, [bc]
    ld [$2000], a
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0011
    add hl, bc
    ld a, [hl+]
    ld l, [hl]
    ld e, a
    ld d, l
    ld a, [_allocated_hardware_sprites]
    ld hl, sp+$04
    ld [hl], a
    ld hl, $0014
    add hl, bc
    ld a, [hl]
    ld [$da1d], a
    ld l, e
    ld h, d
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
    ld hl, $0009
    add hl, bc
    ld l, [hl]
    ld h, $00
    add hl, hl
    ld c, l
    ld b, h
    pop hl
    push hl
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
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
    ld a, [hl]
    ld [$da1b], a
    ld hl, sp+$06
    ld a, [hl]
    ld [$da1c], a
    ld hl, sp+$03
    ld a, [hl-]
    ld d, a
    ld a, [hl+]
    inc hl
    ld e, a
    push de
    ld a, [hl]
    push af
    inc sp
    call _move_metasprite
    add sp, $03
    ld a, e
    ld hl, _allocated_hardware_sprites
    add [hl]
    ld [hl], a
    ld hl, _projectile 
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, _prev_projectile
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, _projectile 
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_000_2019


Jump_000_2165:
    ld hl, _save_bank
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    add sp, $07
    ret