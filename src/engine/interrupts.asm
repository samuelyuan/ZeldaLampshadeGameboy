; Loaded at bank 0a 0x405f

_remove_LCD_ISRs:
    di
    ld de, _parallax_LCD_isr
    push de
    call _remove_LCD
    pop hl
    ld de, _simple_LCD_isr
    push de
    call _remove_LCD
    pop hl
    ld de, _fullscreen_LCD_isr
    push de
    call _remove_LCD
    pop hl
    ldh a, [rLCDC]
    and $ef
    ldh [rLCDC], a
    ei
    ret