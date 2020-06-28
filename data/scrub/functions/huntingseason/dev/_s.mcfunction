#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function should be called once a player has already volunteered and when
#  all participants are ready to begin the game.
#>

# play the startup sound
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5

# set player flags that might have changed since setup (just to be safe)
scoreboard players set @p[scores={hunted=1}] huntedLost 0
scoreboard players set @p[scores={hunted=1}] huntedWon 0

# blind and immobolize players for the countdown
effect give @a minecraft:blindness 3600 1 true
effect give @a minecraft:slowness 3600 255 true

# suspend time and set it to day
gamerule doDaylightCycle false
time set 0

# set the new spawn at the origin and distribute the players there
setworldspawn 0 0 0
spreadplayers 0 0 8 16 false @a

# set up the updater blocks
setblock 0 255 0 minecraft:repeating_command_block[conditional=false,facing=down]{auto:1,Command:"execute store result score @a[scores={hunted=0}] relX run data get entity @p[scores={hunted=1}] Pos[0]"}
setblock 0 254 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute store result score @a[scores={hunted=0}] relZ run data get entity @p[scores={hunted=1}] Pos[2]"}
setblock 0 253 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] run execute store result score @s posX run data get entity @s Pos[0]"}
setblock 0 252 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] run execute store result score @s posZ run data get entity @s Pos[2]"}
setblock 0 251 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] run scoreboard players operation @s relX -= @s posX"}
setblock 0 250 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] run scoreboard players operation @s relZ -= @s posZ"}
setblock 0 249 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute store result score @p[scores={hunted=1}] Dim run data get entity @p[scores={hunted=1}] Dimension"}
setblock 0 248 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] execute if score @p[scores={hunted=1}] Dim matches 0 run title @s actionbar [\"\",{\"text\":\"( \"},{\"score\":{\"name\":\"@s\",\"objective\":\"relX\"}},{\"text\":\", \"},{\"score\":{\"name\":\"@s\",\"objective\":\"relZ\"}},{\"text\":\" )\"}]"}
setblock 0 247 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] execute if score @p[scores={hunted=1}] Dim matches -1 run title @s actionbar [\"\",{\"text\":\"( \"},{\"text\":\"oooo\",\"obfuscated\":true,\"color\":\"dark_red\"},{\"text\":\", \"},{\"text\":\"oooo\",\"obfuscated\":true,\"color\":\"dark_red\"},{\"text\":\" )\"}]"}
setblock 0 246 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[scores={hunted=0}] execute if score @p[scores={hunted=1}] Dim matches 1 run title @s actionbar [\"\",{\"text\":\"( \"},{\"text\":\"oooo\",\"obfuscated\":true,\"color\":\"dark_purple\"},{\"text\":\", \"},{\"text\":\"oooo\",\"obfuscated\":true,\"color\":\"dark_purple\"},{\"text\":\" )\"}]"}
setblock 0 245 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute if score @p[scores={hunted=1}] huntedWon matches 1 run function scrub:huntingseason/dev/_w"}
setblock 0 244 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute if score @p[scores={hunted=1}] huntedLost matches 1 run function scrub:huntingseason/dev/_l"}

# start the countdown chain
function scrub:huntingseason/dev/_5