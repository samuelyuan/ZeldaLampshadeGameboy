
sio_ISR:
    push af
    push hl
    push bc
    push de
    ld c, $01
    xor a
    ldh [rSC], a
    ld hl, _SIO_STATUS
    ld a, [hl]
    cp $02
    jr nz, jr_000_1730

    ld a, [c]
    push af
    inc sp
    ld [hl], $00
    ld a, $66
    ld [c], a
    ld a, $80
    ldh [rSC], a
    call _on_SIO_receive
    inc sp
    jr jr_000_175c

jr_000_1730:
    cp $01
    jr nz, jr_000_175c

    ld a, [c]
    cp $55
    ld [hl], $00
    jr z, jr_000_173f

    ld [hl], $04
    jr jr_000_174b

jr_000_173f:
    ld a, [_link_next_mode]
    cp $02
    jr nz, jr_000_174b

    ld [hl], a
    ld a, $55
    jr jr_000_174d

jr_000_174b:
    ld a, $66

jr_000_174d:
    ld [c], a
    ld a, $80
    ldh [rSC], a
    ld a, $00
    ld [_link_next_mode], a
    ld a, $01
    ld [_link_byte_sent], a

jr_000_175c:
    pop de
    pop bc
    pop hl

jr_000_175f:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_175f

    pop af
    reti