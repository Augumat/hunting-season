#>
# This function should be called by the player who wishes to be the runner (or
#  called *as* them by the console or an operator using /execute).  Once called
#  the scoreboard will be initialized and important values and tags will be set
#  up for use during the game.
#>

# create temporary values for conditional
scoreboard objectives add __dummy dummy
scoreboard objectives add __succ dummy

# if the game has not been initialized yet, call setup
execute store success score __dummy __succ if score gamestate init matches 1
execute if score __dummy __succ matches 0 run function scrub:huntingseason/dev/zz_i

# volunteer the caller
function scrub:huntingseason/dev/zz_v

# clean up temporary values
scoreboard objectives remove __succ
scoreboard objectives remove __dummy