#> x9_ender_chest:init_player
# ストレージ初期化
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

# 個別ストレージ呼び出し
function #oh_my_dat:please

## 最初の樽をセット
data modify storage player_item_tuner: result.items set value [{id:"minecraft:barrel",Count:1b,Slot:0b,tag:{x9EnderChest:true,BlockEntityTag:{Items:[]}}}]
## 現在のエンダーチェストのアイテムを記録
data modify storage player_item_tuner: result.items[0].tag.BlockEntityTag.Items set from entity @s EnderItems
execute store result storage player_item_tuner: result.items[0].Slot byte 1 run data get entity @s SelectedItemSlot
data modify storage player_item_tuner: result.fill set value {id:"minecraft:air"}

function #player_item_tuner:replace/enderchest
