; Loaded in bank 3 0x4be6
; projectiles_init and projectile_launch are banked in bank 3
; projectile_update and projectile_render are nonbanked

_projectiles_init:
    dec sp
    xor a
    ld hl, _projectiles_active_head
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _projectiles_inactive_head
    ld [hl+], a
    ld [hl], a
    ld hl, sp+$00
    ld [hl], $00

jr_003_4bf7:
    ld hl, sp+$00
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, hl
    add hl, bc
    ld bc, $c69f
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld hl, _projectiles_inactive_head
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    ld [de], a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $05
    jr nz, jr_003_4bf7

    inc sp
    ret

_projectile_launch:
    add sp, -$12
    ld a, [_projectiles_inactive_head]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c7ce]
    ld hl, sp+$03
    ld [hl], a
    ld a, [hl-]
    or [hl]
    jp z, Jump_003_502c

    ld hl, sp+$18
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$12
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$11
    ld [hl], a
    ld de, $c758
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000c
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$11
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$10
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0017
    push hl
    push bc
    push de
    call _memcpy
    add sp, $06
    ld hl, sp+$11
    ld [hl], $02
    ld a, $e0
    ld hl, sp+$1b
    sub [hl]
    jr c, jr_003_4ca9

    ld a, [hl]
    sub $a0
    jr c, jr_003_4c91

    ld hl, sp+$11
    ld [hl], $03
    jr jr_003_4ca9

jr_003_4c91:
    ld a, $60
    ld hl, sp+$1b
    sub [hl]
    jr nc, jr_003_4c9e

    ld hl, sp+$11
    ld [hl], $00
    jr jr_003_4ca9

jr_003_4c9e:
    ld hl, sp+$1b
    ld a, [hl]
    sub $20
    jr c, jr_003_4ca9

    ld hl, sp+$11
    ld [hl], $01

jr_003_4ca9:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$1c
    ld a, [hl]
    and $01
    ld l, a
    ld a, [bc]
    and $fe
    or l
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$1c
    ld a, [hl]
    rrca
    and $01
    rlca
    and $02
    ld l, a
    ld a, [bc]
    and $fd
    or l
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld e, l
    ld d, h
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$05
    ld [hl], a
    push de
    ld hl, sp+$11
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0009
    add hl, de
    pop de
    ld c, l
    ld b, h
    ld hl, sp+$11
    ld a, [hl]
    add a
    add c
    ld c, a
    ld a, $00
    adc b
    ld b, a
    ld a, [bc]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000a
    add hl, de
    ld e, l
    ld d, h
    ld a, [bc]
    ld [de], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $000b
    add hl, de
    ld e, l
    ld d, h
    inc bc
    ld a, [bc]
    inc a
    ld [de], a
    ld hl, sp+$0f
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0013
    add hl, de
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld hl, sp+$10
    ld [hl], c
    inc hl
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$0e
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld e, c
    ld d, b
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, sp+$06
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    inc bc
    inc bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    inc hl
    inc hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld de, _sine_wave
    ld hl, sp+$1b
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    add $40
    ld c, a
    ld hl, _sine_wave
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld hl, sp+$0b
    ld [hl], a
    ld hl, sp+$0a
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$10
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$0f
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl-]
    dec hl
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
    inc hl
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
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    dec hl
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
    add hl, hl
    add hl, bc
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
    inc hl
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
    inc hl
    sra [hl]
    dec hl
    rr [hl]

jr_003_4e24:
    ld hl, sp+$10
    ld a, $ff
    sub [hl]
    inc hl
    ld a, $00
    sbc [hl]
    jr nc, jr_003_4e7a

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0c
    ld a, [hl+]
    ld e, [hl]
    add c
    ld c, a
    ld a, e
    adc b
    ld b, a
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$10
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $00ff
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$11
    ld [hl-], a
    ld [hl], e
    jr jr_003_4e24

jr_003_4e7a:
    ld hl, sp+$11
    ld a, [hl-]
    or [hl]
    jp z, Jump_003_4f5e

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0e
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, [hl+]
    ld [hl], a
    push af
    inc sp
    ld hl, sp+$0b
    ld a, [hl]
    push af
    inc sp
    call _muluschar
    pop hl
    ld hl, sp+$0c
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0d
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
    inc hl
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
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$0c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    pop hl
    push hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, sp+$08
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0f
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$0c
    ld a, [hl]
    push af
    inc sp
    call _muluschar
    pop hl
    ld hl, sp+$0d
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$0a
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$0b
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
    inc hl
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
    inc hl
    sra [hl]
    dec hl
    rr [hl]
    ld hl, sp+$0f
    ld a, [hl]
    ld hl, sp+$0c
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$0d
    ld [hl], a
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld c, e
    ld b, a
    ld hl, sp+$08
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_003_4f5e:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0012
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$10
    ld [hl], a
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$11
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld c, l
    ld b, h
    ld de, _sine_wave
    ld hl, sp+$11
    ld l, [hl]
    ld h, $00
    add hl, de
    ld e, l
    ld d, h
    ld a, [de]
    push bc
    ld hl, sp+$12
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld l, c
    ld h, b
    ld a, e
    ld [hl+], a
    ld [hl], d
    inc bc
    inc bc
    ld hl, sp+$11
    ld a, [hl]
    add $40
    ld e, a
    ld hl, _sine_wave
    ld d, $00
    add hl, de
    ld a, [hl]
    push bc
    ld hl, sp+$12
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, $c7ce
    ld a, [hl-]
    or [hl]
    jr z, jr_003_500d

    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0023
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, _projectiles_inactive_head
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a

jr_003_500d:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld c, l
    ld b, h
    ld hl, _projectiles_active_head
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ld hl, sp+$02
    ld a, [hl]
    ld [_projectiles_active_head], a
    ld hl, sp+$03
    ld a, [hl]
    ld [_projectiles_active_head + 1], a

Jump_003_502c:
    add sp, $12
    ret