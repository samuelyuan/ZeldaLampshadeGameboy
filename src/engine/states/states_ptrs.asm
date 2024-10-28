_state_start_fns:
    db $05
    dw _topdown_init
    db $02
    dw _platform_init
    db $05 
    dw _adventure_init
    db $05
    dw _shmup_init
    db $07
    dw _pointnclick_init
    db $0a
    dw _logo_init

_state_update_fns:
    db $05
    dw _topdown_update
    db $02
    dw _platform_update
    db $05
    dw _adventure_update
    db $05
    dw _shmup_update
    db $07
    dw _pointnclick_update
    db $0a
    dw _logo_update