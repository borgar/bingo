execute store success score $success bingo_tmp if data storage bingo:card slots[{item:{id:"bingo:sea_pickle"}}] run data modify storage bingo:card slots[{item:{id:"bingo:sea_pickle"}}].selected set value true
execute if score $success bingo_tmp matches 1 run function bingo:item_detection/helper/check_and_announce