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

# remove teams
team remove runner
team remove hunter

# remove scoreboard objectives
scoreboard objectives remove posX
scoreboard objectives remove posZ
scoreboard objectives remove relX
scoreboard objectives remove relZ
scoreboard objectives remove Target

# remove goal objectives
scoreboard objectives remove runnerLoses
scoreboard objectives remove runnerWins

# remove the "initialized" mark
scoreboard objectives remove gamestate
scoreboard objectives remove init

# remove the position updaters
fill 0 255 0 0 196 0 minecraft:air