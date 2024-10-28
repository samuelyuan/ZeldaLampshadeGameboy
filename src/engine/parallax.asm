_parallax_init:
    ; memcpy(parallax_rows, parallax_rows_defaults, sizeof(parallax_rows));
    ld de, $0012
    push de
    ld de, _parallax_rows_defaults
    push de
    ld de, _PARALLAX_ROWS
    push de
    call _memcpy
    add sp, $06
    ret

_parallax_rows_defaults:
    db $00, $0f, $02, $00, $02, $00, $00, $1f, $01, $02, $02, $00, $00, $00, $00, $04
    db $10, $00