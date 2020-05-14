#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function is called to reset the game and revert all scoreboard values to
#  their defaults.
#>

# reset gamerules (to server defaults)
gamerule commandBlockOutput true

# remove scoreboard objectives
scoreboard objectives remove hunted
scoreboard objectives remove posX
scoreboard objectives remove posZ
scoreboard objectives remove Dim
scoreboard objectives remove Target

# remove goal objectives
scoreboard objectives remove huntedLost
scoreboard objectives remove huntedWon

# remove the "initialized" mark
scoreboard objectives remove gamestate
scoreboard objectives remove init

# remove the position updaters
fill 0 255 0 0 248 0 minecraft:air