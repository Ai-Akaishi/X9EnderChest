### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:open
# エンダーチェストを開いた時の処理
# Process on opened ender_chest.
# @within
#   x9_ender_chest:trigger/open

#>
# 個別ストレージ
# Private Storage
# @internal
#define storage oh_my_dat:
#>
# 個別ストレージ呼び出し
# Call Private Storage
# @internal
#define function oh_my_dat:please

# 個別ストレージ呼び出し
function oh_my_dat:please
# 開いたエンダーチェストにx9EnderChest付き樽以外があった場合、プレイヤー初期化
execute store result score _ x9EnderChest if data entity @s EnderItems[]
execute store result score @s x9EnderChest if data entity @s EnderItems[{id:"minecraft:barrel",Count:1b,tag:{x9EnderChest:true}}]
scoreboard players operation _ x9EnderChest -= @s x9EnderChest
scoreboard players reset @s x9EnderChest
execute if score _ x9EnderChest matches 1.. run function x9_ender_chest:init_player
# エンダーチェストの中身をストレージに退避
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels set from entity @s EnderItems

# 今どのスロットか記憶する
execute store result score _ x9EnderChest store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Slot int 1 run data get entity @s SelectedItemSlot

# アイテム情報を箱に入れる
forceload add 1 1
setblock 1 1 1 minecraft:black_shulker_box
execute if score _ x9EnderChest matches 0 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:0b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 1 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:1b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 2 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:2b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 3 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:3b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 4 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:4b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 5 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:5b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 6 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:6b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 7 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:7b}].tag.BlockEntityTag.Items[]
execute if score _ x9EnderChest matches 8 run data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:8b}].tag.BlockEntityTag.Items[]
# プレイヤーのエンダーチェストにセット
loot replace entity @s enderchest.0 27 mine 1 1 1 minecraft:debug_stick

# エンダーチェスト閉じ検知準備
scoreboard players set _ x9EnderChest 0
execute unless data entity @s Inventory[{Slot:100b}] run function x9_ender_chest:open/without_boots
execute if score _ x9EnderChest matches 0 unless data entity @s Inventory[{Slot:101b}] run function x9_ender_chest:open/without_leggings
execute if score _ x9EnderChest matches 0 unless data entity @s Inventory[{Slot:102b}] run function x9_ender_chest:open/without_chestplate
execute if score _ x9EnderChest matches 0 unless data entity @s Inventory[{Slot:103b}] run function x9_ender_chest:open/without_helmet
execute if score _ x9EnderChest matches 0 unless data entity @s Inventory[{Slot:-106b}] run function x9_ender_chest:open/without_offhand
execute if score _ x9EnderChest matches 0 run function x9_ender_chest:open/with_fullset
scoreboard players set @s x9EnderChest 2
clear @s #x9_ender_chest:ghost{x9EnderChest:true}



