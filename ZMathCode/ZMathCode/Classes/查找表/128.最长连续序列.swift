//
//  128.最长连续序列.swift
//  ZMathCode
//
//  Created by zmfflying on 2023/4/27.
//  Copyright © 2023 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

 请你设计并实现时间复杂度为 O(n) 的算法解决此问题。

  

 示例 1：

 输入：nums = [100,4,200,1,3,2]
 输出：4
 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 示例 2：

 输入：nums = [0,3,7,2,5,8,4,6,0,1]
 输出：9
  

 提示：

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/longest-consecutive-sequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print("\(longestConsecutive([100,4,200,1,3,2]))")

## 笔记
 这道题的核心就是 从小到大, 每次都去找比当前值大的数, 而如果存在比当前值小的数, 说明当前值肯定不是最大的那个

## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    let numSet: Set<Int> = Set(nums)
    var maxLen: Int = 0
    
    for num in numSet {
        if numSet.contains(num-1) {
            continue
        }
        //找大
        var big = num
        var count = 0
        while numSet.contains(big) {
            count += 1
            big += 1
        }
        maxLen = max(count, maxLen)
    }
    return maxLen
}

//func longestConsecutive(_ nums: [Int]) -> Int {
//    var dict: [Int: Int] = [Int: Int]()
//    var maxLen: Int = 0
//
//    for num in nums {
//        if dict[num] != nil {
//            continue
//        }
//        //找小
//        var cur = 1
//        if let pre = dict[num - 1] {
//            cur = pre + 1
//        }
//        dict[num] = cur
//        //找大
//        var big = num + 1
//        while dict[big] != nil {
//            cur += 1
//            dict[big] = cur
//            big += 1
//        }
//        maxLen = max(cur, maxLen)
//    }
//    return maxLen
//}
