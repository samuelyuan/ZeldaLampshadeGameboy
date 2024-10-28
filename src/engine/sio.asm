_SIO_init:
    ld hl, _link_operation_mode
    ld [hl], $00
    ld hl, _link_packet_len
    ld [hl], $00
    ld bc, _link_packet
    ld hl, _link_packet_ptr
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _link_packet_received
    ld [hl], $00
    ld hl, _link_packet_snd_len
    ld [hl], $00
    ld hl, _link_packet_snd_ptr
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _link_packet_sent
    ld [hl], $00
    ret