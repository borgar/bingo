execute store success score $success bingo_tmp if data storage bingo:card slots[{item:{id:"bingo:apple"}}] run data modify storage bingo:card slots[{item:{id:"bingo:apple"}}].selected set value true
execute if score $success bingo_tmp matches 1 run function bingo:item_detection/helper/check_and_announce