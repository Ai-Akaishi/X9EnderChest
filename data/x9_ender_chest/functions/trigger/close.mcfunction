### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:trigger/close
# エンダーチェストを閉じた時の処理
# Process on closed ender_chest.
# @private

#>
# 操作用ディメンション
# Custom Dimension for Processing
# @private
#define dimension dimension:void

# エンダーチェストを開いたことをリセット
scoreboard players reset @s x9EnderChest
execute in dimension:void run function x9_ender_chest:close

# トリガー再有効化
advancement revoke @s only x9_ender_chest:close
