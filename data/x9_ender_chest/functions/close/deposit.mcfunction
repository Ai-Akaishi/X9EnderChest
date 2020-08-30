### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:close/deposit
# 預かったアイテムを返す
# Return the deposit item.
# @within
#   x9_ender_chest:close

setblock 1 1 1 minecraft:black_shulker_box
data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.deposit
execute store result score _ x9EnderChest run loot give @s mine 1 1 1 minecraft:debug_stick
execute if score _ x9EnderChest matches 0 run function x9_ender_chest:close/deposit_alt
