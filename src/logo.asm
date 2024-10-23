_logo_init:
    ld hl, _camera_offset_x
    ld [hl], $00
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _GAME_TIME
    ld [hl], $00
    ret

_logo_update:
    ret