#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# The end of the countdown chain.
#  - Displays a different message to the runner and hunter(s)
#  - Releases players
#  - Resumes time
#  - Enables the tracking display for hunters
#>

# play the starting sound and set the titles for the target and hunters
execute as @a run playsound minecraft:entity.ender_dragon.ambient master @p ~ ~ ~ 1 0.8
title @a[team=hunter] title {"text":"HUNT THEM DOWN!","color":"red"}
title @p[team=runner] title {"text":"RUN!","color":"aqua"}

# begin the chase by clearing effects on each player, displaying the sidebar, and resuming time
effect clear @a
gamerule doDaylightCycle true