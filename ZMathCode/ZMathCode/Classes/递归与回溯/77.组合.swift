//
//  77.组合.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/23.
//  Copyright © 2020 zmfflying. All rights reserved.
//

/**
## 题目
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:

 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combinations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(combine(4, 2))

## 笔记
 这道题的核心还是 递归+循环
 唯一需要注意的就是提前剪枝
 在剩余的数不足以凑成结果的时候就停止
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var res:[[Int]] = [[Int]]()
    var path:[Int] = [Int]()

    func help(curIndex: Int) {
        //判断结果
        if path.count == k {
            res.append(path)
            return
        }
        
        //剪枝 当剩余的数已经不足以凑成结果的时候停止
        if path.count + (n - curIndex + 1) < k {
            return
        }

        //对curIndex 及以后的数做循环
        //curIndex 之前的数都已经用过了
        for index in curIndex...n {
            path.append(index)
            help(curIndex: index+1)
            path.removeLast()
        }
    }

    help(curIndex: 1)
    return res
}

