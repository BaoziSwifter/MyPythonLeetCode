#!/usr/bin/env python
# -*- coding: utf-8 -*-

# 交换排序
# 冒泡排序
def bubbleSort(arr):
    l = len(arr)
    for i in range(l):
        for j in range(1,l-i):
            if arr[j-1] > arr[j]:
                t = arr[j-1]
                arr[j-1] = arr[j]
                arr[j] = t

def bubbleSortOpt(arr):
    l = len(arr)
    for i in range(l-1):
        isChange = True
        for j in range(l-1,i):
            if arr[j] < arr[j-1]:
                t = arr[j]
                arr[j] = arr[j-1]
                arr[j-1] = t
                isChange = False
            if isChange:
                return    
              
# 插入排序
# 简单插入排序
def inserSort(arr):
    length = len(arr)
    for i in range(1,length):
        if arr[i] < arr[i-1]:
            tmp = arr[i]
            j = i -1
            while j >= 0 and arr[j] > tmp:
                arr[j+1] = arr[j]
                j = j - 1
            arr[j+1] = tmp
            
def inserBinarySort(arr):
    l = len(arr)
    i = 1
    while i < l:
        if arr[i] > arr[i-1]:
            left = 0
            right = i-1
            while left <= right:
                mid = (left + right) // 2
                if arr[i] < arr[mid]:
                    right = mid - 1
                else:
                    left = mid + 1
            j = i
            while j > left:
                arr[j] = arr[j-1]
                j -= 1
            arr[left] = arr[i]
        i += 1
    
                
# 希尔排序
def shellSort(arr):
    pass

# 选择排序
def selectSort(arr):
    _length = len(arr)-1
    for i in range(_length):
        minIndex = i 
        for j in range(i+1,_length+1):
            if arr[j] < arr[minIndex]:
                minIndex = j
        tmp = arr[i]
        arr[i] = arr[minIndex]
        arr[minIndex] = tmp
# 快速排序
# 这种递归的写法 python效率很低 
def start_partition(arr,left,right):
 
    i = enter_partition(arr,left,right)
    start_partition(arr,left,i-1)
    start_partition(arr,i+1,right)
def enter_partition(arr,left,right):
    l = left 
    r = right 
    
    tmp = arr[l]
    while l < r:
        while l < r and arr[r] >= tmp:
            r = r - 1 
        arr[l] = arr[r]
        
        while l < r and arr[l] <= tmp:
            l = l + 1 
        arr[r] = arr[l]
    arr[l] = tmp 
    return l
      
        
   

    
# 归并排序
def mergeSort(arr):
    pass
# 堆排序
def heapSort(arr):
    pass

# 计数排序
def countSort(arr):
    pass

# 桶排序

# 基数排序


if __name__ == '__main__':
    
    
    # num1 = [2,4,1,8,3,9,6]
    # bubbleSort(num1)
    # [print(">> %d" % i) for i in num1]
    
    # num2 = [2,4,1,8,3,9,6]
    # inserSort(num2)
    # [print("insert >> %d" % i) for i in num2]
    
    # num3 = [2,4,1,8,3,9,6]
    # inserBinarySort(num3)
    # [print("insert binary sort >> %d" % i) for i in num3]
    
    # num4 = [2,4,1,8,3,9,6]
    # start_partition(num4,0,len(num4)-1)
    
    # print("quick sort result %s" % str(num4))
    num5 = [2,4,1,8,3,9,6]
    selectSort(num5)
    print("select sort result %s" % str(num5))




    

