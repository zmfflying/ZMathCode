//
//  337.打家劫舍III.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/26.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 在上次打劫完一条街道之后和一圈房屋后，小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为“根”。 除了“根”之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果两个直接相连的房子在同一天晚上被打劫，房屋将自动报警。

 计算在不触动警报的情况下，小偷一晚能够盗取的最高金额。

 示例 1:

 输入: [3,2,3,null,3,null,1]

      3
     / \
    2   3
     \   \
      3   1

 输出: 7
 解释: 小偷一晚能够盗取的最高金额 = 3 + 3 + 1 = 7.
 示例 2:

 输入: [3,4,5,1,3,null,1]

      3
     / \
    4   5
   / \   \
  1   3   1

 输出: 9
 解释: 小偷一晚能够盗取的最高金额 = 4 + 5 = 9.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/house-robber-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 let tree5 = TreeNode.init(1, nil, nil)
 let tree4 = TreeNode.init(3, nil, nil)
 let tree3 = TreeNode.init(3, nil, tree5)
 let tree2 = TreeNode.init(2, nil, tree4)
 let tree1 = TreeNode.init(3, tree2, tree3)
 print(rob(tree1))

## 笔记
 这道题两个核心点:
 第一,要使用后序遍历,这样根节点会最后一个被遍历的节点,根节点的最大值就是能盗取的最大金额
 
 第二,这棵树,从下往上每个节点,都会有两种可能金额: 偷本次 和 不偷本次,其中
 偷本节点的最大金额 = 本节点金额 + 不偷左子节点的最大金额 + 不偷右子节点的最大金额
 不偷本节点的最大金额 = 偷左子节点的最大金额 + 偷右子节点的最大金额
 
 用一个数组来记录并传递每个节点可收获的金额即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func rob(_ root: TreeNode?) -> Int {
    
    func help(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return [0,0]
        }
        let money = root!.val
        
        //计算出左右子节点可以获得的金额
        let left: [Int] = help(root?.left)
        let right: [Int] = help(root?.right)
        
        //不偷本节点的最大金额 = 左子节点的最大金额 + 右子节点的最大金额
        let noRobCurMoney = max(left[0], left[1]) + max(right[0], right[1])
        //偷本节点的最大金额 = 本节点金额 + 不偷左子节点的最大金额 + 不偷右子节点的最大金额
        let robCurMoney = money + left[0] + right[0]
        
        return [noRobCurMoney, robCurMoney]
    }
    
    let res = help(root)
    return max(res[0], res[1])
}
