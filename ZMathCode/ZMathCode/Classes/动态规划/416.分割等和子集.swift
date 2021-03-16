//
//  416.分割等和子集.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/8.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个只包含正整数的非空数组。是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

 注意:

 每个数组中的元素不会超过 100
 数组的大小不会超过 200
 示例 1:

 输入: [1, 5, 11, 5]

 输出: true

 解释: 数组可以分割成 [1, 5, 5] 和 [11].
  

 示例 2:

 输入: [1, 2, 3, 5]

 输出: false

 解释: 数组不能分割成两个元素和相等的子集.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-equal-subset-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(canPartition([1, 5, 11, 5]))

## 笔记
 这道题是经典的 0-1背包 题型
 每个元素只能取一次, 每次都是在取和不取中寻求最优值
 具体步骤见代码和注释
 
 关于 0-1背包, 可以参考这篇文章:
 https://juejin.cn/post/6844903607855251463
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//标准的 0-1 背包
func canPartition(_ nums: [Int]) -> Bool {
    var sum = 0
    for num in nums {
        sum += num
    }
    
    //这道题的一个特点就是: 如果和不是偶数就肯定不会符合条件
    //因为数组 nums 只包含正整数, 而奇数除以2就有小数了
    if sum % 2 != 0 {
        return false
    }

    //分割成 0-1 背包问题就是: 在 nums 里面, 寻找能满足和等于数组总和一半的子集
    let C = sum / 2
    let count = nums.count
    
    //二维数组 dp[i][j] 表示: 在前 i 个元素里, 是否存在和等于 j 的子集
    //注意这里 内层数组个数为 C+1, 因为 C 的情况也要取
    //外层数组个数为 count即可, 因为 count 用不上, 最后一个元素是 count-1
    var dp: [[Bool]] = [[Bool]].init(repeating: [Bool].init(repeating: false, count: C+1), count: count)
    
    //设置初始值: dp[i][0] 恒等于 true, 因为和等于 0 的子集肯定存在, 即 []
    for i in 0..<count {
        dp[i][0] = true
    }
    
    for i in 1..<count {
        let num = nums[i]
        for j in 1...C {
            //如果比j大, 那肯定不选当前元素
            if j < num {
                dp[i][j] = dp[i-1][j]
            } else {
                //选 i 的情况是 dp[i-1][j-num]
                //不选 i 的情况是 dp[i-1][j]
                //因为都是 bool 类型, true || false = true
                //所以只要有一种满足, 那就可以了
                dp[i][j] = dp[i-1][j] || dp[i-1][j-num]
            }
        }
    }

    return dp[count-1][C]
}

//优化 一维数组
//针对本题而言,dp里是bool类型元素,只要有一个为true
//那么 true || false = true
func canPartition1(_ nums: [Int]) -> Bool {
    var sum = 0
    for num in nums {
        sum += num
    }

    if sum % 2 != 0 {
        return false
    }

    let C = sum / 2
    let count = nums.count

    var dp: [Bool] = [Bool].init(repeating: false, count: C+1)
    dp[0] = true
    
    for i in 1..<count {
        let num = nums[i]
        //注意这里要从大到小
        //因为要避免后面的元素收到前面的影响
        //如果是从小到大, 那么如果 dp[0] = true, j 一次遍历后, 所有 d[0+num] 的元素都为true了
        var j = C
        while j >= num {
            dp[j] = dp[j] || dp[j-num]
            j -= 1
        }
    }

    return dp[C]
}
