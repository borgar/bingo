#> bingo:custom_hud/components/player_position/shorten_z_iter
#
# Shortens the z coordinate until enough space was made
#
# @within
# 	function bingo:custom_hud/components/player_position/shorten_both
# 	function bingo:custom_hud/components/player_position/shorten_z
# 	function bingo:custom_hud/components/player_position/shorten_z_iter

scoreboard players operation $custom_hud/player_pos.short_z bingo.tmp /= 10 bingo.const
scoreboard players remove $custom_hud/width.characters bingo.io 1
scoreboard players add $custom_hud/width.padding bingo.io 6
scoreboard players add $custom_hud/player_pos.removed_z bingo.tmp 1

execute if score $custom_hud/width.characters bingo.io matches 12.. run function bingo:custom_hud/components/player_position/shorten_z_iter