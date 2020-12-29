//
//  39.组合总和.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/28.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

 candidates 中的数字可以无限制重复被选取。

 说明：

 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 示例 1：

 输入：candidates = [2,3,6,7], target = 7,
 所求解集为：
 [
   [7],
   [2,2,3]
 ]
 示例 2：

 输入：candidates = [2,3,5], target = 8,
 所求解集为：
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
  

 提示：

 1 <= candidates.length <= 30
 1 <= candidates[i] <= 200
 candidate 中的每个元素都是独一无二的。
 1 <= target <= 500

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(combinationSum([2,3,6,7], 7))

## 笔记
 这道题我的感觉就是 穷尽法
 只要小于target的可能都要考虑到
 然后就是从头到尾一步步的穷尽过去
 中间注意下提前剪枝即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard candidates.count > 0 else {
       return [[]]
    }
    
    var res: [[Int]] = [[Int]]()
    var path: [Int] = [Int]()
    let count = candidates.count

    func help(sum: Int, curIndex: Int) {
        //边界判断 累计的和大于目标值 就放弃
        if sum > target {
            return
        }
        //累计的和等于目标值 就是正确的解
        if sum == target {
            res.append(path)
            return
        }

        //从第一个开始 考虑每一种情况 穷尽法
        for index in curIndex..<count {
            let num = candidates[index]
            let new = sum + num
            //这一步极为重要 能避免很多多余的计算
            if new > target {
                continue
            }
            path.append(num)
            //注意这里  index是可以等于curIndex的  所以[2,2,2,2]是可以计算到的
            help(sum: new, curIndex: index)
            path.removeLast()
        }
    }
    
    help(sum: 0, curIndex: 0)
    return res
}

