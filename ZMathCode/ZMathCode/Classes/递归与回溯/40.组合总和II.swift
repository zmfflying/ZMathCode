//
//  40.组合总和II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/29.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

 candidates 中的每个数字在每个组合中只能使用一次。

 说明：

 所有数字（包括目标数）都是正整数。
 解集不能包含重复的组合。
 示例 1:

 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 所求解集为:
 [
   [1, 7],
   [1, 2, 5],
   [2, 6],
   [1, 1, 6]
 ]
 示例 2:

 输入: candidates = [2,5,2,1,2], target = 5,
 所求解集为:
 [
   [1,2,2],
   [5]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(combinationSum2([10,1,2,7,6,1,5], 8))

## 笔记
 这道题还是只要小于target的可能都要考虑到
 然后就是从头到尾一步步的穷尽过去
 
 特别需要注意的是怎么去重
 去重分两步
 第一步对数组排序
 第二步是在数组的同一层循环里,如果同样的数,前面已经用过了,那么后面就不要再用了
 也就是 index > curIndex && arr[index] == arr[index-1] 这一步的精妙之处
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard candidates.count > 0 else {
        return []
    }
    
    var set: [[Int]] = [[Int]]()
    var path: [Int] = [Int]()
    let count = candidates.count
    //这种去重的一般都要排序
    let arr = candidates.sorted()
    
    //我这里是用当前path的和 sum
    func help(sum: Int, curIndex: Int) {
        //边界判断
        if sum > target {
            return
        }
        
        //如果相等 那么就是一个解
        if sum == target {
            set.append(path)
            return
        }
        
        for index in curIndex..<count {
            let num = arr[index]
            let new = sum + num
            //大剪枝
            if new > target {
                break
            }
            //这一步是关键步骤: 去重
            //因为这里是数组里的循环,是有序的
            //如果同一层循环里前面已经用过了这个值,那么后面的就都不要用了
            if index > curIndex && arr[index] == arr[index-1] {
                continue
            }
            
            path.append(num)
            help(sum: new, curIndex: index+1)
            path.removeLast()
        }
    }
    
    help(sum: 0, curIndex: 0)
    return set
}
