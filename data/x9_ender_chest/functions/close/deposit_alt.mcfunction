### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:close/deposit_alt
# 預かったアイテムを拾えるようにする
# Summon the deposit item at the player.
# @within
#   x9_ender_chest:close/deposit

loot spawn 4.0 4.0 4.0 mine 1 1 1 minecraft:debug_stick
execute positioned 4.0 4.0 4.0 run tp @e[distance=0,type=item,limit=1] @s
