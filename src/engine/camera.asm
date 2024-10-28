_camera_init:
    xor a
    ld hl, _camera_y
    ld [hl+], a
    ld [hl], a
    xor a
    ld hl, _camera_x
    ld [hl+], a
    ld [hl], a
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _camera_offset_x
    ld [hl], $00
    ld e, $0a
    ld hl, _camera_reset
    jp RST_08

_camera_reset:
    ld hl, _camera_deadzone_y
    ld [hl], $00
    ld hl, _camera_deadzone_x
    ld [hl], $00
    ld hl, _camera_settings
    ld [hl], CAMERA_LOCK_FLAG
    ret