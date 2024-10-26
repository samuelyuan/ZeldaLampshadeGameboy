SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

    dec h
    ld a, [bc]
    ld a, a
    or a
    inc b
    ld h, c
    ld d, a
    ld bc, $0027
    ld bc, $21af
    inc e
    push bc
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
    ld hl, _func_bank00a_4029
    jp RST_08

_func_bank00a_4029:
    ld hl, _camera_deadzone_y
    ld [hl], $00
    ld hl, _camera_deadzone_x
    ld [hl], $00
    ld hl, _camera_settings
    ld [hl], $03
    ret

_input_init:
    ld de, $0005
    push de
    ld de, $0000
    push de
    ld de, _JOYPADS
    push de
    call _memset
    add sp, $06
    ld hl, _LAST_JOY
    ld [hl], $00
    ld hl, _FRAME_JOY
    ld [hl], $00
    ld hl, _RECENT_JOY
    ld [hl], $00
    ld hl, _JOYPADS
    ld [hl], $01
    ret

_remove_LCD_ISRs:
    di
    ld de, $1b24
    push de
    call _remove_LCD
    pop hl
    ld de, $177c
    push de
    call _remove_LCD
    pop hl
    ld de, $17f8
    push de
    call _remove_LCD
    pop hl
    ldh a, [rLCDC]
    and $ef
    ldh [rLCDC], a
    ei
    ret

_palette_init:
    ; DMG_palette[0] = DMG_palette[2] = DMG_PALETTE(3, 2, 1, 0);
    ld hl, _DMG_palette + 2
    ld [hl], $1b
    ld hl, _DMG_palette
    ld [hl], $1b
    ; DMG_palette[1] = DMG_PALETTE(3, 1, 0, 2);
    ld hl, _DMG_palette + 1
    ld [hl], $87
    ret

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

_SIO_init:
    ld hl, _link_operation_mode
    ld [hl], $00
    ld hl, _link_packet_len
    ld [hl], $00
    ld bc, _link_packet
    ld hl, _link_packet_ptr
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _link_packet_received
    ld [hl], $00
    ld hl, _link_packet_snd_len
    ld [hl], $00
    ld hl, _link_packet_snd_ptr
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld hl, _link_packet_sent
    ld [hl], $00
    ret

PCWorldOutsideSign:: ; 0x40dd
    INCLUDE "src/scripts/outsideshop/pcworld_outsidesign.asm"

JasperDialogue::   ; bank 0a 0x410d
    INCLUDE "src/scripts/outsideshop/jasper.asm"

GraveyardTombstoneDialogue:: ; bank 0a: 0x4137
    INCLUDE "src/scripts/graveyard/tombstone.asm"

PCWorldInsideSign::; 0x4167
    INCLUDE "src/scripts/pcworld/insidesign.asm"
    
GraveyardMapDraw:: ; 0x4197
    db $14, $12 
    ; bank 3: 0x502f image
    db $03, $2f, $50, $00, $00, $00
    ; bank 7: 0x58a8 tilemap
    db $07, $ea, $58, $00, $00, $00

JTHouseInsideMapDraw:: ; 0x41a5
    db $14, $12 
    ; bank 4: 0x4000 image
    db $04, $00, $40, $00, $00, $00
    ; bank 8: 0x4159 tilemap
    db $08, $59, $41, $00, $00, $00
    
JTHouseOutsideMapDraw:: ; bank 0a: 0x41b3
    db $14, $12 
    ; bank 6: 0x5a14 image
    db $06, $14, $5a, $00, $00, $00
    ; bank 8: 0x42c1 tilemap
    db $08, $c1, $42, $00, $00, $00
    
WellMapDraw:: ; bank 0a 0x41c1
    db $14, $12 
    ; bank 6: 0x60d6 image
    db $06, $d6, $60, $00, $00, $00 
    ; bank 8: 0x4429 tilemap
    db $08, $29, $44, $00, $00, $00
    
DimHouseInsideMapDraw:: ; bank 0a: 0x41cf
    db $14, $12 
    ; bank 4: 0x4892 image
    db $04, $92, $48, $00, $00, $00
    ; bank 8: 0x4591 tilemap
    db $08, $91, $45, $00, $00, $00
    
DimHouseOutsideMapDraw:: ; bank 0a: 0x41dd
    db $14, $12 
    ; bank 4: 0x50a4 image
    db $04, $a4, $50, $00, $00, $00
    ; bank 8: 0x46f9 tilemap
    db $08, $f9, $46, $00, $00, $00
    
NgHeadquartersInsideMapDraw:: ; 0x41eb
    db $14, $12 
    ; bank 4: 0x58c6 image
    db $04, $c6, $58, $00, $00, $00
    ; bank 8: 0x4861 tilemap
    db $08, $61, $48, $00, $00, $00
    
NgHeadquartersOutsideMapDraw:: ; bank 0a 0x41f9
    db $14, $12 
    ; bank 6: 0x67a8 image
    db $06, $a8, $67, $00, $00, $00
    ; bank 8: 0x49c9 tilemap
    db $08, $c9, $49, $00, $00, $00
    
PCWorldMapDraw:: ; bank 0a 0x4207
    db $14, $12 
    ; bank 1: 0x61dc image
    db $01, $dc, $61, $00, $00, $00
    ; bank 8: 0x4b31 tilemap
    db $08, $31, $4b, $00, $00, $00
    
McdonaldsMapDraw:: ; 0x4215
    db $14, $12 ; bank 0a 0x4215
    ; bank 4: 0x5f28 image
    db $04, $28, $5f, $00, $00, $00
    ; bank 8: 0x4c99 tilemap
    db $08, $99, $4c, $00, $00, $00

OutsideShopMapDraw:: ; 0x4223
    db $14, $12
    ; bank 5: 0x4d69 image
    db $05, $69, $4d, $00, $00, $00
    ; bank 8: 0x4e01 tilemap
    db $08, $01, $4e, $00, $00, $00
    
 JRInsideMapDraw:: ; 0x4231 
    db $14, $12 
    ; bank 4: 0x676a image
    db $04, $6a, $67, $00, $00, $00
    ; bank 8: 0x4f69 tilemap
    db $08, $69, $4f, $00, $00, $00
    
JROutsideMapDraw:: ; 0x423f 
    db $14, $12 
    ; bank 4: 0x6f5c image
    db $04, $5c, $6f, $00, $00, $00
    ; bank 8: 0x50d1 tilemap
    db $08, $d1, $50, $00, $00, $00
    
BridgeMapDraw:: ; bank 0a: 0x424d
    db $14, $12 
    ; bank 5: 0x548b image
    db $05, $8b, $54, $00, $00, $00
    ; bank 8: 0x5239 tilemap
    db $08, $39, $52, $00, $00, $00

DefeatedLampshadeBossScreenMapDraw:: ; bank 0a: 0x425b
    db $14, $12 
    ; bank 6: 0x6eaa image
    db $06, $aa, $6e, $00, $00, $00
    ; bank 8: 0x53a1 tilemap
    db $08, $a1, $53, $00, $00, $00

LampshadeBossRoomMapDraw:: ; bank 0a: 0x4269 
    db $14, $12 
    ; bank 3: 0x58f1 image
    db $03, $f1, $58, $00, $00, $00
    ; bank 8: 0x5509 tilemap
    db $08, $09, $55, $00, $00, $00

 RoomBeforeLampshadeBossMapDraw:: ; bank 0a: 0x4277
    db $14, $12 
    ; bank 5: 0x5c1d image
    db $05, $1d, $5c, $00, $00, $00
    ; bank 8: 0x5671 tilemap
    db $08, $71, $56, $00, $00, $00

TempleLightInsideMapDraw:: ; bank 0a: 0x4285
    db $14, $12 
    ; bank 6: 0x738c images
    db $06, $8c, $73, $00, $00, $00
    ; bank 8: 0x57d9 tilemap
    db $08, $d9, $57, $00, $00, $00

 TempleLightOutsideMapDraw:: ; bank 0a: 0x4293
    db $14, $12 
    ; bank 5: 0x636f image
    db $05, $6f, $63, $00, $00, $00
    ; bank 8: 0x5941 tilemap
    db $08, $41, $59, $00, $00, $00
    
GameFinishedScreenMapDraw:: ; bank 0a: 0x42a1 
    db $14, $12 
    ; bank 6: 0x7a7e image
    db $06, $7e, $7a, $00, $00, $00
    ; bank 8: 0x5aa9 tilemap
    db $08, $a9, $5a, $00, $00, $00

TitleScreenMapDraw:: ; bank 0a: 0x42af
    db $14, $12 
    ; bank 1: 0x697e image
    db $01, $7e, $69, $00, $00, $00
    ; bank 8: 0x5c11 tilemap
    db $08, $11, $5c, $00, $00, $00

CursorImage:: ; 0x42bd
    INCBIN "gfx/bank00a_cursor_42bd.2bpp"

GraveyardTransition:: ; 0x42cd
    db $0f, $0a, $01, $04
    db $0a, $f5, $45, $01 ; bank 0a 0x45f5 JT House Outside
    db $09, $0e, $01, $02
    db $0a, $7f, $4a, $03 ; bank 0a 0x4a7f unknown
    db $0c, $0e, $01, $02
    db $0a, $b1, $4a, $03 ; bank 0a 0x4ab1 unknown
    
PcWorldSprites:: ; 0x42e5
    db $0a, $9b, $45
    db $09, $6d, $79
    db $09, $02, $75
    db $08, $29, $7d
    
PCWorldTransition:: ;0x42f1
    db $07, $11, $02, $01
    db $0a, $a1, $48, $01 ; bank 0a 0x48a1 OutsideShop
    db $0a, $06, $02, $01
    db $0a, $ab, $49, $03 ; bank 0a 0x49ab unknown
    
McdonaldsSprites:: ; 0x4301
    db $09, $94, $7e
    db $09, $f0, $79
    db $08, $29, $7d
    
McdonaldsTransition:: ; 0x430a
    db $07, $11, $02, $01
    db $0a, $ed, $48, $01 ; bank 0a 0x48ed OutsideShop
    db $0a, $06, $02, $01
    db $09, $86, $7f, $03 ; bank 9 0x786f unknown
    
JRInsideSprites:: ; 0x431a
    db $09, $ea, $78
    db $09, $17, $77
    db $08, $29, $7d
    
JRInsideTransition:: ; 0x4323
    db $07, $11, $02, $01
    db $0a, $39, $49, $01 ; bank 0a 0x4939 JR Outside
    
JTHouseInsideSprites:: ; 0x432b
    db $09, $d6, $6c
    db $09, $ad, $6e
    db $08, $29, $7d
    db $0a, $9b, $45

JTHouseInsideTransition:: ; 0x4337
    db $09, $11, $02, $01
    db $0a, $97, $47, $01 ; bank 0a 0x4797 JTHouseOutside
    
DimHouseInsideSprites:: ; 0x433f
    db $09, $d1, $6f
    db $08, $29, $7d
    db $0a, $9b, $45

DimHouseInsideTransition:: ; 0x4348
    db $07, $11, $02, $01
    db $0a, $09, $48, $01 ; bank 0a 0x4809 DimHouseOutside

RoomBeforeLampshadeBossTransition:: ; 0x4350
    db $06, $05, $02, $01
    db $0a, $85, $49, $01 ; bank 0a 0x4985 LampshadeBossRoom
    
DefeatedLampshadeBossScreenSprites:: ; 0x4358
    db $0a, $9b, $45
    db $08, $29, $7d

TempleLightOutsideSprites:: ; 0x435e
    db $08, $29, $7d
    
TempleLightOutsideTransition:: ; 0x4361
    db $06, $11, $04, $01
    db $0a, $0d, $4a, $01 ; bank 0a 0x4a0d Bridge
    db $06, $05, $04, $01
    db $0a, $33, $4a, $01 ; bank 0a 0x4a33 TempleLightInside
    
TempleLightInsideSprites:: ; bank 0a 0x4371
    db $08, $29, $7d

TempleLightInsideTransition:: ; bank 0a 0x4374 
    db $06, $03, $04, $01
    db $0a, $dd, $49, $01 ; bank 0a 0x49dd
    db $07, $11, $02, $01
    db $0a, $59, $4a, $01 ; bank 0a 0x4a59 TempleLightOutside

JTHouseOutsideSprites:: ; bank 0a 0x4384  
    db $09, $13, $7b
    db $09, $ad, $6e
    db $08, $29, $7d
    
JTHouseOutsideTransition:: ; bank 0a 0x438d
    db $00, $0a, $01, $04
    db $0a, $1b, $46, $01 ; bank 0a 0x461b Graveyard
    db $02, $00, $0e, $01
    db $0a, $bd, $47, $01 ; bank 0a 0x47bd NgHeadquartersOutside
    db $0f, $00, $01, $0e
    db $0a, $5f, $49, $01 ; bank 0a 0x495f Well
    db $04, $09, $02, $01
    db $0a, $71, $47, $01 ; bank 0a 0x4771 JTHouseInside
    
bank00a_43ad: ; related to GameFinishedScreen
    db $25, $12, $04, $14, $00, $00, $ff, $fc, $33, $ff, $fc, $55
    
    db $44, $e8, $0a ; bank 0a 0x44e8 
    
    db $04
    db $53, $84, $10, $14, $00, $01, $ff, $fc, $0d, $ff, $fc, $00, $55, $af, $02, $21
    db $1f, $c6, $0d, $57, $03, $00
    
WellSprites:: ; bank 0a 0x43d3
    db $0a, $70, $45
    db $0a, $c9, $45
    db $0a, $9b, $45
    db $09, $ad, $6e
    db $08, $29, $7d

WellTransition:: ; bank 0a 0x43e2
    db $00, $00, $01, $0e
    db $0a, $e3, $4a, $01 ; bank 0a 0x4ae3 JTHouseOutside
    db $00, $00, $10, $01
    db $0a, $09, $4b, $01 ; bank 0a 0x4b09 OutsideShop
    db $0f, $00, $01, $0e
    db $0a, $2f, $4b, $01 ; bank 0a 0x4b2f DimHouseOutside
    
DimHouseOutsideSprites:: ; bank 0a 0x43fa
    db $08, $29, $7d
    
DimHouseOutsideTransition:: ; bank 0a 0x43fd
    db $00, $00, $01, $0e
    db $0a, $55, $4b, $01 ; bank 0a 0x4b55 Well
    db $00, $00, $0a, $01
    db $0a, $7b, $4b, $01 ; bank 0a 0x4b7b JR Outside
    db $0c, $09, $02, $01
    db $0a, $e3, $47, $01 ; bank 0a 0x47e3 DimHouseInside
    
NgHeadquartersOutsideSprites:: ; bank 0a 0x4415
    db $09, $6a, $7c ; bank 9 0x7c6a snake
    db $08, $29, $7d ; bank 8 0x7d29 items
    
NgHeadquartersOutsideTransition:: ; bank 0a 0x441b
    db $02, $11, $0e, $01
    db $0a, $a1, $4b, $01 ; bank 0a 0x4ba1 JTHouseOutside
    db $0f, $04, $01, $0e
    db $0a, $41, $46, $01 ; bank 0a 0x4641 OutsideShop
    db $08, $05, $02, $01 
    db $0a, $2f, $48, $01 ; bank 0a 0x482f NgHeadquartersInside
    
OutsideShopSprites:: ; bank 0a 0x4433
    db $09, $f3, $71 ; bank 9: 0x71f3 flower
    db $0a, $9b, $45
    db $09, $5b, $6c ; bank 9 0x6c5b alex labbe
    db $09, $76, $72 ; bank 9 0x7276 gerkinman
    db $09, $7f, $74 ; bank 9: 0x747f jasper
    db $09, $48, $76 ; bank 9: 0x7648 john
    db $08, $29, $7d ; bank 8: 0x7d29 items

OutsideShopTransition:: ; bank 0a 0x4448
    db $00, $08, $01, $0a
    db $0a, $67, $46, $01 ; bank 0a 0x4667 NgHeadquartersOutside
    db $00, $11, $10, $01
    db $0a, $8d, $46, $01 ; bank 0a 0x468d Well
    db $0f, $08, $01, $0a
    db $0a, $b3, $46, $01 ; bank 0a 0x46b3 JR Outside
    db $04, $00, $08, $01
    db $0a, $d9, $46, $01 ; bank 0a 0x46d9 Bridge
    db $02, $07, $02, $01
    db $0a, $7b, $48, $01 ; bank 0a 0x487b PC World
    db $0c, $07, $02, $01
    db $0a, $c7, $48, $01 ; bank 0a 0x48c7 McDonalds

JROutsideSprites:: ; 0x4478
    db $09, $73, $7f
    db $09, $85, $75
    db $09, $48, $76
    db $08, $29, $7d
    
JROutsideTransition:: ; 0x4484
    db $00, $04, $01, $0e
    db $0a, $ff, $46, $01 ; bank 0a 0x46ff OutsideShop
    db $00, $11, $0a, $01
    db $0a, $25, $47, $01 ; bank 0a 0x4725 DimHouseOutside
    db $06, $05, $02, $01
    db $0a, $13, $49, $01 ; bank 0a 0x4913 JR Inside
    
BridgeSprites:: ; 0x449c
    db $0a, $9b, $45
    db $09, $67, $78
    db $08, $29, $7d
    
BridgeTransition:: ; 0x44a5
    db $04, $11, $08, $01
    db $0a, $4b, $47, $01 ; bank 0a 0x474b OutsideShop
    db $06, $00, $04, $01
    db $0a, $e7, $49, $01 ; bank 0a 0x49e7 TempleLightOutside

NgHeadquartersInsideSprites:: ; 0x44b5
    db $09, $f1, $7d
    db $08, $29, $7d
    
NgHeadquartersInsideTransition:: ; 0x44bb
    db $07, $11, $02, $01
    db $0a, $55, $48, $01 ; bank 0a 0x4855 NgHeadquartersOutside
    
bank00a_44c3:
    db $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03, $00
    db $ff, $fd, $14, $06, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc
    
    db $27, $03, $02
    
; 0x44e4
    db $09, $6f, $5a ; bank 9 0x5a6f RoomBeforeLampshadeBoss

    db $00

bank00a_44e8:
    db $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $00, $00
    db $ff, $fd, $14, $00, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc
    
    db $27, $03, $02
    
    db $09, $e3, $5f ; bank 9 0x5fe3 title screen
    
    db $00

    db $12, $05, $14, $00, $02, $ff, $fc, $14, $00, $01, $ff, $fd, $75, $ff, $fc, $14
    db $00, $0c, $ff, $fb, $0d, $ff, $fb, $00, $55, $af, $02, $14, $00, $02, $ff, $fc
    db $14, $00, $00, $ff, $fd, $75, $ff, $fc, $00
    
GraveCoverSpriteImage:: ; 0x4536
    db $02, $00
    INCBIN "gfx/bank00a_gravecover_4538.2bpp"
    
SignSpriteFrames::
    ; bank 0a 0x4558
    db $80, $00, $00, $00

    ; frames
    db $58, $45
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00
    
    ; bank0a 0x4570
    db $01, $00, $f0, $5c, $45, $5e, $45, $6e, $45, $00, $0f, $f8, $07

    db $09, $03, $7a, $00, $00, $00 ; points to bank 9 0x7a03

bank00a_4583:
    db $80, $00, $00, $00

    db $83, $45
    
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00

bank00a_459b: ; 0x459b
    db $01, $00, $f0, $87, $45, $89, $45, $99, $45, $00, $0f, $f8, $07
    
    db $0a, $ae, $45, $00, $00, $00 ; bank 0a 0x45ae

bank00a_45ae:
    db $00, $00, $00

    ; 0x45b1
    db $80, $00, $00, $00, $b1, $45, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $e0, $b5, $45, $b7, $45, $c7
    db $45, $f8, $17, $e8, $07, $0a, $ae, $45, $00, $00, $00, $80, $00, $00, $00, $dc
    db $45, $01, $00, $00, $e0, $45, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00

GraveyardToJTHouseOutsideTransition:: ; bank 0a 0x45f5
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $00
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $01, $ff, $fc, $27
    db $03, $02, $09, $76, $5f
    
    db $00
    
 JTHouseOutsideToGraveyardTransition:: ; bank 0a 0x461b
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $03, $ff, $fc, $27
    db $03, $02, $09, $61, $54

    db $00

NgHeadquartersOutsideToOutsideShopTransition:: ; 0x4641
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $00
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $01, $ff, $fc, $27
    db $03, $02, $09, $46, $63
    
    db $00
    
OutsideShopToNgHeadquartersOutsideTransition:: ; 0x4667
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $03, $ff, $fc, $27
    db $03, $02, $09, $0b, $63
    
    db $00

OutsideShopToWellTransition:: ; 0x468d
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $00, $80, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $91, $61
    
    db $00

OutsideShopToJROutsideTransition:: ; 0x46b3
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $00
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $01, $ff, $fc, $27
    db $03, $02, $09, $85, $64

    db $00

OutsideShopToBridgeTransition:: ; 0x46d9
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $90, $65

    db $00

JROutsideToOutsideShopTransition:: ; 0x46ff
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $03, $ff, $fc, $27
    db $03, $02, $09, $46, $63

    db $00
    
JROutsideToDimHouseOutsideTransition:: ; 0x4725
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $00, $ff, $fd, $14, $00, $80, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $34, $62
    
    db $00

BridgeToOutsideShopTransition:: ; 0x474b
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $00, $80, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $46, $63

    db $00

JTHouseOutsideToJTHouseInsideTransition:: ; 0x4771
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $04
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $29, $59

    db $00

JTHouseInsideToJTHouseOutsideTransition:: ; bank 0a 0x4797
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $02
    db $00, $ff, $fd, $14, $05, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $76, $5f

    db $00

JTHouseOutsideToNgHeadquartersOutsideTransition:: ; bank 0a 0x47bd
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $05
    db $00, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $0b, $63

    db $00

DimHouseOutsideToDimHouseInsideTransition:: ; 0x47e3
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $34, $5a

    db $00

DimHouseInsideToDimHouseOutsideTransition:: ; 0x4809
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $00, $ff, $fd, $14, $05, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $34, $62

    db $00

NgHeadquartersOutsideToNgHeadquartersInsideTransition:: ; 0x482f
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $67, $66

    db $00

NgHeadquartersInsideToNgHeadquartersOutsideTransition:: ; 0x4855
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $04
    db $00, $ff, $fd, $14, $03, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $0b, $63

    db $00

OutsideShopToPCWorldTransition:: ; 0x487b
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $a0, $55

    db $00

PCWorldToOutsideShopTransition:: ; 0x48a1
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $01
    db $00, $ff, $fd, $14, $04, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $46, $63

    db $00

OutsideShopToMcdonaldsTransition:: ; 0x48c7
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $ab, $56

    db $00

McdonaldsToOutsideShopTransition:: ; 0x48ed
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $00, $ff, $fd, $14, $04, $80, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $46, $63

    db $00

JROutsideToJRInsideTransition:: ; 0x4913
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $b6, $57

    db $00

JRInsideToJROutsideTransition:: ; 0x4939
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $00, $ff, $fd, $14, $03, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $85, $64

    db $00

JTHouseOutsideToWellTransition:: ; 0x495f
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $00
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $01, $ff, $fc, $27
    db $03, $02, $09, $91, $61

    db $00

RoomBeforeLampshadeBossToLampshadeBossRoomTransition:: ; 0x4985
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $00, $ff, $fd, $14, $07, $80, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $bc, $5b

    db $00

PCWorldUnknownTransition_49ab: ; 0x49ab
    db $25, $12, $01, $19, $00, $00, $ff, $ff, $1a, $00, $49, $bf, $00, $01, $ff, $ff
    db $01, $09, $49, $c8, $55, $66, $a2, $09, $04, $53, $84, $10, $00, $19, $00, $00
    db $ff, $ff, $1a, $00, $49, $d9, $00, $02, $ff, $ff, $01, $09, $49, $dc, $5f, $10
    db $00, $00, $25, $55, $69, $62, $09, $04, $53, $84, $10
    
    db $00

BridgeToTempleLightOutsideTransition:: ; 0x49e7
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14
    db $03, $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff
    db $fc, $27, $03, $02, $09, $93, $5d
    
    db $00

TempleLightOutsideToBridgeTransition:: ; 0x4a0d
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $00, $80, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $90, $65
    
    db $00

TempleLightOutsideToTempleLightInsideTransition:: ; 0x4a33
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $6b, $5e

    db $00

TempleLightInsideToTempleLightOutsideTransition:: ; 0x4a59
    db $25, $12, $04, $21, $03, $C6, $0D, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $03, $00, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $93, $5d

    db $00

GraveyardUnknownTransition_4a7f: ; 0x4a7f
    db $25, $12, $01, $19, $00, $00, $ff, $ff, $1a, $00, $4a, $93, $00, $01, $ff, $ff
    db $01, $09, $4a, $9c, $55, $74, $03, $07, $04, $53, $84, $10, $00, $19, $00, $00
    db $ff, $ff, $1a, $00, $4a, $ad, $00, $02, $ff, $ff, $01, $09, $4a, $b0, $5f, $10, $00

    db $00

GraveyardUnknownTransition_4ab1: ; 0x4ab1
    db $25, $12, $01, $19, $00, $00, $ff, $ff, $1a, $00, $4a, $c5, $00, $01, $ff, $ff
    db $01, $09, $4a, $ce, $55, $75, $8e, $07, $04, $53, $84, $10, $00, $19, $00, $00
    db $ff, $ff, $1a, $00, $4a, $df, $00, $02, $ff, $ff, $01, $09, $4a, $e2, $5f, $10, $00

    db $00

WellToJTHouseOutsideTransition:: ; bank 0a 0x4ae3
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $03, $ff, $fc, $27
    db $03, $02, $09, $76, $5f

    db $00

WellToOutsideShopTransition:: ; 0x4b09
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $80, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $46, $63

    db $00

 WellToDimHouseOutsideTransition:: ; 0x4b2f
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $00
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $01, $ff, $fc, $27
    db $03, $02, $09, $34, $62

    db $00

DimHouseOutsideToWellTransition:: ; 0x4b55
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $06
    db $80, $ff, $fd, $14, $05, $80, $ff, $fe, $35, $ff, $fc, $32, $03, $ff, $fc, $27
    db $03, $02, $09, $91, $61

    db $00

DimHouseOutsideToJROutsideTransition:: ; 0x4b7b
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $03
    db $00, $ff, $fd, $14, $08, $00, $ff, $fe, $35, $ff, $fc, $32, $02, $ff, $fc, $27
    db $03, $02, $09, $85, $64

    db $00

NgHeadquartersOutsideToJTHouseOutsideTransition:: ; bank 0a 0x4ba1
    db $25, $12, $04, $21, $03, $c6, $0d, $57, $01, $14, $00, $00, $ff, $fc, $14, $05
    db $00, $ff, $fd, $14, $00, $80, $ff, $fe, $35, $ff, $fc, $32, $00, $ff, $fc, $27
    db $03, $02, $09, $76, $5f

    db $00

    INCLUDE "src/engine/logo.asm"

    ; unused
    ds $3428, $ff