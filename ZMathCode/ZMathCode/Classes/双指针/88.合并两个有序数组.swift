//
//  88.合并两个有序数组.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/4.
//  Copyindex2 © 2021 zmfflying. All index2s reserved.
//
/**
 ## 题目
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。


 示例 1：

 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 示例 2：

 输入：nums1 = [1], m = 1, nums2 = [], n = 0
 输出：[1]
  

 提示：

 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[i] <= 109

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 var nums1 = [1,2,3,0,0,0]
 merge(&nums1, 3, [2,5,6], 3)
 print(nums1)

## 笔记
 第一种思路 把第二个数组里的数组放到第一个数组里然后排序
 
 第二种思路 创建一个新数组,每次从原来的两个数组里从前往后取,找到最小的那个元素放进新数组里
 
 第三种思路 不开启新空间,就在第一个数组里进行处理,从后往前取最大值
 
 下面重点讲讲第三种思路,应该算是三指针吧
 第一个index1  指向 m-1,即第一个数组的有效数据末端
 第一个index2  指向 n-1,即第二个数组的末端
 第三个indexCur  指向 m + n - 1, 即包含无效数据的第一个数组的末端
 
 然后从后往前遍历无效数据的第一个数组, 即 第三个指针indexCur -= 1
 在每一个位置都去比较 index1 和 index2 的元素
 取出较大的一个放到 indexCur
 对应的 index1 或者 index2 -= 1 即可
 
 注意这种思路处理的时候,如果取的是 index1, 要和 indexCur 进行数据交换
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    //记录第一个数组的有效数据末端索引
    var index1 = m - 1
    //第二个数组的末端索引
    var index2 = n - 1

    //记录正在处理的索引
    var indexCur = m + n - 1

    //从尾端开始处理
    while indexCur >= 0 {
        //找出当前未处理的两段数据的值
        let numIndex1 = index1 < 0 ? Int.min : nums1[index1]
        let numIndex2 = index2 < 0 ? Int.min : nums2[index2]

        //取出最大值放在尾端
        //同时对应索引 -= 1
        if numIndex1 > numIndex2 {
            //如果是第一段数据要注意交换数据
            if nums1[indexCur] != numIndex1 {
                nums1[index1] = nums1[indexCur]
                nums1[indexCur] = numIndex1
            }
            index1 -= 1
        } else {
            nums1[indexCur] = numIndex2
            index2 -= 1
        }
        indexCur -= 1
    }
}

//这种和上面的思路一样,优化后只用处理 n 次就行了, 但是没有上面好理解
//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//    var index1 = m - 1
//    var index2 = n - 1
//    var indexCur = m + n - 1
//
//    while index2 >= 0 {
//        if index1 >= 0 && nums1[index1] > nums2[index2] {
//            nums1[indexCur] = nums1[index1]
//            index1 -= 1
//        } else {
//            nums1[indexCur] = nums2[index2]
//            index2 -= 1
//        }
//        indexCur -= 1
//    }
//}
