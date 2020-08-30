### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:open/without_helmet
# 頭に検知用アイテムを渡す
# Give a detective item to the head.
# @within
#   x9_ender_chest:open

replaceitem entity @s armor.head minecraft:stone_button{x9EnderChest:true,display:{Name:'"EnderChestGhost"'}}
scoreboard players set _ x9EnderChest 1
