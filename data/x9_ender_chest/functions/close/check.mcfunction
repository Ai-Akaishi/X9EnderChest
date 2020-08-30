### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:close/check
# もしストレージにデータを持っていたら、エンダーチェストに戻す
# Return data to the ender_chest from storage.
# @within
#   x9_ender_chest:load

# 個別ストレージ呼び出し
function oh_my_dat:please
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].x9EnderChest run function x9_ender_chest:trigger/close
