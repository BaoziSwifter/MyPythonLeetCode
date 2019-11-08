#
# @lc app=leetcode.cn id=169 lang=python3
#
# [169] 求众数
#
# https://leetcode-cn.com/problems/majority-element/description/
#
# algorithms
# Easy (60.52%)
# Likes:    360
# Dislikes: 0
# Total Accepted:    83.1K
# Total Submissions: 137.3K
# Testcase Example:  '[3,2,3]'
#
# 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
# 
# 你可以假设数组是非空的，并且给定的数组总是存在众数。
# 
# 示例 1:
# 
# 输入: [3,2,3]
# 输出: 3
# 
# 示例 2:
# 
# 输入: [2,2,1,1,1,2,2]
# 输出: 2
# 
# 
#

# @lc code=start
class Solution:
    # 排序法
    # def majorityElement(self, nums: List[int]) -> int:
    #     nums.sort()
    #     return nums[len(nums)//2]

    # 中间计算方式
    # def majorityElement(self, nums: List[int]) -> int:
    # cache = {}
    # for num in nums:
    #     cache[num] = cache.get(num, 0) + 1
    #     if cache[num] > int(len(nums) / 2):
    #         return num

    # 最快的方式
    # def majorityElement(self, nums: List[int]) -> int:
    #   return  max([(nums.count(i),i) for i in set(nums)], key=lambda x: x[0])[1]
    
    # 最优的方式
    # def majorityElement(self, nums: List[int]) -> int:
    # for i in nums[len(nums)//2:]:
    #     if nums.count(i) > len(nums)//2:
    #         return i
    
    def majorityElement(self, nums: List[int]) -> int:
        mapStore = {}
        for num in nums:
            if num in mapStore:
                mapStore[num] += 1
            else:
                mapStore[num] = 1
        minLen = len(nums) // 2
        for k,v in mapStore.items():
            if v > minLen:
                return k
# @lc code=end

