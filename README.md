# It's Hunting Season!

A Minecraft data pack that implements a fully functioning hunter(s) VS speedrunner minigame.

## Installation

1. Download the latest version of the pack `hunting-season-1-0.zip` from the RELEASES tab on this page.
2. Create a new world for the match (the world folder needs to exist).
3. Place the zip file in the `datapacks` folder inside your world file.
4. Fire up the game/server and begin!

## Usage

Just follow these two steps to start the match!

1. Run `/function scrub:huntingseason/volunteer` if you are the player who will be hunted.
2. Run `/function scrub:huntingseason/start` to enable tracking and start the countdown to begin the game!

A user with operator permissions should run these commands, but if for some reason you don't want to or can't give operator permissions to the person who wishes to volunteer as the runner, use the command `/execute as <name_here> run /function scrub:huntingseason/volunteer` and replace `<name_here>` with the person you want. 

You can also stop the session prematurely by running `/function scrub:huntingseason/reset` to revert to the game's state before the minigame.

Run the command `scrub:huntingseason/help` ingame for the same explanation given above, including nifty hover and click events for the listed commands that autofill them into your chat bar!
(The teal commands and green `[?]` boxes are the bits that interact with the mouse)
