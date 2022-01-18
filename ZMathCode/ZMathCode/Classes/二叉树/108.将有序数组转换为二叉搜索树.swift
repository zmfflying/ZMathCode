//
//  108.将有序数组转换为二叉搜索树.swift
//  ZMathCode
//
//  Created by QZD on 2022/1/17.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 高度平衡 二叉搜索树。

 高度平衡 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。

  

 示例 1：


 输入：nums = [-10,-3,0,5,9]
 输出：[0,-3,9,-10,null,5]
 解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：

 示例 2：


 输入：nums = [1,3]
 输出：[3,1]
 解释：[1,3] 和 [3,1] 都是高度平衡二叉搜索树。
  

 提示：

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums 按 严格递增 顺序排列

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
## 笔记
 print(sortedArrayToBST([-10,-3,0,5,9])
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    /**
     本题等同于根据中序遍历的序列恢复二叉搜索树。
     因此我们可以以升序序列中的任一个元素作为根节点，以该元素左边的升序序列构建左子树，以该元素右边的升序序列构建右子树，这样得到的树就是一棵二叉搜索树 又因为本题要求高度平衡，因此我们需要选择升序序列的中间元素作为根节点
     */
    func p_help(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = (left + right) / 2
        let root = TreeNode.init(nums[mid])
        root.left = p_help(nums, left, mid - 1)
        root.right = p_help(nums, mid + 1, right)
        return root
    }
    
    return p_help(nums, 0, nums.count - 1)
}
