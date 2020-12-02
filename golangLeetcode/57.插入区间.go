/*
 * @lc app=leetcode.cn id=57 lang=golang
 *
 * [57] 插入区间
 */

// @lc code=start
func insert1(intervals [][]int, newInterval []int) [][]int {
	leftIndex, leftPos := searchPosition(intervals, newInterval[0], 0)
	if leftIndex == -1 {
		intervals = append(intervals, newInterval)
		return intervals
	}
	rightIndex, rightPos := searchPosition(intervals, newInterval[1], leftIndex)
	res := make([][]int, 0)

	if rightIndex == -1 {
		res = append(res, intervals[:leftIndex]...)
		if leftPos == 0 {
			res = append(res, newInterval)
		} else {
			leftItem := intervals[leftIndex]
			res = append(res, []int{leftItem[0], newInterval[1]})
		}
	} else {
		if leftPos == 0 && rightPos == 0 {
			res = append(res, intervals[:leftIndex]...)
			res = append(res, newInterval)
			res = append(res, intervals[rightIndex:]...)
		} else if leftPos == 0 && rightPos == 1 {
			res = append(res, intervals[:leftIndex]...)
			res = append(res, []int{newInterval[0], intervals[rightIndex][1]})
			if rightIndex < len(intervals)-1 {
				res = append(res, intervals[rightIndex+1:]...)
			}
		} else if leftPos == 1 && rightPos == 0 {
			res = append(res, intervals[:leftIndex]...)
			res = append(res, []int{intervals[leftIndex][0], newInterval[1]})
			res = append(res, intervals[rightIndex:]...)

		} else {
			res = append(res, intervals[:leftIndex]...)
			res = append(res, []int{intervals[leftIndex][0], intervals[rightIndex][1]})
			if rightIndex < len(intervals)-1 {
				res = append(res, intervals[rightIndex+1:]...)
			}
		}
	}

	return res
}

func searchPosition(intervals [][]int, num, begin int) (int, int) {
	for i, target := range intervals[begin:] {
		if target[0] > num {
			return i + begin, 0
		} else if target[1] >= num {
			return i + begin, 1
		} else {
			if i+begin == len(intervals)-1 {
				return -1, 0
			}
		}
	}
	return 0, 0
}

func insert(intervals [][]int, newInterval []int) [][]int {
	left, right := newInterval[0], newInterval[1]
	merged := false
	var res [][]int
	for _, interval := range intervals {
		if interval[0] > right {
			if !merged {
				res = append(res, []int{left, right})
				merged = true
			}
			res = append(res, interval)
		} else if interval[1] < left {
			res = append(res, interval)
		} else {
			left = min(left, interval[0])
			right = max(right, interval[1])
		}
	}
	if !merged {
		res = append(res, []int{left, right})
	}
	return res
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func max(a, b int) int {
	if a < b {
		return b
	}
	return a
}

// @lc code=end

