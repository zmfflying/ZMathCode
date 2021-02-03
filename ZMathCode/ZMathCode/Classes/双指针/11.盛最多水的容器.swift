//
//  11.盛最多水的容器.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/3.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器。


 示例 1：

 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 示例 2：

 输入：height = [1,1]
 输出：1
 示例 3：

 输入：height = [4,3,2,1,4]
 输出：16
 示例 4：

 输入：height = [1,2,1]
 输出：2
  

 提示：

 n = height.length
 2 <= n <= 3 * 104
 0 <= height[i] <= 3 * 104


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/container-with-most-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(maxArea([1,8,6,2,5,4,8,3,7]))

## 笔记
 这道题就是经典的双指针题目了
 思路就是两边往中间移
 那边小就移动哪一边
 每次都获取当前的容量
 然后就可以获得最大容量了
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func maxArea(_ height: [Int]) -> Int {
    var maxArea: Int = 0
    
    //从两边往中间移
    var left: Int = 0
    var right: Int = height.count - 1
    
    while left < right {
        let leftHeight: Int = height[left]
        let rightHeight: Int = height[right]
        
        //得到当前容量
        let area: Int = min(leftHeight, rightHeight) * (right - left)
        //判断最大容量
        maxArea = max(maxArea, area)
        
        //哪边元素比较小就移动哪一边
        if leftHeight < rightHeight  {
            left += 1
        } else {
            right -= 1
        }
    }
     
    return maxArea
}
