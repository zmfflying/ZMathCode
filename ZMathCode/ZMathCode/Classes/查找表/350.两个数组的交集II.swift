//
//  350.两个数组的交集II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/25.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给定两个数组，编写一个函数来计算它们的交集。

 示例 1：

 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 输出：[2,2]
 示例 2:

 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[4,9]
  

 说明：

 输出结果中每个元素出现的次数，应与元素在两个数组中出现次数的最小值一致。
 我们可以不考虑输出结果的顺序。
 进阶：

 如果给定的数组已经排好序呢？你将如何优化你的算法？
 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 如果 nums2 的元素存储在磁盘上，内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/intersection-of-two-arrays-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(intersect([4,9,5], [9,4,9,8,4]))

## 笔记
 这道题就是利用 hash 表查找 o(1)的特性
 元素为key  个数为value
 
 需要注意的就是 hash 表里存小数组的数据
 然后用大数组去匹配的运算会比较快
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    //保证nums1为小数组 nums2为大数组
    if nums1.count > nums2.count {
        return intersect(nums2, nums1)
    }
    
    var res: [Int] = [Int]()
    //创建一个hash表
    var dic: [Int: Int] = [Int: Int]()
    
    //hash表记录小数组的数据 元素为key 个数为value
    for num in nums1 {
        dic[num] = dic[num] == nil ? 1 : (dic[num]! + 1)
    }
    
    //用大数组里的数据去匹配
    for num in nums2 {
        if dic[num] != nil {
            res.append(num)
            
            let count = dic[num]! - 1
            dic[num] = count == 0 ? nil : count
        }
        
        //这里尽量减少循环的次数
        if res.count == nums1.count {
            break
        }
    }
    
    return res
}
