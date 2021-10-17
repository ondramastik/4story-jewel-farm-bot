## Jewelry farm bot

Simple [AutoHotkey](https://www.autohotkey.com/) script performing 4 steps

* Buys 3 stacks of enhancement scripts and full inventory of configured jewel
* Goes to a blacksmith and enhances every jewel in inventory
* If jewel has a stat equal or higher to *MIN_STAT_VALUE* constant, it sends it away via mail
* After every jewel is enhanced, it goes to a merchant and sells the rest of the jewels
* Then the entire process is repeated

## Project Status

This script is perfectly usable, and I won't improve or fix it any further.

## Installation and Setup Instructions

* Install [AutoHotkey](https://www.autohotkey.com/)
* Login, empty your inventory and arrange your bags to match a simple X * Y grid
* Stand right in front of any merchant so clicking the middle of your screen will open a shopping dialog
* Open the script and configure all constants listed here. Those are positions and offsets of buttons in the game.
    * *SMITH_JEWEL_POS_X, SMITH_JEWEL_POS_Y* - Blacksmith's slot for a jewel
    * *SMITH_SCROLL_POS_X, SMITH_SCROLL_POS_Y* - Blacksmith's slot for a scroll
    * *ENHANCEMENT_BUTTON_POS_X, ENHANCEMENT_BUTTON_POS_Y* - Blacksmith's enhancement button
    * *CONFIRM_DIALOG_POS_X, CONFIRM_DIALOG_POS_Y* - Confirm dialog button
    * *SUCCESS_DIALOG_POS_X, SUCCESS_DIALOG_POS_Y* - Success dialog button
    * *BAG_OFFSET_X, BAG_OFFSET_Y* - Position of first slot of top left bag
    * *SCROLL_POS_X, SCROLL_POS_Y* - Position of first slot in your inventory with enhancing scrolls.
    * *START_JEWEL_POS_X, JEWEL_POS_Y* - Position of first slot in your inventory with jewel
    * *MIN_STAT_VALUE* - The minimum stat value you want to send away
    * *SPEED* - The total speed of mouse movement. If you have good PC, you can try faster movements.
    * *INVENTORY_SLOT_OFFSET* - Size of inventory slot
* With everything set up, just turn on the script
