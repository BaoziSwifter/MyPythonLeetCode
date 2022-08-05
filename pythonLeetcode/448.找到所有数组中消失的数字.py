#
# @lc app=leetcode.cn id=448 lang=python3
#
# [448] 找到所有数组中消失的数字
#
# https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array/description/
#
# algorithms
# Easy (54.02%)
# Likes:    226
# Dislikes: 0
# Total Accepted:    17.8K
# Total Submissions: 32.9K
# Testcase Example:  '[4,3,2,7,8,2,3,1]'
#
# 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。
# 
# 找到所有在 [1, n] 范围之间没有出现在数组中的数字。
# 
# 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。
# 
# 示例:
# 
# 
# 输入:
# [4,3,2,7,8,2,3,1]
# 
# 输出:
# [5,6]
# 
# 
#

# @lc code=start
class Solution:
    # 集合相减
    # def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
    #     return list(set(range(1,len(nums)+1))-set(nums))

    # 2
    # def findDisappearedNumbers(self, nums):
        # 将所有正数作为数组下标，置对应数组值为负值。那么，仍为正数的位置即为（未出现过）消失的数字。
        # 举个例子：
        # 原始数组：[4,3,2,7,8,2,3,1]
        # 重置后为：[-4,-3,-2,-7,8,2,-3,-1]
        # 结论：[8,2] 分别对应的index为[5,6]（消失的数字）
        # for num in nums:
        #     index = abs(num) - 1
        #     # 始终保持nums[index]为负数
        #     nums[index] = -abs(nums[index])
        # return [i + 1 for i, num in enumerate(nums) if num > 0]
    # 3
    # def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
    #     flags = list(range(1, 1 + len(nums)))
    #     for num in nums:
    #         flags[num-1] = 0
    #     res = [i for i in flgas if i != 0]
    #     return res

    # 4
    # def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        
    #     numss = set(nums)
        
    #     return [ i for i in range(1, len(nums)+1) if i not in numss]
    
    # 5
    # def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
    #     if nums == []:
    #         return []
    #     a = set(nums)
    #     maxlen = len(nums)
    #     b = []
    #     for i in range(1, maxlen+1):
    #         if i not in a:
    #             b.append(i)
    #     return b 
    
    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        if not nums:
            return None
        nums.sort()
        storeList = []
        start = 0
        for i in nums:
            if i - start > 1:
                storeList.extend(list(range(start+1,i)))
            start = i
        maxVal = nums[-1]
        storeList.extend(list(range(maxVal+1,len(nums)+1)))
        return storeList

# @lc code=end

