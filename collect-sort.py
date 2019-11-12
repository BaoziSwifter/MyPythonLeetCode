# 冒泡排序
def bubbleSort(arr):
  for i in range(1,len(arr)):
    for j in range(0,len(arr)-i):
      if arr[j] > arr[j+1]:
        arr[j],arr[j+1] = arr[j+1],arr[j]
  return arr


# 选择排序
# 算法步骤
# 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置。
# 再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
# 重复第二步，直到所有元素均排序完毕。
def selectionSort(arr):
    arrLen = len(arr)
    for i in range(arrLen-1):
        #记录最小数的索引
        minIndex = i
        for j in range(i+1,arrLen):
            if arr[j] < arr[minIndex]:
                minIndex = j
        if i != minIndex:
            arr[i],arr[minIndex] = arr[minIndex],arr[i]
    return arr


# 插入排序
# 工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。

# 插入排序和冒泡排序一样，也有一种优化算法，叫做拆半插入。

# 算法步骤
# 将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。

# 从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
def insertionSort(arr):
    for i in range(len(arr)):
        preIndex = i - 1
        current = arr[i]
        while preIndex >= 0 and arr[preIndex] > current:
            arr[preIndex + 1] = arr[preIndex]
            preIndex -= 1
        arr[preIndex + 1] = current
    return arr


# 希尔排序
# 希尔排序的基本思想是：先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，待整个序列中的记录"基本有序"时，再对全体记录进行依次直接插入排序。

# 算法步骤
# 选择一个增量序列 t1，t2，……，tk，其中 ti > tj, tk = 1；

# 按增量序列个数 k，对序列进行 k 趟排序；

# 每趟排序，根据对应的增量 ti，将待排序列分割成若干长度为 m 的子序列，分别对各子表进行直接插入排序。仅增量因子为 1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。

# https://www.baidu.com/s?ie=UTF-8&wd=%E5%B8%8C%E5%B0%94%E6%8E%92%E5%BA%8F%20%E5%8E%9F%E7%90%86


def sheelSort(arr):
  gap = len(arr) // 2
  while gap > 0:
    for i in range(gap,len(arr)):
      tmp = arr[i]
      j = i - gap
      while j >= 0 and arr[j] > tmp:
        arr[j+gap]=arr[j]
        j -= gap
      arr[j+gap] = tmp

    gap = gap // 2

# 并归排序
# 算法步骤
# 申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列；

# 设定两个指针，最初位置分别为两个已经排序序列的起始位置；

# 比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置；

# 重复步骤 3 直到某一指针达到序列尾；

# 将另一序列剩下的所有元素直接复制到合并序列尾。


def mergeSort(arr):
  if (len(arr)< 2):
    return arr
  middle = len(arr) // 2

  left,right = arr[0:middle],arr[middle:]
  return merge(mergeSort(left),mergeSort(right))

  def merge(left,right):
    res = []
    while left and right:
      if left[0] <= right[0]:
        res.append(left.pop(0))
      else:
        res.append(right.pop(0))
    
    while left:
      res.append(left.pop(0))
    
    while right:
      res.append(right.pop(0))
    
    return res
    


# 快排
# 快速排序在平均状况下，排序 n 个项目要 Ο(nlogn) 次比较。在最坏状况下则需要 Ο(n2) 次比较，但这种状况并不常见。事实上，快速排序通常明显比其他 Ο(nlogn) 算法更快，因为它的内部循环（inner loop）可以在大部分的架构上很有效率地被实现出来。

# 快速排序使用分治法（Divide and conquer）策略来把一个串行（list）分为两个子串行（sub-lists）。

# 快速排序又是一种分而治之思想在排序算法上的典型应用。本质上来看，快速排序应该算是在冒泡排序基础上的递归分治法。

# 算法步骤
# 从数列中挑出一个元素，称为 "基准"（pivot）;

# 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。
#   在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；

# 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序；

def quickSort(arr):
  if not arr:
    return
  
  left ,right = 0, len(arr)-1

  partition(arr,left,right)
  
def partition(arr,left,right):

  flag = left

  findLeft = left
  findRight = right

  while findLeft < findRight:
    while arr[findRight] >= arr[flag] and findLeft < findRight:
      findRight -= 1
    
    while arr[findLeft] <= arr[flag] and findLeft < findRight:
      findLeft += 1
    swap(arr,findLeft,findRight)
  swap(arr,flag,findLeft)

  partition(arr,left,findLeft-1)
  partition(arr,findLeft+1,right)




def swap(arr,i,j):
  arr[i],arr[j] = arr[j],arr[i]

