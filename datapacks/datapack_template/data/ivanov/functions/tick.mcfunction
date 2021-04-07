# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Run these commands every tick.
#---------------------------------------------------------------------------------------------------

# Register the player
tellraw @a[tag=!Registered] {"text":"You've been registered!"}
effect clear @a[tag=!Registered]
effect give @a[tag=!Registered] minecraft:hunger 3 10 true
effect give @a[tag=!Registered] minecraft:absorption 3 10 true
effect give @a[tag=!Registered] minecraft:saturation 5 10 true
spawnpoint @a[tag=!Registered] 88 5 114
tag @a[tag=!Registered] add Registered

# Feed hungry players
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

execute as @a at @s if block ~ ~-0.1 ~ minecraft:brown_stained_glass run scoreboard players set @a jump 0
execute as @a at @s if block ~ ~-0.1 ~ minecraft:brown_stained_glass run tp @a 88 5 114 0 0


execute if entity @a[scores={jump=7..}] run say You jumped too much!
execute if entity @a[scores={jump=7..}] run tp @a 88 5 114 0 0
execute if entity @a[scores={jump=7..}] run scoreboard players set @a jump 0

execute as @a[scores={sneak=1..}] at @s if block ~ ~-1 ~ minecraft:crimson_nylium run say Got to the block. You won!
execute as @a[scores={sneak=1..}] at @s if block ~ ~-1 ~ minecraft:crimson_nylium run tp @s 88 5 114 0 0
execute as @a[scores={sneak=1..}] run scoreboard players set @a sneak 0

# Flag dead players and then do things to them.
execute as @a[scores={timeSinceDeath=..1,health=20}] run say haha you died