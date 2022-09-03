//
//  5.大小顶堆.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/3.
//

import Foundation

/**
 大小顶堆概念
 此概念是从堆的概念引申而来， 对于n个元素的关键字序列{K1,K2, ... ,Kn},
 当且仅当满足下列关系时称其为堆，其中2i和2i+1 要求不大于n
 K[i] <= K[2i+1]
 K[i] <= K[2i+2]
 
 或者
 K[i] >= K[2i+1]
 K[i] >= K[2i+2]
 
 若将此序列对应的一维数组看成是一个完全二叉树，则堆的含义表明，
 完全二叉树中所有的非根节点的值均不小于（或不大于）其左、右节点的值。
 因此，在一个堆中，堆顶元素（即完全二叉树的根节点）必为序列中的最大元素（或者最小元素）
 并且堆中的任一棵子树也都是堆。
 若堆顶为最小元素，则称为最小顶堆（小根堆）；若堆顶为最大元素，则称为最大顶堆（大根堆）；
 
 */

/**
 构建大顶堆的思想
 1> 将初始待排序的序列（K[0], K[1], ... ,K[n]）构建成大顶堆，此堆初始为无序区
 2> 将堆顶元素K[0]与最后一个元素K[n]交换，此时得到新的无序区（K[0], K[1], ... , K[n-1]）
    和新的有序(K[n])， 且满足K[0...n-1] <= K[n]
 3> 由于交换后新得堆顶K[0]可能违反堆的性质，因此需要对当前无序区（K[0], K[1], ..., K[n-1]）调整为新堆
    然后再次将K[0]与无序区最后一个元素交换，得到新的无序区（（K[0], K[1], ..., K[n-2]）和新的有序区（K[n-1], K[n]）。
    不断重复此过程直到有序区的元素个数为n,则整个排序完成
    
    具体操作如下：
    1> 初始化堆：将K[0...n]构造为堆
    2> 将当前无序区的堆顶元素K[0]同该区间的最后一个记录交换，然后将新的无序区调整为新的堆
 
 因此对于堆排序最重要的两个操作就是构造初始堆和调整堆，其实构造初始堆实际上也是调整堆的过程，只不过构造初始堆是对所有的非叶子结点都进行调整
 */

class MaxHeap {
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
}
