; Loaded in bank 6 0x43f5

_printer_send_receive:
    ld hl, sp+$02
    ld a, [hl]
    ldh [rSB], a
    ld a, $81
    ldh [rSC], a

jr_006_43fe:
    ldh a, [rSC]
    rlca
    jr c, jr_006_43fe

    ldh a, [rSB]
    ld e, a
    ret

_PRN_PKT_INIT:
    db $88, $33, $01, $00, $00, $00, $01, $00, $00, $00

_PRN_PKT_STATUS:
    db $88, $33, $0f, $00, $00, $00, $0f, $00, $00, $00

_PRN_PKT_EOF:
    db $88, $33, $04, $00, $00, $00, $04, $00, $00, $00

_PRN_PKT_CANCEL:
    db $88, $33, $08, $00, $00, $00, $01, $00, $00, $00

_printer_send_byte:
    ld hl, _fade_timer + 3
    ld b, [hl]
    ld c, $00
    push bc
    ld hl, sp+$04
    ld a, [hl]
    push af
    inc sp
    call _printer_send_receive
    inc sp
    ld a, e
    pop bc
    ld d, $00
    or c
    ld e, a
    ld a, d
    or b
    ld hl, _fade_timer + 3
    ld [hl], e
    inc hl
    ld [hl], a
    ret


_printer_send_command:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, $00

jr_006_4455:
    ld a, e
    ld hl, sp+$04
    sub [hl]
    jr nc, jr_006_446a

    inc e
    ld a, [bc]
    inc bc
    push bc
    push de
    push af
    inc sp
    call _printer_send_byte
    inc sp
    pop de
    pop bc
    jr jr_006_4455

jr_006_446a:
    ld hl, $c612
    ld a, [hl]
    sub $81
    jr nz, jr_006_4475

    dec hl
    ld e, [hl]
    ret


jr_006_4475:
    ld de, $00f0
    ret


Call_006_4479:
    dec sp
    ld a, [$c613]
    or a
    jr nz, jr_006_44a0

    ld bc, $450d
    ld e, $06

jr_006_4485:
    ld a, e
    or a
    jr z, jr_006_4498

    ld a, [bc]
    inc bc
    push bc
    push de
    push af
    inc sp
    call _printer_send_receive
    inc sp
    pop de
    pop bc
    dec e
    jr jr_006_4485

jr_006_4498:
    ld hl, $c614
    ld a, $86
    ld [hl+], a
    xor a
    ld [hl], a

jr_006_44a0:
    ld hl, sp+$00
    ld [hl], $10
    ld hl, sp+$03
    ld a, [hl+]
    ld e, a
    ld d, [hl]

jr_006_44a9:
    ld hl, sp+$00
    ld a, [hl]
    or a
    jr z, jr_006_44d1

    ld a, [de]
    ld c, a
    ld b, $00
    ld hl, $c614
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld [$c614], a
    ld a, h
    ld [$c615], a
    ld a, [de]
    push de
    push af
    inc sp
    call _printer_send_receive
    inc sp
    pop de
    ld hl, sp+$00
    dec [hl]
    inc de
    jr jr_006_44a9

jr_006_44d1:
    ld hl, $c613
    inc [hl]
    ld a, [hl]
    sub $28
    jr nz, jr_006_4509

    ld a, [$c614]
    push af
    inc sp
    call _printer_send_receive
    inc sp
    ld a, [$c615]
    push af
    inc sp
    call _printer_send_receive
    inc sp
    xor a
    push af
    inc sp
    call _printer_send_receive
    inc sp
    xor a
    push af
    inc sp
    call _printer_send_receive
    inc sp
    ld hl, $c613
    ld [hl], $00
    xor a
    ld hl, $c614
    ld [hl+], a
    ld [hl], a
    ld e, $01
    jr jr_006_450b

jr_006_4509:
    ld e, $00

jr_006_450b:
    inc sp
    ret


    adc b
    inc sp
    inc b
    nop
    add b
    ld [bc], a

_printer_wait:
    ld hl, sp+$02
    ld a, [hl+]
    ld c, a
    ld b, [hl]

jr_006_4518:
    push bc
    ld a, $0a
    push af
    inc sp
    ld de, $4411
    push de
    call _printer_send_command
    add sp, $03
    ld a, e
    pop bc
    ld e, a
    ld hl, sp+$04
    and [hl]
    inc hl
    ld d, a
    ld a, [hl]
    sub d
    ret z

    ld a, c
    ld d, b
    dec bc
    or d
    jr nz, jr_006_453a

    ld e, $f0
    ret


jr_006_453a:
    ld a, e
    and $f0
    ret nz

    call _wait_vbl_done
    jr jr_006_4518

_gbprinter_detect:
    ld hl, $c613
    ld [hl], $00
    ld a, $0a
    push af
    inc sp
    ld de, _PRN_PKT_INIT
    push de
    call _printer_send_command
    add sp, $03
    ld hl, sp+$06
    ld c, [hl]
    ld b, $00
    ld hl, $00ff
    push hl
    push bc
    call _printer_wait
    add sp, $04
    ret

_gbprinter_print_overlay:
    add sp, -$1f
    ld hl, sp+$18
    ld [hl], $00
    ld hl, sp+$26
    ld a, [hl]
    srl a
    ld hl, sp+$1e
    ld [hl], a
    ld hl, sp+$17
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl]
    or a
    jr nz, jr_006_4580

    ld e, a
    jp Jump_006_47a0


jr_006_4580:
    call _GetWinAddr
    ld hl, sp+$1b
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$25
    ld a, [hl]
    ld hl, sp+$1d
    ld [hl+], a
    ld [hl], $00
    ld a, $05

jr_006_4592:
    ld hl, sp+$1d
    sla [hl]
    inc hl
    rl [hl]
    dec a
    jr nz, jr_006_4592

    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, sp+$1b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1a
    ld [hl], a
    ld hl, $c613
    ld [hl], $00
    ld hl, sp+$17
    ld a, [hl]
    add a
    ld hl, sp+$1b
    ld [hl], a

Jump_006_45bc:
    ld hl, sp+$1b
    ld a, [hl]
    or a
    jp z, Jump_006_4710

    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$10
    ld [hl+], a
    ld a, d
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl-], a
    ld a, [hl+]
    inc hl
    ld [hl], a
    ld hl, sp+$1c
    ld [hl], $00
    ld hl, sp+$19
    ld a, [hl]
    ld hl, sp+$1d
    ld [hl], a
    ld hl, sp+$1a
    ld a, [hl]
    ld hl, sp+$1e
    ld [hl], a

Jump_006_45e2:
    ld hl, sp+$1c
    ld a, [hl]
    sub $14
    jp z, Jump_006_46f7

    ld hl, sp+$1d
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    push de
    call Call_000_0ca8
    pop hl
    ld hl, sp+$17
    ld [hl], e
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$10
    ld a, [hl]
    ld hl, sp+$16
    ld [hl], a
    ld hl, sp+$11
    ld a, [hl]
    ld hl, sp+$17
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    push de
    ld a, $01
    push af
    inc sp
    ld a, [hl]
    push af
    inc sp
    call Call_000_34ba
    add sp, $04
    ld hl, sp+$12
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    push bc
    call Call_006_4479
    pop hl
    ld a, e
    or a
    jr z, jr_006_4629

    ld hl, sp+$18
    inc [hl]

jr_006_4629:
    ld hl, sp+$18
    ld a, [hl]
    sub $09
    jp nz, Jump_006_46ea

    ld hl, sp+$18
    ld [hl], $00
    ld a, $0a
    push af
    inc sp
    ld de, $441b
    push de
    call _printer_send_command
    add sp, $03
    ld hl, sp+$26
    ld a, [hl]
    ld hl, sp+$16
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0001
    ld a, e
    sub l
    ld e, a
    ld a, d
    sbc h
    ld hl, sp+$15
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$1b
    ld a, [hl]
    ld hl, sp+$16
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$14
    ld a, [hl+]
    inc hl
    sub [hl]
    jr nz, jr_006_4673

    dec hl
    ld a, [hl+]
    inc hl
    sub [hl]
    jr nz, jr_006_4673

    ld hl, sp+$27
    ld c, [hl]
    jr jr_006_4676

jr_006_4673:
    ld bc, $0000

jr_006_4676:
    ld hl, $da27
    ld [hl], c
    ld b, $00
    ld hl, $da28
    ld [hl], $e4
    ld hl, $da29
    ld [hl], $7f
    ld hl, $016a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $da2a
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld a, $0e
    push af
    inc sp
    ld de, $da20
    push de
    call _printer_send_command
    add sp, $03
    ld hl, $0202
    push hl
    ld de, $0078
    push de
    call _printer_wait
    add sp, $04
    ld a, e
    and $f0
    jp nz, Jump_006_47a0

    ld hl, $0002
    push hl
    ld de, $04b0
    push de
    call _printer_wait
    add sp, $04
    ld a, e
    and $f0
    jp nz, Jump_006_47a0

    ld a, $0a
    push af
    inc sp
    ld de, _PRN_PKT_INIT
    push de
    call _printer_send_command
    add sp, $03
    ld hl, $00ff
    push hl
    ld de, $000a
    push de
    call _printer_wait
    add sp, $04
    ld a, e
    ld hl, sp+$17
    ld [hl], a
    or a
    jr z, jr_006_46ea

    ld e, [hl]
    jp Jump_006_47a0


Jump_006_46ea:
jr_006_46ea:
    ld hl, sp+$1c
    inc [hl]
    inc hl
    inc [hl]
    jp nz, Jump_006_45e2

    inc hl
    inc [hl]
    jp Jump_006_45e2


Jump_006_46f7:
    ld hl, sp+$1b
    dec [hl]
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0020
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1b
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1a
    ld [hl], a
    jp Jump_006_45bc


Jump_006_4710:
    ld hl, sp+$18
    ld a, [hl]
    or a
    jr z, jr_006_4790

    ld a, $0a
    push af
    inc sp
    ld de, _PRN_PKT_EOF
    push de
    call _printer_send_command
    add sp, $03
    ld hl, sp+$27
    ld a, [hl]
    ld hl, sp+$1e
    ld [hl], a
    ld de, $da27
    ld a, [hl]
    ld [de], a
    ld a, [hl-]
    ld [hl+], a
    xor a
    ld [hl-], a
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, sp+$1e
    ld a, [hl-]
    dec hl
    ld [hl], a
    ld hl, $da28
    ld [hl], $e4
    ld hl, $da29
    ld [hl], $7f
    ld hl, sp+$1b
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $016a
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$1f
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$1e
    ld [hl-], a
    ld de, $da2a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, $0e
    push af
    inc sp
    ld de, $da20
    push de
    call _printer_send_command
    add sp, $03
    ld hl, $0202
    push hl
    ld de, $0078
    push de
    call _printer_wait
    add sp, $04
    ld a, e
    and $f0
    jr nz, jr_006_47a0

    ld hl, $0002
    push hl
    ld de, $04b0
    push de
    call _printer_wait
    add sp, $04
    ld a, e
    and $f0
    jr nz, jr_006_47a0

jr_006_4790:
    ld a, $0a
    push af
    inc sp
    ld de, _PRN_PKT_STATUS
    push de
    call _printer_send_command
    add sp, $03
    ld hl, sp+$1e
    ld [hl], e

Jump_006_47a0:
jr_006_47a0:
    add sp, $1f
    ret