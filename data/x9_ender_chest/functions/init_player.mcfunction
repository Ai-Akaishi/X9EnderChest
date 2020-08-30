### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:init_player
# ストレージ初期化
# Initialize storage of the player.
# @within
#   x9_ender_chest:open

forceload add 1 1
setblock 1 1 1 minecraft:black_shulker_box
data modify block 1 1 1 Items append value {id:"minecraft:barrel",Count:1b,Slot:0b,tag:{x9EnderChest:true,BlockEntityTag:{Items:[]}}}
data modify block 1 1 1 Items[0].tag.BlockEntityTag.Items set from entity @s EnderItems
data modify block 1 1 1 Items[0].Slot set from entity @s SelectedItemSlot
# プレイヤーのエンダーチェストにセット
loot replace entity @s enderchest.0 27 mine 1 1 1 minecraft:debug_stick
