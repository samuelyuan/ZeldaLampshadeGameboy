SECTION "ROM Bank $000", ROM0[$0]

RST_00::
    nop
    nop

Call_000_0002:
    jp RST_38


    rst $38

Jump_000_0006:
    rst $38
    rst $38

RST_08::
    ldh a, [$90]
    push af
    ld a, e
    ldh [$90], a
    db $ea
    nop

RST_10::
    db $20, $e7
    pop af
    ldh [$90], a
    ld [$2000], a

RST_18::
    ret


    db $ff, $ff, $ff, $ff, $ff, $ff, $ff
RST_20::
    jp hl


    db $ff, $ff, $ff, $ff, $ff, $ff, $ff

MemsetSmall:: 
    ld [hl+], a
    dec c
    jr nz, MemsetSmall

    ret


    rst $38
    rst $38
    rst $38

MemcpySmall::
    ld a, [de]
    ld [hl+], a
    inc de
    dec c
    jr nz, MemcpySmall
    ret

    db $ff

RST_38::
    di
Jump_000_0039:
    jp ___HandleCrash


Jump_000_003c:
    rst $38
    rst $38
    rst $38
    rst $38

VBlankInterrupt::
    push af
    push hl

Call_000_0042:
    ld hl, $c0a5
    jp Jump_000_0080


LCDCInterrupt::
    jp Jump_000_364a


    db $ff, $ff, $ff, $ff, $ff

TimerOverflowInterrupt::
    ei
    jp timer_ISR


    db $ff, $ff, $ff, $ff

SerialTransferCompleteInterrupt::
    ei
    jp sio_ISR


    rst $38
    rst $38
    rst $38
    rst $38

JoypadTransitionInterrupt::
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

Call_000_006e:
    rst $38
    rst $38
    rst $38

Call_000_0071:
    rst $38
    rst $38

Jump_000_0073:
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

Jump_000_0080:
    push bc
    push de

jr_000_0082:
    ld a, [hl+]
    or [hl]
    jr z, jr_000_0091

    push hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    rst $20
    pop hl
    inc hl
    jr jr_000_0082

    add sp, $04

jr_000_0091:
    pop de
    pop bc
    pop hl

jr_000_0094:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_0094
    pop af
    reti

__standard_VBL_handler:
    ld hl, $c0a3
    inc [hl]
    jr nz, jr_000_00a4

    inc hl
    inc [hl]

jr_000_00a4:
    call $ff80
    ld a, $01
    ldh [$91], a
    ret

_refresh_OAM:
    ldh a, [rSTAT]
    and $02
    jr nz, _refresh_OAM

    ld a, $c0
    jp $ff84


Call_000_00b7:
    push de
    xor a
    ld bc, $197e
    ld hl, _CPU
    call _memset_simple
    ld a, $c0
    ldh [$92], a
    ld h, a
    xor a
    ld l, a
    ld c, $a0
    rst $28

Call_000_00cc:
    pop de
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

Boot::
    jr _code_start

    rst $38
    rst $38

HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "ZELDALAMPSHADE", $00, $00

HeaderNewLicenseeCode::
    db $30, $30

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $1b

HeaderROMSize::
    db $03

HeaderRAMSize::
    db $03

HeaderDestinationCode::
    db $00

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $01

HeaderComplementCheck::
    db $33

HeaderGlobalChecksum::
    db $cd, $26

_reset:
    ld a, [_IS_GBA]
    ld b, a
    ld a, [_CPU]

_code_start:
    di
    ld d, a
    ld e, b
    ld sp, $df00
    call $00b7
    ld a, d
    ld [_CPU], a
    cp $11
    jr nz, jr_000_016f

    xor a
    srl e
    rla
    ld [_IS_GBA], a

jr_000_016f:
    call _display_off
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [rSTAT], a
    ldh [rWY], a
    ld a, $07
    ldh [rWX], a
    ld de, $01c6
    ld hl, $ff80
    ld c, $0c
    rst $30
    call $ff80
    ld bc, __standard_VBL_handler ; 0x009c
    call _add_VBL
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    ld a, $c0
    ldh [rLCDC], a
    xor a
    ldh [rIF], a
    ld a, $01
    ldh [rIE], a
    ldh [$90], a
    xor a
    ld hl, $c0a3
    ld [hl+], a
    ld [hl], a
    ldh [rNR52], a
    call gsinit
    ei
    call _main

jr_000_01b7:
    halt
    jr jr_000_01b7

_set_interrupts:
    di
    ld hl, sp+$02
    xor a
    ldh [rIF], a
    ld a, [hl]
    ei

Jump_000_01c3:
    ldh [rIE], a
    ret


    ldh a, [$92]
    or a
    ret z

    ldh [rDMA], a
    ld a, $28

jr_000_01ce:
    dec a
    jr nz, jr_000_01ce

    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

___HandleCrash:
    push hl
    ld hl, $2000
    ld [hl], $07
    pop hl
    jp $4000

_SIO_send_byte:
    ld a, $01
    ld [_SIO_STATUS], a
    ld a, $01
    ldh [rSC], a
    ld hl, sp+$02
    ld a, [hl]
    ldh [rSB], a
    ld a, $81
    ldh [rSC], a
    ret

_SIO_receive:
    ld a, $02
    ld [_SIO_STATUS], a
    xor a
    ldh [rSC], a
    ld a, $55
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    ret

Call_000_022e:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a

jr_000_0234:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_0234

    ld a, [hl]
    ld [de], a
    ret


Call_000_023d:
    call _GetWinAddr
    jr jr_000_0245

    call _GetBkgAddr

jr_000_0245:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld e, d
    swap c

Jump_000_024f:
    rlc c
    ld a, c
    and $03
    add e
    ld d, a
    ld a, $e0
    and c
    add b
    ld e, a

Call_000_025b:
jr_000_025b:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_025b

    ld a, [hl]
    ld [de], a
    pop bc
    ret


_GetWinAddr:
    ldh a, [rLCDC]
    bit 6, a
    jr z, _is98

    jr _is9c

_GetBkgAddr:
    ldh a, [rLCDC]
    bit 3, a
    jr nz, _is9c

_is98:
    ld de, $9800
    ret


_is9c:
    ld de, $9c00
    ret


state_init:
    ld hl, _state_start_fns
    jr state_call

_state_update:
    ld hl, _state_update_fns

state_call:
    ld a, [_SCENE_TYPE]
    ld e, a
    add a
    add e
    add l
    ld l, a
    adc h
    sub l
    ld h, a
    ldh a, [$90]
    push af
    ld a, [hl+]
    ldh [$90], a
    ld [$2000], a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    rst $20
    pop af
    ldh [$90], a
    ld [$2000], a
    ret

_ui_time_masks:
    db $00, $00, $01, $03, $07, $0f, $1f, $3f

_ui_print_shift_char:
    ld hl, sp+$06
    ldh a, [$90]
    push af
    ld a, [hl-]
    ldh [$90], a
    ld [$2000], a
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, $08

jr_000_02be:
    push af
    ld a, [de]
    ld c, a
    ld a, [$ca37]
    xor c
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [$ca37]
    xor b
    ld b, a
    inc de
    ld a, [$ca36]
    sla a
    jr z, jr_000_030a

    jr c, jr_000_02f2

    srl a
    srl a
    jr nc, jr_000_02e2

    srl c
    srl b

jr_000_02e2:
    or a
    jr z, jr_000_030a

jr_000_02e5:
    srl c
    srl b
    srl c
    srl b
    dec a
    jr nz, jr_000_02e5

    jr jr_000_030a

jr_000_02f2:
    srl a
    srl a
    jr nc, jr_000_02fc

    sla c
    sla b

jr_000_02fc:
    or a
    jr z, jr_000_030a

jr_000_02ff:
    sla c
    sla b
    sla c
    sla b
    dec a
    jr nz, jr_000_02ff

jr_000_030a:
    ld a, [$ca35]
    and [hl]
    ld [hl], a
    ld a, [$ca35]
    cpl
    and c
    or [hl]
    ld [hl+], a
    ld a, [$ca35]
    and [hl]
    ld [hl], a
    ld a, [$ca35]
    cpl
    and b
    or [hl]
    ld [hl+], a
    pop af
    dec a
    jr nz, jr_000_02be

    pop af
    ldh [$90], a
    ld [$2000], a
    ret


_ui_draw_frame_row:
    ld hl, sp+$05
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld a, c
    or a
    jr z, jr_000_035e

jr_000_033a:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_033a

    ld a, e
    ld [hl+], a
    dec c
    jr z, jr_000_035e

    inc e
    ld b, c
    dec b
    jr z, jr_000_0356

jr_000_034a:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_034a

    ld a, e
    ld [hl+], a
    dec c
    dec b
    jr nz, jr_000_034a

jr_000_0356:
    inc e

jr_000_0357:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_0357

    ld [hl], e

jr_000_035e:
    ret


    or c
    ld d, h
    ld [bc], a
    ld [bc], a
    db $db
    ld d, h
    ld [bc], a
    ld bc, $0000
    nop
    nop
    inc h
    ld d, e
    ld [bc], a
    ld [bc], a
    ld h, [hl]
    ld d, e
    ld [bc], a
    ld bc, $321c
    ld [bc], a
    ld b, $16
    ld d, l
    ld [bc], a
    dec b
    or d
    jr z, jr_000_0380

    inc b
    and e

jr_000_0380:
    ld d, l
    ld [bc], a
    ld [bc], a
    push bc
    ld d, e
    ld [bc], a
    inc bc
    ld b, d
    ld d, h
    ld [bc], a
    ld bc, $0000
    nop
    nop
    ld h, $56
    ld [bc], a
    ld b, $b5
    add hl, hl
    ld [bc], a
    ld b, $d8
    ld d, a
    ld [bc], a
    ld [$5a82], sp
    ld [bc], a
    ld [bc], a
    jr nc, jr_000_03fb

    ld [bc], a
    ld [bc], a
    ld c, [hl]
    ld e, e
    ld [bc], a
    ld bc, $5b7b
    ld [bc], a
    inc b
    call c, Call_000_025b
    inc b
    jp c, $022a

    nop
    ld d, d
    ld d, a
    ld [bc], a
    ld [bc], a
    xor e
    ld d, a
    ld [bc], a
    ld [bc], a
    and b
    ld e, h
    ld [bc], a
    nop
    ld [$025c], sp
    inc b
    inc e
    ld e, c
    ld [bc], a
    ld [$5cac], sp
    ld [bc], a
    inc b
    rst $18
    ld e, h
    ld [bc], a
    inc b
    inc de
    ld e, l
    ld [bc], a
    inc b
    ld d, l
    ld e, l
    ld [bc], a
    inc b
    add c
    ld e, l
    ld [bc], a
    inc b
    xor l
    ld e, l
    ld [bc], a
    inc b
    db $ec
    ld e, l
    ld [bc], a
    inc bc
    push af
    ld e, l
    ld [bc], a
    inc b
    ld bc, $025e
    ld [bc], a
    dec l
    ld e, [hl]
    ld [bc], a
    ld [$5eb2], sp
    ld [bc], a
    nop
    pop bc
    ld e, [hl]
    ld [bc], a
    nop
    call nc, $025e
    ld [bc], a

Jump_000_03fb:
jr_000_03fb:
    ld d, $5f
    ld [bc], a
    inc b
    sub c
    ld e, a
    ld [bc], a
    inc b
    sub l
    ld e, h
    ld [bc], a
    ld bc, $600c
    ld [bc], a

Jump_000_040a:
    ld [bc], a
    rst $30
    ld e, d
    ld [bc], a
    ld [bc], a
    add [hl]
    ld [hl-], a
    ld [bc], a
    inc bc
    ld e, [hl]
    ld b, e
    add hl, bc
    add hl, bc
    ld c, a
    ld b, e
    add hl, bc
    ld bc, $4000
    ld [bc], a
    ld [bc], a
    db $d3
    ld c, c
    ld [bc], a
    ld [bc], a
    cp l
    ld c, d
    ld [bc], a
    inc bc
    dec h
    ld c, d
    ld [bc], a
    ld [bc], a
    ld b, $4b
    ld [bc], a
    inc b
    sub e
    ld c, e
    ld [bc], a
    ld [bc], a
    ld [hl], a
    ld c, l
    ld [bc], a
    dec b
    dec sp
    ld c, [hl]
    ld [bc], a
    ld b, $99
    ld c, [hl]
    ld [bc], a
    dec b
    ld l, b
    ld c, a
    ld [bc], a
    ld [$4c0d], sp
    ld [bc], a
    ld [bc], a
    nop
    nop
    nop
    nop
    ld a, h
    ld c, h
    ld [bc], a
    inc b
    jp nc, Jump_000_024f

    inc bc
    db $10
    ld d, b
    ld [bc], a
    inc bc
    db $76
    ld d, d
    ld [bc], a
    inc b
    ld e, l
    ld h, $05
    ld bc, $4798
    dec b
    ld [bc], a
    push hl
    ld b, a
    dec b
    ld [bc], a
    nop
    nop
    nop
    nop
    rst $38
    ld b, a
    dec b
    ld [bc], a
    sub b
    ld c, b
    dec b
    inc bc
    cp c
    ld c, c
    dec b
    inc b
    ld de, $0549
    ld b, $07
    ld c, d
    dec b
    inc b
    adc e
    ld d, e
    ld b, $05
    nop
    nop
    nop
    nop
    ld [hl+], a
    ld c, e
    dec b
    ld bc, $4bcb
    dec b
    ld [bc], a
    ld d, e
    ld c, e
    dec b
    dec b
    call nc, $0548
    dec b
    adc [hl]
    ld c, e
    dec b
    ld b, $a0
    ld d, e
    ld b, $05
    nop
    ld c, a
    ld b, $01
    rla
    ld c, a
    ld b, $01
    ld l, e
    ld c, a
    ld b, $02
    sub l
    ld c, a
    ld b, $03
    ld b, b
    ld c, a
    ld b, $04
    ld c, c
    ld c, h
    dec b
    add hl, bc
    ret


    ld c, a
    ld b, $01
    ei
    ld c, a
    ld b, $04
    ld h, $50
    ld b, $02
    ld l, h
    ld d, b
    ld b, $06
    jr jr_000_051a

    ld b, $08
    and a
    ld d, c
    ld b, $05
    ld a, c
    ld d, d
    ld b, $01
    adc l
    ld d, d
    ld b, $07
    add c
    ld c, a
    ld b, $01
    ld h, $45
    add hl, bc
    inc b
    ld l, d
    ld b, l
    add hl, bc
    nop
    adc h
    ld b, l
    add hl, bc
    ld bc, $45f3
    add hl, bc
    ld bc, $0000
    nop
    nop
    jp nz, $0945

    inc b
    ld sp, hl
    ld b, l
    add hl, bc
    dec b
    jp hl


    ld b, l
    add hl, bc
    ld [bc], a
    ld d, h
    ld c, b
    add hl, bc
    nop
    reti


    ld c, b
    add hl, bc
    nop
    rst $20
    ld c, b
    add hl, bc
    nop
    ld a, [c]
    ld c, b
    add hl, bc
    nop
    inc sp
    ld d, h
    ld b, $01
    ld b, [hl]
    ld d, h
    ld b, $05
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_051a:
    nop
    ld d, h
    ld b, a
    rlca
    inc b
    and a
    ld c, b
    rlca
    ld [bc], a
    ld b, c
    ld d, b
    ld b, $01
    ld d, l
    ld d, b
    ld b, $01
    db $76
    ld c, d
    ld [bc], a
    ld [bc], a
    ld c, [hl]
    ld d, b
    ld [bc], a
    ld [bc], a
    dec sp
    ld h, b
    ld [bc], a
    ld b, $80
    ld h, b
    ld [bc], a
    ld b, $58
    ld b, a
    add hl, bc
    nop
    ld h, b
    ld b, a
    add hl, bc
    inc bc
    ret


    ld b, a
    add hl, bc
    inc bc
    ld sp, $0948
    ld bc, $4000
    ld [$0002], sp
    nop
    nop
    nop
    rrca
    ld h, $01
    nop
    ld l, e
    ld d, e
    ld b, $01
    ld l, h
    ld b, [hl]
    add hl, bc
    inc bc
    xor l
    ld b, [hl]
    add hl, bc
    inc b
    nop
    nop
    nop
    nop
    sub d
    ld d, b
    ld [bc], a
    ld [bc], a

    db $db, $50, $02, $04

    bit 0, a
    dec b
    ld bc, $4cf6
    ld [bc], a
    inc b
    ld l, b
    ld d, c
    ld [bc], a
    inc b
    sbc l
    ld c, c
    ld [bc], a
    ld [bc], a
    ldh [rSCX], a
    add hl, bc
    dec b
    add d
    ld b, h
    add hl, bc
    dec b
    ld d, b
    ld c, l
    dec b
    inc b
    and l
    ld b, d
    add hl, bc
    inc bc
    rst $30
    ld b, d
    add hl, bc
    dec b
    ld hl, sp-$13
    or [hl]
    dec b

    db $00, $03, $00, $06, $02
    
_start_scene:
    ; points to bank 9: 0x5fe3
    db $09
    dw $5fe3

    db $10
    
    db $07
    
_ui_fonts:
    db $03
    
    db $43, $72

_core_reset_hook:
    ld e, $06
    ld hl, _core_reset ; jumps to bank 6: 0x4000
    jp RST_08


_main:
    ld e, $06
    ld hl, _core_run ; jumps to bank 6 0x431c
    jp RST_08

    INCLUDE "src/engine/states/states_ptrs.asm"

    ld hl, sp+$06
    jr jr_000_05de

_hUGE_init:
    ld hl, sp+$02

jr_000_05de:
    push bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call hUGE_init
    pop bc
    ret


    ld hl, sp+$07
    jr jr_000_05ed

    ld hl, sp+$03

jr_000_05ed:
    push bc
    ld a, [hl-]
    and $01
    ld c, a
    ld b, [hl]
    call hUGE_mute_channel
    pop bc
    ret


    ld hl, sp+$06
    jr jr_000_05fe

Call_000_05fc:
    ld hl, sp+$02

jr_000_05fe:
    push bc
    ld c, [hl]

Call_000_0600:
Jump_000_0600:
    db $cd, $51, $08
    pop bc
    ret


hUGE_init:
    ld a, [hl+]
    ld [$d9dc], a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [de]
    ld [_RAND_SEED + 2], a
    ld c, $12
    ld de, _RAND_SEED + 3

jr_000_0616:
    ld a, [hl+]
    ld [de], a
    inc de
    dec c
    jr nz, jr_000_0616

    ld c, $29
    ld hl, _hUGE_mute_mask
    xor a

jr_000_0622:
    ld [hl+], a
    dec c
    jr nz, jr_000_0622

    ld a, $f0
    ld [$d9ed], a
    ld [$d9f5], a
    ld a, $64
    ld [_hUGE_current_wave], a
    ld c, $00

Call_000_0635:
    ld hl, _RAND_SEED + 3
    ld de, $d9d4
    call Call_000_064d
    ld hl, $d9c4
    call Call_000_064d
    ld hl, $d9c6
    call Call_000_064d
    ld hl, $d9c8

Call_000_064d:
    ld a, [hl+]
    add c
    ld h, [hl]
    ld l, a
    adc h
    sub l
    ld h, a
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc de
    ret


hUGE_mute_channel:
    ld e, $fe
    ld a, b
    or a
    jr z, jr_000_0668

jr_000_0661:
    sla c
    rlc e
    dec a
    jr nz, jr_000_0661

jr_000_0668:
    ld a, [_hUGE_mute_mask]
    and e
    or c
    ld [_hUGE_mute_mask], a
    and c
    jp nz, Jump_000_086f

    ret


Call_000_0675:
    ld a, [$d9e4]
    ld h, a
    add h
    add h
    ld h, $00
    ld l, a
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    inc hl
    ld c, [hl]
    ret


Call_000_0684:
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0675
    ld hl, $0000
    cp $48
    ret nc

    ld [de], a

Call_000_0691:
    add a
    add $18
    ld l, a
    adc $0c
    sub l
    ld h, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    scf
    ret


Call_000_069e:
    add $c0
    cpl
    cp $07
    ret c

    ld h, a
    sub $04
    srl a
    srl a
    ld l, a
    ld a, h
    and $03
    add $04
    swap l
    or l
    ret


Call_000_06b5:
    ld a, b
    add a
    add a
    add a
    add d
    add $e7
    ld l, a
    adc $d9
    sub l
    ld h, a
    ret


Jump_000_06c2:
    ld c, a
    ld a, [_hUGE_mute_mask]
    dec b
    jr z, jr_000_06da

    dec b
    jr z, jr_000_06e5

    dec b
    jr z, jr_000_06f0

    bit 0, a
    ret nz

    ld a, e
    ldh [rNR13], a
    ld a, d
    or c
    ldh [rNR14], a
    ret


jr_000_06da:
    bit 1, a
    ret nz

    ld a, e
    ldh [rNR23], a
    ld a, d
    or c
    ldh [rNR24], a
    ret


jr_000_06e5:
    bit 2, a
    ret nz

    ld a, e
    ldh [rNR33], a
    ld a, d
    or c
    ldh [rNR34], a
    ret


jr_000_06f0:
    bit 3, a
    ret nz

    ld a, e
    call Call_000_069e
    ldh [rNR43], a
    xor a
    ldh [rNR44], a
    ret


    jr jr_000_0705

    jr jr_000_0720

    jr jr_000_073b

    jr jr_000_075c

Call_000_0705:
jr_000_0705:
    ld a, [_hUGE_mute_mask]
    bit 0, a
    ret nz

    ld a, [$d9e2]
    ld [$d9e7], a
    ldh [rNR13], a
    ld a, [$d9e3]
    ld [$d9e8], a
    ld hl, $d9ee
    or [hl]
    ldh [rNR14], a
    ret


Call_000_0720:
jr_000_0720:
    ld a, [_hUGE_mute_mask]
    bit 1, a
    ret nz

    ld a, [$d9e2]
    ld [$d9ef], a
    ldh [rNR23], a
    ld a, [$d9e3]
    ld [$d9f0], a
    ld hl, $d9f6
    or [hl]
    ldh [rNR24], a
    ret


Call_000_073b:
jr_000_073b:
    ld a, [_hUGE_mute_mask]
    bit 2, a
    ret nz

    xor a
    ldh [rNR30], a
    cpl
    ldh [rNR30], a
    ld a, [$d9e2]
    ld [$d9f7], a
    ldh [rNR33], a
    ld a, [$d9e3]
    ld [$d9f8], a
    ld hl, $d9fe
    or [hl]
    ldh [rNR34], a
    ret


Call_000_075c:
jr_000_075c:
    ld a, [_hUGE_mute_mask]
    bit 3, a
    ret nz

    ld a, [$d9e2]
    ld [$da00], a
    ldh [rNR43], a
    ld a, [$da06]
    ldh [rNR44], a
    ret


Call_000_0770:
    ld a, b
    and $0f
    add a
    add $84
    ld l, a
    adc $07
    sub l
    ld h, a ; loads address 0x0784 into hl register 
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, e
    ld a, [$d9e5]
    or a
    jp hl

    di
    ld [$0927], sp
    add hl, sp
    add hl, bc
    ld b, [hl]
    add hl, bc
    jp z, $a408

    rlca
    xor c
    rlca
    ld e, $08
    ret


    rlca
    adc $07
    db $e4
    rlca
    ld d, c
    ld [$0882], sp
    ld e, e
    ld [$0860], sp
    ld c, e
    ld [$79c0], sp
    ldh [rNR50], a
    ret


    ld hl, $d9d0
    ld a, $0f
    and c
    add a
    add [hl]
    ld e, a
    inc hl
    ld a, $00
    adc [hl]
    ld h, a
    ld l, e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$d9e5]
    or a
    push af
    inc sp
    push bc
    call Call_000_07c8
    add sp, $03
    ret


Call_000_07c8:
    jp hl


    ret nz

    ld a, c
    ldh [rNR51], a
    ret


    ret nz

    ld a, b
    or a
    ld a, [_hUGE_mute_mask]
    jr z, jr_000_07dd

    bit 1, a
    ret nz

    ld a, c
    ldh [rNR21], a
    ret


jr_000_07dd:
    bit 0, a
    ret nz

    ld a, c
    ldh [rNR11], a
    ret


    ret nz

    add $fe
    adc $03
    add a
    daa
    rra
    ld d, a
    ld a, [_hUGE_mute_mask]
    and d
    ret nz

    ld a, c
    and $0f
    ld d, a
    ld a, c
    and $f0
    ld e, a
    swap e
    ld a, b
    add a
    add a
    add b

Call_000_0800:
    add $12
    ld c, a
    ld a, [c]
    and $f0
    swap a
    sub d
    jr nc, jr_000_080c

    xor a

jr_000_080c:
    add e
    cp $10
    jr c, jr_000_0813

    ld a, $0f

jr_000_0813:
    swap a
    ld [c], a
    inc c
    inc c
    ld a, [c]
    or $80
    ld [c], a
    jr jr_000_0834

    jr nz, jr_000_0832

    ld d, $00
    call Call_000_06b5
    ld a, [$d9e2]
    ld [hl+], a
    ld a, [$d9e3]
    ld [hl], a
    pop hl
    pop af
    and a
    push af
    jp hl


jr_000_0832:
    cp c
    ret nz

jr_000_0834:
    ld d, $00
    call Call_000_06b5
    ld a, [hl+]
    ld [$d9e2], a
    ld a, [hl]
    ld [$d9e3], a
    ld a, b
    add a
    add $fd
    ld l, a
    adc $06
    sub l
    ld h, a
    jp hl


    ret nz

    ld a, c
    ld [$d9dc], a
    ret


Call_000_0851:
    ld a, $01
    ld [$d9e1], a
    ld a, c
    ld [$d9e0], a
    ret


    ld a, c
    ld [$d9e1], a
    ret


    cp c
    ret nz

    add $fe
    adc $03
    add a
    daa
    rra
    ld d, a
    ld a, [_hUGE_mute_mask]
    and d
    ret nz

Jump_000_086f:
    ld a, b
    add a
    add a
    add b
    add $12
    ld l, a
    ld h, $ff
    xor a
    ld [hl+], a
    ld a, b
    cp $02
    ret z

    inc l
    ld [hl], $ff
    ret


    ret nz

    swap c
    ld a, [_hUGE_mute_mask]
    dec b
    jr z, jr_000_089c

    dec b
    jr z, jr_000_08a7

    dec b
    jr z, jr_000_08c3

    bit 0, a
    ret nz

    ldh a, [rNR12]
    and $0f
    or c
    ldh [rNR12], a
    ret


jr_000_089c:
    bit 1, a
    ret nz

    ldh a, [rNR22]
    and $0f
    or c
    ldh [rNR22], a
    ret


jr_000_08a7:
    bit 2, a
    ret nz

    ld a, c
    cp $a0
    jr nc, jr_000_08be

    cp $50
    jr nc, jr_000_08ba

    or a
    jr z, jr_000_08c0

    ld a, $60
    jr jr_000_08c0

jr_000_08ba:
    ld a, $40
    jr jr_000_08c0

jr_000_08be:
    ld a, $20

jr_000_08c0:
    ldh [rNR32], a
    ret


jr_000_08c3:
    bit 3, a
    ret nz

    ld a, c
    ldh [rNR42], a
    ret


    ret z

    ld d, $04
    call Call_000_06b5
    ld a, c
    and $f0
    swap a
    ld e, a
    ld a, [$d9e6]
    and e
    ld a, [hl]
    jr z, jr_000_08e2

    call Call_000_0691
    jr jr_000_08ed

jr_000_08e2:
    call Call_000_0691
    ld a, c
    and $0f
    add l
    ld l, a
    adc h
    sub l
    ld h, a

jr_000_08ed:
    ld d, h
    ld e, l
    xor a
    jp Jump_000_06c2


    ; 0x08f3
    ret z

    ld d, $04
    call Call_000_06b5
    ld d, [hl]
    ld a, [$d9e5]
    dec a
    jr jr_000_0902

jr_000_0900:
    sub $03

jr_000_0902:
    cp $03
    jr nc, jr_000_0900

    add a
    add $0f
    ld l, a
    adc $09
    sub l
    ld h, a
    jp hl


    jr @+$0b

    jr jr_000_0916

    ld a, d
    jr jr_000_091e

jr_000_0916:
    ld a, c
    swap a
    cp $79
    and $0f
    add d

jr_000_091e:
    call Call_000_0691
    ld d, h
    ld e, l
    xor a
    jp Jump_000_06c2


    ret z

    ld d, $00
    call Call_000_06b5
    ld a, [hl+]
    add c
    ld e, a
    adc [hl]
    sub e

jr_000_0932:
    ld d, a
    ld [hl-], a
    ld [hl], e
    xor a
    jp Jump_000_06c2


    ret z

    ld d, $00
    call Call_000_06b5
    ld a, [hl+]
    sub c
    ld e, a
    sbc a
    add [hl]
    jr jr_000_0932

    jr nz, jr_000_095d

    ld d, $02
    call Call_000_06b5
    ld a, [$d9e2]
    or a
    jr z, jr_000_0958

    ld [hl+], a
    ld a, [$d9e3]
    ld [hl], a

jr_000_0958:
    pop hl
    pop af
    and a
    push af
    jp hl


jr_000_095d:
    ld d, $00
    call Call_000_06b5
    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    sub e
    ld a, h
    sbc d
    jr c, jr_000_0979

    ld a, e
    add c
    ld e, a
    adc d
    sub e
    ld d, a
    ld c, $00
    jr jr_000_0983

jr_000_0979:
    ld a, e
    sub c
    ld e, a
    sbc a
    add d
    ld d, a
    jr c, jr_000_098c

    ld c, $ff

jr_000_0983:
    ld a, l
    sub e
    ld a, h
    sbc d
    rra
    xor c
    rla
    jr nc, jr_000_098e

jr_000_098c:
    ld d, h
    ld e, l

jr_000_098e:
    pop hl
    ld a, e
    ld [hl+], a
    ld [hl], d
    ld a, $06
    add l
    ld l, a
    adc h
    sub l
    ld h, a
    ld a, [hl]
    res 7, [hl]
    jp Jump_000_06c2


Call_000_099f:
    ld a, b
    and $f0
    swap a
    ret z

    dec a
    add a
    jr jr_000_09b0

Call_000_09a9:
    ld a, b
    and $f0
    swap a
    ret z

    dec a

jr_000_09b0:
    add a
    add a
    add e
    ld e, a
    adc d
    sub e
    ld d, a
    rla
    ret


hUGE_dosound:
    ld a, [$d9e5]
    or a
    jp nz, Jump_000_0b34

    ld hl, $d9d4
    ld de, $d9eb
    call Call_000_0684
    push af
    jr nc, jr_000_09f5

    ld a, [$d9ca]
    ld e, a
    ld a, [$d9cb]
    ld d, a
    call Call_000_09a9
    ld a, [$d9ee]
    res 7, a
    jr z, jr_000_09f2

    ld a, [_hUGE_mute_mask]
    bit 0, a
    jr nz, jr_000_09f5

    ld a, [de]
    inc de
    ldh [rNR10], a
    ld a, [de]
    inc de
    ldh [rNR11], a
    ld a, [de]
    ldh [rNR12], a
    inc de
    ld a, [de]

jr_000_09f2:
    ld [$d9ee], a

jr_000_09f5:
    ld a, l
    ld [$d9e2], a
    ld a, h
    ld [$d9e3], a
    ld e, $00
    call Call_000_0770
    pop af
    call c, Call_000_0705
    ld hl, $d9d6
    ld de, $d9f3
    call Call_000_0684
    push af
    jr nc, jr_000_0a38

    ld a, [$d9ca]
    ld e, a
    ld a, [$d9cb]
    ld d, a
    call Call_000_09a9
    ld a, [$d9f6]
    res 7, a
    jr z, jr_000_0a35

    ld a, [_hUGE_mute_mask]
    bit 1, a
    jr nz, jr_000_0a38

    inc de
    ld a, [de]
    inc de
    ldh [rNR21], a
    ld a, [de]
    ldh [rNR22], a
    inc de
    ld a, [de]

jr_000_0a35:
    ld [$d9f6], a

jr_000_0a38:
    ld a, l
    ld [$d9e2], a
    ld a, h
    ld [$d9e3], a
    ld e, $01
    call Call_000_0770
    pop af
    call c, Call_000_0720
    ld hl, $d9d8
    ld de, $d9fb
    call Call_000_0684
    ld a, l
    ld [$d9e2], a
    ld a, h
    ld [$d9e3], a
    push af
    jr nc, jr_000_0ace

    ld a, [$d9cc]
    ld e, a

Call_000_0a61:
    ld a, [$d9cd]
    ld d, a
    call Call_000_09a9
    ld a, [$d9fe]
    res 7, a
    jr z, jr_000_0acb

    ld a, [_hUGE_mute_mask]
    bit 2, a
    jr nz, jr_000_0ace

    ld a, [de]
    inc de
    ldh [rNR31], a
    ld a, [de]
    inc de
    ldh [rNR32], a

Jump_000_0a7e:
    ld a, [de]
    inc de
    ld hl, $d9dd
    cp [hl]
    jr z, jr_000_0aca

    ld [hl], a
    swap a
    ld hl, $d9d2
    add [hl]
    inc hl
    ld h, [hl]
    ld l, a
    adc h
    sub l
    ld h, a
    xor a
    ldh [rNR30], a
    ld a, [hl+]
    ldh [$30], a
    ld a, [hl+]
    ldh [$31], a
    ld a, [hl+]
    ldh [$32], a
    ld a, [hl+]
    ldh [$33], a
    ld a, [hl+]
    ldh [$34], a
    ld a, [hl+]
    ldh [$35], a
    ld a, [hl+]
    ldh [$36], a
    ld a, [hl+]
    ldh [$37], a
    ld a, [hl+]
    ldh [$38], a
    ld a, [hl+]
    ldh [$39], a
    ld a, [hl+]
    ldh [$3a], a
    ld a, [hl+]
    ldh [$3b], a
    ld a, [hl+]
    ldh [$3c], a
    ld a, [hl+]
    ldh [$3d], a
    ld a, [hl+]
    ldh [$3e], a
    ld a, [hl+]
    ldh [$3f], a
    ld a, $80
    ldh [rNR30], a

jr_000_0aca:
    ld a, [de]

jr_000_0acb:
    ld [$d9fe], a

jr_000_0ace:
    ld e, $02
    call Call_000_0770
    pop af
    call c, Call_000_073b
    ld hl, $d9da
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0675
    ld [$da03], a
    cp $48
    push af
    jr nc, jr_000_0b28

    call Call_000_069e
    ld [$d9e2], a
    ld de, $0000
    call Call_000_09a9
    ld a, [$da06]

Jump_000_0af7:
    res 7, a
    jr z, jr_000_0b25

    ld a, [_hUGE_mute_mask]
    bit 3, a

Call_000_0b00:
    jr nz, jr_000_0b28

    ld hl, $d9ce
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    sla e
    add hl, de
    ld a, [hl+]
    ldh [rNR42], a
    ld a, [hl]
    and $3f
    ldh [rNR41], a
    ld a, [$d9e2]
    ld d, a
    ld a, [hl]
    and $80
    swap a
    or d
    ld [$d9e2], a
    ld a, [hl]
    and $40
    or $80

jr_000_0b25:
    ld [$da06], a

jr_000_0b28:
    ld e, $03
    call Call_000_0770
    pop af
    call c, Call_000_075c
    jp Jump_000_0bca


Jump_000_0b34:
    ld a, [_hUGE_mute_mask]
    bit 0, a
    jr nz, jr_000_0b4d

    ld hl, $d9d4
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0675
    ld a, c
    or a
    jr z, jr_000_0b4d

    ld e, $00
    call Call_000_0770

jr_000_0b4d:
    ld a, [_hUGE_mute_mask]
    bit 1, a
    jr nz, jr_000_0b66

    ld hl, $d9d6
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0675
    ld a, c
    or a
    jr z, jr_000_0b66

    ld e, $01
    call Call_000_0770

jr_000_0b66:
    ld a, [_hUGE_mute_mask]
    bit 2, a
    jr nz, jr_000_0b7f

    ld hl, $d9d8
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0675
    ld a, c
    or a
    jr z, jr_000_0b7f

    ld e, $02
    call Call_000_0770

jr_000_0b7f:
    ld a, [_hUGE_mute_mask]
    bit 3, a
    jr nz, jr_000_0bca

    ld hl, $d9da
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0675
    cp $48
    jr nc, jr_000_0bc1

    ld h, a
    ld a, [$d9ce]
    ld e, a
    ld a, [$d9cf]
    ld d, a
    call Call_000_099f
    jr z, jr_000_0bc1

    ld a, [$d9e5]
    cp $07
    jr nc, jr_000_0bc1

    inc de
    ld l, a
    ld a, h
    ld h, $00
    add hl, de
    add [hl]
    call Call_000_069e
    ld l, a
    ld a, [de]
    ld e, a
    and $80
    swap a
    or l
    ldh [rNR43], a
    ld a, e
    and $40
    ldh [rNR44], a

jr_000_0bc1:
    ld a, c
    or a
    jr z, jr_000_0bca

    ld e, $03
    call Call_000_0770

Jump_000_0bca:
jr_000_0bca:
    ld hl, $d9e6
    inc [hl]
    ld a, [$d9dc]
    ld b, a
    ld hl, $d9e5
    ld a, [hl]
    inc a
    cp b
    jr z, jr_000_0bdc

    ld [hl], a
    ret


jr_000_0bdc:
    ld [hl], $00
    ld a, [$d9e1]
    or a
    jr z, jr_000_0bf4

    dec a
    ld b, a
    ld hl, $d9e1
    xor a
    ld [hl-], a
    or [hl]
    ld [hl], $00
    jr z, jr_000_0bff

    dec a
    add a
    jr jr_000_0c0c

jr_000_0bf4:
    ld a, [$d9e4]
    inc a
    ld b, a
    cp $40
    jr nz, jr_000_0c13

    ld b, $00

jr_000_0bff:
    ld a, [$d9c1]
    ld c, a
    ld a, [$d9df]
    add $02
    cp c
    jr nz, jr_000_0c0c

    xor a

jr_000_0c0c:
    ld [$d9df], a
    ld c, a
    call Call_000_0635

jr_000_0c13:
    ld a, b
    ld [$d9e4], a
    ret


    inc l
    nop
    sbc h
    nop
    ld b, $01
    ld l, e
    ld bc, $01c9
    inc hl
    ld [bc], a
    ld [hl], a
    ld [bc], a
    add $02
    ld [de], a
    inc bc
    ld d, [hl]
    inc bc
    sbc e
    inc bc
    jp c, $1603

    inc b
    ld c, [hl]
    inc b
    add e
    inc b
    or l
    inc b
    push hl
    inc b
    ld de, $3b05
    dec b
    ld h, e
    dec b
    adc c
    dec b
    xor h
    dec b
    adc $05
    db $ed
    dec b
    ld a, [bc]
    ld b, $27
    ld b, $42
    ld b, $5b
    ld b, $72
    ld b, $89
    ld b, $9e
    ld b, $b2
    ld b, $c4
    ld b, $d6
    ld b, $e7
    ld b, $f7
    ld b, $06
    rlca
    inc d
    rlca
    ld hl, $2d07
    rlca
    add hl, sp
    rlca
    ld b, h
    rlca
    ld c, a
    rlca
    ld e, c
    rlca
    ld h, d
    rlca
    ld l, e
    rlca
    ld [hl], e
    rlca
    ld a, e
    rlca
    add e
    rlca
    adc d
    rlca
    sub b
    rlca
    sub a
    rlca
    sbc l
    rlca
    and d
    rlca
    and a
    rlca
    xor h
    rlca
    or c
    rlca
    or [hl]
    rlca
    cp d
    rlca
    cp [hl]
    rlca
    pop bc
    rlca
    call nz, $c807
    rlca
    rlc a
    adc $07
    pop de
    rlca
    call nc, $d607
    rlca
    reti


    rlca
    db $db
    rlca
    db $dd
    rlca
    rst $18
    rlca

Call_000_0ca8:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a

jr_000_0cad:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_0cad

    ld e, [hl]
    ret


    ldh a, [rLCDC]
    and $40
    jr z, jr_000_0cc3

    jr jr_000_0cc7

    ldh a, [rLCDC]
    and $08
    jr nz, jr_000_0cc7

jr_000_0cc3:
    ld d, $98
    jr jr_000_0cc9

jr_000_0cc7:
    ld d, $9c

jr_000_0cc9:
    ld hl, sp+$03
    ld a, [hl-]
    ld l, [hl]
    ld e, d
    swap a
    rlca
    ld h, a
    and $03
    add e
    ld d, a
    ld a, $e0
    and h
    add l
    ld l, a
    ld h, d

jr_000_0cdc:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_0cdc

    ld e, [hl]
    ret


_hide_sprites_range:
    ld hl, sp+$02
    ld a, [hl+]
    cp $28
    ret nc

    add a
    add a
    ld e, a
    ld a, [hl-]
    sub [hl]
    ret c

    ret z

    ld hl, ___render_shadow_OAM
    ld h, [hl]
    ld l, e
    ld de, $0004
    rra
    jr nc, jr_000_0cff

    ld [hl], d
    add hl, de
    ret z

jr_000_0cff:
    srl a
    jr nc, jr_000_0d08

    ld [hl], d
    add hl, de
    ld [hl], d
    add hl, de
    ret z

jr_000_0d08:
    ld [hl], d
    add hl, de
    ld [hl], d
    add hl, de
    ld [hl], d
    add hl, de
    ld [hl], d
    add hl, de
    dec a
    jr nz, jr_000_0d08

    ret


    push bc
    add sp, -$10
    ld hl, sp+$00
    ld c, $10
    xor a
    rst $28
    ld hl, sp+$00
    ld a, $89
    ld [hl+], a
    ld a, $03
    ld [hl-], a
    call Call_000_0d61
    ld c, $00
    ld a, $30
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld e, $04
    ld a, [c]

jr_000_0d32:
    ld b, a
    ld a, $20
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld a, $10
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld a, $30
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld a, [c]
    ld a, [c]
    cp b
    jr nz, jr_000_0d4e

    dec e
    jr nz, jr_000_0d32

    ld e, $00
    jr jr_000_0d58

jr_000_0d4e:
    ld hl, sp+$01
    ld a, $00
    ld [hl-], a
    call Call_000_0d61
    ld e, $01

jr_000_0d58:
    add sp, $10
    pop bc
    ret


_sgb_transfer:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a

Call_000_0d61:
    push bc
    ld a, [hl]
    and $03
    jr z, jr_000_0da0

jr_000_0d67:
    push af
    ld c, $00
    ld [c], a
    ld a, $30
    ld [c], a
    ld b, $10

jr_000_0d70:
    ld e, $08
    ld a, [hl+]
    ld d, a

jr_000_0d74:
    srl d
    ld a, $10
    jr c, jr_000_0d7c

    ld a, $20

jr_000_0d7c:
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld a, $30
    ld [c], a
    ld a, [c]
    ld a, [c]
    dec e
    jr nz, jr_000_0d74

    dec b
    jr nz, jr_000_0d70

    ld a, $20
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld a, $30
    ld [c], a
    ld de, $1b58

jr_000_0d95:
    ldh a, [rP1]
    dec de
    ld a, d
    or e
    jr nz, jr_000_0d95

    pop af
    dec a
    jr nz, jr_000_0d67

jr_000_0da0:
    pop bc
    ret


_move_metasprite:
    ld hl, sp+$04
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl]
    cp $28
    jr nc, jr_000_0dde

    add a
    add a
    ld e, a
    ld hl, ___current_metasprite
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [___render_shadow_OAM]
    ld d, a

jr_000_0dba:
    ld a, [hl+]
    cp $80
    jr z, jr_000_0dd7

    add b
    ld b, a
    ld [de], a
    inc e
    ld a, [hl+]
    add c
    ld c, a
    ld [de], a
    inc e
    ld a, [___current_base_tile]
    add [hl]
    inc hl
    ld [de], a
    inc e
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, e
    cp $a0
    jr c, jr_000_0dba

jr_000_0dd7:
    ld a, e
    srl a
    srl a
    ld hl, sp+$02

jr_000_0dde:
    sub [hl]
    ld e, a
    ret


_memset_simple:
    ld e, a
    ld a, b
    or c
    ret z

    ld [hl], e
    dec bc
    ld d, h
    ld e, l
    inc de

_memcpy_simple:
    ld a, b
    or c
    ret z

    srl b
    rr c
    jr nc, jr_000_0df6

    ld a, [hl+]
    ld [de], a
    inc de

jr_000_0df6:
    inc b
    inc c
    jr jr_000_0e00

jr_000_0dfa:
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de

jr_000_0e00:
    dec c
    jr nz, jr_000_0dfa

    dec b
    jr nz, jr_000_0dfa

    ret


Call_000_0e07:
    ld hl, $c0a5

Jump_000_0e0a:
jr_000_0e0a:
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    inc hl
    or d
    ret z

    ld a, e
    cp c
    jr nz, jr_000_0e0a

    ld a, d
    cp b
    jr nz, jr_000_0e0a

    ld d, h
    ld e, l
    dec de
    dec de

jr_000_0e1c:
    ld a, [hl+]
    ld [de], a
    ld b, a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    or b
    ret z

    jr jr_000_0e1c

_add_VBL:
    ld hl, $c0a5

_add_int:
jr_000_0e2a:
    ld a, [hl+]
    or [hl]
    jr z, jr_000_0e31

    inc hl
    jr jr_000_0e2a

jr_000_0e31:
    ld a, b
    ld [hl-], a
    ld [hl], c
    ret


_wait_vbl_done:
    ldh a, [rLCDC]
    and $80
    ret z

    xor a
    ldh [$91], a

jr_000_0e3d:
    halt
    ldh a, [$91]
    or a
    jr z, jr_000_0e3d

    ret


_display_off:
    ldh a, [rLCDC]
    and $80
    ret z

jr_000_0e4a:
    ldh a, [rLY]
    cp $92
    jr nc, jr_000_0e4a

jr_000_0e50:
    ldh a, [rLY]
    cp $91
    jr c, jr_000_0e50

    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a
    ret


    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call Call_000_0e07
    pop bc
    ret


Call_000_0e68:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    call _add_VBL
    pop bc
    ret

    INCLUDE "src/engine/actor_nonbanked.asm"

    INCLUDE "src/engine/bankdata.asm"

    INCLUDE "src/engine/camera_nonbanked.asm"

    INCLUDE "src/engine/data_manager_nonbanked.asm"

    INCLUDE "src/engine/events_nonbanked.asm"

    INCLUDE "src/engine/input_nonbanked.asm"

    INCLUDE "src/engine/interrupt_sio.asm"

    INCLUDE "src/engine/interrupt_timer.asm"

    INCLUDE "src/engine/interrupts_nonbanked.asm"

    INCLUDE "src/engine/math.asm"

    INCLUDE "src/engine/music_manager_nonbanked.asm"

    INCLUDE "src/engine/parallax_nonbanked.asm"

    INCLUDE "src/engine/projectiles_nonbanked.asm"

    INCLUDE "src/engine/scroll_nonbanked.asm"

    INCLUDE "src/engine/set_tile_submap.asm"

    INCLUDE "src/engine/sfx_player.asm"

    INCLUDE "src/engine/sio_nonbanked.asm"

    INCLUDE "src/engine/ui_nonbanked.asm"

    INCLUDE "src/engine/vm_sgb.asm"

    INCLUDE "src/engine/vm_ui_nonbanked.asm"

    INCLUDE "src/engine/vm_nonbanked.asm"

_fill_win_rect:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    ld hl, sp+$08
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld h, [hl]
    ld l, a
    call Call_000_369b
    pop bc
    ret

_randw:
    ld a, [_RAND_SEED]
    ld l, a
    ld e, a
    ld a, [$d9c0]
    ld d, a
    sla l
    rla
    sla l
    rla
    sla l
    rla
    sla l
    rla
    ld h, a
    ld a, e
    add l
    ld l, a
    ld a, h
    adc d
    ld h, a
    ld a, l
    add $93
    ld [_RAND_SEED], a
    ld d, a
    ld a, h
    adc $5c
    ld [$d9c0], a
    ld e, a
    ret

_initrand:
    ld hl, sp+$02
    ld a, [hl+]
    ld [_RAND_SEED], a
    ld a, [hl]
    ld [_RAND_SEED + 1], a
    ret

get_win_data:
Call_000_34ba:
    ldh a, [rLCDC]
    and $10
    jp nz, Jump_000_3507

    push bc
    ld hl, sp+$07
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld e, a
    ld l, [hl]
    push hl
    xor a
    or e
    jr nz, jr_000_34d5

    ld de, $1000
    jr jr_000_34de

jr_000_34d5:
    ld h, $00
    ld l, e
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld d, h
    ld e, l

jr_000_34de:
    pop hl
    ld a, l
    rlca
    sbc a
    ld h, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    push bc
    ld bc, $9000
    add hl, bc
    pop bc

jr_000_34ed:
    bit 3, h
    jr z, jr_000_34f7

    bit 4, h
    jr z, jr_000_34f7

    res 4, h

jr_000_34f7:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_34f7

    ld a, [hl+]
    ld [bc], a
    inc bc
    dec de
    ld a, d
    or e
    jr nz, jr_000_34ed

    pop bc
    ret


Jump_000_3507:
    push bc
    ld hl, sp+$07
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld e, a
    ld l, [hl]
    push hl
    xor a
    or e
    jr nz, jr_000_351b

    ld de, $1000
    jr jr_000_3524

jr_000_351b:
    ld h, $00
    ld l, e
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld d, h
    ld e, l

jr_000_3524:
    pop hl
    ld l, a
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    push bc
    ld bc, $8000
    add hl, bc
    ld b, h
    ld c, l
    pop hl
    call Call_000_36f1
    pop bc
    ret


    ld hl, $0003
    ld b, h
    add hl, sp
    ld e, [hl]
    dec hl
    ld c, [hl]
    jr jr_000_3557

_muluschar:
    ld hl, $0002
    ld b, h
    add hl, sp
    ld e, [hl]
    inc hl
    ld c, [hl]
    jr jr_000_3557

    ld hl, $0002
    add hl, sp
    ld a, [hl+]
    ld a, e
    ld l, [hl]
    ld c, l
    ld a, l
    rla
    sbc a
    ld b, a

jr_000_3557:
    ld a, e
    rla
    sbc a
    ld d, a
    jr jr_000_3576

Call_000_355d:
    ld hl, $0002
    add hl, sp
    ld a, [hl+]
    ld e, a
    ld c, [hl]
    xor a
    ld d, a
    ld b, a
    jr jr_000_3576

Call_000_3569:
    ld hl, $0002
    add hl, sp
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, h
    ld c, l

jr_000_3576:
    ld hl, $0000
    ld a, b
    ld b, $10
    or a
    jr nz, jr_000_3582

    ld b, $08
    ld a, c

jr_000_3582:
    add hl, hl
    rl c
    rla
    jr nc, jr_000_3589

    add hl, de

jr_000_3589:
    dec b
    jr nz, jr_000_3582

    ld e, l
    ld d, h
    ret

_abs:
    ld hl, sp+$03
    ld a, [hl-]
    ld d, a
    ld e, [hl]
    add a
    ret nc

    xor a
    sub e
    ld e, a
    ld a, $00
    sbc d
    ld d, a
    ret

_set_win_tiles:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    ld hl, sp+$09
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld h, [hl]
    ld l, a
    call set_xy_wtt
    pop bc
    ret

set_tile_data:
    ld hl, sp+$06
    ld d, [hl]
    jr jr_000_35c1

_set_bkg_data:
_set_win_data:
    ld d, $90
    ldh a, [rLCDC]
    and $10
    jr z, jr_000_35c1

set_sprite_data:
    ld d, $80

jr_000_35c1:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    swap e
    ld a, e
    and $0f
    add d
    ld d, a
    ld a, e
    and $f0
    ld e, a

jr_000_35d6:
    bit 3, d
    jr z, jr_000_35dc

    res 4, d

jr_000_35dc:
    ld b, $10

jr_000_35de:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_35de

    ld a, [hl+] ; load background, hl has address of image
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_35de

    dec c
    jr nz, jr_000_35d6

    pop bc
    ret


Call_000_35ef:
    ld hl, sp+$02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push bc
    ld b, h
    ld c, l
    ld de, $0000

jr_000_35fa:
    ld a, [hl+]
    or a
    jr z, jr_000_3601

    inc de
    jr jr_000_35fa

jr_000_3601:
    srl d
    rr e
    ld a, e
    or d
    jr z, jr_000_361c

    dec hl
    dec hl
    inc d
    inc e
    jr jr_000_3616

jr_000_360f:
    ld a, [hl]
    push af
    ld a, [bc]
    ld [hl-], a
    pop af
    ld [bc], a
    inc bc

jr_000_3616:
    dec e
    jr nz, jr_000_360f

    dec d
    jr nz, jr_000_360f

jr_000_361c:
    pop bc
    ld hl, sp+$02
    ld e, [hl]
    inc hl
    ld d, [hl]
    ret


    ldh a, [$90]
    push af
    ld hl, $3639
    push hl
    ld hl, $da07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$da09]
    ldh [$90], a
    ld [$2000], a
    jp hl


    pop af
    ldh [$90], a
    ld [$2000], a
    ret


    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


Jump_000_364a:
    push af
    push hl
    push bc
    push de
    ld hl, $da0b
    push hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_000_366d

    rst $20
    ld hl, $da0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    jr z, jr_000_366d

    rst $20
    ld hl, $da0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    or h
    call nz, RST_20

jr_000_366d:
    pop hl
    pop de
    pop bc
    pop hl

jr_000_3671:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_3671

    pop af
    reti


_add_LCD:
    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_3684
    pop bc
    ret


Call_000_3684:
    ld hl, $da0b
    jp _add_int


_remove_LCD:
    push bc
    ld hl, sp+$04
    ld c, [hl]
    inc hl
    ld b, [hl]
    call Call_000_3695
    pop bc
    ret


Call_000_3695:
    ld hl, $da0b
    jp Jump_000_0e0a


Call_000_369b:
    push hl
    ldh a, [rLCDC]
    and $40
    jr z, jr_000_36ab

    jr jr_000_36b0

_fill_rect_btt:
    push hl
    ldh a, [rLCDC]
    and $08
    jr nz, jr_000_36b0

jr_000_36ab:
    ld hl, $9800
    jr jr_000_36b3

jr_000_36b0:
    ld hl, $9c00

jr_000_36b3:
    push bc
    swap e
    rlc e
    ld a, e
    and $03
    add h
    ld b, a
    ld a, $e0
    and e
    add d
    ld c, a
    pop hl
    pop de
    push de
    push bc

jr_000_36c6:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_36c6

    ld a, h
    ld [bc], a
    ld a, c
    and $e0
    ld e, a
    ld a, c
    inc a
    and $1f
    or e
    ld c, a
    dec d
    jr nz, jr_000_36c6

    pop bc
    pop de
    dec e
    ret z

    push de
    ld a, b
    and $fc
    ld e, a
    ld a, $20
    add c
    ld c, a
    adc b
    sub c
    and $03
    or e
    ld b, a
    push bc
    jr jr_000_36c6

Call_000_36f1:
    inc d
    inc e
    jr jr_000_36fe

jr_000_36f5:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_36f5

    ld a, [bc]
    ld [hl+], a
    inc bc

jr_000_36fe:
    dec e
    jr nz, jr_000_36f5

    dec d
    jr nz, jr_000_36f5

    ret


Call_000_3705:
    push bc
    ld hl, sp+$09
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    call Call_000_36f1
    pop bc
    ret


_fill_bkg_rect:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    ld hl, sp+$08
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld h, [hl]
    ld l, a
    call _fill_rect_btt
    pop bc
    ret

padup:
    push af
    push de

jr_000_372c:
    ld d, $7f

jr_000_372e:
    call _joypad
    or a
    jr nz, jr_000_372c

    dec d
    jr nz, jr_000_372e

    pop de
    pop af
    ret


_joypad:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    and $0f
    ld e, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    and $0f
    swap a
    or e
    cpl
    ld e, a
    ld a, $30
    ldh [rP1], a
    ld a, e
    ret


    ld hl, sp+$02
    ld d, [hl]

.wait_pad:
    call _joypad
    and d
    jr z, .wait_pad

    ret


Call_000_376c:
    jp hl

_memcpy:
    ld hl, sp+$07
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    or d
    jr z, jr_000_37aa

    push bc
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    srl d
    rr e
    jr nc, jr_000_3787

    ld a, [bc]
    ld [hl+], a
    inc bc

jr_000_3787:
    srl d
    rr e
    jr nc, jr_000_3793

    ld a, [bc]
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl+], a
    inc bc

jr_000_3793:
    inc d
    inc e
    jr jr_000_37a3

jr_000_3797:
    ld a, [bc]
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl+], a
    inc bc

jr_000_37a3:
    dec e
    jr nz, jr_000_3797

    dec d
    jr nz, jr_000_3797

    pop bc

jr_000_37aa:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ret

_memset:
    ld hl, sp+$07
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    or d
    jr z, jr_000_37dd

    dec hl
    ld a, [hl-]
    push af
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    pop af
    srl d
    rr e
    jr nc, jr_000_37c7

    ld [hl+], a

jr_000_37c7:
    srl d
    rr e
    jr nc, jr_000_37cf

    ld [hl+], a
    ld [hl+], a

jr_000_37cf:
    inc d
    inc e
    jr jr_000_37d7

jr_000_37d3:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a

jr_000_37d7:
    dec e
    jr nz, jr_000_37d3

    dec d
    jr nz, jr_000_37d3

jr_000_37dd:
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ret


set_xy_wtt:
    push hl
    ldh a, [rLCDC]
    and $40
    jr z, jr_000_37f3

    jr jr_000_37f8

set_xy_btt:
    push hl
    ldh a, [rLCDC]
    and $08
    jr nz, jr_000_37f8

jr_000_37f3:
    ld hl, $9800
    jr set_xy_tt

jr_000_37f8:
    ld hl, $9c00

set_xy_tt:
    push bc
    swap e
    rlc e
    ld a, e
    and $03
    add h
    ld b, a
    ld a, $e0
    and e
    add d
    ld c, a
    pop hl
    pop de
    push de
    push bc

jr_000_380e:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_380e

    ld a, [_MAP_TILE_OFFSET]
    add [hl]
    ld [bc], a
    inc hl
    ld a, c
    and $e0
    ld e, a
    ld a, c
    inc a
    and $1f
    or e
    ld c, a
    dec d
    jr nz, jr_000_380e

    pop bc
    pop de
    dec e
    ret z

    push de
    ld a, b
    and $fc
    ld e, a
    ld a, $20
    add c
    ld c, a
    adc b
    sub c
    and $03
    or e
    ld b, a
    push bc
    jr jr_000_380e

    ld hl, sp+$03
    ld e, [hl]
    dec hl
    ld c, [hl]
    ld b, $00
    call Call_000_38e6
    ld e, c
    ld d, b
    ret


    ld hl, sp+$03
    ld e, [hl]
    dec hl
    ld c, [hl]
    ld b, $00
    jp Jump_000_38e6


    ld hl, $0003
    ld d, h
    add hl, sp
    ld a, [hl-]
    ld e, a
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    call Call_000_38ea
    ld e, c
    ld d, b
    ret


    ld hl, $0003
    ld d, h
    add hl, sp
    ld a, [hl-]
    ld e, a
    ld c, [hl]
    ld a, c
    rlca
    sbc a
    ld b, a
    call Call_000_38ea
    ret


    ld hl, sp+$03
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_38e2
    ld e, c
    ld d, b
    ret


    ld hl, sp+$03
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_38e2
    ret


Call_000_388c:
    ld hl, sp+$05
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_38ea
    ld e, c
    ld d, b
    ret


_modsint:
    ld hl, sp+$05
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_38ea
    ret


    ld hl, sp+$03
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_3920
    ld e, c
    ld d, b
    ret


    ld hl, sp+$03
    ld e, [hl]
    dec hl
    ld l, [hl]
    ld c, l
    call Call_000_3920
    ret


    ld hl, sp+$05
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a

Call_000_38c8:
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_3923
    ld e, c
    ld d, b
    ret


    ld hl, sp+$05
    ld a, [hl-]
    ld d, a
    ld a, [hl-]
    ld e, a
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    ld b, h
    ld c, l
    call Call_000_3923
    ret


Call_000_38e2:
    ld a, c
    rlca
    sbc a
    ld b, a

Call_000_38e6:
Jump_000_38e6:
    ld a, e
    rlca
    sbc a
    ld d, a

Call_000_38ea:
    ld a, b
    push af
    xor d
    push af
    bit 7, d
    jr z, jr_000_38f8

    sub a
    sub e
    ld e, a
    sbc a
    sub d
    ld d, a

jr_000_38f8:
    bit 7, b
    jr z, jr_000_3902

    sub a
    sub c
    ld c, a
    sbc a
    sub b
    ld b, a

jr_000_3902:
    call Call_000_3923
    jr c, jr_000_391d

    pop af
    and $80
    jr z, jr_000_3912

    sub a
    sub c
    ld c, a
    sbc a
    sub b
    ld b, a

jr_000_3912:
    pop af
    and $80
    ret z

    sub a
    sub e
    ld e, a
    sbc a
    sub d
    ld d, a
    ret


jr_000_391d:
    pop af
    pop af
    ret


Call_000_3920:
    ld b, $00
    ld d, b

Call_000_3923:
    ld a, e
    or d
    jr nz, jr_000_392e

    ld bc, $0000
    ld d, b
    ld e, c
    scf
    ret


jr_000_392e:
    ld l, c
    ld h, b
    ld bc, $0000
    or a
    ld a, $10

jr_000_3936:
    push af
    rl l
    rl h
    rl c
    rl b
    push bc
    ld a, c
    sbc e
    ld c, a
    ld a, b
    sbc d
    ld b, a
    ccf
    jr c, jr_000_3951

    pop bc
    pop af
    dec a
    or a
    jr nz, jr_000_3936

    jr jr_000_395a

jr_000_3951:
    inc sp
    inc sp
    pop af
    dec a
    scf
    jr nz, jr_000_3936

    jr jr_000_395a

jr_000_395a:
    ld d, b
    ld e, c
    rl l
    ld c, l
    rl h
    ld b, h
    or a
    ret


_set_bkg_tiles:
    push bc
    ld hl, sp+$04
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    ld hl, sp+$09
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld c, a
    ld a, [hl-]
    ld h, [hl]
    ld l, a
    call set_xy_btt
    pop bc
    ret


    nop
    nop
    adc b
    inc sp
    ld [bc], a
    nop
    inc b
    nop
    ld bc, $e400
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    sub [hl]
    nop
    rrca
    rra
    db $10
    ret nz

    nop

gsinit:
    ld bc, $0019
    ld hl, $3978
    ld de, _FADE_STYLE
    call _memcpy_simple
    xor a
    ld hl, _SIO_STATUS
    ld c, $03
    rst $28
    ld a, $00
    ld [_SIO_STATUS], a
    ldh [rSC], a
    ld a, $66
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    ld hl, $ca53
    ld [hl], $00
    ret

    ; unused
    ds 1607, $ff