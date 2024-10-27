; Loaded in bank 6 0x4000

_core_reset:
    ld e, $0a
    ld hl, _SIO_init; jumps to bank 0a: 0x40b4
    call RST_08
    ld e, $0a
    ld hl, _input_init ; jumps to bank 0a: 0x4039
    call RST_08
    ld e, $03
    ld hl, _load_init ; jumps to bank 3: 0x4000
    call RST_08
    ld e, $09
    ld hl, _music_init_driver ; jumps to bank 9: 0x4186
    call RST_08
    ld e, $0a
    ld hl, _parallax_init ; jumps to bank 0a: 0x4090
    call RST_08
    ld e, $05
    ld hl, _scroll_init ; jumps to bank 5: 0x4080
    call RST_08
    ld e, $07
    ld hl, _fade_init ; jumps to bank 7: 0x442d
    call RST_08
    ld e, $0a
    ld hl, _camera_init ; jumps to bank 0a: 0x400b
    call RST_08
    ld e, $01
    ld hl, _actors_init ; jumps to bank 1: 0x4000
    call RST_08
    ld e, $01
    ld hl, _ui_init ; jumps to bank 1: 0x563c
    call RST_08
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, _events_init ; jumps to bank 5: 0x4000
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, _timers_init ; jumps to bank 5: 0x4040
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $09
    ld hl, _music_init_events ; jumps to bank 9: 0x41dd
    call RST_08
    inc sp
    ret

_process_vm:
    add sp, -$05

Jump_006_4077:
jr_006_4077:
    call _script_runner_update
    ld a, e
    or a
    jr z, jr_006_408d

    cp $01
    jr z, jr_006_408d

    cp $02
    jr z, jr_006_4077

    sub $03
    jp z, Jump_006_4136

    jr jr_006_4077

jr_006_408d:
    call Call_000_16dd
    ld a, [_FRAME_JOY]
    sub $f0
    jr nz, jr_006_40c0

    ld a, $01
    push af
    inc sp
    ld e, $02
    ld hl, _script_runner_init
    call RST_08
    inc sp
    ld bc, $4000
    ld a, $0a
    ld h, $00
    push hl
    inc sp
    ld de, $0000
    push de
    push bc
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $06
    jr jr_006_4077

jr_006_40c0:
    ld hl, $cb90
    ld a, [hl]
    sub $01
    ld a, $00
    rla
    xor $01
    jr nz, jr_006_40e6

    ld a, [_FRAME_JOY]
    or a
    jr z, jr_006_40d6

    call _events_update

jr_006_40d6:
    call _state_update
    ld a, [_GAME_TIME]
    and $0f
    jr nz, jr_006_40e3

    call _timers_update

jr_006_40e3:
    call _music_events_update

jr_006_40e6:
    ld c, $c0
    ldh a, [$92]
    sub c
    jr nz, jr_006_40f4

    ld hl, ___render_shadow_OAM
    ld [hl], $df
    jr jr_006_40f9

jr_006_40f4:
    ld hl, ___render_shadow_OAM
    ld [hl], $c0

jr_006_40f9:
    ld hl, _allocated_hardware_sprites
    ld [hl], $00
    call _camera_update
    ld e, $05
    ld hl, _scroll_update
    call RST_08
    call _actors_update
    call _projectiles_update
    call _ui_update
    ld e, $01
    ld hl, _actor_handle_player_collision
    call RST_08
    ld hl, _GAME_TIME
    inc [hl]
    ld a, $28
    push af
    inc sp
    ld a, [_allocated_hardware_sprites]
    push af
    inc sp
    call _hide_sprites_range
    pop hl
    ld a, [___render_shadow_OAM]
    ldh [$92], a
    call _wait_vbl_done
    jp Jump_006_4077


Jump_006_4136:
    ld a, [$cb92]
    dec a
    jr z, jr_006_4156

    ld a, [$cb92]
    sub $02
    jr z, jr_006_419b

    ld a, [$cb92]
    sub $03
    jp z, Jump_006_4216

    ld a, [$cb92]
    sub $04
    jp z, Jump_006_4236

    jp Jump_006_4077


jr_006_4156:
    ld e, $0a
    ld hl, _remove_LCD_ISRs ; jumps to bank 0a: 0x405f
    call RST_08
    call _core_reset_hook
    xor a
    push af
    inc sp
    ld e, $02
    ld hl, _script_runner_init ; jumps to bank 02: 0x6100
    call RST_08
    inc sp
    ld hl, _start_scene
    ld b, [hl]
    ld hl, _start_scene + 1
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld h, $01
    ld l, b
    push hl
    ld b, a
    push bc
    ld e, $03
    ld hl, _load_scene
    call RST_08
    add sp, $04
    ld a, e
    sub $01
    ld a, $00
    rla
    ld hl, sp+$04
    ld [hl], a
    ld e, $03
    ld hl, _load_player
    call RST_08
    jp Jump_006_4288


jr_006_419b:
    ld e, $0a
    ld hl, _remove_LCD_ISRs
    call RST_08
    xor a
    push af
    inc sp
    ld e, $02
    ld hl, _script_runner_init
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, _timers_init
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $05
    ld hl, _events_init
    call RST_08
    inc sp
    xor a
    push af
    inc sp
    ld e, $09
    ld hl, _music_init_events
    call RST_08
    inc sp
    ld hl, $cb95
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld hl, sp+$03
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, [$cb94]
    push af
    inc sp
    push de
    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call _ReadBankedFarPtr
    add sp, $05
    ld a, [bc]
    ld l, c
    ld h, b
    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld h, $01
    push hl
    inc sp
    push af
    inc sp
    push bc
    ld e, $03
    ld hl, _load_scene
    call RST_08
    add sp, $04
    ld a, e
    sub $01
    ld a, $00
    rla
    ld hl, sp+$04
    ld [hl], a
    jr jr_006_4288

Jump_006_4216:
    ld a, [$cb94]
    ld hl, $cb95
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    push af
    inc sp
    ld e, $06
    ld hl, _data_save
    call RST_08
    inc sp
    jp Jump_006_4077


Jump_006_4236:
    ld e, $07
    ld hl, _fade_out_modal
    call RST_08
    ld e, $0a
    ld hl, _remove_LCD_ISRs
    call RST_08
    ld a, [$cb94]
    ld hl, $cb95
    ld c, [hl]
    inc hl
    ld b, [hl]
    push af
    inc sp
    push bc
    call _ReadBankedUWORD
    add sp, $03
    ld a, e
    push af
    inc sp
    ld e, $06
    ld hl, _data_load
    call RST_08
    inc sp
    ld hl, $cb91
    ld [hl], e
    ld hl, _CURRENT_SCENE
    ld c, [hl]
    ld hl, $c527
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ld b, a
    push bc
    push hl
    ld e, $03
    ld hl, _load_scene
    call RST_08
    add sp, $04
    ld a, e
    sub $01
    ld a, $00
    rla
    ld hl, sp+$04
    ld [hl], a

Jump_006_4288:
jr_006_4288:
    di
    ld a, [_scene_LCD_type]
    dec a
    jr z, jr_006_4298

    ld a, [_scene_LCD_type]
    sub $02
    jr z, jr_006_42a2

    jr jr_006_42ac

jr_006_4298:
    ld de, $1b24
    push de
    call _add_LCD
    pop hl
    jr jr_006_42b4

jr_006_42a2:
    ld de, $17f8
    push de
    call _add_LCD
    pop hl
    jr jr_006_42b4

jr_006_42ac:
    ld de, $177c
    push de
    call _add_LCD
    pop hl

jr_006_42b4:
    xor a
    ldh [rLYC], a
    ei
    ld a, [$da2e]
    or a
    jr nz, jr_006_42c4

    ldh a, [rLCDC]
    or $02
    ldh [rLCDC], a

jr_006_42c4:
    ld e, $01
    ld hl, _player_init ; bank 1: 0x4055
    call RST_08
    call state_init
    ld c, $c0
    ldh a, [$92]
    sub c
    jr nz, jr_006_42dd

    ld hl, ___render_shadow_OAM
    ld [hl], $df
    jr jr_006_42e2

jr_006_42dd:
    ld hl, ___render_shadow_OAM
    ld [hl], $c0

jr_006_42e2:
    ld hl, _allocated_hardware_sprites
    ld [hl], $00
    call _camera_update
    ld e, $05
    ld hl, _scroll_repaint
    call RST_08
    call _actors_update
    ld a, $28
    push af
    inc sp
    ld a, [_allocated_hardware_sprites]
    push af
    inc sp
    call _hide_sprites_range
    pop hl
    ld a, [___render_shadow_OAM]
    ldh [$92], a
    ld hl, sp+$04
    ld a, [hl]
    or a
    jp z, Jump_006_4077

    ld e, $07
    ld hl, _fade_in_modal
    call RST_08
    jp Jump_006_4077


    add sp, $05
    ret

_core_run: ; bank 6: 0x4310
    ld hl, _IS_SGB
    ld [hl], $00
    ld a, [_CPU]
    sub $11
    jr nz, jr_006_432e

    ld a, [$0143]
    rlca
    jr c, jr_006_4331

jr_006_432e:
    xor a
    jr jr_006_4333

jr_006_4331:
    ld a, $01

jr_006_4333:
    ld [_IS_CGB], a
    ld a, [_IS_GBA]
    or a
    jr z, jr_006_4342

    ld a, [_IS_CGB]
    or a
    jr nz, jr_006_4345

jr_006_4342:
    xor a
    jr jr_006_4347

jr_006_4345:
    ld a, $01

jr_006_4347:
    ld [_IS_GBA], a
    xor a
    and a
    push af
    ld de, $0000
    push de
    ld de, $df00
    push de
    call _memset
    add sp, $06
    ld e, $06
    ld hl, _data_init
    call RST_08
    call _display_off
    ld e, $0a
    ld hl, $4080
    call RST_08
    ld a, $67
    ldh [rLCDC], a
    ld a, $07
    ldh [rWX], a
    ld a, $90
    ldh [rWY], a
    ldh a, [rDIV]
    ld b, $00
    ld c, a
    push bc
    call _initrand
    pop hl
    call _core_reset_hook
    ld a, $01
    push af
    inc sp
    ld e, $02
    ld hl, _script_runner_init
    call RST_08
    inc sp
    di
    ld hl, $c69d
    ld [hl], $8b
    inc hl
    ld [hl], $c6
    xor a
    ldh [rLYC], a
    ld de, $1824
    push de
    call Call_000_0e68
    pop hl
    ldh a, [rSTAT]
    or $40
    ldh [rSTAT], a
    ld hl, $c0a0
    ld a, [hl]
    sub $11
    jr nz, jr_006_43c1

    ld hl, $0143
    ld a, [hl]
    rlca
    jr nc, jr_006_43c1

    ld bc, $0080
    jr jr_006_43c4

jr_006_43c1:
    ld bc, $00c0

jr_006_43c4:
    ld a, c
    ldh [rTMA], a
    ld a, $07
    ldh [rTAC], a
    ldh a, [rIE]
    or $0e
    ldh [rIE], a
    ei
    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a
    ld a, $0a
    ld h, $00
    push hl
    inc sp
    ld de, $0000
    push de
    ld de, $4000
    push de
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $06
    jp _process_vm