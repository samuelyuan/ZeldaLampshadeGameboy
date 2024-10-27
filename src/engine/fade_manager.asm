; Loaded at bank 7 0x4367

_DMGFadeToWhiteStep:
    ld hl, sp+$03

jr_007_4369:
    ld a, [hl-]
    ld e, [hl]
    or a
    ret z

    ld d, a

jr_007_436e:
    ld h, $04

jr_007_4370:
    ld a, e

jr_007_4371:
    and $03

jr_007_4373:
    jr z, jr_007_4376

    dec a

jr_007_4376:
    srl a

jr_007_4378:
    rr l
    srl a
    rr l
    srl e
    srl e
    dec h

jr_007_4383:
    jr nz, jr_007_4370

    ld e, l
    dec d
    jr nz, jr_007_436e

    ret


_DMGFadeToBlackStep:
    ld hl, sp+$03
    ld a, [hl-]
    ld e, [hl]
    or a
    ret z

    ld d, a

jr_007_4391:
    ld h, $04

jr_007_4393:
    ld a, e
    and $03

jr_007_4396:
    cp $03
    jr z, jr_007_439b

    inc a

jr_007_439b:
    srl a
    rr l
    srl a
    rr l
    srl e
    srl e
    dec h
    jr nz, jr_007_4393

    ld e, l
    dec d
    jr nz, jr_007_4391

    ret

_ApplyPaletteChangeDMG:
    ld a, $04
    ld hl, sp+$02
    sub [hl]
    jr nc, jr_007_43b8

    ld [hl], $04

jr_007_43b8:
    ld a, [_FADE_STYLE]
    or a
    jr nz, jr_007_43f2

    ld a, [_DMG_palette]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _DMGFadeToWhiteStep
    pop hl
    ld a, e
    ldh [rBGP], a
    ld a, [_DMG_palette + 1]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _DMGFadeToWhiteStep
    pop hl
    ld a, e
    ldh [rOBP0], a
    ld a, [_DMG_palette + 2]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _DMGFadeToWhiteStep
    pop hl
    ld a, e
    ldh [rOBP1], a
    ret


jr_007_43f2:
    ld a, [_DMG_palette]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _DMGFadeToBlackStep
    pop hl
    ld a, e
    ldh [rBGP], a
    ld a, [_DMG_palette + 1]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _DMGFadeToBlackStep
    pop hl
    ld a, e
    ldh [rOBP0], a
    ld a, [_DMG_palette + 2]
    ld hl, sp+$02
    ld h, [hl]
    push hl
    inc sp
    push af
    inc sp
    call _DMGFadeToBlackStep
    pop hl
    ld a, e
    ldh [rOBP1], a
    ret

_fade_speeds:
    db $00, $01, $03, $07, $0f, $1f, $3f

_fade_init:
    ld a, [$4428]
    ld [_fade_frames_per_step], a
    ld hl, _fade_timer
    ld [hl], $05
    ld hl, _fade_running
    ld [hl], $00
    ld a, $05
    push af
    inc sp
    call _ApplyPaletteChangeDMG
    inc sp
    ret

_fade_in:
    ld a, [_fade_timer]
    or a
    ret z

    ; fade_frame = 0;
    ld hl, _fade_frame
    ld [hl], $00
    ; fade_direction = FADE_IN;
    ld hl, _fade_direction
    ld [hl], $00
    ; fade_running = TRUE;
    ld hl, _fade_running
    ld [hl], $01
    ; fade_timer = FADED_OUT_FRAME;
    ld hl, _fade_timer
    ld a, $05
    ld [hl], a
    push af
    inc sp
    call _ApplyPaletteChangeDMG
    inc sp
    ret

_fade_out:
    ld a, [_fade_timer]
    sub $05
    ret z

    jr jr_007_446f

jr_007_446f:
    ; fade_frame = 0;
    ld hl, _fade_frame
    ld [hl], $00
    ; fade_direction = FADE_OUT;
    ld hl, _fade_direction
    ld [hl], $01
    ; fade_running = TRUE;
    ld hl, _fade_running
    ld [hl], $01
    ; fade_timer = FADED_IN_FRAME;
    ld hl, _fade_timer
    ld [hl], $00
    xor a
    push af
    inc sp
    call _ApplyPaletteChangeDMG
    inc sp
    ret

_fade_update:
    ld a, [_fade_running]
    or a
    ret z

    ld hl, _fade_frame
    ld c, [hl]
    inc [hl]
    ld a, c
    ld hl, _fade_frames_per_step
    and [hl]
    ret nz

    ld a, [_fade_direction]
    or a
    jr nz, jr_007_44b6

    ld hl, _fade_timer
    ld a, [hl]
    or a
    jr z, jr_007_44a9

    dec [hl]

jr_007_44a9:
    ld a, [_fade_timer]
    or a
    jr nz, jr_007_44cb

    ld hl, _fade_running
    ld [hl], $00
    jr jr_007_44cb

jr_007_44b6:
    ld hl, _fade_timer
    ld a, [hl]
    sub $05
    jr nc, jr_007_44bf

    inc [hl]

jr_007_44bf:
    ld a, [_fade_timer]
    sub $05
    jr nz, jr_007_44cb

    ld hl, _fade_running
    ld [hl], $00

jr_007_44cb:
    ld a, [_fade_timer]
    push af
    inc sp
    call _ApplyPaletteChangeDMG
    inc sp
    ret


    ld a, [_fade_timer]
    push af
    inc sp
    call _ApplyPaletteChangeDMG
    inc sp
    ret

_fade_setspeed:
    ld bc, $4426
    ld hl, sp+$06
    ld l, [hl]
    ld h, $00
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld [_fade_frames_per_step], a
    ret

_fade_in_modal:
    ld e, $07
    ld hl, _fade_in
    call RST_08

jr_007_44f7:
    ld a, [_fade_running]
    or a
    ret z

    call _wait_vbl_done
    ld e, $07
    ld hl, _fade_update
    call RST_08
    jr jr_007_44f7

_fade_out_modal:
    ld e, $07
    ld hl, _fade_out
    call RST_08

jr_007_4511:
    ld a, [_fade_running]
    or a
    ret z

    call _wait_vbl_done
    ld e, $07
    ld hl, _fade_update
    call RST_08
    jr jr_007_4511