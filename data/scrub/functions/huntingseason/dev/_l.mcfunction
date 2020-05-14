#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function should be executed when the hunter(s) win.  Displays the
#  winning team in chat and plays a sound.  After a couple seconds, calls
#  reset to clean up after the game.
#>

# play a sound and report the loss in chat
playsound minecraft:entity.wolf.growl master @a ~ ~ ~ 0.5 0.5
playsound minecraft:entity.ghast.death master @a ~ ~ ~ 0.8 0.5
tellraw @a {"text":"The hunters win!","color":"red"}

# spawn blood firework on the runner
execute as @p[scores={hunted=1}] run /summon firework_rocket ~ ~ ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;11743532]}]}}}}

# give short instructions on starting a new game
tellraw @a ["",{"text":"\nIf you want to start another game in this world, have the new runner "},{"text":"volunteer","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:huntingseason/volunteer"}},{"text":" again!\n"},{"text":"(for more info, run ","color":"gray"},{"text":"help","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:huntingseason/help"}},{"text":")","color":"gray"}]

# conclude by resetting the engine
function scrub:huntingseason/dev/_r