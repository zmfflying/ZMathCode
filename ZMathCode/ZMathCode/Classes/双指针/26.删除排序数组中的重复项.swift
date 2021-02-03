//
//  26.删除排序数组中的重复项.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/3.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 示例 1:

 给定数组 nums = [1,1,2],

 函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。

 你不需要考虑数组中超出新长度后面的元素。
 示例 2:

 给定 nums = [0,0,1,1,1,2,2,3,3,4],

 函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。

 你不需要考虑数组中超出新长度后面的元素。
  

 说明:

 为什么返回数值是整数，但输出的答案是数组呢?

 请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

 你可以想象内部操作如下:

 // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
 int len = removeDuplicates(nums);

 // 在函数里修改输入数组对于调用者是可见的。
 // 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 var nums = [0,0,1,1,1,2,2,3,3,4]
 print(removeDuplicates(&nums), nums)

## 笔记
 这道题是要使用快慢指针的思想
 因为题目要求只要前面数据正确就可以,而且还是有序数组
 那么就可以创建快慢指针
 慢指针指向第 0 个元素
 快指针指向第 1 个元素
 
 然后在快指针往后移动的过程中
 当快指针指向的元素和慢指针指向的元素不相等的时候移动慢指针即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    //快慢指针
    var slow = 0
    var fast = 1
    while fast < nums.count {
        //当两个指针指向的元素不相等的时候慢指针才移动
        if nums[slow] != nums[fast] {
            slow += 1
            nums[slow] = nums[fast]
        }
        //否则就是快指针移动
        fast += 1
    }
    return slow + 1
}

