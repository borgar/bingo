tellraw @a {"translate": "bingo.got_item", "with": [{"selector": "@s"}, {"translate": "item.minecraft.golden_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_pickaxe"}}}]}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_completed_item, tag=bingo_current_team, limit=1] run function bingo:item_detection/goals/announce_completed_goals
tag @s add bingo_clear_golden_pickaxe
schedule function bingo:item_detection/clear_item/golden_pickaxe 1