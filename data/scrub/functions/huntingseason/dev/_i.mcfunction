#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# stub
#>

# set gamerules
gamerule commandBlockOutput false

# create scoreboard objectives
scoreboard objectives add hunted dummy
scoreboard objectives add posX dummy
scoreboard objectives add posZ dummy
scoreboard objectives add PosX dummy
scoreboard objectives add PosZ dummy
scoreboard objectives add Target dummy
scoreboard objectives add gamestate dummy

# add goal objectives
scoreboard objectives add huntedLost deathCount
scoreboard objectives add huntedWon minecraft.killed:minecraft.ender_dragon

# mark the game as initialized
scoreboard objectives add init dummy
scoreboard players set gamestate init 1