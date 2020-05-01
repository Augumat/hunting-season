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
spreadplayers 0 0 8 32 false @a

# set up the updater blocks
setblock 0 255 0 minecraft:repeating_command_block[conditional=false,facing=down]{auto:1,Command:"execute store result score @p[scores={hunted=1}] posX run data get entity @p[scores={hunted=1}] Pos[0]"}
setblock 0 254 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute store result score @p[scores={hunted=1}] posZ run data get entity @p[scores={hunted=1}] Pos[2]"}
setblock 0 253 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"scoreboard players operation PosX Target = @p[scores={hunted=1}] posX"}
setblock 0 252 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"scoreboard players operation PosZ Target = @p[scores={hunted=1}] posZ"}
setblock 0 251 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute if score @p[scores={hunted=1}] huntedWon matches 1 run function scrub:huntingseason/dev/_w"}
setblock 0 250 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute if score @p[scores={hunted=1}] huntedLost matches 1 run function scrub:huntingseason/dev/_l"}

# start the countdown chain
function scrub:huntingseason/dev/_5