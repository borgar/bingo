#> bingo:game/start/move_z/1
#
# @within function bingo:game/start/move_z/0

execute if score $game/start.spawnz bingo.tmp matches ..-1 run scoreboard players add $game/start.spawnz bingo.tmp 32768

execute if score $game/start.spawnz bingo.tmp matches ..16383 run function bingo:game/start/move_z/2
execute if score $game/start.spawnz bingo.tmp matches 16384.. positioned ~ ~ ~14999552 run function bingo:game/start/move_z/2