#include <Vis2>

; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SMITH_JEWEL_POS_X := 782
SMITH_JEWEL_POS_Y := 432

SMITH_SCROLL_POS_X := 864
SMITH_SCROLL_POS_Y := 441

ENHANCEMENT_BUTTON_POS_X := 780
ENHANCEMENT_BUTTON_POS_Y := 672

CONFIRM_DIALOG_POS_X := 969
CONFIRM_DIALOG_POS_Y := 519

SUCCESS_DIALOG_POS_X := 957
SUCCESS_DIALOG_POS_Y := 605

BAG_OFFSET_X := 64
BAG_OFFSET_Y := 121

SCROLL_POS_X := 1137
SCROLL_POS_Y := 160

START_JEWEL_POS_X := 1137

JEWEL_POS_X := START_JEWEL_POS_X
JEWEL_POS_Y := 190

MIN_STAT_VALUE := 41
SPEED := 11
USED_SCROLLS = 0
INVENTORY_SLOT_OFFSET := 40
ENHANCEMENT_DURATION := 7300

LOOPY_COUNTER := 0
LOOPX_ITER_COUNT := 12

SendMessage(jewelPosX, jewelPosY) {
	MouseMove, % 1754, 50, SPEED ; MOVE TO MESSAGES ICON
	MouseClick
	MouseMove, % 1711, 123, SPEED ; MOVE TO MESSAGES
	MouseClick
	MouseMove, % 688, 776, SPEED ; MOVE TO NEW MESSAGE
	MouseClick
	MouseMove, % jewelPosX, jewelPosY, SPEED ; MOVE TO JEWEL
	MouseClickDrag, Left, jewelPosX, jewelPosY, 137, 586, SPEED ; DRAG A RING TO A MESSAGE
	MouseMove, % 255, 680, SPEED ; MOVE TO SEND BUTTON
	MouseClick
	MouseMove, % 1030, 250, SPEED ; MOVE TO CLOSE MESSAGES
	MouseClick
	MouseMove, % 1588, 50, SPEED ; MOVE TO ANVIL
	MouseClick
	MouseMove, % 1593, 135, SPEED ; MOVE TO ENCHANTMENT
	MouseClick
}

MouseMove, % JEWEL_POS_X, JEWEL_POS_Y, 0 ; MOVE TO 1ST RING
MouseClick ; FOCUS WINDOW
Sleep, 2000 ; WAIT FOR FOCUS
Loop,6 {
	LOOPY_COUNTER := LOOPY_COUNTER + 1
	LOOPX_COUNTER := 0
	Loop % LOOPX_ITER_COUNT {
		LOOPX_COUNTER := LOOPX_COUNTER + 1
		MouseMove, % JEWEL_POS_X, JEWEL_POS_Y, SPEED ; MOVE TO 1ST RING
		MouseClickDrag, Left, JEWEL_POS_X, JEWEL_POS_Y, SMITH_JEWEL_POS_X, SMITH_JEWEL_POS_Y, SPEED ; DRAG A RING TO A SMITH
		MouseMove, % SCROLL_POS_X, SCROLL_POS_Y, SPEED ; MOVE TO SCROLL
		MouseClickDrag, Left, SCROLL_POS_X, SCROLL_POS_Y, SMITH_SCROLL_POS_X, SMITH_SCROLL_POS_Y, SPEED ; DRAG SCROLL TO A SMITH
		MouseMove, % ENHANCEMENT_BUTTON_POS_X, ENHANCEMENT_BUTTON_POS_Y, 0 ; MOVE TO ENHANCEMENT BUTTON
		MouseClick ; START ENHANCEMENT
		MouseMove, % CONFIRM_DIALOG_POS_X, CONFIRM_DIALOG_POS_Y, 0 ; MOVE TO CONFIRMATION DIALOG
		MouseClick ; CONFIRM DIALOG
		Sleep, ENHANCEMENT_DURATION ; WAIT FOR UPGRADE
		MouseMove, % SUCCESS_DIALOG_POS_X, SUCCESS_DIALOG_POS_Y, 0 ; MOVE TO SUCCESS DIALOG
		MouseClick ; CONFIRM DIALOG
		
		USED_SCROLLS:= USED_SCROLLS + 1
		
		text := OCR([631, 580, 150, 16])
		
		strengthIndex := RegExMatch(text, "O)Sila \+(?<value>\d+)", strength)
		dexterityIndex := RegExMatch(text, "O)ost \+(?<value>\d+)", dexterity)
		intelligenceIndex := RegExMatch(text, "O)Inteligence \+(?<value>\d+)", intelligence)
		hpIndex := RegExMatch(text, "O)Body zivota \+(?<value>\d+)", hp)
		
		if(strengthIndex != 0 && strength["value"] > MIN_STAT_VALUE 
			|| dexterityIndex && dexterity["value"] > MIN_STAT_VALUE
			|| intelligenceIndex && intelligence["value"] > MIN_STAT_VALUE
			|| hpIndex && hp["value"] > 650) {
			SendMessage(JEWEL_POS_X, JEWEL_POS_Y)
		}
		
		if(Mod(USED_SCROLLS, 30) == 0) {
			SCROLL_POS_X := SCROLL_POS_X + INVENTORY_SLOT_OFFSET
		}
		if(MOD(LOOPX_COUNTER, 4) == 0) {
			JEWEL_POS_X := JEWEL_POS_X + BAG_OFFSET_X
		} else {
			JEWEL_POS_X := JEWEL_POS_X + INVENTORY_SLOT_OFFSET
		}
	}
	if(MOD(LOOPY_COUNTER, 3) == 0) {
		JEWEL_POS_Y := JEWEL_POS_Y + BAG_OFFSET_Y
	} else {
		JEWEL_POS_Y := JEWEL_POS_Y + INVENTORY_SLOT_OFFSET
	}
	
	JEWEL_POS_X := START_JEWEL_POS_X
	
	if(LOOPY_COUNTER == 2) {
		JEWEL_POS_X := JEWEL_POS_X + (INVENTORY_SLOT_OFFSET * 3) + BAG_OFFSET_X
		LOOPX_ITER_COUNT := 8
	} else {
		LOOPX_ITER_COUNT := 12
	}
}

return

Esc::ExitApp
