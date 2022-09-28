//
//  1.排序算法.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation

// 1.冒泡排序
func bubbleSort(array: [Int]) -> [Int] {
    var resArray = array
    for i in 0..<resArray.count {
        for j in 0..<resArray.count - i - 1 {
            if resArray[j] > resArray[j+1] {
                (resArray[j], resArray[j+1]) = (resArray[j+1], resArray[j])
            }
        }
    }
    return resArray
}

// 2.选择排序
func selectionSort(array: [Int]) -> [Int] {
    var resArray = array
    for i in 0..<resArray.count {
        var minIndex = i
        for j in i+1..<resArray.count {
            if resArray[minIndex] > resArray[j] {
                minIndex = j
            }
        }
        (resArray[minIndex], resArray[i]) = (resArray[i], resArray[minIndex])
    }
    return resArray
}

// 3.插入排序
func insertSort(array: [Int]) -> [Int] {
    var resArray = array
    for i in 1..<resArray.count {
        let minValue = resArray[i]
        var j = i - 1
        while j >= 0, resArray[j] > minValue {
            (resArray[j+1], resArray[j]) = (resArray[j], resArray[j+1])
            j -= 1
        }
        resArray[j+1] = minValue
    }
    return resArray
}

// 4.shell排序
func shellSort(array: [Int]) -> [Int] {
    var sortArray = array
    var gap = sortArray.count / 2
    while gap > 0 {
        var i = 0
        while i < sortArray.count {
            var j = i
            while j < sortArray.count - gap {
                if sortArray[j] > sortArray[j + gap] {
                    (sortArray[j], sortArray[j + gap]) = (sortArray[j + gap], sortArray[j])
                }
                j += gap
            }
            i += 1
        }
        gap /= 2
    }
    return sortArray
}

// 5.并归排序
func mergeSort(array: [Int]) -> [Int] {
    var sortArray = array
    let arrayCnt = array.count
    if arrayCnt < 2 { return sortArray }
    let sortMidIndex = arrayCnt / 2
    
    // 分成左右两个数组
    let leftArray = Array(sortArray[0...sortMidIndex])
    let rightArray = Array(sortArray[sortMidIndex+1..<arrayCnt])
    sortArray = mergeArray(leftArray: mergeSort(array: leftArray), rightArray: mergeSort(array: rightArray))
    return sortArray
}

func mergeArray(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var leftIndex = 0, rightIndex = 0
    while leftIndex < leftArray.count , rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            mergedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else {
            mergedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    while leftIndex < leftArray.count {
        mergedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightArray.count {
        mergedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    return mergedArray
}

// 6.快速排序
func quickSortEnter(_ array: inout [Int]) {
    if array.count < 2 { return }
    let low = 0, high = array.count - 1
    quickSort(&array, low, high)
}

func quickSort(_ array: inout [Int], _ low: Int, _ high: Int) {
    func getCurrentIndex(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
        let target = array[low]
        var low = low, high = high
        while low < high {
            while low < high && array[high] >= target {
                high -= 1
            }
            array[low] = array[high]
            while low < high && array[low] <= target {
                low += 1
            }
            array[high] = array[low]
        }
        array[low] = target
        return low
    }
    if low >= high { return }
    let index = getCurrentIndex(&array, low, high)
    quickSort(&array, low, index - 1)
    quickSort(&array, index + 1, high)
}

// 7.堆排序
var length = 0
func heapSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    var sortArray = array
    createMaxHeap(array: &sortArray)
    var index = sortArray.count - 1 // 最后一个元素位置
    while index > 0 {
        (sortArray[0], sortArray[index]) = (sortArray[index], sortArray[0])
        length -= 1
        heapify(array: &sortArray, index: 0)
        index -= 1
    }
    return sortArray
}

func createMaxHeap(array: inout [Int]) {
    length = array.count
    var i = length / 2 // 根节点
    while i >= 0 {
        heapify(array: &array, index: i)
        i -= 1
    }
}

func heapify(array: inout [Int], index: Int) {
    let left = 2*index + 1 // 左子节点
    let right = 2*index + 2 // 右子节点
    var largets = index
    
    /// 找到最大的位置
    if left < length, array[left] > array[largets] {
        largets = left
    }
    if right < length, array[right] > array[largets] {
        largets = right
    }
    // 前后值不一样，进行交互
    if largets != index {
        (array[index], array[largets]) = (array[largets], array[index])
        heapify(array: &array, index: largets)
    }
}

// 8.计数排序
func countingSort(array: [Int]) -> [Int] {
    guard !array.isEmpty else {
        return array
    }
    var maxValue = array[0], minValue = array[0]
    for item in array {
        maxValue = max(maxValue, item)
        minValue = min(minValue, item)
    }
    var list:[Int] = Array(repeating: 0, count: maxValue - minValue + 1)
    for item in array {
        let a = item - minValue
        list[a] = list[a] + 1
    }
    
    var resArray = [Int]()
    for (i, item) in list.enumerated() {
        if item == 0 { continue }
        for _ in 0..<item {
            let num = i + minValue
            resArray.append(num)
        }
    }
    return resArray
}

// 9.桶排序
// 桶排序是计数排序的升级
var bucket = 5
func bucketCount(min: Int, max: Int, array:[Int]) -> Int {
    let nums1 = (max - min + 1) / bucket
    let nums2 = (max - min + 1) % bucket > 0 ? 1 : 0
    return nums1 + nums2
}
func bucketSort(array: [Int]) -> [Int] {
    guard !array.isEmpty else {
        return array
    }
    var maxValue = array[0], minValue = array[0]
    for item in array {
        maxValue = max(maxValue, item)
        minValue = min(minValue, item)
    }
    
    let buckets = bucketCount(min: minValue, max: maxValue, array: array)
    var bucketList: [[Int]] = Array(repeating: [], count: buckets)
    for item in array {
        let index = (item - minValue) / bucket
        var items = bucketList[index]
        items.append(item)
        bucketList[index] = items
    }
    
    // 对每个桶进行排序，使用了插入排序
    var resultList = [Int]()
    for items in bucketList {
        let sorts = insertSort(array: items)
        resultList += sorts
    }
    return resultList
}

// 10.基数排序
