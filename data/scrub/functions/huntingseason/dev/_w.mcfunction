#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function should be executed when the runner wins.  Displays the winner
#  in chat, plays a sound, and spawns fireworks.  After a couple seconds, calls
#  reset to clean up after the game.
#>

# play a sound and report the win in chat
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.65 0.65
tellraw @a ["",{"selector":"@p[scores={hunted=1}]","color":"green"},{"text":" wins!","color":"green"}]

# spawn fireworks on the winner
execute as @p[scores={hunted=1}] run summon firework_rocket ~ ~12 ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Flicker:1,Colors:[I;4312372,15790320],FadeColors:[I;1973019]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~3 ~1 ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~ ~1 ~3 {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~-3 ~1 ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~ ~1 ~-3 {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~2 ~1 ~2 {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~2 ~1 ~-2 {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~-2 ~1 ~2 {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}
execute as @p[scores={hunted=1}] run summon firework_rocket ~-2 ~1 ~-2 {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Trail:1,Colors:[I;3887386,4312372,15790320]}]}}}}

# give short instructions on starting a new game
tellraw @a ["",{"text":"\nIf you want to start another game in this world, have the new runner "},{"text":"volunteer","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:huntingseason/volunteer"}},{"text":" again!\n"},{"text":"(for more info, run ","color":"gray"},{"text":"help","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:huntingseason/help"}},{"text":")","color":"gray"}]

# conclude by resetting the engine
function scrub:huntingseason/dev/_r