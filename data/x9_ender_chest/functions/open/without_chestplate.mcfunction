### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:open/without_chestplate
# 胴に検知用アイテムを渡す
# Give a detective item to the chest.
# @within
#   x9_ender_chest:open

replaceitem entity @s armor.feet minecraft:leather_chestplate{x9EnderChest:true,display:{Name:'"EnderChestGhost"'},AttributeModifiers:[]}
scoreboard players set _ x9EnderChest 1
