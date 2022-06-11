#> x9_ender_chest:close/
# エンダーチェストを閉じた時の処理
# Process on closed ender_chest.
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

# 個別ストレージ呼び出し
function oh_my_dat:please
# 保存したスロットを確認
execute store result score _ x9EnderChest run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Slot
# アイテム情報更新
## 空っぽの樽の中にエンダーチェストのアイテムを入れる
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel set value {id:"minecraft:barrel",Count:0b,Slot:0b,tag:{x9EnderChest:true,BlockEntityTag:{Items:[]}}}
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel.tag.BlockEntityTag.Items set from entity @s EnderItems
## スロットとカウントを設定
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel.Slot byte 1 run scoreboard players get _ x9EnderChest
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel.Count byte 1 if data entity @s EnderItems[0]

## スロットに応じてアイテムデータを上書き
execute if score _ x9EnderChest matches 0 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:0b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:1b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 2 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:2b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 3 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:3b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 4 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:4b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 5 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:5b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 6 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:6b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 7 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:7b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
execute if score _ x9EnderChest matches 8 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[{Slot:8b}] set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel

# アイテム情報を指定
data modify storage player_item_tuner: result set value {fill:{id:"minecraft:air"}}
data modify storage player_item_tuner: result.items set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels
# プレイヤーのエンダーチェストにセット

## エンダーチェストのアイテム置き換え
data modify storage x9_ender_chest: _ set from storage player_item_tuner: result.items
data remove storage x9_ender_chest: _[{Count:0b}]
function #player_item_tuner:replace/enderchest
## エンダーチェストのアイテム置き換えチェック
# ワールド読み込み直後は失敗する可能性があるので、置き換えた後のエンダーチェストのアイテムを確認して、
# もし失敗していたら、データを保持する
execute store result storage x9_ender_chest: _ byte 1 run data modify storage x9_ender_chest: _ set from entity @s EnderItems
## ストレージ内の情報をクリア
execute if data storage x9_ender_chest: {_:false} run data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest
