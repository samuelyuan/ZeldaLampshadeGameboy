SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

    ld [$c523], a
    ldh a, [rIE]
    ld [$c524], a
    ldh a, [rLCDC]
    ld [$c525], a
    ld a, $80
    ldh [rLCDC], a
    ld a, $01
    ld [$00ff], a
    ld a, $00
    ld [$000f], a
    halt
    ld a, $00
    ldh [rLCDC], a
    ld [$9d9e], sp
    ld sp, $9d9e
    push hl
    push de
    push bc
    ld a, [$c523]
    push af
    ldh a, [rVBK]
    ld e, a
    bit 0, a
    jr z, jr_007_4046

    ld hl, $9d96
    ld c, $0a

jr_007_403a:
    ld b, [hl]
    xor a
    ldh [rVBK], a
    ld [hl], b
    inc l
    inc a
    ldh [rVBK], a
    dec c
    jr nz, jr_007_403a

jr_007_4046:
    xor a
    ldh [rNR52], a
    ldh [rVBK], a
    ld a, e
    ld [$9dbb], a
    ld a, $01
    ldh [rVBK], a
    ld hl, $9dcb
    ld b, $12

jr_007_4058:
    xor a
    ld c, $15
    rst $28
    ld a, l
    add $0b
    ld l, a
    dec b
    jr nz, jr_007_4058

    xor a
    ldh [rVBK], a
    ld a, $03
    ldh [rBGP], a
    ld a, $80
    ldh [rBCPS], a
    xor a
    ld c, $69
    ld [c], a
    ld [c], a
    dec a
    ld [c], a
    ld [c], a
    ld [c], a
    ld [c], a
    ld [c], a
    ld [c], a
    ld a, $70
    ldh [rSCY], a
    ld a, $5c
    ldh [rSCX], a
    call Call_007_4189
    ld hl, $9db7
    ld de, $9d9c
    ld c, $04
    rst $30
    ld hl, $9dcb
    ld de, $42ea
    ld b, $03

jr_007_4096:
    ld a, $20
    ld [hl+], a
    ld c, $13
    rst $30
    ld a, $20
    ld [hl+], a
    ld a, l
    add $0b
    ld l, a
    dec b
    jr nz, jr_007_4096

    ld a, $20
    ld c, $15
    rst $28
    ld l, $6b
    ld c, $04
    rst $30
    pop bc
    call Call_007_413a
    ld c, $08
    rst $30
    ld a, [$c0a0]
    call Call_007_413e
    ld a, $20
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld l, $8b
    ld c, $04
    rst $30
    pop bc
    call Call_007_413a
    ld c, $06
    rst $30
    pop bc
    call Call_007_413a
    ld a, $20
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a

jr_007_40d7:
    ld a, l
    add $0b
    ld l, a
    ld c, $04
    rst $30
    pop bc
    push bc
    call Call_007_413a
    ld de, $433d
    ld c, $07
    rst $30
    pop de
    call Call_007_415a
    ld de, $4344
    bit 7, l
    jr z, jr_007_40d7

    ld de, $4348
    ld l, $ab
    ld c, $06
    rst $30
    ld a, [$c525]
    call Call_007_413e
    ld c, $04
    rst $30
    ldh a, [rKEY1]
    call Call_007_413e
    ld c, $04
    rst $30
    ld a, [$c524]
    call Call_007_413e
    ld [hl], $20
    ld l, $cb
    ld c, $07
    rst $30

jr_007_411a:
    ld a, $20
    ld [hl+], a
    ld a, [de]
    inc de
    ld [hl+], a
    cp $20
    jr z, jr_007_4130

    ld a, [de]
    inc de
    ld c, a
    ld a, [de]
    inc de
    ld b, a
    ld a, [bc]
    call Call_007_413e
    jr jr_007_411a

jr_007_4130:
    ld a, $89
    ldh [rLCDC], a

jr_007_4134:
    xor a
    ldh [rIF], a
    db $76
    jr jr_007_4134

Call_007_413a:
    call Call_007_413f
    ld a, c

Call_007_413e:
    ld b, a

Call_007_413f:
    ld a, b
    and $f0
    swap a
    add $30
    cp $3a
    jr c, jr_007_414c

    add $07

jr_007_414c:
    ld [hl+], a
    ld a, b
    and $0f
    add $30
    cp $3a
    jr c, jr_007_4158

    add $07

jr_007_4158:
    ld [hl+], a
    ret


Call_007_415a:
    ld b, d
    ld c, e
    call Call_007_413a
    ld a, $20
    ld [hl+], a
    ld [hl+], a
    ld a, e
    sub $08
    ld e, a
    ld a, d
    sbc $00
    ld d, a

jr_007_416b:
    ld a, l
    add $0b
    ld l, a
    ld a, $20
    ld [hl+], a

jr_007_4172:
    ld a, [de]
    inc de
    call Call_007_413e
    ld a, [de]
    inc de
    call Call_007_413e
    ld a, $20
    ld [hl+], a
    bit 4, l
    jr nz, jr_007_4172

    ld a, l
    and $7f
    jr nz, jr_007_416b

    ret


Call_007_4189:
    ld hl, $41b0

jr_007_418c:
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    or e
    ret z

jr_007_4192:
    ld c, [hl]
    inc hl
    bit 7, c
    jr z, jr_007_41a2

    ld a, [hl+]

jr_007_4199:
    ld [de], a
    inc de
    ld [de], a
    inc de
    inc c
    jr nz, jr_007_4199

    jr jr_007_4192

jr_007_41a2:
    inc c
    dec c
    jr z, jr_007_418c

jr_007_41a6:
    ld a, [hl+]
    ld [de], a
    inc de
    ld [de], a
    inc de
    dec c
    jr nz, jr_007_41a6

    jr jr_007_4192

    nop
    sub b
    ld hl, sp-$01
    nop
    nop
    sub d
    ld hl, sp-$01
    nop
    ret nc

    sub d
    ld [$ffff], sp
    rst $38
    rst $38
    jp $ffff


    rst $38
    nop
    nop
    sub e
    ld d, b
    rst $38
    rst $08
    and a
    inc sp
    inc sp
    inc sp
    sub a
    rst $08
    rst $38
    rst $08
    adc a
    rrca
    rst $08
    rst $08
    rst $08
    inc bc
    rst $38
    add a
    inc sp
    rst $20
    rst $08
    sbc a
    ccf
    inc bc
    rst $38
    add a
    ld [hl], e
    di
    rst $00
    di
    ld [hl], e
    add a
    rst $38
    rst $00
    and a
    ld h, a
    inc bc
    rst $20
    rst $20
    rst $20
    rst $38
    inc bc
    ccf
    ccf
    add a
    di
    inc sp
    add a
    rst $38
    add a
    inc sp
    ccf
    rlca
    inc sp
    inc sp
    add a
    rst $38
    inc bc
    di
    di
    rst $20
    rst $20
    rst $08
    rst $08
    rst $38
    add a
    inc sp
    inc sp
    add a
    inc sp
    inc sp
    add a
    rst $38
    add a
    inc sp
    inc sp
    add e
    di
    inc sp
    add a
    nop
    and b
    sub e
    ld [$ffff], sp
    sbc a
    sbc a
    rst $38
    sbc a
    sbc a
    rst $38
    nop
    db $10
    sub h
    ld b, d
    rst $38
    rst $08
    or a
    ld a, e
    ld a, e
    inc bc
    ld a, e
    ld a, e
    rst $38
    rlca
    ld a, e
    ld a, e
    rlca
    ld a, e
    ld a, e
    rlca
    rst $38
    jp Jump_007_7fbf


    ld a, a
    ld a, a
    cp a
    jp $0fff


    ld [hl], a
    ld a, e
    ld a, e
    ld a, e
    ld [hl], a
    rrca
    rst $38
    inc bc
    ld a, a
    ld a, a
    inc bc
    ld a, a
    ld a, a
    inc bc
    rst $38
    inc bc
    ld a, a
    ld a, a
    inc bc
    ld a, a
    ld a, a
    ld a, a
    rst $38
    add e
    ld a, a
    ld a, a
    ld b, e
    ld a, e
    ld a, e
    add a
    rst $38
    ld a, e
    ld a, e
    ld a, e
    inc bc
    ld a, e
    ld a, e
    ld a, e
    rst $38
    add e
    ei
    rst $28
    ld [bc], a
    add e
    rst $38
    ld a, [$0afb]
    rlca
    rst $38
    ld a, e
    ld [hl], a
    ld l, a
    ld e, a
    rra
    ld l, a
    ld [hl], e
    rst $38
    ld a, [$137f]
    inc bc
    rst $38
    ld a, e
    inc sp
    ld c, e
    ld a, e
    ld a, e
    ld a, e
    ld a, e
    rst $38
    ld a, e
    dec sp
    ld e, e
    ld l, e
    ld [hl], e
    ld a, e
    ld a, e
    rst $38
    add a
    ei
    ld a, e
    inc hl
    add a
    rst $38
    rlca
    ld a, e
    ld a, e
    rlca
    ld a, a
    ld a, a
    ld a, a
    rst $38
    add a
    ld a, e
    ld a, e
    ld a, e
    ld e, e
    ld h, a
    sub e
    rst $38
    rlca
    ld a, e
    ld a, e
    rlca
    ld l, a
    ld [hl], a
    ld a, e
    rst $38
    add e
    ld a, a
    ld a, a
    add a
    ei
    ld a, e
    add a
    rst $38
    ld bc, $effa
    ld bc, $faff
    ld a, e
    ld [bc], a
    add a
    rst $38
    ei
    ld a, e
    ld [hl+], a
    or a
    rst $08
    rst $38
    ld a, e
    ld a, e
    ld a, e
    ld a, e
    ld c, e
    inc sp
    ld a, e
    rst $38
    ld a, e
    ld a, e
    or a
    rst $08
    or a
    ld a, e
    ld a, e
    rst $38
    cp e
    cp e
    cp e
    rst $10
    rst $28
    rst $28
    rst $28
    rst $38
    inc bc
    ei
    rst $30
    rst $28
    rst $18
    cp a
    inc bc
    nop
    nop
    nop
    ld c, e
    ld b, l
    ld d, d
    ld c, [hl]
    ld b, l
    ld c, h
    jr nz, jr_007_4342

    ld b, c
    ld c, [hl]
    ld c, c
    ld b, e
    jr nz, jr_007_4348

    ld c, h
    ld b, l
    ld b, c
    ld d, e
    ld b, l
    ld d, e
    ld b, l
    ld c, [hl]
    ld b, h
    jr nz, jr_007_4344

    jr nz, jr_007_4348

    ld c, h
    ld b, l
    ld b, c
    ld d, d
    jr nz, jr_007_435b

    ld c, c
    ld b, e
    jr nz, jr_007_435e

    ld b, [hl]
    ld d, h
    ld c, b
    ld c, c
    ld d, e
    jr nz, jr_007_4369

    ld b, e
    ld d, d
    ld b, l
    ld b, l
    ld c, [hl]
    jr nz, jr_007_4371

    ld c, a
    jr nz, jr_007_4364

    ld b, l
    ld d, [hl]
    ld d, e
    jr nz, jr_007_4366

    ld b, [hl]
    ld a, [hl-]
    jr nz, @+$22

    ld c, l
    ld c, a
    ld b, h
    ld b, l
    ld c, h
    ld a, [hl-]
    jr nz, jr_007_4373

    ld b, e
    ld a, [hl-]
    jr nz, jr_007_4355

    jr nz, @+$46

    ld b, l
    ld a, [hl-]
    jr nz, jr_007_4383

    ld c, h
    ld a, [hl-]
    jr nz, jr_007_435f

    ld d, [hl]
    ld c, c
    ld b, l

jr_007_4342:
    ld d, a
    ld a, [hl-]

jr_007_4344:
    jr nz, @+$55

    ld d, b
    ld a, [hl-]

jr_007_4348:
    jr nz, jr_007_4396

    ld b, e
    ld b, h
    ld b, e
    ld a, [hl-]
    jr nz, jr_007_439b

    ld sp, $203a
    ld c, c
    ld b, l

jr_007_4355:
    ld a, [hl-]
    jr nz, jr_007_4378

    ld b, d
    ld b, c
    ld c, [hl]

jr_007_435b:
    ld c, e
    ld a, [hl-]
    ld d, d

jr_007_435e:
    sub b

jr_007_435f:
    rst $38

jr_007_4360:
    ld d, [hl]
    cp e
    sbc l
    ld d, a

jr_007_4364:
    ld [hl], b
    rst $38

jr_007_4366:
    db $20

    INCLUDE "src/engine/fade_manager.asm"

    INCLUDE "src/engine/sgb_border.asm"

_func_bank007_4754:
    add sp, -$06
    ld hl, sp+$0c
    ld a, [hl]
    ld hl, sp+$00
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    ld [hl], a
    pop de
    push de
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld hl, sp+$0e
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_007_4792

    pop de
    push de
    ld hl, $0008
    add hl, de
    push hl
    ld a, l
    ld hl, sp+$06
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$05
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    add hl, bc
    jr jr_007_4796

jr_007_4792:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_007_4796:
    ld c, l
    ld b, h
    ld hl, _camera_settings
    ld a, [hl]
    and $fc
    ld [hl], a
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld a, [_camera_x]
    ld hl, sp+$02
    sub [hl]
    jr nz, jr_007_47e1

    ld a, [$c51b]
    ld hl, sp+$03
    sub [hl]
    jr nz, jr_007_47e1

    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$04
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, [_camera_y]
    ld hl, sp+$04
    sub [hl]
    jr nz, jr_007_47e1

    ld a, [$c51d]
    ld hl, sp+$05
    sub [hl]
    jr nz, jr_007_47e1

    ld hl, sp+$11
    ld a, [hl]
    and $03
    ld hl, _camera_settings
    ld c, [hl]
    or c
    ld [hl], a
    jp Jump_007_48a4


jr_007_47e1:
    ld a, [$da1f]
    ld hl, sp+$10
    and [hl]
    jp nz, Jump_007_4890

    ld hl, sp+$02
    ld e, l
    ld d, h
    ld hl, _camera_x
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4804

    bit 7, d
    jr nz, jr_007_4809

    cp a
    jr jr_007_4809

jr_007_4804:
    bit 7, d
    jr z, jr_007_4809

    scf

jr_007_4809:
    jr nc, jr_007_4818

    ld hl, _camera_x
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_007_483f

jr_007_4818:
    ld de, _camera_x
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    ld a, [de]
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4830

    bit 7, d
    jr nz, jr_007_4835

    cp a
    jr jr_007_4835

jr_007_4830:
    bit 7, d
    jr z, jr_007_4835

    scf

jr_007_4835:
    jr nc, jr_007_483f

    ld hl, _camera_x
    inc [hl]
    jr nz, jr_007_483f

    inc hl
    inc [hl]

jr_007_483f:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, _camera_y
    ld a, c
    sub [hl]
    inc hl
    ld a, b
    sbc [hl]
    ld a, b
    ld d, a
    bit 7, [hl]
    jr z, jr_007_4859

    bit 7, d
    jr nz, jr_007_485e

    cp a
    jr jr_007_485e

jr_007_4859:
    bit 7, d
    jr z, jr_007_485e

    scf

jr_007_485e:
    jr nc, jr_007_486d

    ld hl, _camera_y
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    dec de
    ld a, e
    ld [hl+], a
    ld [hl], d
    jr jr_007_4890

jr_007_486d:
    ld hl, _camera_y
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    ld d, [hl]
    ld a, b
    bit 7, a
    jr z, jr_007_4881

    bit 7, d
    jr nz, jr_007_4886

    cp a
    jr jr_007_4886

jr_007_4881:
    bit 7, d
    jr z, jr_007_4886

    scf

jr_007_4886:
    jr nc, jr_007_4890

    ld hl, _camera_y
    inc [hl]
    jr nz, jr_007_4890

    inc hl
    inc [hl]

Jump_007_4890:
jr_007_4890:
    pop de
    push de
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, c
    add $fb
    ld c, a
    ld a, b
    adc $ff
    ld b, a
    pop hl
    push hl
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_007_48a4:
    add sp, $06
    ret


    ld hl, sp+$08
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    sla c
    rl b
    bit 7, [hl]
    jr z, jr_007_48c3

    ld hl, sp+$06
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    jr jr_007_48c7

jr_007_48c3:
    ld hl, _SCRIPT_MEMORY
    add hl, bc

jr_007_48c7:
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, _camera_x
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, _camera_y
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, _camera_settings
    ld a, [hl]
    and $fc
    ld [hl], a
    ld e, $05
    ld hl, $40ca
    jp RST_08


    add sp, -$07
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr z, jr_007_490d

    dec hl
    dec hl
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, $c0a3
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a

jr_007_490d:
    ld a, [$c0a3]
    ld hl, sp+$02
    ld [hl], a
    ld a, [$c0a4]
    ld hl, sp+$03
    ld [hl], a
    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$0e
    ld a, [hl]
    ld hl, sp+$05
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, [hl+]
    ld c, a
    ld h, [hl]
    ld l, c
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld hl, sp+$02
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    dec hl
    ld d, a
    ld a, e
    sub c
    ld e, a
    ld a, d
    sbc b
    ld [hl-], a
    ld [hl], e
    ld hl, sp+$10
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, sp+$02
    ld a, [de]
    inc de
    sub [hl]
    inc hl
    ld a, [de]
    sbc [hl]
    jr nc, jr_007_49d7

    inc bc
    inc bc
    ld l, c
    ld h, b
    inc hl
    ld a, [hl-]
    bit 0, [hl]
    jr z, jr_007_4997

    push bc
    call _randw
    ld a, e
    pop bc
    and $0f
    ld hl, sp+$06
    ld [hl], a
    ld e, [hl]
    ld a, $0a
    ld d, a
    sub [hl]
    bit 7, e
    jr z, jr_007_4982

    bit 7, d
    jr nz, jr_007_4987

    cp a
    jr jr_007_4987

jr_007_4982:
    bit 7, d
    jr z, jr_007_4987

    scf

jr_007_4987:
    jr nc, jr_007_498f

    ld hl, sp+$06
    ld a, [hl]
    add $f6
    ld [hl], a

jr_007_498f:
    ld hl, sp+$06
    ld a, [hl]
    add $fb
    ld [$c7e0], a

jr_007_4997:
    ld l, c
    ld h, b
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    bit 1, c
    jr z, jr_007_49c8

    call _randw
    ld a, e
    and $0f
    ld c, a
    ld e, c
    ld a, $0a
    ld d, a
    sub c
    bit 7, e
    jr z, jr_007_49b7

    bit 7, d
    jr nz, jr_007_49bc

    cp a
    jr jr_007_49bc

jr_007_49b7:
    bit 7, d
    jr z, jr_007_49bc

    scf

jr_007_49bc:
    jr nc, jr_007_49c2

    ld a, c
    add $f6
    ld c, a

jr_007_49c2:
    ld a, c
    add $fb
    ld [$c7e1], a

jr_007_49c8:
    ld hl, sp+$04
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], $01
    ld e, $00
    jr jr_007_49e3

jr_007_49d7:
    ld hl, $c7e1
    ld [hl], $00
    ld hl, $c7e0
    ld [hl], $00
    ld e, $01

jr_007_49e3:
    add sp, $07
    ret

KirbyDialogue::    ; bank 7 0x49e6
    INCLUDE "src/scripts/jrinside/kirby.asm"

DanteDialogue::    ; 0x4ba4
    INCLUDE "src/scripts/graveyard/dante.asm"

HeihachiDialogue::    ; bank 7: 0x4dec
    INCLUDE "src/scripts/graveyard/heihachi.asm"

SnakeDialogue::    ; bank 7 0x5005
    INCLUDE "src/scripts/ngheadquarters/snake.asm"

RandyDialogue:: ; 0x52d2
    INCLUDE "src/scripts/randy.asm"

DanDialogueJTHouseInside:: ; 0x55d3
    INCLUDE "src/scripts/jthouse/dan_jthouseinside.asm"

SamusDialogue:: ; 0x56e0
    INCLUDE "src/scripts/samus.asm"

GraveyardTilemap:: ; 0x58ea
    db $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $04, $05, $06, $07
    db $08, $09, $0a, $0b, $08, $09, $0a, $0b, $08, $09, $0a, $0b, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
    db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $17, $1a, $10, $11, $12, $13, $1b, $1c, $1d, $1e
    db $1f, $20, $08, $21, $22, $23, $24, $25, $26, $27, $25, $28, $1f, $20, $08, $21, $29, $2a, $2b, $2c
    db $12, $13, $14, $15, $2d, $2e, $24, $25, $25, $25, $25, $28, $2f, $30, $14, $15, $31, $32, $33, $34
    db $08, $21, $22, $23, $35, $36, $37, $38, $38, $38, $38, $39, $3a, $3b, $22, $23, $3c, $25, $25, $3d
    db $14, $15, $2d, $2e, $2d, $2e, $3e, $3f, $40, $41, $3e, $3f, $02, $03, $00, $01, $42, $25, $25, $43
    db $22, $23, $35, $36, $35, $36, $44, $45, $46, $47, $44, $45, $0a, $0b, $08, $09, $48, $49, $4a, $4b
    db $2d, $2e, $4c, $4d, $2d, $2e, $4e, $4f, $4f, $4f, $4f, $50, $2f, $30, $14, $15, $51, $52, $53, $54
    db $35, $36, $55, $56, $35, $36, $57, $25, $58, $25, $58, $59, $3a, $3b, $22, $23, $5a, $5b, $5c, $5d
    db $2d, $2e, $5e, $5f, $2d, $2e, $57, $60, $25, $60, $25, $60, $4f, $4f, $61, $61, $62, $63, $64, $65
    db $35, $36, $66, $67, $35, $36, $57, $25, $58, $25, $58, $25, $58, $25, $61, $61, $68, $69, $6a, $6b
    db $6c, $6d, $2d, $2e, $2d, $2e, $57, $60, $25, $60, $4c, $4d, $25, $60, $25, $60, $6e, $6f, $70, $71
    db $72, $73, $35, $36, $35, $36, $57, $25, $58, $25, $55, $56, $58, $25, $58, $25, $74, $75, $76, $77
    db $4c, $4d, $4f, $4f, $4f, $4f, $4c, $4d, $25, $60, $5e, $5f, $25, $60, $4c, $4d, $78, $79, $7a, $7b
    db $55, $56, $58, $25, $58, $25, $55, $56, $58, $25, $66, $67, $58, $25, $55, $56, $7c, $7d, $7e, $7f
    db $25, $60, $4c, $4d, $6c, $6d, $25, $60, $6c, $6d, $6c, $6d, $6c, $6d, $b4, $b5, $b6, $b7, $b8, $b9
    db $58, $25, $55, $56, $72, $73, $58, $25, $72, $73, $72, $73, $72, $73, $ba, $bb, $bc, $bd, $be, $bf

GraveyardSceneInit:: ; 0x5a52
    db $25, $12, $04

    db $1a, $00, $5a, $61, $00, $04, $00, $00, $05, $09, $5a, $69, $14, $00, $03, $ff, $fc, $33, $ff, $fc
    db $14, $00, $04, $ff, $fc, $3f, $08, $00, $ff, $fc
    db $1a, $00, $5a, $7f, $00, $0b, $00, $00, $05, $09, $5a, $87, $14, $00, $04, $ff, $fc, $33, $ff, $fc
    db $14, $00, $05, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5a, $a0, $00, $00, $00, $00, $01, $09, $5a, $ad, $14, $00, $06, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5a, $b9, $00, $01, $00, $00, $01, $09, $5a, $c6, $14, $00, $06, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5a, $d2, $00, $02, $00, $00, $01, $09, $5a, $df, $14, $00, $06, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5a, $eb, $00, $03, $00, $00, $01, $09, $5a, $f8, $14, $00, $06, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $04, $00, $04, $00, $00, $01, $09, $5b, $11, $14, $00, $06, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $1d, $00, $05, $00, $00, $01, $09, $5b, $2a, $14, $00, $06, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $36, $00, $06, $00, $00, $01, $09, $5b, $43, $14, $00, $06, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $4f, $00, $07, $00, $00, $01, $09, $5b, $5c, $14, $00, $06, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $68, $00, $08, $00, $00, $01, $09, $5b, $75, $14, $00, $06, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $81, $00, $09, $00, $00, $01, $09, $5b, $8e, $14, $00, $06, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $9a, $00, $0a, $00, $00, $01, $09, $5b, $a7, $14, $00, $06, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $b3, $00, $0b, $00, $00, $01, $09, $5b, $c0, $14, $00, $06, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $cc, $00, $0c, $00, $00, $01, $09, $5b, $d9, $14, $00, $06, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5b, $e5, $00, $0d, $00, $00, $05, $09, $5b, $f2, $14, $00, $06, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $00

GraveyardSprites:: ; bank 7 0x5c05
    db $09, $0e, $6f
    db $0a, $9b, $45
    db $09, $fc, $73
    db $09, $a9, $72
    db $08, $29, $7d

PCWorldSceneInit:: ; 0x5c14
    db $25
    db $12, $04
    db $14, $00, $04, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $30, $00, $00, $00, $00, $01, $09, $5c, $3d, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $49, $00, $01, $00, $00, $01, $09, $5c, $56, $14, $00, $05, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $62, $00, $02, $00, $00, $01, $09, $5c, $6f, $14, $00, $05, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $7b, $00, $03, $00, $00, $01, $09, $5c, $88, $14, $00, $05, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $94, $00, $04, $00, $00, $01, $09, $5c, $a1, $14, $00, $05, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $ad, $00, $05, $00, $00, $01, $09, $5c, $ba, $14, $00, $05, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $c6, $00, $06, $00, $00, $01, $09, $5c, $d3, $14, $00, $05, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $df, $00, $07, $00, $00, $01, $09, $5c, $ec, $14, $00, $05, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5c, $f8, $00, $08, $00, $00, $01, $09, $5d, $05, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $11, $00, $09, $00, $00, $01, $09, $5d, $1e, $14, $00, $05, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $2a, $00, $0a, $00, $00, $01, $09, $5d, $37, $14, $00, $05, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $43, $00, $0b, $00, $00, $01, $09, $5d, $50, $14, $00, $05, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $5c, $00, $0c, $00, $00, $01, $09, $5d, $69, $14, $00, $05, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $75, $00, $0d, $00, $00, $05, $09, $5d, $82, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03

    db $00

McdonaldsSceneInit:: ; 0x5d95
    db $25
    db $12, $04
    db $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $b1, $00, $00, $00, $00, $01, $09, $5d, $be, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $ca, $00, $01, $00, $00, $01, $09, $5d, $d7, $14, $00, $04, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $e3, $00, $02, $00, $00, $01, $09, $5d, $f0, $14, $00, $04, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5d, $fc, $00, $03, $00, $00, $01, $09, $5e, $09, $14, $00, $04, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $15, $00, $04, $00, $00, $01, $09, $5e, $22, $14, $00, $04, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $2e, $00, $05, $00, $00, $01, $09, $5e, $3b, $14, $00, $04, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $47, $00, $06, $00, $00, $01, $09, $5e, $54, $14, $00, $04, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $60, $00, $07, $00, $00, $01, $09, $5e, $6d, $14, $00, $04, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $79, $00, $08, $00, $00, $01, $09, $5e, $86, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $92, $00, $09, $00, $00, $01, $09, $5e, $9f, $14, $00, $04, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $ab, $00, $0a, $00, $00, $01, $09, $5e, $b8, $14, $00, $04, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $c4, $00, $0b, $00, $00, $01, $09, $5e, $d1, $14, $00, $04, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $dd, $00, $0c, $00, $00, $01, $09, $5e, $ea, $14, $00, $04, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5e, $f6, $00, $0d, $00, $00, $05, $09, $5f, $03, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03

    db $00

JRInsideSceneInit:: ; 0x5f16
    db $25
    db $12, $04
    db $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $32, $00, $00, $00, $00, $01, $09, $5f, $3f, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $4b, $00, $01, $00, $00, $01, $09, $5f, $58, $14, $00, $04, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $64, $00, $02, $00, $00, $01, $09, $5f, $71, $14, $00, $04, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $7d, $00, $03, $00, $00, $01, $09, $5f, $8a, $14, $00, $04, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $96, $00, $04, $00, $00, $01, $09, $5f, $a3, $14, $00, $04, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $af, $00, $05, $00, $00, $01, $09, $5f, $bc, $14, $00, $04, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $c8, $00, $06, $00, $00, $01, $09, $5f, $d5, $14, $00, $04, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $e1, $00, $07, $00, $00, $01, $09, $5f, $ee, $14, $00, $04, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $5f, $fa, $00, $08, $00, $00, $01, $09, $60, $07, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $13, $00, $09, $00, $00, $01, $09, $60, $20, $14, $00, $04, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $2c, $00, $0a, $00, $00, $01, $09, $60, $39, $14, $00, $04, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $45, $00, $0b, $00, $00, $01, $09, $60, $52, $14, $00, $04, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $5e, $00, $0c, $00, $00, $01, $09, $60, $6b, $14, $00, $04, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $77, $00, $0d, $00, $00, $05, $09, $60, $84, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03

    db $00

JTHouseInsideSceneInit:: ; 0x6097
    db $25
    db $12, $04
    db $14, $00, $04, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $b3, $00, $00, $00, $00, $01, $09, $60, $c0, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $cc, $00, $01, $00, $00, $01, $09, $60, $d9, $14, $00, $05, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $e5, $00, $02, $00, $00, $01, $09, $60, $f2, $14, $00, $05, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $60, $fe, $00, $03, $00, $00, $01, $09, $61, $0b, $14, $00, $05, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $17, $00, $04, $00, $00, $01, $09, $61, $24, $14, $00, $05, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $30, $00, $05, $00, $00, $01, $09, $61, $3d, $14, $00, $05, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $49, $00, $06, $00, $00, $01, $09, $61, $56, $14, $00, $05, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $62, $00, $07, $00, $00, $01, $09, $61, $6f, $14, $00, $05, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $7b, $00, $08, $00, $00, $01, $09, $61, $88, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $94, $00, $09, $00, $00, $01, $09, $61, $a1, $14, $00, $05, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $ad, $00, $0a, $00, $00, $01, $09, $61, $ba, $14, $00, $05, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $c6, $00, $0b, $00, $00, $01, $09, $61, $d3, $14, $00, $05, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $df, $00, $0c, $00, $00, $01, $09, $61, $ec, $14, $00, $05, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $61, $f8, $00, $0d, $00, $00, $05, $09, $62, $05, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03

    db $00

DimHouseInsideSceneInit:: ; 0x6218
    db $25
    db $12, $04
    db $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $34, $00, $00, $00, $00, $01, $09, $62, $41, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $4d, $00, $01, $00, $00, $01, $09, $62, $5a, $14, $00, $03, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $66, $00, $02, $00, $00, $01, $09, $62, $73, $14, $00, $03, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $7f, $00, $03, $00, $00, $01, $09, $62, $8c, $14, $00, $03, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $98, $00, $04, $00, $00, $01, $09, $62, $a5, $14, $00, $03, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $b1, $00, $05, $00, $00, $01, $09, $62, $be, $14, $00, $03, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $ca, $00, $06, $00, $00, $01, $09, $62, $d7, $14, $00, $03, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $e3, $00, $07, $00, $00, $01, $09, $62, $f0, $14, $00, $03, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $62, $fc, $00, $08, $00, $00, $01, $09, $63, $09, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $15, $00, $09, $00, $00, $01, $09, $63, $22, $14, $00, $03, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $2e, $00, $0a, $00, $00, $01, $09, $63, $3b, $14, $00, $03, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $47, $00, $0b, $00, $00, $01, $09, $63, $54, $14, $00, $03, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $60, $00, $0c, $00, $00, $01, $09, $63, $6d, $14, $00, $03, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $79, $00, $0d, $00, $00, $05, $09, $63, $86, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03

    db $00

TempleLightOutsideSceneInit:: ; 0x6399
    db $25, $12, $04, $14, $00, $01, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $b5, $00, $00, $00, $00, $01, $09, $63, $c2, $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $ce, $00, $01, $00, $00, $01, $09, $63, $db, $14, $00, $02, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $63, $e7, $00, $02, $00, $00, $01, $09, $63, $f4, $14, $00, $02, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $00, $00, $03, $00, $00, $01, $09, $64, $0d, $14, $00, $02, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $19, $00, $04, $00, $00, $01, $09, $64, $26, $14, $00, $02, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $32, $00, $05, $00, $00, $01, $09, $64, $3f, $14, $00, $02, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $4b, $00, $06, $00, $00, $01, $09, $64, $58, $14, $00, $02, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $64, $00, $07, $00, $00, $01, $09, $64, $71, $14, $00, $02, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $7d, $00, $08, $00, $00, $01, $09, $64, $8a, $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $96, $00, $09, $00, $00, $01, $09, $64, $a3, $14, $00, $02, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $af, $00, $0a, $00, $00, $01, $09, $64, $bc, $14, $00, $02, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $c8, $00, $0b, $00, $00, $01, $09, $64, $d5, $14, $00, $02, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $e1, $00, $0c, $00, $00, $01, $09, $64, $ee, $14, $00, $02, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $64, $fa, $00, $0d, $00, $00, $05, $09, $65, $07, $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03

    db $00

JTHouseOutsideSceneInit:: ; 0x651a
    db $25, $12, $04

    db $1a, $00, $65, $29, $00, $08, $00, $00, $05, $09, $65, $45, $14, $00, $01, $ff, $fc
    db $14, $01, $00, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc
    db $14, $00, $01, $ff, $fc, $84, $00, $03, $ff, $fc
    db $1a, $00, $65, $51, $00, $05, $00, $00, $02, $09, $65, $59, $14, $00, $02, $ff, $fc, $33, $ff, $fc
    db $1a, $00, $65, $65, $00, $08, $00, $00, $05, $09, $65, $6d, $14, $00, $02, $ff, $fc, $33, $ff, $fc
    db $14, $00, $03, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $65, $86, $00, $00, $00, $00, $01, $09, $65, $93, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $65, $9f, $00, $01, $00, $00, $01, $09, $65, $ac, $14, $00, $04, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $65, $b8, $00, $02, $00, $00, $01, $09, $65, $c5, $14, $00, $04, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $65, $d1, $00, $03, $00, $00, $01, $09, $65, $de, $14, $00, $04, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $65, $ea, $00, $04, $00, $00, $01, $09, $65, $f7, $14, $00, $04, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $03, $00, $05, $00, $00, $01, $09, $66, $10, $14, $00, $04, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $1c, $00, $06, $00, $00, $01, $09, $66, $29, $14, $00, $04, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $35, $00, $07, $00, $00, $01, $09, $66, $42, $14, $00, $04, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $4e, $00, $08, $00, $00, $01, $09, $66, $5b, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $67, $00, $09, $00, $00, $01, $09, $66, $74, $14, $00, $04, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $80, $00, $0a, $00, $00, $01, $09, $66, $8d, $14, $00, $04, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $99, $00, $0b, $00, $00, $01, $09, $66, $a6, $14, $00, $04, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $b2, $00, $0c, $00, $00, $01, $09, $66, $bf, $14, $00, $04, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $66, $cb, $00, $0d, $00, $00, $05, $09, $66, $d8, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $00

WellSceneInit:: ; 0x66eb
    db $25
    db $12, $04
    db $1a, $00, $66, $fa, $00, $01, $00, $00, $02
    db $09, $67, $02
    db $14, $00, $04, $ff, $fc
    db $33, $ff, $fc
    db $1a, $00, $67, $0e, $00, $05, $00, $00, $05
    db $09, $67, $16
    db $14, $00, $04, $ff, $fc
    db $33, $ff, $fc
    db $14, $00, $05, $ff, $fc
    db $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $67, $2f, $00, $00, $00, $00, $01
    db $09, $67, $3c
    db $14, $00, $06, $ff, $fc
    db $14, $00, $00, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $67, $48, $00, $01, $00, $00, $01
    db $09, $67, $55
    db $14, $00, $06, $ff, $fc
    db $14, $00, $01, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $67, $61, $00, $02, $00, $00, $01
    db $09, $67, $6e
    db $14, $00, $06, $ff, $fc
    db $14, $00, $02, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $67, $7a, $00, $03, $00, $00, $01
    db $09, $67, $87
    db $14, $00, $06, $ff, $fc
    db $14, $00, $03, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $67, $93, $00, $04, $00, $00, $01
    db $09, $67, $a0
    db $14, $00, $06, $ff, $fc
    db $14, $00, $04, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $67, $ac, $00, $05, $00, $00, $01, $09, $67, $b9, $14, $00, $06, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $67, $c5, $00, $06, $00, $00, $01, $09, $67, $d2, $14, $00, $06, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $67, $de, $00, $07, $00, $00, $01, $09, $67, $eb, $14, $00, $06, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $67, $f7, $00, $08, $00, $00, $01, $09, $68, $04, $14, $00, $06, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $10, $00, $09, $00, $00, $01, $09, $68, $1d, $14, $00, $06, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $29, $00, $0a, $00, $00, $01, $09, $68, $36, $14, $00, $06, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $42, $00, $0b, $00, $00, $01, $09, $68, $4f, $14, $00, $06, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $5b, $00, $0c, $00, $00, $01, $09, $68, $68, $14, $00, $06, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $74, $00, $0d, $00, $00, $05, $09, $68, $81, $14, $00, $06, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc

    db $60, $00, $7f, $cc, $03 ; bank 3 0x7fcc exploration music

    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $00

DimHouseOutsideSceneInit:: ; 0x6899
    db $25
    db $12, $04
    db $14, $00, $01, $ff, $fc
    db $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $68, $b5, $00, $00, $00, $00, $01, $09, $68, $c2, $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $ce, $00, $01, $00, $00, $01, $09, $68, $db, $14, $00, $02, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $68, $e7, $00, $02, $00, $00, $01, $09, $68, $f4, $14, $00, $02, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $00, $00, $03, $00, $00, $01, $09, $69, $0d, $14, $00, $02, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $19, $00, $04, $00, $00, $01, $09, $69, $26, $14, $00, $02, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $32, $00, $05, $00, $00, $01, $09, $69, $3f, $14, $00, $02, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $4b, $00, $06, $00, $00, $01, $09, $69, $58, $14, $00, $02, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $64, $00, $07, $00, $00, $01, $09, $69, $71, $14, $00, $02, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $7d, $00, $08, $00, $00, $01, $09, $69, $8a, $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $96, $00, $09, $00, $00, $01, $09, $69, $a3, $14, $00, $02, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $af, $00, $0a, $00, $00, $01, $09, $69, $bc, $14, $00, $02, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $c8, $00, $0b, $00, $00, $01, $09, $69, $d5, $14, $00, $02, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $e1, $00, $0c, $00, $00, $01, $09, $69, $ee, $14, $00, $02, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $69, $fa, $00, $0d, $00, $00, $05, $09, $6a, $07, $14, $00, $02, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc
    db $0d, $ff, $fc, $00, $55, $af, $02
    db $21, $01, $c6, $0d
    db $57, $03, $00

NgHeadquartersOutsideSceneInit:: ; 0x6a1a
    db $25
    db $12, $04
    db $14, $00, $02, $ff, $fc
    db $14, $00, $0c, $ff, $fd
    db $75, $ff, $fc
    db $1a, $00, $6a, $36, $00, $00, $00, $00, $01, $09, $6a, $43, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $4f, $00, $01, $00, $00, $01, $09, $6a, $5c, $14, $00, $03, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $68, $00, $02, $00, $00, $01, $09, $6a, $75, $14, $00, $03, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $81, $00, $03, $00, $00, $01, $09, $6a, $8e, $14, $00, $03, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $9a, $00, $04, $00, $00, $01, $09, $6a, $a7, $14, $00, $03, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $b3, $00, $05, $00, $00, $01, $09, $6a, $c0, $14, $00, $03, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $cc, $00, $06, $00, $00, $01, $09, $6a, $d9, $14, $00, $03, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $e5, $00, $07, $00, $00, $01, $09, $6a, $f2, $14, $00, $03, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6a, $fe, $00, $08, $00, $00, $01, $09, $6b, $0b, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6b, $17, $00, $09, $00, $00, $01, $09, $6b, $24, $14, $00, $03, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6b, $30, $00, $0a, $00, $00, $01, $09, $6b, $3d, $14, $00, $03, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6b, $49, $00, $0b, $00, $00, $01, $09, $6b, $56, $14, $00, $03, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6b, $62, $00, $0c, $00, $00, $01, $09, $6b, $6f, $14, $00, $03, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6b, $7b, $00, $0d, $00, $00, $05, $09, $6b, $88, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc
    db $0d, $ff, $fc, $00, $55, $af, $02
    db $21, $01, $c6, $0d
    db $57, $03, $00

OutsideShopDialogue:: ; 0x6b9b
    db $20, $00, $07, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $f3, $71 ; points to bank 9: 0x71f3 flower
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $00, $02, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $0a, $9b, $45
    db $0a, $dd, $40 ; bank 0a 0x40dd sign outside of PC World

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $00, $02, $00, $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $5b, $6c ; points to bank 9: 0x6c5b alex labbe
    db $09, $52, $4c ; points to bank 9: 0x4c52 dialogue

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $00, $05, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $1f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $76, $72 ; points to bank 9: 0x7276 gerkinman
    db $09, $f1, $4c ; points to bank 9: 0x4cf1 dialogue

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $00, $06, $80, $06, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $7f, $74 ; points to bank 9: 0x747f jasper
    db $0a, $0d, $41 ; points to bank 0a: 0x410d dialogue

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $00, $06, $00, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $48, $76 ; points to bank 9: 0x7648 john
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $00, $00, $80, $04, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $0f, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $09, $f3, $71 ; points to bank 9: 0x71f3 flower
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $80, $08, $00, $03, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $08, $29, $7d ; points to bank 8: 0x7d29 items
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

    db $20, $80, $08, $00, $05, $00, $00, $0f, $f8, $07, $00, $00, $00, $00, $ff, $10
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

    db $08, $29, $7d ; points to bank 8: 0x7d29 items
    db $00, $00, $00

    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

OutsideShopSceneInit:: ; 0x6d6f
    db $25, $12, $05, $14, $00, $01, $ff, $fc, $3f, $08, $00, $ff, $fc, $14, $00, $06
    db $ff, $fc, $33, $ff, $fc, $14, $00, $01, $ff, $fb, $0d, $ff, $fb, $00, $55, $af
    db $02, $21, $01, $c6, $0d, $57, $03, $1a, $00, $6d, $a2, $00, $01, $00, $00, $01
    db $09, $6d, $e2, $1a, $00, $6d, $b6, $00, $00, $00, $01, $01, $14, $00, $06, $ff
    db $fc, $33, $ff, $fc, $09, $6d, $e2, $14, $00, $06, $ff, $fc, $31, $ff, $fc, $14
    db $00, $06, $ff, $fc, $14, $07, $80, $ff, $fd, $14, $06, $00, $ff, $fe, $14, $00
    db $00, $ff, $ff, $30, $ff, $fc, $14, $00, $01, $00, $01, $14, $00, $06, $ff, $fc
    db $33, $ff, $fc, $14, $00, $07, $ff, $fc, $3f, $08, $00, $ff, $fc, $14, $00, $08
    db $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $05, $00, $00
    db $00, $00, $01, $09, $6e, $12, $14, $00, $09, $ff, $fc, $14, $00, $00, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $6e, $1e, $00, $01, $00, $00, $01, $09, $6e, $2b, $14
    db $00, $09, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $37
    db $00, $02, $00, $00, $01, $09, $6e, $44, $14, $00, $09, $ff, $fc, $14, $00, $02
    db $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $50, $00, $03, $00, $00, $01, $09, $6e
    db $5d, $14, $00, $09, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc, $1a, $00
    db $6e, $69, $00, $04, $00, $00, $01, $09, $6e, $76, $14, $00, $09, $ff, $fc, $14
    db $00, $04, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $82, $00, $05, $00, $00, $01
    db $09, $6e, $8f, $14, $00, $09, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $6e, $9b, $00, $06, $00, $00, $01, $09, $6e, $a8, $14, $00, $09, $ff
    db $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $b4, $00, $07, $00
    db $00, $01, $09, $6e, $c1, $14, $00, $09, $ff, $fc, $14, $00, $07, $ff, $fd, $75
    db $ff, $fc, $1a, $00, $6e, $cd, $00, $08, $00, $00, $01, $09, $6e, $da, $14, $00
    db $09, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc, $1a, $00, $6e, $e6, $00
    db $09, $00, $00, $01, $09, $6e, $f3, $14, $00, $09, $ff, $fc, $14, $00, $08, $ff
    db $fd, $75, $ff, $fc, $1a, $00, $6e, $ff, $00, $0a, $00, $00, $01, $09, $6f, $0c
    db $14, $00, $09, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f
    db $18, $00, $0b, $00, $00, $01, $09, $6f, $25, $14, $00, $09, $ff, $fc, $14, $00
    db $0a, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f, $31, $00, $0c, $00, $00, $01, $09
    db $6f, $3e, $14, $00, $09, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc, $1a
    db $00, $6f, $4a, $00, $0d, $00, $00, $05, $09, $6f, $57, $14, $00, $09, $ff, $fc
    db $14, $00, $00, $ff, $fd, $75, $ff, $fc, $00

JROutsideSceneInit:: ; 0x6f58
    db $25, $12, $04
    db $1a, $00, $6f, $6f, $00, $01, $00, $00, $05, $14, $00, $03, $ff
    db $fc, $33, $ff, $fc, $09, $6f, $6f, $14, $00, $04, $ff, $fc, $14, $00, $0c, $ff
    db $fd, $75, $ff, $fc, $1a, $00, $6f, $88, $00, $00, $00, $00, $01, $09, $6f, $95
    db $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f
    db $a1, $00, $01, $00, $00, $01, $09, $6f, $ae, $14, $00, $05, $ff, $fc, $14, $00
    db $01, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f, $ba, $00, $02, $00, $00, $01, $09
    db $6f, $c7, $14, $00, $05, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc, $1a
    db $00, $6f, $d3, $00, $03, $00, $00, $01, $09, $6f, $e0, $14, $00, $05, $ff, $fc
    db $14, $00, $03, $ff, $fd, $75, $ff, $fc, $1a, $00, $6f, $ec, $00, $04, $00, $00
    db $01, $09, $6f, $f9, $14, $00, $05, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff
    db $fc, $1a, $00, $70, $05, $00, $05, $00, $00, $01, $09, $70, $12, $14, $00, $05
    db $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc, $1a, $00, $70, $1e, $00, $06
    db $00, $00, $01, $09, $70, $2b, $14, $00, $05, $ff, $fc, $14, $00, $06, $ff, $fd
    db $75, $ff, $fc, $1a, $00, $70, $37, $00, $07, $00, $00, $01, $09, $70, $44, $14
    db $00, $05, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc, $1a, $00, $70, $50
    db $00, $08, $00, $00, $01, $09, $70, $5d, $14, $00, $05, $ff, $fc, $14, $00, $00
    db $ff, $fd, $75, $ff, $fc, $1a, $00, $70, $69, $00, $09, $00, $00, $01, $09, $70
    db $76, $14, $00, $05, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc, $1a, $00
    db $70, $82, $00, $0a, $00, $00, $01, $09, $70, $8f, $14, $00, $05, $ff, $fc, $14
    db $00, $09, $ff, $fd, $75, $ff, $fc, $1a, $00, $70, $9b, $00, $0b, $00, $00, $01
    db $09, $70, $a8, $14, $00, $05, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $70, $b4, $00, $0c, $00, $00, $01, $09, $70, $c1, $14, $00, $05, $ff
    db $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc, $1a, $00, $70, $cd, $00, $0d, $00
    db $00, $05, $09, $70, $da, $14, $00, $05, $ff, $fc, $14, $00, $00, $ff, $fd, $75
    db $ff, $fc, $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01
    db $c6, $0d, $57, $03, $00

BridgeSceneInit:: ; 0x70ed 
    db $25, $12, $04
    db $1a, $00, $70, $fc, $00, $0d, $00, $00, $05, $09, $71, $04, $14, $00, $02, $ff, $fc, $33, $ff, $fc, $14, $00, $03, $ff, $fc
    db $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $1d, $00, $00, $00, $00, $01, $09, $71, $2a, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $36, $00, $01, $00, $00, $01, $09, $71, $43, $14, $00, $04, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $4f, $00, $02, $00, $00, $01, $09, $71, $5c, $14, $00, $04, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $68, $00, $03, $00, $00, $01, $09, $71, $75, $14, $00, $04, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $81, $00, $04, $00, $00, $01, $09, $71, $8e, $14, $00, $04, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $9a, $00, $05, $00, $00, $01, $09, $71, $a7, $14, $00, $04, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $b3, $00, $06, $00, $00, $01, $09, $71, $c0, $14, $00, $04, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $cc, $00, $07, $00, $00, $01, $09, $71, $d9, $14, $00, $04, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $e5, $00, $08, $00, $00, $01, $09, $71, $f2, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $71, $fe, $00, $09, $00, $00, $01, $09, $72, $0b, $14, $00, $04, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $17, $00, $0a, $00, $00, $01, $09, $72, $24, $14, $00, $04, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $30, $00, $0b, $00, $00, $01, $09, $72, $3d, $14, $00, $04, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $49, $00, $0c, $00, $00, $01, $09, $72, $56, $14, $00, $04, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $62, $00, $0d, $00, $00, $05, $09, $72, $6f, $14, $00, $04, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc
    db $0d, $ff, $fc, $00, $55, $af, $02
    db $21, $01, $c6, $0d
    db $57, $03, $00

NgHeadquartersInsideSceneInit:: ; 0x7282 
    db $25, $12, $04
    db $14, $00, $02, $ff, $fc, $14, $00, $0c, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $9e, $00, $00, $00, $00, $01, $09, $72, $ab, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $b7, $00, $01, $00, $00, $01, $09, $72, $c4, $14, $00, $03, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $d0, $00, $02, $00, $00, $01, $09, $72, $dd, $14, $00, $03, $ff, $fc, $14, $00, $02, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $72, $e9, $00, $03, $00, $00, $01, $09, $72, $f6, $14, $00, $03, $ff, $fc, $14, $00, $03, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $02, $00, $04, $00, $00, $01, $09, $73, $0f, $14, $00, $03, $ff, $fc, $14, $00, $04, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $1b, $00, $05, $00, $00, $01, $09, $73, $28, $14, $00, $03, $ff, $fc, $14, $00, $05, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $34, $00, $06, $00, $00, $01, $09, $73, $41, $14, $00, $03, $ff, $fc, $14, $00, $06, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $4d, $00, $07, $00, $00, $01, $09, $73, $5a, $14, $00, $03, $ff, $fc, $14, $00, $07, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $66, $00, $08, $00, $00, $01, $09, $73, $73, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $7f, $00, $09, $00, $00, $01, $09, $73, $8c, $14, $00, $03, $ff, $fc, $14, $00, $08, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $98, $00, $0a, $00, $00, $01, $09, $73, $a5, $14, $00, $03, $ff, $fc, $14, $00, $09, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $b1, $00, $0b, $00, $00, $01, $09, $73, $be, $14, $00, $03, $ff, $fc, $14, $00, $0a, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $ca, $00, $0c, $00, $00, $01, $09, $73, $d7, $14, $00, $03, $ff, $fc, $14, $00, $0b, $ff, $fd, $75, $ff, $fc
    db $1a, $00, $73, $e3, $00, $0d, $00, $00, $05, $09, $73, $f0, $14, $00, $03, $ff, $fc, $14, $00, $00, $ff, $fd, $75, $ff, $fc
    db $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21, $01, $c6, $0d, $57, $03, $00

GraveDiggingDialogue:: ; 0x7403
    INCLUDE "src/scripts/graveyard/gravedigging.asm"

ItemsSpriteImage:: ; 0x7719
    db $2c, $00
    INCBIN "gfx/bank007_items_771b.2bpp"

LinkSpriteImage:: ; 0x79db
    db $2c, $00
    INCBIN "gfx/bank007_link_79dd.2bpp"

_func_bank007_7c9d:
    ld hl, _camera_offset_x
    ld [hl], $00
    ld hl, _camera_offset_y
    ld [hl], $00
    ld hl, _camera_deadzone_x
    ld [hl], $18
    ld hl, _camera_deadzone_y
    ld [hl], $18
    ld hl, $c0be
    ld [hl], $01
    ld hl, $c0c9
    ld [hl], $00
    ld a, [$c0cc]
    ld b, a
    inc b
    ld a, [$c0cb]
    push bc
    inc sp
    push af
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, _actor_set_frames
    call RST_08
    add sp, $04
    ret

_func_bank007_:
    add sp, -$07
    ld hl, $c507
    ld [hl], $00
    ld hl, $c61b
    ld c, [hl]
    ld a, c
    and $04
    ld b, $00
    push af
    ld a, c
    and $08
    ld e, a
    ld d, $00
    pop af
    bit 1, c
    jr z, jr_007_7d0a

    ld hl, $c507
    ld [hl], $01
    or b
    jr z, jr_007_7cfe

    ld c, $e0
    jr jr_007_7d41

jr_007_7cfe:
    ld a, d
    or e
    jr z, jr_007_7d06

    ld c, $a0
    jr jr_007_7d41

jr_007_7d06:
    ld c, $c0
    jr jr_007_7d41

jr_007_7d0a:
    bit 0, c
    jr z, jr_007_7d26

    ld hl, $c507
    ld [hl], $01
    or b
    jr z, jr_007_7d1a

    ld c, $20
    jr jr_007_7d41

jr_007_7d1a:
    ld a, d
    or e
    jr z, jr_007_7d22

    ld c, $60
    jr jr_007_7d41

jr_007_7d22:
    ld c, $40
    jr jr_007_7d41

jr_007_7d26:
    or b
    jr z, jr_007_7d32

    ld hl, $c507
    ld [hl], $01
    ld c, $00
    jr jr_007_7d41

jr_007_7d32:
    ld a, d
    or e
    jr z, jr_007_7d3f

    ld hl, $c507
    ld [hl], $01
    ld c, $80
    jr jr_007_7d41

jr_007_7d3f:
    ld c, $00

jr_007_7d41:
    ld a, [$c507]
    or a
    jp z, Jump_007_7ec6

    ld hl, $c0c8
    ld b, [hl]
    ld de, $c0ba
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, $c4
    add c
    ld e, a
    ld a, $18
    adc $00
    ld d, a
    ld a, [de]
    push bc
    push bc
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop bc
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld e, l
    ld a, h
    ld hl, sp+$05
    ld [hl], e
    inc hl
    ld [hl-], a
    ld de, $c0ba
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld hl, $c0bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, c
    add $40
    add $c4
    ld e, a
    ld a, $00
    adc $18
    ld d, a
    ld a, [de]
    push hl
    push bc
    inc sp
    push af
    inc sp
    call _muluschar
    pop hl
    pop hl
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    sra d
    rr e
    ld a, l
    sub e
    ld c, a
    ld a, h
    sbc d
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, $c0ba
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0bf]
    ld hl, sp+$05
    ld [hl+], a
    rlca
    sbc a
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, c
    sub e
    ld e, a
    ld a, b
    sbc d
    ld d, a
    ld hl, $c534
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_007_7e27

    ld hl, sp+$05
    ld a, [hl+]
    ld b, [hl]
    add a
    rl b
    add a
    rl b
    add a
    rl b
    add a
    rl b
    ld hl, $c0ba
    ld [hl+], a
    ld [hl], b
    jr jr_007_7e52

jr_007_7e27:
    ld a, [$c0c0]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld a, e
    add c
    ld c, a
    ld a, d
    adc b
    ld b, a
    ld hl, $c534
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_007_7e52

    dec hl
    ld a, [hl+]
    sub e
    ld c, a
    ld a, [hl]
    sbc d
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld hl, $c0ba
    ld a, c
    ld [hl+], a
    ld [hl], b

jr_007_7e52:
    ld hl, $c0bc
    ld a, [hl+]
    ld c, a
    ld b, [hl]
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, [$c0c1]
    ld e, a
    rlca
    sbc a
    ld d, a
    ld hl, sp+$05
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld c, e
    ld b, d
    ld a, [hl-]
    ld l, [hl]
    ld h, a
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $c536
    ld a, [hl+]
    sub c
    ld a, [hl]
    sbc b
    jr nc, jr_007_7e99

    ld l, e
    ld h, d
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    xor a
    sub l
    ld c, a
    sbc a
    sub h
    ld b, a
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    jr jr_007_7ec6

jr_007_7e99:
    ld a, [$c0c2]
    ld c, a
    rlca
    sbc a
    ld b, a
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld e, l
    ld d, h
    ld hl, $c536
    ld a, [hl+]
    sub e
    ld a, [hl]
    sbc d
    jr nc, jr_007_7ec6

    dec hl
    ld a, [hl+]
    sub c
    ld c, a
    ld a, [hl]
    sbc b
    ld b, a
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld c, l
    ld b, h
    ld hl, $c0bc
    ld a, c
    ld [hl+], a
    ld [hl], b

Jump_007_7ec6:
jr_007_7ec6:
    ld de, $c0ba
    push de
    ld de, $c0bf
    push de
    ld e, $06
    ld hl, _trigger_at_intersection
    call RST_08
    add sp, $04
    ld hl, sp+$00
    ld [hl], e
    xor a
    push af
    inc sp
    ld e, $01
    ld hl, _actor_overlapping_player
    call RST_08
    inc sp
    ld c, e
    ld b, d
    ld hl, sp+$00
    ld a, [hl]
    inc a
    jr z, jr_007_7f03

    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, hl
    add hl, hl
    add hl, hl
    ld de, $c821
    add hl, de
    inc hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    or a
    jr nz, jr_007_7f06

jr_007_7f03:
    xor a
    jr jr_007_7f08

jr_007_7f06:
    ld a, $01

jr_007_7f08:
    ld hl, sp+$01
    ld [hl], a
    ld hl, $0025
    add hl, bc
    push hl
    ld a, l
    ld hl, sp+$04
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$03
    ld [hl], a
    ld a, b
    or c
    jr z, jr_007_7f25

    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_007_7f28

jr_007_7f25:
    xor a
    jr jr_007_7f2a

jr_007_7f28:
    ld a, $01

jr_007_7f2a:
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr nz, jr_007_7f39

    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_007_7f5a

jr_007_7f39:
    ld hl, $c0c9
    ld [hl], $01
    ld a, [$c0ce]
    inc a
    ld hl, $c0cd
    ld b, [hl]
    push af
    inc sp
    push bc
    inc sp
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
    call RST_08
    add sp, $04
    jr jr_007_7f81

jr_007_7f5a:
    ld hl, $c0c9
    ld [hl], $00
    ld a, [$c0cc]
    ld hl, sp+$06
    ld [hl-], a
    inc a
    ld [hl], a
    ld a, [$c0cb]
    ld hl, sp+$06
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld d, a
    ld e, [hl]
    push de
    ld de, $c0b9
    push de
    ld e, $01
    ld hl, $4562
    call RST_08
    add sp, $04

jr_007_7f81:
    ld a, [$c61b]
    bit 4, a
    jr z, jr_007_7ffd

    ld a, [$c61c]
    bit 4, a
    jr nz, jr_007_7ffd

    ld hl, $c507
    ld [hl], $00
    ld hl, sp+$04
    ld a, [hl]
    or a
    jr z, jr_007_7fea

    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld l, e
    ld h, d
    inc hl
    push hl
    ld a, l
    ld hl, sp+$07
    ld [hl], a
    pop hl
    ld a, h
    ld hl, sp+$06
    ld [hl-], a
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    ld a, [hl]
    ld hl, sp+$04
    ld [hl], a
    ld hl, sp+$01
    ld a, [hl]
    ld hl, sp+$05

Jump_007_7fbf:
    ld [hl-], a
    dec hl
    dec hl
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$06
    ld [hl-], a
    dec hl
    ld de, $0000
    push de
    ld a, $01
    push af
    inc sp
    ld de, $0000
    push de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl]
    push af
    inc sp
    ld e, $02
    ld hl, _script_execute
    call RST_08
    add sp, $08
    jr jr_007_7ffd

jr_007_7fea:
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr z, jr_007_7ffd

    dec hl
    ld a, [hl]
    push af
    inc sp
    ld e, $06
    ld hl, _trigger_interact
    call RST_08
    inc sp

jr_007_7ffd:
    add sp, $07
    ret
