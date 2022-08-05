#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

你可以假设 nums1 和 nums2 不会同时为空。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""

class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        nums1.sort()
        nums2.sort()
        n1 = nums1
        n2 = nums2
        count = 0
        index1,index2 = 0,0
        lastVal ,preVal = 0,0
        num1Len,num2Len = len(nums1),len(nums2)
        while count <= (num1Len+num2Len)//2:
            if index1 < num1Len and index2 < num2Len:
                if n1[index1] < n2[index2]:
                    preVal = lastVal
                    lastVal = n1[index1]
                    index1 += 1
                else:
                    preVal = lastVal
                    lastVal = n2[index2]
                    index2 += 1
            elif index1 < num1Len and index2 >= num2Len:
                preVal = lastVal
                lastVal = n1[index1]
                index1 += 1
            elif index2 < num2Len and index1 >= num1Len:
                preVal = lastVal
                lastVal = n2[index2]
                index2 += 1
            else:
                break
            count += 1
        if (num1Len+num2Len)%2:
            return lastVal
        else:
            return (lastVal + preVal)/2.0
            
class Solution2(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        nums1.extend(nums2)
        nums1.sort()
        n = len(nums1)
        if n % 2 != 0:
            return nums1[int(n / 2) ]
        else:
            return (nums1[int(n / 2)] + nums1[int((n / 2)) - 1]) / 2.0
        
        
        
        
if __name__ == '__main__':
    
    s = Solution()
    print("----- "+str(s.findMedianSortedArrays([],[3])))
