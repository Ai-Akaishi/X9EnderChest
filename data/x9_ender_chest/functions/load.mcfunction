### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:laod
# 初期化
# Initialize
# @within
#   #minecraft:load

execute as @a[scores={x9EnderChest=1..}] run function x9_ender_chest:close/check
scoreboard objectives remove x9EnderChest
scoreboard objectives add x9EnderChest minecraft.custom:minecraft.open_enderchest
