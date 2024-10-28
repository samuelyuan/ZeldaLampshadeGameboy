SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

    INCLUDE "src/engine/vm_actor.asm"

    INCLUDE "src/engine/vm.asm"

DanDialogueWell::    ; bank 2 0x63a4
    INCLUDE "src/scripts/well/dan_well.asm"

ZeldaIntroMusic::
    INCLUDE "audio/zeldaintro.asm"

    INCLUDE "src/engine/states/platform.asm"