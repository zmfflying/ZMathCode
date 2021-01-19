//
//  239.滑动窗口最大值.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/14.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。
 
 示例 1：

 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 示例 2：

 输入：nums = [1], k = 1
 输出：[1]
 示例 3：

 输入：nums = [1,-1], k = 1
 输出：[1,-1]
 示例 4：

 输入：nums = [9,11], k = 2
 输出：[11]
 示例 5：

 输入：nums = [4,-2], k = 2
 输出：[4]

 提示：

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sliding-window-maximum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))

## 笔记
 这道题我没看题解之前确实是想不到用队列的方式来做的,思路是这样的
 
 用一个队列记录索引,窗口往后移的时候来处理这个队列
 处理的规则是 进 和 出
 进: 窗口右边有元素加入的时候,丢弃掉队列里比这个元素小的索引,因为只要这个元素还在这个窗口里,那么最大值肯定就是它,当这个元素出去的时候,那么跟在它后面的自然就是第二大的元素
 
 出:窗口左边有元素要出去的时候,判断下这个元素是不是当前队列里的最大值,如果是,那就处理下队列,移除第一个,如果不是最大值就不用管,因为根据进的规则,它的索引这个时候肯定不在队列里
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var res:[Int] = [Int]()
    //要记录索引 不要记录具体的数字
    var indexArr:[Int] = [Int]()
    //右边界
    var rightIndex = 0
    //左边界
    var leftIndex = rightIndex - k + 1
    
    while rightIndex < nums.count {
        //获取当前右边界的值
        let curNum = nums[rightIndex]
        
        //这里的左边界等于0的时候 是首次形成窗口的时候,窗口左边不需要动
        if leftIndex > 0 {
            //注意 这个时候 左边要丢弃的是 leftIndex - 1
            if leftIndex - 1 == indexArr.first {
                indexArr.removeFirst()
            }
        }
        
        //注意 这里如果有比尾数大的值要进窗口来 那么比这个尾数小的值肯定不会成为最大值了,丢弃即可
        while indexArr.count > 0 && curNum > nums[indexArr.last!] {
            indexArr.removeLast()
        }
        //因为上一步已经处理过了 这里直接加在末尾就行
        indexArr.append(rightIndex)
        
        //当窗口形成后才有值
        if leftIndex >= 0 {
            res.append(nums[indexArr.first!])
        }
        
        //左右边界同时移动
        rightIndex += 1
        leftIndex += 1
    }
    
    return res
}
