    db $12, $05
    db $1a, $00, $74, $11, $00, $0a, $00, $00, $02 ; item < 0a
    db $09, $74, $52
    db $40, $00

    db "This grave looks\n" ; 0x7413
    db "fresh and\n"
    db "enticing...", $00
    
    db $47, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $45, $fe, $12, $00
    db $44, $03, $01
    db $1a, $00, $74, $5e, $00, $0a, $00, $00, $01 ; item == 0a
    db $09, $75, $8d
    db $14, $00, $00, $ff, $fc
    db $3c, $ff, $fb, $ff, $fc
    db $1a, $00, $75, $8d, $00, $01, $ff, $fb, $06
    db $14, $00, $00, $ff, $fc
    db $3d, $ff, $ff, $fc
    db $14, $00, $00, $ff, $fc
    db $84, $00, $01, $ff, $fc
    db $14, $00, $00, $ff, $fc
    db $14, $00, $00, $ff, $fd
    db $75, $ff, $fc
    db $14, $00, $0c, $ff, $fb
    db $0d, $ff, $fb, $00, $55, $af, $02
    db $14, $00, $00, $ff, $fc
    db $14, $00, $01, $ff, $fd
    db $75, $ff, $fc
    db $14, $00, $0c, $ff, $fb
    db $0d, $ff, $fb, $00, $55, $af, $02
    db $14, $00, $00, $ff, $fc
    db $84, $00, $00, $ff, $fc
    db $14, $00, $00, $ff, $fc
    db $3d, $07, $ff, $fc
    db $1a, $00, $74, $d5, $00, $0a, $00, $00, $01 ; item == 0a
    db $09, $75, $8a
    db $14, $00, $04, $ff, $fc
    db $33, $ff, $fc
    db $40, $00

    db "You dug up\n" ; 0x74df
    db "the grave.", $00
    
    db $47, $03, $01, $04, $14, $00, $00
    db $45, $ff, $0e, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $45, $fe, $12, $00
    db $44, $03, $01
    db $14, $00, $0b, $00, $00
    db $14, $00, $06, $ff, $fc ; set item to 0b
    db $14, $00, $0a, $ff, $fd
    db $75, $ff, $fc
    db $40, $00
    
    db "You got the\n" ; 0x7521
    db "Human Corpse!", $00
    
    db $47, $03, $01, $05, $14, $00, $00, $45
    db $ff, $0d, $00, $41, $ff, $00, $44, $07, $01
    
    db $40, $00
    
    db "The meaty flesh\n" ; 0x754e
    db "hasn't had time\n"
    db "to rot.", $00
    
    db $47, $03, $01, $05, $14, $00, $00, $41, $ff, $00, $44, $07, $01
    db $45, $fe, $12, $00, $44, $03, $01, $09, $75, $8d, $00, $12, $05
    
    db $1a, $00, $75, $9c, $00, $0a, $00, $00, $02 ; item < 0a
    db $09, $75, $dd
    
    db $40, $00
    
    db "This grave looks\n"
    db "fresh and\n"
    db "enticing...", $00
    
    db $47, $03, $01, $05, $14, $00, $00, $45, $ff, $0d, $00, $41, $ff, $00
    db $44, $07, $01, $45, $fe, $12, $00, $44, $03, $01, $1a, $00, $75, $e9, $00, $0a
    db $00, $00, $01
    db $09, $77, $18
    db $14, $00, $00, $ff, $fc
    db $3c, $ff, $fb, $ff, $fc
    db $1a, $00, $77, $18, $00, $03, $ff, $fb, $06
    
    db $14, $00, $00, $ff, $fc
    db $3d, $ff, $ff, $fc
    db $14, $00, $00, $ff, $fc
    db $84, $00, $01, $ff, $fc
    db $14, $00, $00, $ff, $fc
    db $14, $00, $02, $ff, $fd
    db $75, $ff, $fc
    db $14, $00, $0c, $ff, $fb
    db $0d, $ff, $fb, $00, $55, $af, $02
    db $14, $00, $00, $ff, $fc
    db $14, $00, $03, $ff, $fd
    db $75, $ff, $fc
    db $14, $00, $0c, $ff, $fb
    db $0d, $ff, $fb, $00, $55, $af, $02
    db $14, $00, $00, $ff, $fc
    db $84, $00, $00, $ff, $fc
    db $14, $00, $00, $ff, $fc
    db $3d, $07, $ff, $fc
    db $1a, $00, $76, $60, $00, $0a, $00, $00, $01 ; item == 0a
    db $09, $77, $15

    db $14, $00, $04, $ff, $fc
    db $33, $ff, $fc
    db $40, $00

    db "You dug up\n"
    db "the grave.", $00

    db $47, $03, $01, $04, $14, $00, $00
    db $45, $ff, $0e, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $45, $fe, $12, $00
    db $44, $03, $01
    db $14, $00, $0b, $00, $00 ; set item to 0b
    db $14, $00, $05, $ff, $fc
    db $14, $00, $0a, $ff, $fd
    db $75, $ff, $fc
    db $40, $00

    db "You got the\n"
    db "Human Corpse!", $00
    
    db $47, $03, $01, $05, $14, $00, $00
    db $45, $ff, $0d, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $40, $00

    db "The meaty flesh\n"
    db "hasn't had time\n"
    db "to rot.", $00
    
    db $47, $03, $01, $05, $14, $00, $00
    db $41, $ff, $00
    db $44, $07, $01
    db $45, $fe, $12, $00
    db $44, $03, $01
    db $09, $77, $18
    db $00