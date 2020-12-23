//
//  47.全排列II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/17.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。

 示例 1：

 输入：nums = [1,1,2]
 输出：
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 示例 2：

 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  

 提示：

 1 <= nums.length <= 8
 -10 <= nums[i] <= 10

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(permuteUnique([1,1,2]))

## 笔记
 这道题的核心就是把数组看做排列成一行的空格
 然后从左往右每一个位置都依此尝试填入一个数
 注意的是 每次前面位置的数据已经绝对正确,我们只用考虑后面位置的就行
 
 最终我是利用Set元素唯一的特性做的
 这样自然不是最优解,但是很遗憾的是
 就算最优解放在我的面前
 我还是理解不了
 等后面面刷更多的题后再来复习
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

//利用set元素唯一的特性
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    //path 是当前的数组 如 [1,2,3] 或者 [1,3,2]
    //注意 path在同一时刻是唯一的
    var path = nums
    
    let total = nums.count
    
    //set 是最终结果 利用set元素唯一的特性
    var set: Set<[Int]> = Set<[Int]>()

    //total 是数组的count 用来做边界判断
    //curIndex 表示当前处理的位置 比如[1,2,3]的第0位 是1
    func help(total: Int, curIndex: Int, nums: [Int]) {
        if curIndex == total {
            //如果走到这里 nums已经走完 这个时候的path就是一次的数据
            set.insert(path)
            return
        }
        
        for i in curIndex..<total {
            //这里就是从左往右每一个位置都依此尝试填入一个数
            path.swapAt(curIndex, i)
            help(total: total, curIndex: curIndex+1, nums: nums)
            //本次处理完后要把位置换回去
            path.swapAt(curIndex, i)
        }
    }
    
    help(total: total, curIndex: 0, nums: nums)
    return [[Int]](set)
}


//最优解
//func permuteUnique(_ nums: [Int]) -> [[Int]] {
//    let nums = nums.sorted()
//    var used = [Bool](repeating: false, count: nums.count)
//    var r = [Int]()
//    var rs = [[Int]]()
//
//    func execute(_ nums: [Int], cur: Int) {
//        print(r,cur)
//        if r.count == nums.count {
//            rs.append(r)
//            return
//        }
//
//        for i in 0..<nums.count {
//            if used[i] {
//                continue
//            }
//            if i > 0 && nums[i] == nums[i-1] && used[i-1] {
//                continue
//            }
//            used[i] = true
//            r.append(nums[i])
//            execute(nums, cur: cur + 1)
//            r.removeLast()
//            used[i] = false
//        }
//    }
//
//    execute(nums,cur:0)
//    return rs
//}
