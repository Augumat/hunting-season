#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function volunteers the caller as the runner and every other player as
#  a hunter, then notifies them.  After this function has been called, the game
#  can begin in earnest.
#>

# mark hunters with 0 and the hunted with 1
scoreboard players set @a hunted 0
scoreboard players set @s hunted 1

# play a sound and notify the hunters and hunted of their roles
execute as @p[scores={hunted=1}] run playsound minecraft:entity.arrow.shoot master @s ~ ~ ~ 1 0.8
tellraw @p[scores={hunted=1}] ["",{"text":"You will be hunted by","color":"gray"},{"text":" ","color":"red"},{"selector":"@a[scores={hunted=0}]","color":"red"},{"text":" when the round begins","color":"gray"}]
execute as @a[scores={hunted=0}] run playsound minecraft:entity.ghast.warn master @s ~ ~ ~ 1 0.5
tellraw @a[scores={hunted=0}] ["",{"text":"You will be hunting","color":"gray"},{"text":" ","color":"red"},{"selector":"@p[scores={hunted=1}]","color":"red"},{"text":" when the round begins","color":"gray"}]
