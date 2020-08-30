### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

#> x9_ender_chest:trigger/open
# エンダーチェストを開いた時の処理
# Process on opened ender_chest.
# @private

#>
# 操作用ディメンション
# Custom Dimension for Processing
# @private
#define dimension dimension:void

execute in dimension:void run function x9_ender_chest:open

# トリガー再有効化
advancement revoke @s only x9_ender_chest:open
