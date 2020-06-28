#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# Initializes the engine to its beginning state by creating scoreboard
#  objectives and setting gamerules.  This should automatically be called by
#  /volunteer when necessary. (the conditional is a pre-emptive choice to
#  allow for future expansion)
#>

# set gamerules
gamerule commandBlockOutput false

# create scoreboard objectives
scoreboard objectives add hunted dummy
scoreboard objectives add posX dummy
scoreboard objectives add posZ dummy
scoreboard objectives add relX dummy
scoreboard objectives add relZ dummy
scoreboard objectives add Dim dummy
scoreboard objectives add Target dummy
scoreboard objectives add gamestate dummy

# add goal objectives
scoreboard objectives add huntedLost deathCount
scoreboard objectives add huntedWon minecraft.killed:minecraft.ender_dragon

# mark the game as initialized
scoreboard objectives add init dummy
scoreboard players set gamestate init 1