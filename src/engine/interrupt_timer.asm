timer_ISR:
    push af
    push hl
    push bc
    push de
    call _music_play_isr
    call _SIO_update
    pop de
    pop bc
    pop hl

jr_000_1774:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_1774

    pop af
    reti