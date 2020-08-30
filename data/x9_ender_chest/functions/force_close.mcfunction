### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:force_close
# 強制的にエンダーチェストを閉じる
# Ensure ender_chest closed.
# @within
#   x9_ender_chest:close

execute if predicate x9_ender_chest:low run clone ~-3 0 ~-3 ~3 ~3 ~3 ~-3 0 ~-3 filtered minecraft:ender_chest force
execute if predicate x9_ender_chest:high run clone ~-3 ~-3 ~-3 ~3 255 ~3 ~-3 ~-3 ~-3 filtered minecraft:ender_chest force
execute unless predicate x9_ender_chest:low unless predicate x9_ender_chest:high run clone ~-3 ~-3 ~-3 ~3 ~3 ~3 ~-3 ~-3 ~-3 filtered minecraft:ender_chest force
