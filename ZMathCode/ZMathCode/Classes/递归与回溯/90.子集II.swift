//
//  90.子集II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/6.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: [1,2,2]
 输出:
 [
   [2],
   [1],
   [1,2,2],
   [2,2],
   [1,2],
   []
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subsets-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(subsetsWithDup([1,2,2]))

## 笔记
 这道题有两种思路
 第一种是利用 Set 这种数据结构的元素唯一特性做
 
 第二种是在数组的循环里去重,因为在数组的同一层循环里,如果同样的数,前面已经用过了,那么后面就不要再用了
 也就是 index > curIndex && arr[index] == arr[index-1] 这一步的精妙之处
 这种思路在 40.组合总和II 这道题里也有用到
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

//这种是利用 Set 元素唯一的特性
//func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//    var res: Set<[Int]> = Set<[Int]>()
//    var path: [Int] = [Int]()
//    let count = nums.count
//    let arr = nums.sorted()
//
//    func help(curIndex: Int) {
//        res.insert(path)
//        if curIndex >= count {
//            return
//        }
//
//        for index in curIndex..<count {
//            let num = arr[index]
//            path.append(num)
//            help(curIndex: index+1)
//            path.removeLast()
//        }
//    }
//
//    help(curIndex: 0)
//    return [[Int]](res)
//}

//在数组的循环里去重
func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = [[Int]]()
    var path: [Int] = [Int]()
    let count = nums.count
    //这种去重的一般都要排序
    let arr = nums.sorted()
    
    func help(curIndex: Int) {
        res.append(path)
        
        //边界判断
        if curIndex >= count {
            return
        }
        
        for index in curIndex..<count {
            let num = arr[index]
            //这一步是关键步骤: 去重
            //因为这里是数组里的循环,是有序的
            //如果同一层循环里前面已经用过了这个值,那么后面的就都不要用了
            if index > curIndex && num == arr[index - 1] {
                continue
            }
            path.append(num)
            help(curIndex: index+1)
            path.removeLast()
        }
    }
    
    help(curIndex: 0)
    return res
}

