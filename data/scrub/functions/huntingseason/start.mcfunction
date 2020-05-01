#>
# This function should be called once a player has already volunteered and when
#  all participants are ready to begin the game.
#>

# create temporary values for conditional
scoreboard objectives add __dummy dummy
scoreboard objectives add __succ dummy

# if the game has been initialized and there is a target chosen, start the game
#  otherwise, print usage
execute store success score __dummy __succ if score @p[scores={hunted=1}] hunted matches 1
execute if score __dummy __succ matches 1 run function scrub:huntingseason/dev/_s
execute if score __dummy __succ matches 0 run tellraw @s ["",{"text":"No one has volunteered to be the runner yet!\nTry running "},{"text":"/function scrub:huntingseason/setup","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:huntingseason/setup"}},{"text":" to get started, or run "},{"text":"/function scrub:huntingseason/help","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:huntingseason/help"}},{"text":" for more detailed instructions."}]

# clean up
scoreboard objectives remove __succ
scoreboard objectives remove __dummy