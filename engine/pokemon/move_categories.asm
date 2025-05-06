; Copy the move category name of move b to wStringBuffer1
; @param b: move index
GetMoveCategoryName:
    ld a, b
    ; We need to decrement the index here because the move constant
    ; is equal to the table index + 1
    dec a
    ld bc, MOVE_LENGTH
    ld hl, Moves + MOVE_CATEGORY
    call AddNTimes
    ld a, BANK(Moves)
    call GetFarByte

    ld hl, CategoryNames
    ld e, a
    ld d, 0
    add hl, de
    add hl, de
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld de, wStringBuffer1
    ld bc, MOVE_NAME_LENGTH
    jp CopyBytes

INCLUDE "data/moves/category_names.asm"