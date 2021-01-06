//
//  216.组合总和III.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/6.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 找出所有相加之和为 n 的 k 个数的组合。组合中只允许含有 1 - 9 的正整数，并且每种组合中不存在重复的数字。

 说明：

 所有数字都是正整数。
 解集不能包含重复的组合。
 示例 1:

 输入: k = 3, n = 7
 输出: [[1,2,4]]
 示例 2:

 输入: k = 3, n = 9
 输出: [[1,2,6], [1,3,5], [2,3,4]]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(combinationSum3(3, 7))

## 笔记
 这道题就是从小到大一个个的数都去计算
 需要注意的就两个
 一个是: 比当前数小的情况,前面肯定已经计算过了,不用在考虑, 即只用考虑 1,3,4  不用考虑 1,3,2
 另一个是: 要注意边界判断的条件有三个,path.count 是否大于k, 当前 path 的和加上当前数是否已经大于 n, 当前数是否已经大于了9
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var res:[[Int]] = [[Int]]()
    var path:[Int] = [Int]()
    //组合中只允许含有 1 - 9
    let maxNum: Int = min(9, n)
    
    //sum 是当前path的和
    //curNum 是从小到大当前的数字
    //curCount 是当前path里的count
    func help(sum: Int, curNum: Int, curCount: Int) {
        //正确值判断
        if sum == n && curCount == k {
            res.append(path)
            return
        }
        
        //边界判断
        if (sum + curNum) > n || curCount > k || curNum > maxNum {
            return
        }
        
        //从1到9 一个个去尝试
        for num in curNum...maxNum {
            let new = sum + num
            //这里不写也行 但是写了可以提前剪枝
            if new > n {
                break
            }
            
            path.append(num)
            //都是从小到大去计算的
            //所以只管+1就行 小于的前面肯定都已经算过了
            //即只用考虑 1,3,4  不用考虑 1,3,2
            help(sum: new, curNum: num+1, curCount: curCount+1)
            path.removeLast()
        }
    }
    help(sum: 0, curNum: 1, curCount: 0)
    return res
}
