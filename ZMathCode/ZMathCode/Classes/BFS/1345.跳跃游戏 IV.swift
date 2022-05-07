//
//  1345.跳跃游戏 IV.swift
//  ZMathCode
//
//  Created by QZD on 2022/5/5.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个整数数组 arr ，你一开始在数组的第一个元素处（下标为 0）。

 每一步，你可以从下标 i 跳到下标 i + 1 、i - 1 或者 j ：

 i + 1 需满足：i + 1 < arr.length
 i - 1 需满足：i - 1 >= 0
 j 需满足：arr[i] == arr[j] 且 i != j
 请你返回到达数组最后一个元素的下标处所需的 最少操作次数 。

 注意：任何时候你都不能跳到数组外面。

  

 示例 1：

 输入：arr = [100,-23,-23,404,100,23,23,23,3,404]
 输出：3
 解释：那你需要跳跃 3 次，下标依次为 0 --> 4 --> 3 --> 9 。下标 9 为数组的最后一个元素的下标。
 示例 2：

 输入：arr = [7]
 输出：0
 解释：一开始就在最后一个元素处，所以你不需要跳跃。
 示例 3：

 输入：arr = [7,6,9,6,9,6,9,7]
 输出：1
 解释：你可以直接从下标 0 处跳到下标 7 处，也就是数组的最后一个元素处。
  

 提示：

 1 <= arr.length <= 5 * 104
 -108 <= arr[i] <= 108

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jump-game-iv
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print(minJumps([100,-23,-23,404,100,23,23,23,3,404]))
 
## 笔记
 最先的,就是最小的
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

//广度优先搜索，只要搜索到当前元素是目标元素，则这个路径一定是最短路径
func minJumps(_ arr: [Int]) -> Int {

    let n: Int = arr.count
    //使用哈希表记录某个值有哪些下标
    var map: [Int: [Int]] = [Int: [Int]].init()
    for i in 0..<n {
        //忽略连续重复的，不会影响结果
        if i - 1 >= 0 && i + 1 < n && arr[i - 1] == arr[i] && arr[i] == arr[i + 1] {
            continue
        }
        map[arr[i], default: [Int]()].append(i)
    }

    //为了防止重复同队，只有该点没有被遍历过时，可以入队并更新最小步数
    var dist: Set<Int> = Set<Int>.init()

    //记录每个下标的最小步数
    //一定要先入先出
    var dp: [(Int, Int)] = [(Int, Int)].init()
    dp.insert((0, 0), at: 0)
    dist.insert(0)

    while !dp.isEmpty {
        //假如当前走到的位置为 t，我们尝试将 t−1、 t+1 和与 arr[t] 等值的位置进行入队
        let cur: (Int, Int) = dp.removeLast()
        let index: Int = cur.0
        var step: Int = cur.1

        if index == n - 1 {
            return step
        }
        
        step += 1
        if index + 1 < n && dist.insert(index + 1).inserted {
            dp.insert((index + 1, step), at: 0)
        }

        if index - 1 >= 0 && dist.insert(index - 1).inserted {
            dp.insert((index - 1, step), at: 0)
        }

        if let list: [Int] = map[arr[index]] {
            for ne in list {
                if dist.insert(ne).inserted {
                    dp.insert((ne, step), at: 0)
                }
            }

            //为确保等值下标的遍历只会发生一次，我们需要在将等值下标添加到队列后，将 arr[t] 从哈希表中移除
            map.removeValue(forKey: arr[index])
        }
    }

    return -1
}

//这个会超时
func minJumps1(_ arr: [Int]) -> Int {

    let n: Int = arr.count
    //使用「哈希表」记录某个值有哪些下标
    var map: [Int: [Int]] = [Int: [Int]].init()
    //使用「倒序」的形式构建等值下标列表，这样可以确保如果最后位置是通过「等值跳」而来时，能够优先出队
    for i in (0..<n).reversed() {
        // 忽略连续重复的，不会影响结果。例如测试用例 27 / 32。
        if i - 1 >= 0 && i + 1 < n && arr[i - 1] == arr[i] && arr[i] == arr[i + 1] {
            continue
        }

        map[arr[i], default: [Int]()].append(i)
    }

    //记录每个下标的最小步数
    //为了防止重复同队，我们可以使用 dist 数组记录到达某个位置的最小步数
    //只有该点没有被遍历过时，可以入队并更新最小步数
    var dist: [Int] = [Int].init(repeating: -1, count: n)

    //记录 t−1、 t+1 和与 arr[t]
    var d: [Int] = [Int].init()
    d.append(0)
    dist[0] = 0

    while !d.isEmpty {
        //假如当前走到的位置为 t，我们尝试将 t−1、 t+1 和与 arr[t] 等值的位置进行入队
        let t: Int = d.removeFirst()
        let step: Int = dist[t]

        if t == n - 1 {
            return step
        }

        if t + 1 < n && dist[t + 1] == -1 {
            d.append(t + 1)
            dist[t + 1] = step + 1
        }

        if t - 1 >= 0 && dist[t - 1] == -1 {
            d.append(t - 1)
            dist[t - 1] = step + 1
        }

        if let list: [Int] = map[arr[t]] {
            for ne in list {
                if dist[ne] == -1 {
                    d.append(ne)
                    dist[ne] = step + 1
                }
            }

            //为确保等值下标的遍历只会发生一次，我们需要在将等值下标添加到队列后，将 arr[t] 从哈希表中移除
            map.removeValue(forKey: arr[t])
        }
    }

    return -1
}
