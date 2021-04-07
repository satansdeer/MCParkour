# Called from: #ivanov:load

#---------------------------------------------------------------------------------------------------
# Purpose: When a objective is removed, all of its data is wiped clean. Since we use the scoreboard
#	primarily for storing data, this is an efficient way to hard reset the project to "factory
#   state". If this project were to ever need some kind of persistent data between sessions, another
#   solution should be designed.
#---------------------------------------------------------------------------------------------------

# CONST (constant) scoreboard stores values which should not be changed or altered in any way.
#   They are almost always numbers which are used in math operations.
scoreboard objectives remove CONST
scoreboard objectives add CONST dummy
	scoreboard players set -100 CONST -100
	scoreboard players set 2 CONST 2
	scoreboard players set 3 CONST 3
	scoreboard players set 4 CONST 4
	scoreboard players set 6 CONST 6
	scoreboard players set 12 CONST 12
	scoreboard players set 20 CONST 20
	scoreboard players set 60 CONST 60
	scoreboard players set 80 CONST 80
	scoreboard players set 100 CONST 100

# This section removes and recreates read-only scoreboards. These scoreboard should not be altered,
#   and some require the player be registered
scoreboard objectives remove health
scoreboard objectives add health health {"text":"❤","color":"red"}
	scoreboard objectives setdisplay belowName health
scoreboard objectives remove food
scoreboard objectives add food food
scoreboard objectives remove timeSinceDeath
scoreboard objectives add timeSinceDeath minecraft.custom:minecraft.time_since_death
# These scoreboard
scoreboard objectives remove QueryResult
scoreboard objectives add QueryResult dummy
scoreboard objectives remove SuccessCount
scoreboard objectives add SuccessCount dummy

scoreboard objectives remove jump
scoreboard objectives add jump minecraft.custom:minecraft.jump

#---------------------------------------------------------------------------------------------------
# Purpose: Set-up scoreboard for customizable game variables. These are variables which should be
#   treated as global and accessible from any function. They may also store
#---------------------------------------------------------------------------------------------------
# This objective is removed and reset after each round to ensure no hanky panky has occurred. 
scoreboard objectives remove gameVariable
scoreboard objectives add gameVariable dummy

scoreboard objectives setdisplay sidebar health

time set noon
gamerule doDaylightCycle false

# Re-register when reloading the map
tag @a remove Registered