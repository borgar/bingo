#> bingo:preferences/show
#
# Shows the preferences page the player just selected.
#
# @within function bingo:lobby/player_tick
# @context entity Player who triggered bingo.pref
# @user
# @reads storage bingo:registries preferences.custom_hud.main

#>
# This storage contains the menuOptions nbt, which can be modified in functions
# referenced in #bingo:preferences/* function tags to set disabled and hidden
# attributes on specific entries.
#
# @api
#declare storage io.bingo:preferences
#>
# @within bingo:preferences/**
#declare storage tmp.bingo:preferences

#>
# Used to tag a player if the enable gamemode switch tag was added this tick
#
# @private
#declare tag bingo.pref.added

tag @s[scores={bingo.pref=2}, tag=!bingo.enable_manual_gameode_switch] add bingo.pref.added
tag @s[scores={bingo.pref=2}, tag=!bingo.enable_manual_gameode_switch] add bingo.enable_manual_gameode_switch
tag @s[scores={bingo.pref=2}, tag=bingo.enable_manual_gameode_switch, tag=!bingo.pref.added] remove bingo.enable_manual_gameode_switch
tag @s remove bingo.pref.added

data remove storage tmp.bingo:preferences back
execute if score @s bingo.pref matches 1..2 run data modify storage io.bingo:preferences menuOptions set from storage bingo:registries preferences.main
execute if score @s bingo.pref matches 1..2 run function #bingo:preferences/main
execute if score @s bingo.pref matches 1..2 run tellraw @s ["\n\n\n\n\n=== ", {"translate": "bingo.preferences.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.description", "color": "gray"}, "\n"]

execute if score @s bingo.pref matches 5..69 run function bingo:preferences/custom_hud/show

execute if score @s bingo.pref matches 1..5 run function bingo:preferences/print_menu_items
execute if score @s bingo.pref matches 11 run function bingo:preferences/print_menu_items
scoreboard players reset @s bingo.pref

execute if data storage tmp.bingo:preferences back run tellraw @s ["\n", {"storage": "tmp.bingo:preferences", "nbt": "back", "interpret": true}]

#>
# In case an action happened and in the next tick a different page shoud be
# shown, this score is set.
#
# @within function bingo:preferences/**
#declare score_holder $preferences.next_page
execute if score $preferences.next_page bingo.tmp matches -2147483648.. run scoreboard players operation @s bingo.pref = $preferences.next_page bingo.tmp
scoreboard players reset $preferences.next_page bingo.tmp