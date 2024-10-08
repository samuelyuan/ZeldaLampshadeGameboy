SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

    adc c
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    db $20, $d0
    rra
    ret z

    rra
    rst $00
    rra
    push bc
    ld e, $c6
    dec e
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rrca
    rst $30
    jr jr_004_405f

    jr nz, jr_004_40a8

    rst $08
    cp b
    ret nc

    ld a, [c]
    and d
    ld [c], a
    and d
    xor $ae
    rst $38
    add b
    ld a, a
    ret nz

    ldh [rNR41], a
    ldh a, [$9f]
    add sp, $5f
    ld a, a
    cpl
    ccf
    jr z, jr_004_4080

    jr z, @+$01

    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $30
    ld [$08f7], sp
    db $fc
    ld bc, $02f8
    ld bc, $0b04
    ld hl, sp+$13
    ld hl, sp-$1d
    ld hl, sp-$5d

jr_004_405f:
    ld a, b
    ld h, e
    cp b
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10

jr_004_4080:
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e

jr_004_40a8:
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    add b
    rst $38
    ld b, b
    rst $38
    ld a, a
    rst $38
    ccf
    ldh a, [$38]
    rst $28
    scf
    rst $28
    scf
    xor $37
    db $ed
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    ldh a, [$a0]
    ld a, b
    ret nc

    rst $38
    rst $28
    rst $38
    db $10
    rrca
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    ld a, b
    cpl
    ldh a, [$5f]
    rst $38
    cp a

jr_004_40e8:
    rst $38
    ld b, b

jr_004_40ea:
    nop
    rst $38

jr_004_40ec:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_004_40f2:
    ld bc, $02ff
    rst $38
    cp $ff
    db $fc
    rrca
    inc e
    rst $30
    db $ec
    rst $30
    db $ec
    ld [hl], a
    db $ec
    or a
    db $e3
    jr c, jr_004_40e8

    jr c, jr_004_40ea

    jr c, jr_004_40ec

    jr c, jr_004_412e

    ld hl, sp-$1d
    jr c, jr_004_40f2

    jr c, @-$1b

    jr c, jr_004_40ea

    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_004_416a

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_412e:
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    dec [hl]
    rst $28
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed

jr_004_416a:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    rst $38
    ld a, a
    rst $18
    ret nz

    and b
    sbc a
    ret nz

    cp a
    rst $08
    cp a
    ld hl, sp-$10
    sbc b
    sub b
    rst $38
    sbc a
    rst $38
    rst $38
    rst $38
    inc bc
    rlca
    ld sp, hl
    inc bc
    db $fd
    di
    db $fd
    rra
    rrca
    add hl, de
    add hl, bc
    rst $38
    ld sp, hl
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    rst $38
    ccf
    jp nz, $cc7d

    ld [hl], e
    pop de
    ld l, [hl]
    ret nc

    ld l, a
    call z, $4273
    ld a, l
    ld [hl], c
    adc $ff
    rst $38
    ld b, b
    cp a
    adc h
    ld [hl], e
    ld b, $f9
    pop hl
    ld e, $10
    rst $28
    ld c, $f1
    pop bc
    ld a, $ff
    rst $38
    add b
    ld a, a
    inc c
    di
    ld b, $f9
    pop bc
    ld a, $20
    rst $18
    inc e
    db $e3
    add e
    ld a, h
    rst $38
    db $fc
    inc bc
    cp $1b
    and $0f
    ld a, [c]
    jp Jump_000_233e


    sbc $1e
    ld [c], a
    ld [bc], a
    rst $38
    xor h
    rst $30
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_4223

jr_004_4223:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    ret nc

    ldh [$c0], a
    add b
    ret nz

    add b
    cp $80
    ldh [$80], a
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    dec bc

jr_004_4253:
    rlca
    inc bc
    ld bc, $0103
    rlca
    ld bc, $0103
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $77c8
    db $e4

jr_004_4265:
    ld e, e
    db $dd
    ld h, b
    ret nz

    ld a, a
    cp a
    ld a, a
    sbc [hl]
    ld a, a
    ld e, $7f
    nop
    rst $38
    jr nz, jr_004_4253

    db $10
    rst $28
    rst $30
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld b, b
    cp a
    jr nz, jr_004_4265

    rst $28
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add e
    ld a, [hl]
    ld b, a
    cp d
    db $db
    ld b, $03
    cp $fd
    cp $79
    cp $78
    cp $00
    rst $38
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    ldh [$80], a
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    add b
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0107
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0103
    rst $38
    nop
    rst $38
    ld e, $ff
    ld hl, $46f9
    db $f4
    ld c, e
    or a
    ld l, b
    or [hl]
    ld l, c
    ld [hl], a
    ret z

    rst $38
    nop
    rst $38
    ld a, b
    rst $38
    add h
    rst $08
    ld [hl-], a
    scf
    jp z, Jump_000_0af7

    xor a
    sub $ec
    rla
    rst $00
    jr c, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ld bc, $ff00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    rst $38
    nop
    rst $38
    nop
    nop
    ret nz

    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_4354:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_4354

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_004_438b

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    ret nz

    add b
    ret nz

    add b
    ldh [$80], a
    rst $38
    add b
    cp a

jr_004_438b:
    ret nz

    rst $38
    rst $38
    ret nz

    ld a, a
    rst $38
    ld a, a
    inc bc
    ld bc, $0103
    rlca
    ld bc, $01ff
    db $fd
    inc bc
    rst $38
    rst $38
    inc bc
    cp $ff
    cp $ec
    ld d, e
    pop hl
    ld e, [hl]
    rst $38
    ld h, c
    sbc $7f
    ret nc

    ld l, a
    and c
    ld a, a
    sbc $3f
    nop
    rst $38
    scf
    jp z, Jump_000_32cf

    rst $38
    add $3b
    cp $03
    cp $c5
    cp $bb
    ld a, h
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rIE], a
    nop
    nop
    nop
    nop
    rst $38
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $38
    inc bc
    rst $38
    inc b
    cp $09
    db $fd
    dec de
    db $ed
    dec sp
    rst $28
    add hl, sp
    bit 7, h
    push bc
    ld a, [hl]
    rst $38
    ldh [rIE], a
    db $10
    ccf
    ret z

    rst $18
    db $ec
    db $db
    xor $fb
    adc $e9
    rra
    pop de
    ccf
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    jp $e37f


    ld a, h
    pop af
    ld e, [hl]
    call c, $ff6f
    inc hl
    rst $28
    jr nc, @-$03

    inc e
    rst $38
    rlca
    pop hl
    rst $38
    db $e3
    rra
    push bc
    ccf
    dec e
    ei
    rst $38
    ld [c], a
    ei
    ld b, $ef
    inc e
    rst $38
    ldh a, [$d1]
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_004_44b9

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_004_44b9:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_44c6:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_44c6

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    rst $38
    rst $38
    cp a
    ret nz

    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    ret nz

    cp a
    add b
    rst $38
    cp a
    rst $38
    rst $38
    rst $38
    db $fd
    inc bc
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $fd03
    ld bc, $fdff
    rst $38
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    cp a
    rst $38
    and a
    rst $20
    cp a
    push hl
    and a
    push hl
    and a
    push hl
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    push hl
    rst $20
    db $fd
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
    rst $38
    cp a
    ldh [$a1], a
    rst $38
    and c
    cp $bf
    rst $38
    cp a
    ldh [$a1], a
    rst $38
    and c
    cp $bf
    rst $38
    db $fd
    rlca
    add l
    rst $38
    add l
    ld a, a
    db $fd
    rst $38
    db $fd
    rlca
    add l
    rst $38
    add l
    ld a, a
    db $fd
    rst $38
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc

jr_004_4709:
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    scf
    db $ed
    scf
    xor $37
    rst $28
    jr c, jr_004_4709

    ccf
    ldh a, [$7f]
    rst $38
    ld b, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    cp $ff
    db $dd
    db $e3
    xor l
    pop de
    and l
    reti


    add l
    ld sp, hl
    xor c
    pop de
    adc a
    pop af
    sub l
    jp hl


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_004_4755:
    nop
    ld sp, hl
    ld b, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    cp e
    rst $00
    or l
    adc e

jr_004_4768:
    and l
    sbc e

jr_004_476a:
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a

jr_004_4770:
    xor c
    sub a

jr_004_4772:
    db $ec
    or a

jr_004_4774:
    db $ec
    ld [hl], a
    db $ec
    rst $30
    inc e
    rst $30
    db $fc
    rrca
    cp $ff
    ld [bc], a
    rst $38
    ld bc, $e3ff
    jr c, jr_004_4768

    jr c, jr_004_476a

    jr c, jr_004_47ac

    ld hl, sp-$1d
    jr c, jr_004_4770

    jr c, jr_004_4772

    jr c, jr_004_4774

    jr c, jr_004_4755

    db $dd
    jp $c3dc


    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_47ac:
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    add $1d
    push bc
    ld e, $c7
    rra
    ret z

    rra
    ret nc

    rra
    add b
    jr nz, jr_004_47fe

    ld b, b
    ccf
    add b
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    add l
    ld sp, hl
    add c
    ld sp, hl
    sub l
    jp hl


    sub l
    jp hl


    add l
    ld sp, hl
    add e
    pop bc

jr_004_47fe:
    dec h
    sbc c
    ld e, d
    and l
    ld a, [$d500]
    nop
    xor d
    nop
    ld d, l
    nop
    and b
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    cp a
    nop
    ld d, a
    nop
    xor e
    nop
    ld d, l
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld bc, $a100
    sbc a
    add c
    sbc a
    xor c
    sub a
    xor c
    sub a
    and c
    sbc a
    pop bc
    add e
    and h
    sbc c
    ld e, d
    and l
    rst $30
    ld [$08f7], sp
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, e
    cp b
    and e
    ld a, b
    db $e3
    ld hl, sp+$13
    ld hl, sp+$0b
    ld hl, sp+$01
    inc b
    ld hl, sp+$02
    db $fc
    ld bc, $d5ca
    adc $d1
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop

jr_004_486b:
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    jr nz, jr_004_486b

    rra
    ret z

    rra
    rst $00
    rra
    push bc
    ld e, $c6
    dec e
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    cp a
    ret nz

    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    ret nz

    cp a
    add b
    rst $38
    cp a
    rst $38
    rst $38
    rst $38
    db $fd
    inc bc
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $fd03
    ld bc, $fdff
    rst $38
    rst $38
    rrca
    rst $30
    jr jr_004_4911

    jr nz, jr_004_495a

    rst $08
    cp b
    ret nc

    ld a, [c]
    and d
    ld [c], a
    and d
    xor $ae
    rst $38
    add b
    ld a, a
    ret nz

    ldh [rNR41], a
    ldh a, [$9f]
    add sp, $5f
    ld a, a
    cpl
    ccf
    jr z, jr_004_4932

    jr z, @+$01

    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $30
    ld [$08f7], sp
    db $fc
    ld bc, $02f8
    ld bc, $0b04
    ld hl, sp+$13
    ld hl, sp-$1d
    ld hl, sp-$5d

jr_004_4911:
    ld a, b
    ld h, e
    cp b
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10

jr_004_4932:
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e

jr_004_495a:
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    add b
    rst $38
    ld b, b
    rst $38
    ld a, a
    rst $38
    ccf
    ldh a, [$38]
    rst $28
    scf
    rst $28
    scf
    xor $37
    db $ed
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    cp a
    rst $38
    and a
    rst $20
    cp a
    push hl
    and a
    push hl
    and a
    push hl
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    push hl
    rst $20
    db $fd
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
    rst $38
    ldh a, [$a0]
    ld a, b
    ret nc

    rst $38
    rst $28
    rst $38
    db $10
    rrca
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    ld a, b
    cpl
    ldh a, [$5f]
    rst $38
    cp a

jr_004_49ba:
    rst $38
    ld b, b

jr_004_49bc:
    nop
    rst $38

jr_004_49be:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_004_49c4:
    ld bc, $02ff
    rst $38
    cp $ff
    db $fc
    rrca
    inc e
    rst $30
    db $ec
    rst $30
    db $ec
    ld [hl], a
    db $ec
    or a
    db $e3
    jr c, jr_004_49ba

    jr c, jr_004_49bc

    jr c, jr_004_49be

    jr c, jr_004_4a00

    ld hl, sp-$1d
    jr c, jr_004_49c4

    jr c, @-$1b

    jr c, jr_004_49bc

    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_004_4a3c

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_4a00:
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    dec [hl]
    rst $28
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed

jr_004_4a3c:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    rst $38
    ccf
    jp nz, $cc7d

    ld [hl], e
    pop de
    ld l, [hl]
    ret nc

    ld l, a
    call z, $4273
    ld a, l
    ld [hl], c
    adc $ff
    rst $38
    ld b, b
    cp a
    adc h
    ld [hl], e
    ld b, $f9
    pop hl
    ld e, $10
    rst $28
    ld c, $f1
    pop bc
    ld a, $ff
    rst $38
    add b
    ld a, a
    inc c
    di
    ld b, $f9
    pop bc
    ld a, $20
    rst $18
    inc e
    db $e3
    add e
    ld a, h
    rst $38
    db $fc
    inc bc
    cp $1b
    and $0f
    ld a, [c]
    jp Jump_000_233e


    sbc $1e
    ld [c], a
    ld [bc], a
    rst $38
    rst $00
    jr c, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ld bc, $ff00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    rst $38
    nop
    rst $38
    nop
    nop
    ret nz

    nop
    rst $38
    and a
    rst $20
    cp a
    rst $20
    and h
    rst $20
    and h
    rst $20
    and h
    rst $20
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    db $fd
    rst $38
    push hl
    rst $20
    db $fd
    and a
    push hl
    and a
    push hl
    and a
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
    rst $38
    xor h
    rst $30
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_4af5

jr_004_4af5:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc

jr_004_4b05:
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    ret z

    ld [hl], a
    db $e4

jr_004_4b17:
    ld e, e
    db $dd
    ld h, b
    ret nz

    ld a, a
    cp a
    ld a, a
    sbc [hl]
    ld a, a
    ld e, $7f
    nop
    rst $38
    jr nz, jr_004_4b05

    db $10
    rst $28
    rst $30
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld b, b
    cp a
    jr nz, jr_004_4b17

    rst $28
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add e
    ld a, [hl]
    ld b, a
    cp d
    db $db
    ld b, $03
    cp $fd
    cp $79
    cp $78
    cp $00
    rst $38
    rst $38
    nop
    rst $38
    nop
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rIE], a
    nop
    nop
    nop
    nop
    rst $38
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    ld e, $ff
    ld hl, $46f9
    db $f4
    ld c, e
    or a
    ld l, b
    or [hl]
    ld l, c
    ld [hl], a
    ret z

    rst $38
    nop
    rst $38
    ld a, b
    rst $38
    add h
    rst $08
    ld [hl-], a
    scf
    jp z, Jump_000_0af7

    xor a
    sub $ec
    rla
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_4be6:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_4be6

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_004_4c1d

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    db $ec
    ld d, e
    pop hl
    ld e, [hl]
    rst $38
    ld h, c
    sbc $7f
    ret nc

jr_004_4c1d:
    ld l, a
    and c
    ld a, a
    sbc $3f
    nop
    rst $38
    scf
    jp z, Jump_000_32cf

    rst $38
    add $3b
    cp $03
    cp $c5
    cp $bb
    ld a, h
    nop
    rst $38
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_004_4ceb

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_004_4ceb:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_4cf8:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_4cf8

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $38
    inc bc
    rst $38
    inc b
    cp $09
    db $fd
    dec de
    db $ed
    dec sp
    rst $28
    add hl, sp
    bit 7, h
    push bc
    ld a, [hl]
    rst $38
    ldh [rIE], a
    db $10
    ccf
    ret z

    rst $18
    db $ec
    db $db
    xor $fb
    adc $e9
    rra
    pop de
    ccf
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    jp $e37f


    ld a, h
    pop af
    ld e, [hl]
    call c, $ff6f
    inc hl
    rst $28
    jr nc, @-$03

    inc e
    rst $38
    rlca
    pop hl
    rst $38
    db $e3
    rra
    push bc
    ccf
    dec e
    ei
    rst $38
    ld [c], a
    ei
    ld b, $ef
    inc e
    rst $38
    ldh a, [$c0]
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc

jr_004_4f1b:
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    scf
    db $ed
    scf
    xor $37
    rst $28
    jr c, jr_004_4f1b

    ccf
    ldh a, [$7f]
    rst $38
    ld b, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    cp $ff
    db $dd
    db $e3
    xor l
    pop de
    and l
    reti


    add l
    ld sp, hl
    xor c
    pop de
    adc a
    pop af
    sub l
    jp hl


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_004_4f67:
    nop
    ld sp, hl
    ld b, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    cp e
    rst $00
    or l
    adc e

jr_004_4f7a:
    and l
    sbc e

jr_004_4f7c:
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a

jr_004_4f82:
    xor c
    sub a

jr_004_4f84:
    db $ec
    or a

jr_004_4f86:
    db $ec
    ld [hl], a
    db $ec
    rst $30
    inc e
    rst $30
    db $fc
    rrca
    cp $ff
    ld [bc], a
    rst $38
    ld bc, $e3ff
    jr c, jr_004_4f7a

    jr c, jr_004_4f7c

    jr c, jr_004_4fbe

    ld hl, sp-$1d
    jr c, jr_004_4f82

    jr c, jr_004_4f84

    jr c, jr_004_4f86

    jr c, jr_004_4f67

    db $dd
    jp $c3dc


    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_4fbe:
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    add $1d
    push bc
    ld e, $c7
    rra
    ret z

    rra
    ret nc

    rra
    add b
    jr nz, jr_004_5010

    ld b, b
    ccf
    add b
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    add l
    ld sp, hl
    add c
    ld sp, hl
    sub l
    jp hl


    sub l
    jp hl


    add l
    ld sp, hl
    add e
    pop bc

jr_004_5010:
    dec h
    sbc c
    ld e, d
    and l
    ld a, [$d500]
    nop
    xor d
    nop
    ld d, l
    nop
    and b
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    cp a
    nop
    ld d, a
    nop
    xor e
    nop
    ld d, l
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld bc, $a100
    sbc a
    add c
    sbc a
    xor c
    sub a
    xor c
    sub a
    and c
    sbc a
    pop bc
    add e
    and h
    sbc c
    ld e, d
    and l
    rst $30
    ld [$08f7], sp
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, e
    cp b
    and e
    ld a, b
    db $e3
    ld hl, sp+$13
    ld hl, sp+$0b
    ld hl, sp+$01
    inc b
    ld hl, sp+$02
    db $fc
    ld bc, $d5ca
    adc $d1
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38

jr_004_50a2:
    rst $38
    rst $38
    add d
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ei
    nop
    pop af
    ld b, $52
    inc l
    ld h, $99
    and h
    ld e, e
    sub c
    ld l, [hl]
    push de
    ld a, [hl+]
    rst $18
    jr nz, jr_004_50a2

    nop
    cp l
    nop
    ld a, [hl]
    nop
    rst $38
    nop
    inc a
    add c
    sbc c
    ld b, d
    jp $e724


    jr @-$02

    ld [bc], a
    ld a, [$f404]
    ld [$08f0], sp
    ldh a, [$08]
    db $f4
    ld [$04fa], sp
    db $fc
    ld [bc], a
    ld bc, $0700
    inc bc
    dec c
    ld b, $0e
    rra
    scf
    jr c, jr_004_511f

    ld [hl], c
    ld e, [hl]
    ld h, c
    ld e, [hl]
    pop hl
    rst $38
    rst $38
    cp l
    jp Jump_000_1ee1


    adc a
    ld [hl], b
    rra
    ldh [$3f], a
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    rst $38
    rst $38
    sbc $e1
    add e
    ld a, h
    ld hl, sp+$07
    cp $01
    cp $01
    cp $01
    cp $01
    add c
    cp $f0
    rst $38
    ret nc

    ccf
    cp h
    ld a, a
    ld [hl], a

jr_004_511f:
    adc a
    ld a, d
    add a
    ld a, a
    add e
    dec a
    jp Jump_004_7f80


    inc bc
    rst $38
    ld b, l
    cp $ee
    rst $38
    or a
    ld hl, sp+$2e
    pop af
    ld e, [hl]
    pop hl
    sbc $e1
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $18
    nop
    adc a
    ld h, b
    ld c, d
    inc [hl]
    ld h, h
    sbc c
    dec h
    jp c, $7689

    xor e
    ld d, h
    ei
    inc b
    sbc [hl]
    pop hl
    sbc a
    ldh [$8f], a
    ldh a, [$cf]
    ldh a, [$c5]
    ld a, [$fe51]
    ldh a, [rIE]
    or d
    rst $38
    inc e
    db $e3
    nop
    rst $38
    nop
    rst $38
    and $19
    rst $38
    nop
    rst $38
    nop
    cp e
    ld b, h
    inc de
    db $ec
    db $fc
    inc bc
    ld [hl], b
    adc a
    nop
    rst $38
    dec de
    db $e4
    ccf
    ret nz

    ei
    inc b
    ld sp, hl
    ld b, $b0
    ld c, a
    dec a
    jp $8779


    ld sp, hl
    rlca
    db $db
    daa
    db $d3
    cpl
    adc d
    ld a, a
    adc a
    ld a, a
    dec c
    rst $38
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_004_521e

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    sbc d
    rst $38
    adc [hl]
    rst $38
    jp $d1ff


    ld a, a
    ldh a, [rIE]
    ld hl, sp-$41
    db $fc
    adc a
    rst $38
    rst $08
    ld bc, $10fe
    rst $38
    db $10
    rst $38
    ld hl, sp-$01

jr_004_521e:
    rrca
    rst $38
    nop
    rst $38
    add b
    rst $38
    db $e3
    rst $38
    add b
    ld a, a
    ld [bc], a
    rst $38
    ld b, d
    rst $38
    rst $20
    rst $38
    cp h
    rst $38
    nop
    rst $38
    inc b
    rst $38
    adc a
    rst $38
    ld e, c
    rst $38
    ld [hl], c
    rst $38
    jp $8bff


    cp $0f
    rst $38
    rra
    db $fd
    ccf
    pop af
    rst $38
    di
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_5267

jr_004_5267:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    jp $a53c


    ld b, d
    ld b, d
    add c
    nop
    nop
    db $ed
    ld a, b
    ret c

    jr nc, jr_004_52fc

    jr nc, jr_004_5313

    ld hl, $372b
    inc a
    rra
    inc bc
    nop
    nop
    nop
    adc a
    ld a, a
    db $fc
    inc bc
    xor b
    ld [hl], b
    ldh a, [$f8]
    sub h
    ld hl, sp+$0b
    db $fc
    rst $30
    ld c, $7b
    rlca
    ld a, b
    rst $38
    ld bc, $44fe
    ccf
    ld c, a
    ccf
    ret


    ccf
    sbc b
    ld a, a
    ld [hl], b
    rst $38
    jp $d2fc


    ccf
    xor l
    ld e, $d7
    inc c
    ld a, l
    add [hl]
    pop de
    xor $7a
    db $fc
    db $fc
    nop
    nop
    nop
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38

jr_004_52fc:
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38

jr_004_5313:
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec c
    rrca
    add hl, de
    ld e, $13
    inc e
    inc d
    ccf
    dec sp
    dec a
    dec l
    jr c, jr_004_535f

    ld a, b
    ld e, e
    ld a, h
    add sp, -$10
    sub b
    ld a, b
    inc c
    ld hl, sp-$78
    ld a, h
    ld [hl], h
    adc h
    cp h
    db $fc
    ld hl, sp+$18
    add sp, $3c
    rra
    rra
    ld a, [hl+]
    inc [hl]
    ld a, l
    ld b, b
    db $db
    and b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_535f:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    rst $38
    cp a
    ret nz

    ldh a, [$80]
    ldh a, [$9f]
    ldh a, [$9f]
    rst $38
    sbc a
    rst $38
    sbc a
    rst $38
    sbc a
    cp $ff
    db $fd
    inc bc
    rrca
    ld bc, $f90f
    rrca
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    ld hl, sp-$08
    ld d, h
    inc l
    cp [hl]
    ld [bc], a
    db $db
    dec b
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_53a8:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_53a8

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop

jr_004_53b6:
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_004_53df

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    rrca
    rlca
    dec de
    inc c
    ld d, $19
    dec d
    ld [de], a
    ld [hl], a

jr_004_53df:
    jr nc, jr_004_53b6

    ld [hl], d
    or a
    ret nc

    push af
    sub d
    db $db
    rst $20
    db $e4
    jp $c0c8


    pop bc
    ret z

    rst $38
    ret z

    db $eb
    call c, $ffda
    ld d, l
    rst $38
    rst $08
    rst $38
    cpl
    call c, Call_000_1fee
    rst $08
    ccf
    rst $28
    ccf
    and a
    ld a, a
    cp [hl]
    rst $38
    ld d, a
    cp $f0
    ldh [$d8], a
    jr nc, jr_004_5473

    sbc b
    xor b
    ld c, b
    xor $0c
    xor e
    ld c, [hl]
    db $ed
    dec bc
    xor a
    ld c, c
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $28
    sbc a
    cp a
    add b
    add b
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    cp a
    rst $38
    ldh [rIE], a
    rst $38
    ld a, a
    rst $30
    ld sp, hl
    db $fd
    ld bc, $0301
    inc bc
    rst $38
    rst $38
    rst $38
    db $fd
    rst $38
    rlca
    rst $38
    rst $38
    cp $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb

jr_004_5473:
    dec bc
    db $eb
    dec bc
    or a
    sub b
    or l
    sub d
    or a
    sub b
    or l
    sub d
    or d
    sub c
    or c
    sbc b
    cp b
    sbc h
    cp a
    sbc a
    sbc d
    rst $38
    cp l
    ld a, a
    rst $38
    rst $38
    rst $18
    adc a
    add $e7
    rst $38
    ld h, a
    push de
    xor $af
    rst $18
    xor e
    rst $38
    ld d, l
    rst $38
    db $eb
    rst $38
    ld d, [hl]
    rst $38
    xor h
    rst $38
    pop af
    cp $00
    nop
    rst $38
    rst $38
    db $ed
    add hl, bc
    xor l
    ld c, c
    db $ed
    add hl, bc
    xor l
    ld c, c
    ld c, l
    adc c
    adc l
    add hl, de
    dec e
    add hl, sp
    db $fd
    ld sp, hl
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    cp h
    adc a
    rst $18
    add a
    ret nz

    and b
    rst $38
    and $bf
    rst $38
    jr nz, jr_004_5561

    nop
    rra
    nop
    nop
    di
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    ld h, [hl]
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $08
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    ld h, [hl]
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    dec a
    pop af
    ei
    pop hl
    inc bc
    dec b
    rst $38
    ld h, a
    db $fd
    rst $38
    inc b
    cp $00
    ld hl, sp+$00
    nop
    call $ceb0
    or b
    rst $18
    and b
    sbc $a1
    cp $81
    cp h
    jp $e7d8


    rst $28
    ldh a, [rIE]
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    or e
    dec c
    ld [hl], e
    dec c
    ei
    dec b
    ld a, e
    add l
    ld a, a
    add c
    dec a
    jp $e71b


    rst $30
    rrca
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b

jr_004_5561:
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr @+$21

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    nop
    nop
    ld b, d
    add c
    and l
    ld b, d
    jp $ff3c


    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    add b
    rst $38
    rst $08
    or b
    cp c
    add $ff
    rst $38
    sbc a
    rst $30
    rst $38
    sub a
    rst $38
    sub a
    rst $38
    rst $38
    ld bc, $f3ff
    dec c
    sbc l
    ld h, e
    rst $38
    rst $38
    ld sp, hl
    rst $28
    rst $38
    jp hl


    rst $38
    jp hl


    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    ccf
    rst $18
    ccf
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    db $fc
    rst $38
    ei
    db $fc
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_55ea:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_55ea

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr jr_004_5621

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $38
    sub a
    ld hl, sp-$70
    rst $28
    sbc a
    rst $38
    add b
    rst $38
    rst $38
    adc b

jr_004_5621:
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    jp hl


    rra
    add hl, bc
    rst $30
    ld sp, hl
    rst $38
    ld bc, $ffff
    ld de, $ffff
    rst $38
    rst $38
    nop
    rst $18
    ccf
    ld e, a
    cp a
    ld e, a
    cp a
    rst $18
    ccf
    sbc a
    ld a, a
    sbc a
    ld a, a
    ret nc

    ccf
    rst $28
    ldh a, [$fb]
    db $fc
    ld a, [$fafd]
    db $fd
    ei
    db $fc
    ld sp, hl
    cp $f9
    cp $0b
    db $fc
    rst $30
    rrca
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e

jr_004_5689:
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    nop
    nop
    ld a, h
    jr c, jr_004_5689

    ld b, h
    add $82
    xor [hl]
    add $ca
    cp [hl]
    or d
    sbc $b2
    sbc $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    cp d
    sub $fa
    sub [hl]
    db $db
    or [hl]
    db $db
    or [hl]
    jp nc, $f5bf

    ld e, [hl]
    ld a, d
    inc a
    inc c
    nop
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

jr_004_5779:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    ret nz

    add b
    ldh a, [$e0]
    ret nc

    jr c, jr_004_5779

    ld a, h
    db $76
    adc [hl]
    ld a, e
    add [hl]
    ld a, a
    add e
    dec a
    jp $ffff


    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop

jr_004_589f:
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld h, [hl]
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    jr nz, jr_004_589f

    rra
    ret z

    rra
    rst $00
    rra
    push bc
    ld e, $c6
    dec e
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $30
    ld [$08f7], sp
    db $fc
    ld bc, $02f8
    ld bc, $0b04
    ld hl, sp+$13
    ld hl, sp-$1d
    ld hl, sp-$5d
    ld a, b
    ld h, e
    cp b
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    add b
    rst $38
    ld b, b
    rst $38
    ld a, a
    rst $38
    ccf
    ldh a, [$38]
    rst $28
    scf
    rst $28
    scf
    xor $37
    db $ed
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38

jr_004_596e:
    rst $38
    nop

jr_004_5970:
    nop
    rst $38

jr_004_5972:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_004_5978:
    ld bc, $02ff
    rst $38
    cp $ff
    db $fc
    rrca
    inc e
    rst $30
    db $ec
    rst $30
    db $ec
    ld [hl], a
    db $ec
    or a
    db $e3
    jr c, jr_004_596e

    jr c, jr_004_5970

    jr c, jr_004_5972

    jr c, jr_004_59b4

    ld hl, sp-$1d
    jr c, jr_004_5978

    jr c, @-$1b

    jr c, jr_004_5970

    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_004_59f0

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_59b4:
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    dec [hl]
    rst $28
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed

jr_004_59f0:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
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
    ldh a, [$9f]
    db $fd
    sub d
    db $f4
    sub d
    ldh a, [$92]
    ldh a, [$9f]
    ei
    sub h
    sbc c
    sub h
    sbc b
    db $f4
    nop
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    inc c
    stop
    rst $38
    cp e
    ld b, h
    or e
    ld b, h
    add d
    ld b, h
    nop
    rst $38
    rst $28
    db $10
    rst $28
    stop
    stop
    rst $38
    cp e
    ld b, h
    or e
    ld b, h
    add b
    ld b, h
    rrca
    ld sp, hl
    cp a
    ld c, c
    cpl
    ld c, c
    rrca
    ld c, c
    rrca
    ld sp, hl
    rst $18
    add hl, hl
    sbc c
    add hl, hl
    add hl, de
    cpl
    xor h
    rst $30
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_5a79

jr_004_5a79:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_5aea:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_5aea

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_004_5baf

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_004_5baf:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_5bbc:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_5bbc

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc

jr_004_5d9f:
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    scf
    db $ed
    scf
    xor $37
    rst $28
    jr c, jr_004_5d9f

    ccf
    ldh a, [$7f]
    rst $38
    ld b, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    cp $ff
    db $dd
    db $e3
    xor l
    pop de
    and l
    reti


    add l
    ld sp, hl
    xor c
    pop de
    adc a
    pop af
    sub l
    jp hl


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_004_5deb:
    nop
    ld sp, hl
    ld b, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    cp e
    rst $00
    or l
    adc e

jr_004_5dfe:
    and l
    sbc e

jr_004_5e00:
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a

jr_004_5e06:
    xor c
    sub a

jr_004_5e08:
    db $ec
    or a

jr_004_5e0a:
    db $ec
    ld [hl], a
    db $ec
    rst $30
    inc e
    rst $30
    db $fc
    rrca
    cp $ff
    ld [bc], a
    rst $38
    ld bc, $e3ff
    jr c, jr_004_5dfe

    jr c, jr_004_5e00

    jr c, jr_004_5e42

    ld hl, sp-$1d
    jr c, jr_004_5e06

    jr c, jr_004_5e08

    jr c, jr_004_5e0a

    jr c, jr_004_5deb

    db $dd
    jp $c3dc


    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_5e42:
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    add $1d
    push bc
    ld e, $c7
    rra
    ret z

    rra
    ret nc

    rra
    add b
    jr nz, jr_004_5e94

    ld b, b
    ccf
    add b
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    add l
    ld sp, hl
    add c
    ld sp, hl
    sub l
    jp hl


    sub l
    jp hl


    add l
    ld sp, hl
    add e
    pop bc

jr_004_5e94:
    dec h
    sbc c
    ld e, d
    and l
    ld a, [$d500]
    nop
    xor d
    nop
    ld d, l
    nop
    and b
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    cp a
    nop
    ld d, a
    nop
    xor e
    nop
    ld d, l
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld bc, $a100
    sbc a
    add c
    sbc a
    xor c
    sub a
    xor c
    sub a
    and c
    sbc a
    pop bc
    add e
    and h
    sbc c
    ld e, d
    and l
    rst $30
    ld [$08f7], sp
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, e
    cp b
    and e
    ld a, b
    db $e3
    ld hl, sp+$13
    ld hl, sp+$0b
    ld hl, sp+$01
    inc b
    ld hl, sp+$02
    db $fc
    ld bc, $d5ca
    adc $d1
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop

jr_004_5f01:
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    add h
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    jr nz, jr_004_5f01

    rra
    ret z

    rra
    rst $00
    rra
    push bc
    ld e, $c6
    dec e
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rrca
    rst $30
    jr jr_004_5f87

    jr nz, jr_004_5fd0

    rst $08
    cp b
    ret nc

    ld a, [c]
    and d
    ld [c], a
    and d
    xor $ae
    rst $38
    add b
    ld a, a
    ret nz

    ldh [rNR41], a
    ldh a, [$9f]
    add sp, $5f
    ld a, a
    cpl
    ccf
    jr z, jr_004_5fa8

    jr z, @+$01

    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $30
    ld [$08f7], sp
    db $fc
    ld bc, $02f8
    ld bc, $0b04
    ld hl, sp+$13
    ld hl, sp-$1d
    ld hl, sp-$5d

jr_004_5f87:
    ld a, b
    ld h, e
    cp b
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10

jr_004_5fa8:
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e

jr_004_5fd0:
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    add b
    rst $38
    ld b, b
    rst $38
    ld a, a
    rst $38
    ccf
    ldh a, [$38]
    rst $28
    scf
    rst $28
    scf
    xor $37
    db $ed
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    ldh a, [$a0]
    ld a, b
    ret nc

    rst $38
    rst $28
    rst $38
    db $10
    rrca
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    ld a, b
    cpl
    ldh a, [$5f]
    rst $38
    cp a

jr_004_6010:
    rst $38
    ld b, b

jr_004_6012:
    nop
    rst $38

jr_004_6014:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_004_601a:
    ld bc, $02ff
    rst $38
    cp $ff
    db $fc
    rrca
    inc e
    rst $30
    db $ec
    rst $30
    db $ec
    ld [hl], a
    db $ec
    or a
    db $e3
    jr c, jr_004_6010

    jr c, jr_004_6012

    jr c, jr_004_6014

    jr c, jr_004_6056

    ld hl, sp-$1d
    jr c, jr_004_601a

    jr c, @-$1b

    jr c, jr_004_6012

    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_004_6092

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_6056:
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    dec [hl]
    rst $28
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed

jr_004_6092:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    rst $00
    jr c, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ld bc, $ff00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    rst $38
    nop
    rst $38
    nop
    nop
    ret nz

    nop
    rst $38
    rst $38
    inc a
    rst $38
    ld h, $ff
    dec h
    rst $38
    inc h
    rst $38
    db $e4
    rst $38
    and h
    rst $38
    cp h
    db $e3
    cp [hl]
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    add c
    rst $38
    add c
    rst $38
    add c
    xor h
    rst $30
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_610b

jr_004_610b:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    rst $38
    nop
    rst $38
    nop
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rIE], a
    nop
    nop
    nop
    nop
    rst $38
    pop hl
    cp a
    ldh [$bf], a
    rst $38
    cp a
    rst $38
    add b
    add b
    rst $38
    rst $38
    rst $38
    sub d
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    rst $38
    add c
    rst $38
    add c
    rst $38
    ld bc, $ff01
    rst $38
    rst $38
    ld c, c
    rst $38
    rst $38
    rst $38
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    add h
    ei
    sbc c
    and $a2
    db $dd
    and c
    sbc $98
    rst $20
    add h
    ei
    db $e3
    sbc h
    rst $38
    cp $01
    rst $38
    dec c
    di
    rlca
    ld sp, hl
    pop hl
    rra
    ld de, $0fef
    pop af
    add c
    ld a, a
    rst $38
    ld a, a
    rst $18
    ldh [$b0], a
    rst $08
    and b
    rst $18
    and b
    rst $18
    ldh [$9f], a
    ldh [$9f], a
    ldh a, [$8f]
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    cp $fb
    rlca
    dec c
    di
    dec b
    ei
    dec b
    ei
    rlca
    ld sp, hl
    rlca
    ld sp, hl
    rlca
    ld sp, hl
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_620c:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_620c

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_004_6243

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    sub b
    rst $28
    ret z

    or a
    cp e
    ret nz

    add b
    rst $38
    ld a, a

jr_004_6243:
    rst $38
    inc a
    rst $38
    inc a
    rst $38
    nop
    rst $38
    ld b, c
    cp a
    inc hl
    db $dd
    db $ed
    inc bc
    ld bc, $feff
    rst $38
    inc a
    rst $38
    inc a
    rst $38
    nop
    rst $38
    cp a
    ret nz

    ret c

    ldh [$bf], a
    rst $38
    call $cdf4
    db $f4
    cp a
    rst $38
    rst $10
    ld sp, hl
    rst $38
    ld a, a
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    db $dd
    ld b, h
    db $dd
    ld b, h
    rst $38
    rst $38
    rst $38
    ld de, $ffff
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    cp e
    ld [hl+], a
    cp e
    ld [hl+], a
    rst $38
    rst $38
    rst $38
    adc b
    rst $38
    rst $38
    db $fd
    inc bc
    dec de
    rlca
    db $fd
    rst $38
    di
    ld c, a
    di
    ld c, a
    db $fd
    rst $38
    di
    rra
    rst $38
    db $fc
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    rst $38
    nop
    rst $38
    ld e, $ff
    ld hl, $46f9
    db $f4
    ld c, e
    or a
    ld l, b
    or [hl]
    ld l, c
    ld [hl], a
    ret z

    rst $38
    nop
    rst $38
    ld a, b
    rst $38
    add h
    rst $08
    ld [hl-], a
    scf
    jp z, Jump_000_0af7

    xor a
    sub $ec
    rla
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    db $ec
    ld d, e
    pop hl
    ld e, [hl]
    rst $38
    ld h, c
    sbc $7f
    ret nc

    ld l, a
    and c
    ld a, a
    sbc $3f
    nop
    rst $38
    scf
    jp z, Jump_000_32cf

    rst $38
    add $3b
    cp $03
    cp $c5
    cp $bb
    ld a, h
    nop
    rst $38
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_004_6371

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

jr_004_6371:
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_637e:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_637e

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr @+$21

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    ccf
    jp nz, $cc7d

    ld [hl], e
    pop de
    ld l, [hl]
    ret nc

    ld l, a
    call z, $4273
    ld a, l
    ld [hl], c
    adc $ff
    rst $38
    ld b, b
    cp a
    adc h
    ld [hl], e
    ld b, $f9
    pop hl
    ld e, $10
    rst $28
    ld c, $f1
    pop bc
    ld a, $ff
    rst $38
    add b
    ld a, a
    inc c
    di
    ld b, $f9
    pop bc
    ld a, $20
    rst $18
    inc e
    db $e3
    add e
    ld a, h
    rst $38
    db $fc
    inc bc
    cp $1b
    and $0f
    ld a, [c]
    jp Jump_000_233e


    sbc $1e
    ld [c], a
    ld [bc], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38

jr_004_655b:
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret z

    ld [hl], a
    db $e4

jr_004_656d:
    ld e, e
    db $dd
    ld h, b
    ret nz

    ld a, a
    cp a
    ld a, a
    sbc [hl]
    ld a, a
    ld e, $7f
    nop
    rst $38
    jr nz, jr_004_655b

    db $10
    rst $28
    rst $30
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld b, b
    cp a
    jr nz, jr_004_656d

    rst $28
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add e
    ld a, [hl]
    ld b, a
    cp d
    db $db
    ld b, $03
    cp $fd
    cp $79
    cp $78
    cp $00
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc

jr_004_65e1:
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    scf
    db $ed
    scf
    xor $37
    rst $28
    jr c, jr_004_65e1

    ccf
    ldh a, [$7f]
    rst $38
    ld b, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    cp $ff
    db $dd
    db $e3
    xor l
    pop de
    and l
    reti


    add l
    ld sp, hl
    xor c
    pop de
    adc a
    pop af
    sub l
    jp hl


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_004_662d:
    nop
    ld sp, hl
    ld b, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    cp e
    rst $00
    or l
    adc e

jr_004_6640:
    and l
    sbc e

jr_004_6642:
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a

jr_004_6648:
    xor c
    sub a

jr_004_664a:
    db $ec
    or a

jr_004_664c:
    db $ec
    ld [hl], a
    db $ec
    rst $30
    inc e
    rst $30
    db $fc
    rrca
    cp $ff
    ld [bc], a
    rst $38
    ld bc, $e3ff
    jr c, jr_004_6640

    jr c, jr_004_6642

    jr c, jr_004_6684

    ld hl, sp-$1d
    jr c, jr_004_6648

    jr c, jr_004_664a

    jr c, jr_004_664c

    jr c, jr_004_662d

    db $dd
    jp $c3dc


    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_6684:
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    add $1d
    push bc
    ld e, $c7
    rra
    ret z

    rra
    ret nc

    rra
    add b
    jr nz, jr_004_66d6

    ld b, b
    ccf
    add b
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    add l
    ld sp, hl
    add c
    ld sp, hl
    sub l
    jp hl


    sub l
    jp hl


    add l
    ld sp, hl
    add e
    pop bc

jr_004_66d6:
    dec h
    sbc c
    ld e, d
    and l
    ld a, [$d500]
    nop
    xor d
    nop
    ld d, l
    nop
    and b
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    cp a
    nop
    ld d, a
    nop
    xor e
    nop
    ld d, l
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld bc, $a100
    sbc a
    add c
    sbc a
    xor c
    sub a
    xor c
    sub a
    and c
    sbc a
    pop bc
    add e
    and h
    sbc c
    ld e, d
    and l
    rst $30
    ld [$08f7], sp
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    ld h, e
    cp b
    and e
    ld a, b
    db $e3
    ld hl, sp+$13
    ld hl, sp+$0b
    ld hl, sp+$01
    inc b
    ld hl, sp+$02
    db $fc
    ld bc, $d5ca
    adc $d1
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop

jr_004_6743:
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    nop
    ccf
    add b
    rra
    ld b, b
    add b
    jr nz, jr_004_6743

    rra
    ret z

    rra
    rst $00
    rra
    push bc
    ld e, $c6
    dec e
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $30
    ld [$08f7], sp
    db $fc
    ld bc, $02f8
    ld bc, $0b04
    ld hl, sp+$13
    ld hl, sp-$1d
    ld hl, sp-$5d
    ld a, b
    ld h, e
    cp b
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    add b
    rst $38
    ld b, b
    rst $38
    ld a, a
    rst $38
    ccf
    ldh a, [$38]
    rst $28
    scf
    rst $28
    scf
    xor $37
    db $ed
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38

jr_004_6812:
    rst $38
    nop

jr_004_6814:
    nop
    rst $38

jr_004_6816:
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_004_681c:
    ld bc, $02ff
    rst $38
    cp $ff
    db $fc
    rrca
    inc e
    rst $30
    db $ec
    rst $30
    db $ec
    ld [hl], a
    db $ec
    or a
    db $e3
    jr c, jr_004_6812

    jr c, jr_004_6814

    jr c, jr_004_6816

    jr c, jr_004_6858

    ld hl, sp-$1d
    jr c, jr_004_681c

    jr c, @-$1b

    jr c, jr_004_6814

    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, jr_004_6894

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_6858:
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    call nz, $c71f
    inc e
    rst $00
    inc e
    rst $00
    inc e
    rst $00
    inc e
    dec [hl]
    rst $28
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed

jr_004_6894:
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    scf
    db $ed
    rst $00
    jr c, @+$01

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    ld bc, $ff00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    di
    inc c
    rst $38
    nop
    rst $38
    nop
    nop
    ret nz

    nop
    rst $38
    rst $38
    ccf
    jp nz, $cc7d

    ld [hl], e
    pop de
    ld l, [hl]
    ret nc

    ld l, a
    call z, $4273
    ld a, l
    ld [hl], c
    adc $ff
    rst $38
    ld b, b
    cp a
    adc h
    ld [hl], e
    ld b, $f9
    pop hl
    ld e, $10
    rst $28
    ld c, $f1
    pop bc
    ld a, $ff
    rst $38
    add b
    ld a, a
    inc c
    di
    ld b, $f9
    pop bc
    ld a, $20
    rst $18
    inc e
    db $e3
    add e
    ld a, h
    rst $38
    db $fc
    inc bc
    cp $1b
    and $0f
    ld a, [c]
    jp Jump_000_233e


    sbc $1e
    ld [c], a
    ld [bc], a
    rst $38
    xor h
    rst $30
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    db $ec
    or a
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_692d

jr_004_692d:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    rst $38
    nop
    rst $38
    nop
    sbc a
    ld h, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38

jr_004_695d:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rIE], a
    nop
    nop
    nop
    nop
    rst $38
    ret z

    ld [hl], a
    db $e4

jr_004_696f:
    ld e, e
    db $dd
    ld h, b
    ret nz

    ld a, a
    cp a
    ld a, a
    sbc [hl]
    ld a, a
    ld e, $7f
    nop
    rst $38
    jr nz, jr_004_695d

    db $10
    rst $28
    rst $30
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld b, b
    cp a
    jr nz, jr_004_696f

    rst $28
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add e
    ld a, [hl]
    ld b, a
    cp d
    db $db
    ld b, $03
    cp $fd
    cp $79
    cp $78
    cp $00
    rst $38
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    rst $38
    inc b
    cp $09
    db $fd
    dec de
    db $ed
    dec sp
    rst $28
    add hl, sp
    bit 7, h
    push bc
    ld a, [hl]
    rst $38
    ldh [rIE], a
    db $10
    ccf
    ret z

    rst $18
    db $ec
    db $db
    xor $fb
    adc $e9
    rra
    pop de
    ccf
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    ld a, [hl]
    add c
    nop
    rst $38
    ld a, [hl]
    add c
    nop
    rst $38
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    db $db
    inc h
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_6a3e:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_6a3e

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_004_6a75

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    jp $e37f


    ld a, h
    pop af
    ld e, [hl]
    call c, $ff6f

jr_004_6a75:
    inc hl
    rst $28
    jr nc, @-$03

    inc e
    rst $38
    rlca
    pop hl
    rst $38
    db $e3
    rra
    push bc
    ccf
    dec e
    ei
    rst $38
    ld [c], a
    ei
    ld b, $ef
    inc e
    rst $38
    ldh a, [$e2]
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3

jr_004_6ab3:
    dec de
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    scf
    db $ed
    scf
    xor $37
    rst $28
    jr c, jr_004_6ab3

    ccf
    ldh a, [$7f]
    rst $38
    ld b, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38

jr_004_6ad2:
    nop
    rst $38

jr_004_6ad4:
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38

jr_004_6ada:
    nop
    rst $38

jr_004_6adc:
    db $ec
    or a

jr_004_6ade:
    db $ec
    ld [hl], a
    db $ec
    rst $30
    inc e
    rst $30
    db $fc
    rrca
    cp $ff
    ld [bc], a
    rst $38
    ld bc, $e3ff
    jr c, jr_004_6ad2

    jr c, jr_004_6ad4

    jr c, jr_004_6b16

    ld hl, sp-$1d
    jr c, jr_004_6ada

    jr c, jr_004_6adc

    jr c, jr_004_6ade

    jr c, jr_004_6ad4

    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de

jr_004_6b16:
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    add $1d
    push bc
    ld e, $c7
    rra
    ret z

    rra
    ret nc

    rra
    add b
    jr nz, jr_004_6b48

    ld b, b
    ccf
    add b
    rst $28
    db $10
    rst $28
    db $10
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    ld [$08f7], sp
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop

jr_004_6b48:
    rst $38
    nop
    rst $38
    nop
    ld h, e
    cp b
    and e
    ld a, b
    db $e3
    ld hl, sp+$13
    ld hl, sp+$0b
    ld hl, sp+$01
    inc b
    ld hl, sp+$02
    db $fc
    ld bc, $dfd1
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_004_6ba3

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    rst $38
    rrca
    rst $30
    jr @+$3a

    jr nz, jr_004_6c22

jr_004_6ba3:
    rst $08
    cp b
    ret nc

    ld a, [c]
    and d
    ld [c], a
    and d
    xor $ae
    rst $38
    add b
    ld a, a
    ret nz

    ldh [rNR41], a
    ldh a, [$9f]
    add sp, $5f
    ld a, a
    cpl
    ccf
    jr z, @+$41

    jr z, @+$01

    rst $38
    cp a
    ret nz

    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    ret nz

    cp a
    add b
    rst $38
    cp a
    rst $38
    rst $38
    rst $38
    db $fd
    inc bc
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $fd03
    ld bc, $fdff
    rst $38
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_6bf0:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_6bf0

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    jr jr_004_6c27

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ldh a, [$a0]
    ld a, b
    ret nc

    rst $38
    rst $28

jr_004_6c22:
    rst $38
    db $10
    rrca
    rst $38
    rst $38

jr_004_6c27:
    rst $38
    cp $01
    rst $38
    rst $38
    ld a, b
    cpl
    ldh a, [$5f]
    rst $38
    cp a
    rst $38
    ld b, b
    nop
    rst $38
    rst $38
    rst $38
    cp $01
    rst $38
    rst $38
    cp a
    ldh [$a1], a
    rst $38
    and c
    cp $bf
    rst $38
    cp a
    ldh [$a1], a
    rst $38
    and c
    cp $bf
    rst $38
    db $fd
    rlca
    add l
    rst $38
    add l
    ld a, a
    db $fd
    rst $38
    db $fd
    rlca
    add l
    rst $38
    add l
    ld a, a
    db $fd
    rst $38
    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    cp a
    rst $38
    and a
    rst $20
    cp a
    push hl
    and a
    push hl
    and a
    push hl
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    push hl
    rst $20
    db $fd
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    dec h
    rst $20
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
    rst $38
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    and a
    rst $20
    cp a
    rst $20
    and h
    rst $20
    and h
    rst $20
    and h
    rst $20
    cp a
    rst $38
    sbc a
    ldh [$bf], a
    rst $38
    db $fd
    rst $38
    push hl
    rst $20
    db $fd
    and a
    push hl
    and a
    push hl
    and a
    db $fd
    rst $38
    ld sp, hl
    rlca
    db $fd
    rst $38
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    cp $ff
    db $dd
    db $e3
    xor l
    pop de
    and l
    reti


    add l
    ld sp, hl
    xor c
    pop de
    adc a
    pop af
    sub l
    jp hl


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, sp+$07
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    ld sp, hl
    ld b, $ff
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    cp e
    rst $00
    or l
    adc e
    and l
    sbc e
    and c
    sbc a
    sub l
    adc e
    pop af
    adc a
    xor c
    sub a
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    add l
    ld sp, hl
    add c
    ld sp, hl
    sub l
    jp hl


    sub l
    jp hl


    add l
    ld sp, hl
    add e
    pop bc
    dec h
    sbc c
    ld e, d
    and l
    ld a, [$d500]
    nop
    xor d
    nop
    ld d, l
    nop
    and b
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    cp a
    nop
    ld d, a
    nop
    xor e
    nop
    ld d, l
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    ld bc, $a100
    sbc a
    add c
    sbc a
    xor c
    sub a
    xor c
    sub a
    and c
    sbc a
    pop bc
    add e
    and h
    sbc c
    ld e, d
    and l
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    add c
    nop
    rst $38
    rst $38
    sbc $e1
    add e
    ld a, h
    ld hl, sp+$07
    cp $01
    cp $01
    cp $01
    cp $01
    add c
    cp $f0
    rst $38
    ret nc

    ccf
    cp h
    ld a, a
    ld [hl], a
    adc a
    ld a, d
    add a
    ld a, a
    add e
    dec a
    jp Jump_004_7f80


    ld [bc], a
    rst $38
    ld b, d
    rst $38
    rst $20
    rst $38
    cp h
    rst $38
    nop
    rst $38
    inc b
    rst $38
    adc a
    rst $38
    ld e, c
    rst $38
    ld [hl], c
    rst $38
    jp $8bff


    cp $0f
    rst $38
    rra
    db $fd
    ccf
    pop af
    rst $38
    di
    rra
    rra
    ld a, [hl+]
    inc [hl]
    ld a, l
    ld b, b
    db $db
    and b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    rst $38
    cp a
    ret nz

    ldh a, [$80]
    ldh a, [$9f]
    ldh a, [$9f]
    rst $38
    sbc a
    rst $38
    sbc a
    rst $38
    sbc a
    cp $ff
    db $fd
    inc bc
    rrca
    ld bc, $f90f
    rrca
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    ld hl, sp-$08
    ld d, h
    inc l
    cp [hl]
    ld [bc], a
    db $db
    dec b
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    sbc d
    rst $38
    adc [hl]

jr_004_6ff1:
    rst $38
    jp $d1ff


    ld a, a
    ldh a, [rIE]
    ld hl, sp-$41
    db $fc
    adc a
    rst $38
    rst $08
    ld bc, $10fe
    rst $38
    db $10
    rst $38
    ld hl, sp-$01
    rrca
    rst $38
    nop
    rst $38
    add b
    rst $38
    db $e3
    rst $38
    add b
    ld a, a
    inc bc
    rst $38
    ld b, l
    cp $ee
    rst $38
    or a
    ld hl, sp+$2e
    pop af
    ld e, [hl]
    pop hl
    sbc $e1
    rst $38
    rst $38
    cp l
    jp Jump_000_1ee1


    adc a
    ld [hl], b
    rra
    ldh [$3f], a
    ret nz

    ccf
    ret nz

    ccf
    ret nz

    ret nz

    add b
    ldh a, [$e0]
    ret nc

    jr c, jr_004_6ff1

    ld a, h
    db $76
    adc [hl]
    ld a, e
    add [hl]
    ld a, a
    add e
    dec a
    jp $ffff


    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [rIE], a
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $fc
    inc bc
    ld [hl], b
    adc a
    nop
    rst $38
    dec de
    db $e4
    ccf
    ret nz

    ei
    inc b
    ld sp, hl
    ld b, $b0
    ld c, a
    dec a
    jp $8779


    ld sp, hl
    rlca
    db $db
    daa
    db $d3
    cpl
    adc d
    ld a, a
    adc a
    ld a, a
    dec c
    rst $38
    ld a, b
    rst $38
    ld bc, $44fe
    ccf
    ld c, a
    ccf
    ret


    ccf
    sbc b
    ld a, a
    ld [hl], b
    rst $38
    jp $d2fc


    ccf
    xor l
    ld e, $d7
    inc c
    ld a, l
    add [hl]
    pop de
    xor $7a
    db $fc
    db $fc
    nop
    nop
    nop
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    res 6, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    sbc a
    cp a
    add b
    add b
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    cp a
    rst $38
    ldh [rIE], a
    rst $38
    ld a, a
    rst $30
    ld sp, hl
    db $fd
    ld bc, $0301
    inc bc
    rst $38
    rst $38
    rst $38
    db $fd
    rst $38
    rlca
    rst $38
    rst $38
    cp $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $d3
    dec c
    db $ed
    ld a, b
    ret c

    jr nc, jr_004_7174

    jr nc, jr_004_718b

    ld hl, $372b
    inc a
    rra
    inc bc
    nop
    nop
    nop
    adc a
    ld a, a
    db $fc
    inc bc
    xor b
    ld [hl], b
    ldh a, [$f8]
    sub h
    ld hl, sp+$0b
    db $fc
    rst $30
    ld c, $7b
    rlca
    sbc [hl]
    pop hl
    sbc a
    ldh [$8f], a
    ldh a, [$cf]
    ldh a, [$c5]
    ld a, [$fe51]
    ldh a, [rIE]
    or d
    rst $38
    inc e
    db $e3
    nop
    rst $38
    nop
    rst $38
    and $19
    rst $38
    nop
    rst $38
    nop
    cp e
    ld b, h
    inc de
    db $ec
    rst $10
    ret nc

    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    xor e
    jr c, @+$47

    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    push de
    inc e
    and d
    ld a, $41
    ld a, a

jr_004_7174:
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    db $eb
    dec bc
    db $d3

jr_004_7181:
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc

jr_004_718b:
    ei
    inc bc
    ei
    nop
    nop
    ld a, h
    jr c, jr_004_7181

    ld b, h
    add $82
    xor [hl]
    add $ca
    cp [hl]
    or d
    sbc $b2
    sbc $c0
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    call z, $d3df
    db $d3
    db $ec
    ldh [$ef], a
    ldh [$d7], a
    ret nc

    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    add $ff
    add hl, hl
    add hl, sp
    sub $10
    rst $10
    db $10
    xor e
    jr c, jr_004_71bf

jr_004_71bf:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, e
    rst $38
    sub h
    sbc h
    ld l, e
    ld [$08eb], sp
    push de
    inc e
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc sp
    ei
    set 1, e
    scf
    rlca
    rst $30
    rlca
    db $eb
    dec bc
    cp d
    sub $fa
    sub [hl]
    db $db
    or [hl]
    db $db
    or [hl]
    jp nc, $f5bf

    ld e, [hl]
    ld a, d
    inc a
    inc c
    nop
    call $ceb0
    or b
    rst $18
    and b
    sbc $a1
    cp $81
    cp h
    jp $e7d8


    rst $28
    ldh a, [rIE]
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    or e
    dec c
    ld [hl], e
    dec c
    ei
    dec b
    ld a, e
    add l
    ld a, a
    add c
    dec a
    jp $e71b


    rst $30
    rrca
    set 3, b
    call nz, $c3dc
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld b, l
    ld a, h
    add d
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    ld a, $41
    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    db $d3
    dec de
    inc hl
    dec sp
    jp Jump_000_03fb


    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    ld b, d
    add c
    and l
    ld b, d
    jp $ff3c


    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    add b
    rst $38
    rst $08
    or b
    cp c
    add $ff
    rst $38
    sbc a
    rst $30
    rst $38
    sub a
    rst $38
    sub a
    rst $38
    rst $38
    ld bc, $f3ff
    dec c
    sbc l
    ld h, e
    rst $38
    rst $38
    ld sp, hl
    rst $28
    rst $38
    jp hl


    rst $38
    jp hl


    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    ccf
    rst $18
    ccf
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    db $fc
    rst $38
    ei
    db $fc
    nop
    nop
    ld b, b
    add b
    adc b
    ld [hl], b
    db $f4
    ld [$04f8], sp
    ld hl, sp+$04
    ld a, [$fc04]
    ld [bc], a
    ld bc, $0700
    inc bc
    dec c
    ld b, $0e
    rra
    scf
    jr c, @+$30

    ld [hl], c
    ld e, [hl]
    ld h, c
    ld e, [hl]
    pop hl
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    db $dd
    pop bc
    jp c, $d4c3

    rst $00
    ret z

    rst $08
    pop de
    rst $18
    rst $38
    rst $38

jr_004_72e0:
    rst $38
    rst $38
    add b
    add b
    rlca
    rst $38
    jr jr_004_72e0

    ld h, a
    ldh [$9f], a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld bc, $e001
    rst $38
    jr jr_004_7317

    and $07
    ld sp, hl
    ld bc, $00fe
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    cp e
    add e
    ld e, e
    jp $e32b


    inc de
    di
    adc e
    ei
    rst $18
    nop
    adc a
    ld h, b
    ld c, d
    inc [hl]
    ld h, h
    sbc c
    dec h

jr_004_7317:
    jp c, $7689

    xor e
    ld d, h
    ei
    inc b
    rst $38
    sub a
    ld hl, sp-$70
    rst $28
    sbc a
    rst $38
    add b
    rst $38
    rst $38
    adc b
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    jp hl


    rra
    add hl, bc
    rst $30
    ld sp, hl
    rst $38
    ld bc, $ffff
    ld de, $ffff
    rst $38
    rst $38
    nop
    rst $18
    ccf
    ld e, a
    cp a
    ld e, a
    cp a
    rst $18
    ccf
    sbc a
    ld a, a
    sbc a
    ld a, a
    ret nc

    ccf
    rst $28
    ldh a, [$fb]
    db $fc
    ld a, [$fafd]
    db $fd
    ei
    db $fc
    ld sp, hl
    cp $f9
    cp $0b
    db $fc
    rst $30
    rrca
    db $fc
    ld [bc], a
    ld a, [$f404]
    ld [$08f0], sp
    ldh a, [$08]
    db $f4
    ld [$04fa], sp
    db $fc
    ld [bc], a
    ld [c], a
    cp $c5
    call c, $dcc5
    set 3, b
    set 3, b
    rst $10
    ret nc

jr_004_737a:
    rst $10
    ret nc

    rst $10
    ret nc

    ld b, a
    ld a, a
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de

jr_004_7386:
    db $d3
    dec de
    db $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    ei
    nop
    pop af
    ld b, $52
    inc l
    ld h, $99
    and h
    ld e, e
    sub c
    ld l, [hl]
    push de
    ld a, [hl+]
    rst $18
    jr nz, jr_004_737a

    nop
    cp l
    nop
    ld a, [hl]
    nop
    rst $38
    nop
    inc a
    add c
    sbc c
    ld b, d
    jp $e724


    jr jr_004_7386

    ret nc

    rst $10
    ret nc

    rst $10
    ret nc

    set 3, b
    set 3, b
    push bc
    call c, $dcc5
    ld [c], a
    cp $eb
    dec bc
    db $eb
    dec bc
    db $eb
    dec bc
    db $d3
    dec de
    db $d3
    dec de
    and e
    dec sp
    and e
    dec sp
    ld b, a
    ld a, a
    pop de
    rst $18
    ret z

    rst $08
    call nc, $dac7
    jp $c1dd


    ret nz

    ret nz

    rst $38
    rst $38
    ret nz

    rst $18
    ld a, a
    nop
    sbc a
    add b
    ld h, a
    ldh [rNR23], a
    ld hl, sp+$07
    rst $38
    add b
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    cp $00
    ld sp, hl
    ld bc, $07e6
    jr jr_004_7415

    ldh [rIE], a
    ld bc, $03ff
    rst $38
    nop
    rst $38

jr_004_73fe:
    adc e
    ei
    inc de
    di
    dec hl
    db $e3
    ld e, e
    jp $83bb


    inc bc
    inc bc
    rst $38
    rst $38
    inc bc
    ei
    nop
    nop
    nop

Jump_004_7411:
    nop
    nop
    nop
    nop

jr_004_7415:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $00
    jr z, jr_004_7428

    sub c
    ld [$8853], sp

jr_004_7428:
    ld l, $41
    jr z, jr_004_742e

    nop
    nop

jr_004_742e:
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    nop
    rst $38
    nop
    rst $38

jr_004_7442:
    nop
    rst $38
    nop
    rst $38
    rlca
    rst $38
    jr jr_004_7442

    ld h, a
    ldh [$9f], a
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_004_7456:
    ldh [rIE], a
    jr jr_004_7479

    and $07
    ld sp, hl
    ld bc, $fb03
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    nop
    nop
    ld h, b
    nop
    inc d
    jr nz, jr_004_73fe

    db $10
    jp z, Jump_004_7411

jr_004_7479:
    add d
    inc d
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0200
    ld bc, $0305
    nop
    nop
    jr jr_004_7492

jr_004_7492:
    inc a
    nop
    rst $38
    nop
    rst $20
    jr jr_004_7456

    ld a, [hl]
    rst $38
    rst $38
    db $db
    rst $20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ld b, b
    add b
    and b
    ret nz

    pop bc
    rst $18
    jp nz, $c2de

    sbc $c5
    call c, $dcc5
    set 3, b
    set 3, b
    set 3, b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add e
    ei
    ld b, e
    ld a, e
    ld b, e
    ld a, e
    and e
    dec sp
    and e
    dec sp
    db $d3
    dec de
    db $d3
    dec de
    db $d3
    dec de
    dec b
    inc bc
    dec bc
    rlca
    rla
    rrca
    ld c, $07
    inc bc
    ld b, $06
    inc bc
    dec b
    inc bc
    rlca
    ld bc, $00ff
    di
    nop
    db $e4
    nop
    rrca
    nop
    rst $38
    nop
    ld a, h
    nop
    inc sp
    nop
    adc a
    nop
    and b
    ret nz

    ret nc

    ldh [$e8], a
    ldh a, [rSVBK]
    ldh [$c0], a
    ld h, b
    ld h, b
    ret nz

    and b
    ret nz

    ldh [$80], a
    db $db
    ret c

    db $eb
    add sp, -$35
    ret z

    push bc
    call nz, $dcdd
    and $e6
    jp nz, $cfc2

    rst $08
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    db $db
    dec de
    rst $10
    rla
    db $d3
    inc de
    and e
    inc hl
    cp e
    dec sp
    ld h, a
    ld h, a
    ld b, e
    ld b, e
    di
    di
    db $ec
    db $ec
    ldh [$e0], a
    rst $18
    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    sbc a
    add b
    rst $20
    ldh [$98], a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld sp, hl
    ld bc, $07e7
    add hl, de
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    scf
    scf
    rlca
    rlca
    ei
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    dec b
    inc bc
    ld [bc], a
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $db
    rst $20
    rst $38
    rst $38
    cp l
    ld a, [hl]
    rst $20
    jr @+$01

    nop
    inc a
    nop
    jr jr_004_75bc

jr_004_75bc:
    nop
    nop
    and b
    ret nz

    ld b, b
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    rst $18
    db $dd
    jp nz, $d6dd

    ret


    sub $c9
    sub $c9
    sub $c9
    rst $18
    ret nz

    rst $18
    nop
    rst $38
    db $dd
    ld [hl+], a
    db $dd
    xor d
    db $dd
    ld h, d
    db $dd
    xor d
    ld d, l
    xor d
    ld d, l
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub h
    ld l, e
    sub $a9
    ld d, a
    xor d
    ld d, l
    xor e
    call nc, $946b
    rst $38
    nop
    rst $38
    inc bc
    ei
    cp e
    ld b, e
    cp e
    ld e, e
    xor e
    ld d, e
    xor e
    ld d, e
    cp e
    ld b, e
    cp e
    ei
    inc bc
    ei
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    jp $a53c


    ld b, d
    ld b, d
    add c
    nop
    nop
    db $fc
    ld [bc], a
    ld a, [$f804]
    inc b
    ld hl, sp+$04
    db $f4
    ld [$7088], sp
    ld b, b
    add b
    nop
    nop
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    ld e, l
    and d
    ld e, l
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    or [hl]
    ld c, c
    rst $38
    nop
    rst $38
    nop
    nop
    pop de
    ld l, $db
    db $e4
    sbc a
    ld l, d
    sub l
    xor $d1
    ld l, $d1
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    ret nz

    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    xor $11
    xor $75
    adc d
    ld [hl], l
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    ld [$ea15], a
    push de
    ld l, [hl]
    or c
    rst $38
    rst $38
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    rst $18
    jp $c3dc


    db $dd
    jp nz, $8add

    ld [hl], l
    xor $11
    xor $ff
    nop
    rst $38
    nop
    rst $38
    cp d
    ld b, l
    cp e
    call nc, $d52b
    adc $7b
    db $e4
    dec de
    db $e4
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld e, c
    and [hl]
    ld e, l
    xor d
    push de
    ld a, [hl+]
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    jp $c33b


    cp e
    ld b, e
    cp e
    jp nz, $c3dd

    call c, $dfc3
    ret nz

    rst $18
    ret nz

    rst $18
    adc $d1
    adc $d7
    jp z, Jump_000_2ad5

    push de
    cp d
    ld b, l
    cp d
    rst $38
    nop
    rst $38
    nop
    rst $38
    add sp, $17
    db $ed
    ld d, d
    rst $28
    dec d
    push de
    xor d
    ld e, l
    and [hl]
    ld e, c
    rst $38
    nop
    rst $38
    nop
    rst $38
    xor c
    ld d, [hl]
    xor l
    ld d, d
    xor a
    ld d, h
    ld b, e
    cp e
    jp $c33b


    ei
    inc bc
    ei
    inc bc
    ei
    ld [hl], e
    adc e
    ld [hl], e
    cp e
    ld d, e
    xor e
    jp z, $ced5

    pop de
    adc $df
    ret nz

    rst $18
    ret nz

    rst $18
    ret nz

    ret nz

    rst $38
    rst $38
    rst $38
    rst $38
    ld [$a857], a
    ld d, a
    xor b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    xor e
    ld d, [hl]
    xor c
    ld d, [hl]
    xor c
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    ld d, e
    xor e
    ld [hl], e
    adc e
    ld [hl], e
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ret nc

    add hl, de
    ld [$1021], sp
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_785e

jr_004_785e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_786a

jr_004_786a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_7882

jr_004_7882:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_788e

jr_004_788e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_789a

jr_004_789a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_78b2

jr_004_78b2:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_78ca

jr_004_78ca:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_78d6

jr_004_78d6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld c, $20
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_78ee

jr_004_78ee:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_78fa

jr_004_78fa:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    add hl, bc
    jr nz, jr_004_7906

jr_004_7906:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld a, [de]
    ld d, b
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [hl+], a
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld hl, $0010
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rra
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c12

jr_004_7c12:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c1e

jr_004_7c1e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c2a

jr_004_7c2a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c36

jr_004_7c36:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c42

jr_004_7c42:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c4e

jr_004_7c4e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c5a

jr_004_7c5a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c66

jr_004_7c66:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c72

jr_004_7c72:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7c7e

jr_004_7c7e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c8a

jr_004_7c8a:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7c96

jr_004_7c96:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    rlca
    jr nz, jr_004_7ca2

jr_004_7ca2:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7cae

jr_004_7cae:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7cba

jr_004_7cba:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld [bc], a
    jr nz, jr_004_7cc6

jr_004_7cc6:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    daa
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld h, $10
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    inc h
    stop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop

jr_004_7d6e:
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    ld e, d
    nop
    nop
    adc a
    ld [hl], a
    adc a
    ld a, d
    ld c, a
    ld a, e
    rst $08
    ld a, h
    ld c, a
    ld a, b
    ld c, a
    ld a, b
    rrca
    ld a, h
    rrca
    ld a, h
    rrca
    ld a, c
    rrca
    ld a, c
    rrca
    ld a, c
    rrca
    ld a, c
    rst $08
    ld a, c
    rst $08
    ld a, c
    rst $08
    ld a, c
    rst $08
    ld a, c
    nop
    ret nz

    or e
    add b
    nop
    ld b, b
    or h
    add b
    nop
    nop
    add hl, bc
    ret nz

    nop
    jr nc, jr_004_7d6e

    ret nz

    nop
    ld [hl], b
    or b
    ret nz

    nop
    or b
    or b
    ret nz

    nop
    nop
    or b
    add b
    nop
    ld b, b
    or b
    add b
    nop
    add b
    or b
    add b
    nop
    ret nz

    or b
    add b
    inc e
    add b
    or d
    ret nz

    add hl, de
    add b
    or l
    add b
    ld b, a
    nop
    or a
    add b
    dec d
    ld h, b
    or a
    ret nz

    nop
    add b
    nop
    add b
    add b
    jr nz, jr_004_7def

    ret nz

jr_004_7def:
    add b
    jr nz, jr_004_7df4

    ret nz

    add b

jr_004_7df4:
    jr nz, @+$05

    ret nz

    add b
    jr nz, jr_004_7dfe

    ret nz

    add b
    jr nz, jr_004_7e03

jr_004_7dfe:
    ret nz

    add b
    jr nz, jr_004_7e08

    ret nz

jr_004_7e03:
    nop
    jr nz, @+$09

    add b
    nop

jr_004_7e08:
    jr nz, jr_004_7e12

    add b
    nop
    jr nz, jr_004_7e17

    add b
    nop
    jr nz, jr_004_7e1c

jr_004_7e12:
    add b
    nop
    jr nz, @+$0d

    add b

jr_004_7e17:
    nop
    jr nz, jr_004_7e26

    add b
    nop

jr_004_7e1c:
    jr nz, jr_004_7e2b

    add b
    nop
    jr nz, jr_004_7e30

    add b
    nop
    jr nz, jr_004_7e35

jr_004_7e26:
    add b
    sub c
    ld [hl], b
    jr nz, jr_004_7e4b

jr_004_7e2b:
    jr nz, jr_004_7e4d

    jr nz, jr_004_7e4f

    sub c

jr_004_7e30:
    ld h, b
    rra
    rra
    rra
    rra

jr_004_7e35:
    rra
    rra
    sub c
    nop
    inc e
    inc e
    inc e
    inc e
    inc e
    inc e
    sub d
    nop
    jr nz, jr_004_7e63

    jr nz, jr_004_7e65

    jr nz, jr_004_7e67

    ld [hl], c
    nop
    jr jr_004_7e63

jr_004_7e4b:
    jr jr_004_7e65

jr_004_7e4d:
    jr jr_004_7e67

jr_004_7e4f:
    sub h
    nop
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    or c
    nop
    jr jr_004_7e73

    jr jr_004_7e75

    jr jr_004_7e77

    or c
    add b
    jr jr_004_7e7b

jr_004_7e63:
    jr jr_004_7e7d

jr_004_7e65:
    jr jr_004_7e7f

jr_004_7e67:
    or c
    add b
    db $10
    rrca
    rrca
    rrca
    rrca
    rrca
    sub c
    add b
    jr nz, @+$22

jr_004_7e73:
    jr nz, jr_004_7e95

jr_004_7e75:
    jr nz, jr_004_7e97

jr_004_7e77:
    pop bc
    ld b, b
    db $10
    rrca

jr_004_7e7b:
    rrca
    rrca

jr_004_7e7d:
    rrca
    rrca

jr_004_7e7f:
    or c
    ld d, [hl]
    dec de
    ld c, $11
    cp $00
    nop
    or a
    nop
    dec c
    dec bc
    add hl, bc
    rlca
    rlca
    rlca
    or a
    add b
    ld [$0607], sp
    dec b

jr_004_7e95:
    inc b
    inc b

jr_004_7e97:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, $cccc
    call z, $cccc
    call z, $33cc
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    inc sp
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    adc b
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], a
    rst $38
    rst $38
    call z, $ffcc
    rst $38
    call z, Call_000_00cc
    nop
    inc sp
    inc sp
    nop
    nop
    inc sp
    inc sp
    cp $dc
    cp d
    sbc b
    db $76
    ld d, h
    ld [hl-], a
    db $10
    ld bc, $4523
    ld h, a
    adc c
    xor e
    call $ffef
    rst $38
    cp d
    sbc b
    xor c
    add a
    ld [hl-], a
    db $10
    inc [hl]
    ld d, [hl]
    ld b, l
    ld h, a
    cp h
    sbc $cd
    rst $28
    rst $38
    xor $dd
    call z, $aabb
    sbc c
    adc b
    ld [hl], a
    ld h, [hl]
    ld d, l
    ld b, h
    inc sp
    ld [hl+], a
    ld de, $ff00

Jump_004_7f80:
    cp $fd
    db $fc
    ei
    ld a, [$f8f9]
    rst $20
    sub $c5
    or h
    and e
    sub d
    add c
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    adc [hl]
    ld [hl], a
    adc a
    ld a, l
    sub a
    ld a, l
    sbc a
    ld a, l
    and a
    ld a, l
    xor a
    ld a, l
    db $eb
    ld a, l
    daa
    ld a, [hl]
    ld l, [hl]
    ld [hl], a
    sbc a
    ld a, [hl]
    rst $38
    db $e4
    nop
    ld [hl+], a
    ld bc, $d930
    and h
    ld [hl+], a
    add hl, de
    nop
    reti


    and [hl]
    ld [hl+], a
    add hl, hl
    nop
    reti


    xor d

jr_004_7fc6:
    ld [hl+], a
    rrca
    and b
    reti


    xor b
    ld [hl+], a
    nop
    sbc b
    reti


    xor h
    ld [hl+], a
    nop
    db $e4
    reti


    xor [hl]
    ld [hl+], a
    nop
    ret nc

    reti


    or b
    ld [hl+], a
    ld b, b
    nop
    reti


    or d
    ld [hl+], a
    rlca
    nop
    reti


    or h
    ld [hl+], a
    ld [bc], a
    nop
    reti


    or [hl]
    ld [hl+], a
    ld c, [hl]
    jr nz, jr_004_7fc6

    cp b
    ld [hl+], a
    nop
    db $10
    jp c, Jump_000_2234

    nop
    ld [$bed9], sp
    ld [hl+], a
    nop
    ld bc, $1eda
    dec bc
    nop
    rst $38
