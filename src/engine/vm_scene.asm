_vm_scene_push:
    ld de, _CURRENT_SCENE
    ld hl, _SCENE_STACK_PTR
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0003
    push hl
    push de
    push bc
    call _memcpy
    add sp, $06
    ld de, $c0ba
    ld hl, _SCENE_STACK_PTR
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld hl, $0004
    push hl
    push de
    push bc
    call _memcpy
    add sp, $06
    ld hl, _SCENE_STACK_PTR
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0007
    add hl, bc
    ld bc, $c0be
    ld a, [bc]
    ld [hl], a
    ld hl, _SCENE_STACK_PTR
    ld a, [hl]
    add $08
    ld [hl+], a
    ld a, [hl]
    adc $00
    ld [hl], a
    ret

_raise_change_scene_exception:
    ld hl, _VM_EXCEPTION_CODE
    ld [hl], $02
    ld hl, _VM_EXCEPTION_PARAMS_LENGTH
    ld [hl], $03
    ld hl, _VM_EXCEPTION_PARAMS_BANK
    ld [hl], $01
    ld hl, _SCENE_STACK_PTR
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld l, d
    ld [$cb95], a
    ld a, l
    ld [$cb96], a
    inc de
    inc de
    inc de
    ld bc, $0004
    push bc
    push de
    ld de, $c0ba
    push de
    call _memcpy
    add sp, $06
    ld bc, $c0be
    ld hl, _SCENE_STACK_PTR
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0007
    add hl, de
    ld a, [hl]
    ld [bc], a
    ret

_vm_scene_pop:
    ld hl, _SCENE_STACK_PTR
    ld a, [hl]
    add $f8
    ld [hl+], a
    ld a, [hl]
    adc $ff
    ld [hl], a
    jp _raise_change_scene_exception

_vm_scene_pop_all:
    ld hl, _SCENE_STACK_PTR
    ld [hl], $3e
    inc hl
    ld [hl], $c5
    jp _raise_change_scene_exception

_vm_scene_stack_reset:
    ld hl, _SCENE_STACK_PTR
    ld [hl], $3e
    inc hl
    ld [hl], $c5
    ret