tellraw @a {"translate": "bingo.got_item", "with": [{"selector": "@s"}, {"translate": "block.minecraft.rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rail"}}}]}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_completed_item, tag=bingo_current_team, limit=1] run function bingo:item_detection/goals/announce_completed_goals
clear @s minecraft:rail 1