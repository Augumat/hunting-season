#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /zz_dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

# play a sound, display the number of seconds left, and queue the next step
execute as @a run playsound minecraft:block.wooden_button.click_off master @p ~ ~ ~ 1 0.8
title @a title 3
schedule function scrub:huntingseason/zz_dev/dev_2 20