### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:open/without_boots
# 足に検知用アイテムを渡す
# Give a detective item to the feet.
# @within
#   x9_ender_chest:open

replaceitem entity @s armor.feet minecraft:leather_boots{x9EnderChest:true,display:{Name:'"EnderChestGhost"'},AttributeModifiers:[]}
scoreboard players set _ x9EnderChest 1
