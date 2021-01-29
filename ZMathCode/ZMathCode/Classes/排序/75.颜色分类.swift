//
//  75.颜色分类.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/27.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 示例 1：

 输入：nums = [2,0,2,1,1,0]
 输出：[0,0,1,1,2,2]
 示例 2：

 输入：nums = [2,0,1]
 输出：[0,1,2]
 示例 3：

 输入：nums = [0]
 输出：[0]
 示例 4：

 输入：nums = [1]
 输出：[1]
  

 提示：

 n == nums.length
 1 <= n <= 300
 nums[i] 为 0、1 或 2
  

 进阶：

 你可以不使用代码库中的排序函数来解决这道题吗？
 你能想出一个仅使用常数空间的一趟扫描算法吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-colors
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let num = [2,0,2,1,1,0]
 sortColors(num)
 print(num)

## 笔记
 这道题其实考的就是排序
 我尝试了十种排序算法来解答
 具体见代码
 
 
 关于十大排序这篇博客写的特别好
 https://www.cnblogs.com/onepixel/articles/7674659.html
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func sortColors(_ nums: inout [Int]) {
    radixSort(&nums)          //基数排序
//    bucketSort(&nums)       //桶排序
//    countingSort(&nums)     //计数排序
//    heapSort(&nums)         //堆排序
//    mergeSort(&nums)        //归并排序
//    shellSort(&nums)        //希尔排序
//    quickSort(&nums)        //快速排序
//    insertionSort(&nums)    //插入排序
//    selectionSort(&nums)    //选择排序
//    bubbleSort(&nums)       //冒泡排序
    
}


// MARK: - 基数排序 https://www.cnblogs.com/skywang12345/p/3603669.html
//1. 按照个位数进行排序。
//2. 按照十位数进行排序。
//3. 按照百位数进行排序。
//排序后，数列就变成了一个有序序列
func radixSort(_ nums: inout [Int]) {
    if nums.count == 0 {
        return
    }
    //找出最大最小值
    var maxNum = nums[0]
    for num in nums {
        maxNum = max(maxNum, num)
    }
    
    //exp 是位数
    var exp = 1
    
    while maxNum / exp > 0 {
        //构建桶 0到9就行
        var bucket = Array.init(repeating: [Int](), count: 10)
        
        //将元素装入桶
        for num in nums {
            let index = (num / exp) % 10
            bucket[index].append(num)
        }
        
        //取出桶里的元素修改原数组的值
        //注意桶里的元素不需要再进行排序
        var sortedIndex = 0
        var index = 0
        while index < bucket.count {
            let numArr = bucket[index]
            for num in numArr {
                nums[sortedIndex] = num
                sortedIndex += 1
            }
            index += 1
        }
        exp *= 10
    }
}

// MARK: - 桶排序 https://blog.csdn.net/qq_27124771/article/details/87651495
func bucketSort(_ nums: inout [Int]) {
    if nums.count == 0 {
        return
    }
    //找出最大最小值
    var maxNum = nums[0]
    var minNum = nums[0]
    for num in nums {
        maxNum = max(maxNum, num)
        minNum = min(minNum, num)
    }
    
    //构建桶
    let count = (maxNum - minNum) / nums.count + 1
    var bucket = Array.init(repeating: [Int](), count: count)
    
    //将元素装入桶
    for num in nums {
        let index = (num - minNum) / nums.count
        bucket[index].append(num)
    }
    
    //对桶里的元素进行排序并修改原数组的值
    var sortedIndex = 0
    var index = 0
    while index < bucket.count {
        var numArr = bucket[index]
        //我用的插入排序
        insertionSort(&numArr)
        
        for num in numArr {
            nums[sortedIndex] = num
            sortedIndex += 1
        }
        index += 1
    }
}

// MARK: - 计数 https://www.cnblogs.com/xiaochuan94/p/11198610.html
func countingSort(_ nums: inout [Int]) {
    if nums.count == 0 {
        return
    }
    //找出最大最小值
    var maxNum = nums[0]
    var minNum = nums[0]
    for num in nums {
        maxNum = max(maxNum, num)
        minNum = min(minNum, num)
    }
    //构建数组 存储元素对应的个数
    let count = maxNum - minNum + 1
    var newNums = Array.init(repeating: 0, count: count)
    for num in nums {
        let index = num - minNum
        newNums[index] += 1
    }
    //修改原数组的值
    var sortedIndex = 0
    var index = 0
    while index < newNums.count {
        var num = newNums[index]
        while num > 0 {
            nums[sortedIndex] = minNum + index
            sortedIndex += 1
            num -= 1
        }
        index += 1
    }
}

// MARK: - 堆排序 https://www.cnblogs.com/chengxiao/p/6129630.html
// 将待排序序列构造成一个大顶堆，此时，整个序列的最大值就是堆顶的根节点。将其与末尾元素进行交换，此时末尾就为最大值。然后将剩余n-1个元素重新构造成一个堆，这样会得到n个元素的次小值。如此反复执行，便能得到一个有序序列了
func heapSort(_ nums: inout [Int]) {
    //构建大顶堆的方法
    func makeHeap(startIndex: Int, endIndex: Int) {
        var largest = startIndex
        let left = 2 * startIndex + 1
        let right = 2 * startIndex + 2

        if left < endIndex && nums[largest] < nums[left] {
            largest = left
        }

        if right < endIndex && nums[largest] < nums[right] {
            largest = right
        }
        //因为构建堆的时候 是从数组的后面到前面一点点构建
        //所以不会漏掉元素
        if largest != startIndex {
            let temp = nums[largest]
            nums[largest] = nums[startIndex]
            nums[startIndex] = temp
            makeHeap(startIndex: largest, endIndex: endIndex)
        }
    }

    //把整个数组构建成一个大顶堆 从数组的后面到前面一点点构建
    // nums.count / 2 开始才有子节点
    var index = nums.count / 2
    while index >= 0 {
        makeHeap(startIndex: index, endIndex: nums.count)
        index -= 1
    }

    //每次取出大顶堆的第一个  也就是最大值
    //放到数组的最后面
    //然后对剩余的元素进行构建大顶堆
    index = nums.count - 1
    while index > 0 {
        let temp = nums[index]
        nums[index] = nums[0]
        nums[0] = temp
        makeHeap(startIndex: 0, endIndex: index)
        index -= 1
    }

}


// MARK: - 归并 https://www.cnblogs.com/chengxiao/p/6194356.html
func mergeSort(_ nums: inout [Int]) {
    //创建一个辅助方法
    //每次都从中间把数组分为两段
    //用递归回溯的思想 保证左边和右边的数据都有序
    //然后就从两个有序数组中依次取出每一个数据,放到一个临时数组中
    //最后临时数组里已经是有序的数据了,返回这个临时数组
    func help(newNums:[Int]) -> [Int] {
        //边界判断
        if newNums.count == 1 {
            return newNums
        }

        //两段数据
        let mid = newNums.count / 2
        let left = help(newNums: Array(newNums[0..<mid]))
        let right = help(newNums: Array(newNums[mid..<newNums.count]))

        //临时数组
        var res: [Int] = [Int]()
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        //按照大小依次取出 left 和 right里面的数据, 存到res中
        while left.count > leftIndex && right.count > rightIndex {
            if left[leftIndex] < right[rightIndex] {
                res.append(left[leftIndex])
                leftIndex += 1
            } else {
                res.append(right[rightIndex])
                rightIndex += 1
            }
        }

        //防止数组里有数据没有取完
        if left.count > leftIndex {
            res.append(contentsOf: Array(left[leftIndex..<left.count]))
        }

        if right.count > rightIndex {
            res.append(contentsOf: Array(right[rightIndex..<right.count]))
        }

        //这段代码和上面那段代码的逻辑是一样的
//        while left.count > leftIndex || right.count > rightIndex {
//
//            if right.count <= rightIndex || (left.count > leftIndex && left[leftIndex] < right[rightIndex]) {
//
//                res.append(left[leftIndex])
//                leftIndex += 1
//            } else {
//                res.append(right[rightIndex])
//                rightIndex += 1
//            }
//        }

        return res
    }

    nums = help(newNums: nums)
}

// MARK: - 希尔 https://www.cnblogs.com/chengxiao/p/6104371.html
func shellSort(_ nums: inout [Int]) {
    //grap 代表着把数组里的数据分为几组
    //grap 会不断减少 当grap为1的时候其实就是一个插入排序
    var grap = nums.count / 2
    while grap > 0 {
        //每次都是从 grap 到 nums.count 之间遍历
        var i = grap
        while i < nums.count {
            //每次都在组内进行一次插入排序
            var j = i
            while j >= grap && nums[j] < nums[j - grap] {
                let temp = nums[j]
                nums[j] = nums[j - grap]
                nums[j - grap] = temp
                j -= grap
            }
            i += 1
        }
        grap = grap / 2
    }
}

// MARK: - 快速 三向切分处理重复数据
// https://www.cnblogs.com/nullzx/p/5880191.html
// 这篇文章里对三向切分做了详细的图文解释
func quickSort(_ nums: inout [Int]) {
    func quickSort(startIndex: Int, endIndex: Int) {
        if startIndex > endIndex {
            return
        }
        //基准
        let mark = nums[startIndex]

        //三向切分,即用 i k j 将数组分成四段
        //第一段 从 startIndex 到 i-1, 是小于基准的部分
        //第二段 从 i 到 k-1, 是等于基准的部分
        //第三段 从 k 到 j, 是需要处理的数据
        //第四段 从 j+1 到 endIndex 是大于基准的部分
        //在 k <= j 期间, 维护好这个四段数据的准确即可
        var i = startIndex
        var k = startIndex + 1
        var j = endIndex

        //注意 i 到 k-1 是等于基准的部分
        //这里类似于双指针的思想
        //k是右指针 i是左指针
        //又或者把 i到k-1这一段数据做为基准
        //普通快速排序的基准是一个数,三向切分快速排序的基准是一段数据
        while k <= j {
            if nums[k] > mark {
                //当k的值大于基准, 把k和j的值交换
                //j-=1, 但是k不变, 交换过来的值还要进行计算
                let temp = nums[j]
                nums[j] = nums[k]
                nums[k] = temp
                j -= 1
            } else if nums[k] < mark {
                //当k的值小于于基准, 那么i到k-1这一段数据都要移动
                //把k和i的值交换,这一段数据就已经移动好了
                //这个时候 i要加1, 因为现在的i是交换过去的那个小于基准的值了
                //这个时候 k也要加1, 因为现在k是交换过去的那个原来的i, 即那个等于基准的值
                let temp = nums[i]
                nums[i] = nums[k]
                nums[k] = temp
                i += 1
                k += 1
            } else {
                //当k的值等于基准时, 只要k加一即可维护 i到k-1 这一段数据等于基准值的准确性
                k += 1
            }
        }
        //startIndex 到 i-1 是小于的那一段
        quickSort(startIndex: startIndex, endIndex: i-1)

        // j+1 到 endIndex 是小于的那一段
        quickSort(startIndex: j+1, endIndex: endIndex)
    }

    quickSort(startIndex: 0, endIndex: nums.count - 1)
}


// MARK: - 插入 保证前面数据的准确性,把当前元素插入到正确位置
func insertionSort(_ nums: inout [Int]) {
    let count = nums.count
    var i = 1
    while i < count {
        let num = nums[i]
        var preIndex = i - 1
        while preIndex >= 0 && nums[preIndex] > num {
            nums[preIndex + 1] = nums[preIndex]
            preIndex -= 1
        }
        nums[preIndex + 1] = num
        i += 1
    }
}


// MARK: - 选择 找到最小/最大值, 放到数组最前面
func selectionSort(_ nums: inout [Int]) {
    let count = nums.count
    var i = 0
    while i < count {
        var minNum = nums[i]
        var minIndex = i

        var j = i
        while j < count {
            if nums[j] < minNum {
                minNum = nums[j]
                minIndex = j
            }
            j += 1
        }

        if minIndex != i {
            let temp = nums[minIndex]
            nums[minIndex] = nums[i]
            nums[i] = temp
        }

        i += 1
    }

}

// MARK: - 冒泡 找到每次循环的最大值, 放到最后面
func bubbleSort(_ nums: inout [Int]) {
    let count = nums.count
    var i = 0
    while i < count {
        var j = 0
        while j < (count - i - 1) {
            if nums[j] > nums[j+1] {
                let temp = nums[j]
                nums[j] = nums[j+1]
                nums[j+1] = temp
            }
            j += 1
        }
        i += 1
    }

}
