_on_SIO_receive:
    ld hl, _link_packet_len
    ld a, [hl]
    or a
    jr z, jr_000_2468

    dec [hl]
    ld hl, _link_packet_ptr
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl]
    ld [bc], a
    ld hl, _link_packet_ptr
    inc [hl]
    jr nz, jr_000_2452

    inc hl
    inc [hl]

jr_000_2452:
    ld hl, _link_packet_len
    ld a, [hl]
    or a
    jp nz, _SIO_receive

    ld hl, _link_packet_ptr
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    ld hl, _link_packet_received
    ld [hl], $01
    ret


jr_000_2468:
    ld hl, sp+$02
    ld a, [hl]
    ld [_link_packet_len], a
    ld hl, _link_packet_ptr
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    jp _SIO_receive

_SIO_update:
    ld a, [_SIO_STATUS]
    sub $04
    jr nz, jr_000_249f

    ld hl, _link_operation_mode
    ld [hl], $00
    ld hl, _link_packet_snd_len
    ld [hl], $00
    ld hl, _link_packet_len
    ld [hl], $00
    ld hl, _link_packet_ptr
    ld [hl], $f6
    inc hl
    ld [hl], $c7
    ld hl, _SIO_STATUS
    ld [hl], $00
    ld e, $00
    ret

jr_000_249f:
    ld a, [_link_byte_sent]
    or a
    jr z, jr_000_24dd

    ld a, [_link_packet_snd_len]
    or a
    jr z, jr_000_24d8

    ld hl, _link_byte_sent
    ld [hl], $00
    ld a, [_link_packet_snd_len]
    dec a
    jr nz, jr_000_24bb

    ld hl, _link_next_mode
    ld [hl], $02

jr_000_24bb:
    ld hl, _link_packet_snd_ptr
    ld l, [hl]
    ld a, [_link_packet_snd_ptr + 1]
    ld h, a
    ld b, [hl]
    ld hl, _link_packet_snd_ptr
    inc [hl]
    jr nz, jr_000_24cc

    inc hl
    inc [hl]

jr_000_24cc:
    push bc
    inc sp
    call _SIO_send_byte
    inc sp
    ld hl, _link_packet_snd_len
    dec [hl]
    jr jr_000_24dd

jr_000_24d8:
    ld hl, _link_packet_sent
    ld [hl], $01

jr_000_24dd:
    ld e, $01
    ret