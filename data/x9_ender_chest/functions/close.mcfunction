### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:close
# エンダーチェストを閉じた時の処理
# Process on closed ender_chest.
# @within
#   x9_ender_chest:trigger/close

# 個別ストレージ呼び出し
function oh_my_dat:please
# 保存したスロットを確認
execute store result score _ x9EnderChest run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Slot
# アイテム情報更新
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel set value {id:"minecraft:barrel",Count:0b,Slot:0b,tag:{x9EnderChest:true,BlockEntityTag:{Items:[]}}}
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel.tag.BlockEntityTag.Items set from entity @s EnderItems
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel.Slot byte 1 run scoreboard players get _ x9EnderChest
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel.Count byte 1 if data entity @s EnderItems[0]
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrel
# アイテム情報を箱に入れる
forceload add 1 1
setblock 1 1 1 minecraft:black_shulker_box
data modify block 1 1 1 Items append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.Barrels[]
# プレイヤーのエンダーチェストにセット
loot replace entity @s enderchest.0 27 mine 1 1 1 minecraft:debug_stick

# エンダーチェストを確実に閉じる
execute at @s anchored eyes positioned ^ ^ ^2 run function x9_ender_chest:force_close
# depositを戻す
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest.deposit.id run function x9_ender_chest:close/deposit
# ストレージ内の情報をクリア
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest
