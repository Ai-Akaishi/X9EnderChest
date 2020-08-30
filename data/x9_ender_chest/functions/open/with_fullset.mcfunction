### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:open/with_fullset
# インベントリに検知用アイテムを渡す
# Give a detective item to the inventory.
# @within
#   x9_ender_chest:open

execute store result score _ x9EnderChest if data entity @s Inventory[]
execute if score _ x9EnderChest matches 41 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.deposit set from entity @s Inventory[35]
execute if score _ x9EnderChest matches 41 run replaceitem entity @s inventory.26 minecraft:air
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.deposit.Slot set value 0b
give @s minecraft:light_gray_stained_glass_pane{x9EnderChest:true,display:{Name:'"EnderChestGhost"'}}
