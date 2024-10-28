_load_animations:
    add sp, -$03
    ldh a, [$90]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$07
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl-]
    dec hl
    ld [de], a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0005
    add hl, bc
    ld e, l
    ld d, h
    ld a, [de]
    ld hl, sp+$01
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0007
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$08
    ld a, [hl+]
    ld e, [hl]
    add a
    rl e
    ld l, a
    ld h, e
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    ld hl, sp+$01
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, sp+$0a
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0010
    push hl
    push de
    push bc
    call _memcpy
    add sp, $06
    ld hl, sp+$00
    ld a, [hl]
    ldh [$90], a
    ld de, $2000
    ld a, [hl]
    ld [de], a
    add sp, $03
    ret