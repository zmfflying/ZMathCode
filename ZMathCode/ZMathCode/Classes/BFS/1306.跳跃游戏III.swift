//
//  1306.跳跃游戏III.swift
//  ZMathCode
//
//  Created by QZD on 2022/5/7.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 这里有一个非负整数数组 arr，你最开始位于该数组的起始下标 start 处。当你位于下标 i 处时，你可以跳到 i + arr[i] 或者 i - arr[i]。

 请你判断自己是否能够跳到对应元素值为 0 的 任一 下标处。

 注意，不管是什么情况下，你都无法跳到数组之外。

  

 示例 1：

 输入：arr = [4,2,3,0,3,1,2], start = 5
 输出：true
 解释：
 到达值为 0 的下标 3 有以下可能方案：
 下标 5 -> 下标 4 -> 下标 1 -> 下标 3
 下标 5 -> 下标 6 -> 下标 4 -> 下标 1 -> 下标 3
 示例 2：

 输入：arr = [4,2,3,0,3,1,2], start = 0
 输出：true
 解释：
 到达值为 0 的下标 3 有以下可能方案：
 下标 0 -> 下标 4 -> 下标 1 -> 下标 3
 示例 3：

 输入：arr = [3,0,2,1,2], start = 2
 输出：false
 解释：无法到达值为 0 的下标 1 处。
  

 提示：

 1 <= arr.length <= 5 * 10^4
 0 <= arr[i] < arr.length
 0 <= start < arr.length


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jump-game-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print(canReach([4,2,3,0,3,1,2], 5))
 
## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

//DFS
//func canReach(_ arr: [Int], _ start: Int) -> Bool {
//    if arr[start] == 0 {
//        return true
//    }
//
//    let n: Int = arr.count
//    //记录是否使用过
//    var dist: Set<Int> = Set<Int>.init()
//
//    func p_help(index: Int) -> Bool {
//        if index >= n || index < 0 {
//            return false
//        }
//
//        if !dist.insert(index).inserted {
//            return false
//        }
//
//        if arr[index] == 0 {
//            return true
//        }
//
//        return p_help(index: index + arr[index]) || p_help(index: index - arr[index])
//    }
//
//    return p_help(index: start)
//}

//BFS
func canReach(_ arr: [Int], _ start: Int) -> Bool {
    if arr[start] == 0 {
        return true
    }

    let n: Int = arr.count
    //记录是否使用过, 用数组会超时的
    var dist: Set<Int> = Set<Int>.init()

    var dp: [Int] = [start]
    dist.insert(start)

    while !dp.isEmpty {
        let curIndex: Int = dp.removeFirst()
        let curNum: Int = arr[curIndex]
        //越界或者跳转的是已经使用过的情况结束
        if curIndex + curNum < n && dist.insert(curIndex + curNum).inserted {
            if arr[curIndex + curNum] == 0 {
                return true
            } else {
                dp.append(curIndex + curNum)
            }
        }

        if curIndex - curNum >= 0 && dist.insert(curIndex - curNum).inserted {
            if arr[curIndex - curNum] == 0 {
                return true
            } else {
                dp.append(curIndex - curNum)
            }
        }
    }

    return false
}
