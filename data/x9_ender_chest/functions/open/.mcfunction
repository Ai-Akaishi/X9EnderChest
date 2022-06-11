#> x9_ender_chest:open/
# エンダーチェストを開いた時の処理
# Process on opened ender_chest.
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

# 個別ストレージ呼び出し
function oh_my_dat:please

# 正常に閉じられていなければ、閉じちゃえばいい！！
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest run function x9_ender_chest:close/

# 開いたエンダーチェストにx9EnderChest付き樽以外があった場合、プレイヤー初期化
execute store result score _ x9EnderChest if data entity @s EnderItems[]
execute store result score @s x9EnderChest if data entity @s EnderItems[{id:"minecraft:barrel",Count:1b,tag:{x9EnderChest:true}}]
scoreboard players operation _ x9EnderChest -= @s x9EnderChest
scoreboard players reset @s x9EnderChest
execute if score _ x9EnderChest matches 1.. run function x9_ender_chest:init_player
# エンダーチェストの中身をストレージに退避
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels set value [{Slot:0b,Count:0b},{Slot:1b,Count:0b},{Slot:2b,Count:0b},{Slot:3b,Count:0b},{Slot:4b,Count:0b},{Slot:5b,Count:0b},{Slot:6b,Count:0b},{Slot:7b,Count:0b},{Slot:8b,Count:0b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[0] set from entity @s EnderItems[{Slot:0b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[1] set from entity @s EnderItems[{Slot:1b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[2] set from entity @s EnderItems[{Slot:2b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[3] set from entity @s EnderItems[{Slot:3b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[4] set from entity @s EnderItems[{Slot:4b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[5] set from entity @s EnderItems[{Slot:5b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[6] set from entity @s EnderItems[{Slot:6b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[7] set from entity @s EnderItems[{Slot:7b}]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[8] set from entity @s EnderItems[{Slot:8b}]

# 今どのスロットか記憶する
execute store result score _ x9EnderChest store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Slot byte 1 run data get entity @s SelectedItemSlot

# アイテム情報を指定
data modify storage player_item_tuner: result set value {fill:{id:"minecraft:air"}}
execute if score _ x9EnderChest matches 0 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:0b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 1 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:1b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 2 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:2b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 3 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:3b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 4 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:4b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 5 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:5b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 6 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:6b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 7 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:7b}].tag.BlockEntityTag.Items
execute if score _ x9EnderChest matches 8 run data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:8b}].tag.BlockEntityTag.Items

# プレイヤーのエンダーチェストにセット
function #player_item_tuner:replace/enderchest
