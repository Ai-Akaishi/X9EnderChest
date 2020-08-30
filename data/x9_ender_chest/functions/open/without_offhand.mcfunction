### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:open/without_offhand
# オフハンドに検知用アイテムを渡す
# Give a detective item to the offhand.
# @within
#   x9_ender_chest:open

replaceitem entity @s weapon.offhand minecraft:light_gray_stained_glass_pane{x9EnderChest:true,display:{Name:'"EnderChestGhost"'}}
scoreboard players set _ x9EnderChest 1
