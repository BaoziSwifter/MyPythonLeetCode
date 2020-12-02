/*
 * @lc app=leetcode.cn id=289 lang=golang
 *
 * [289] 生命游戏
 */

// @lc code=start
const (
	willDead = 2
	willLive = 3
)

func gameOfLife(board [][]int) {

	for r, rows := range board {
		for l, _ := range rows {
			c := makeCellStatus(r-1, l-1, board) + makeCellStatus(r-1, l, board) + makeCellStatus(r-1, l+1, board) + makeCellStatus(r, l+1, board) + makeCellStatus(r+1, l+1, board) + makeCellStatus(r+1, l, board) + makeCellStatus(r+1, l-1, board) + makeCellStatus(r, l-1, board)
			if board[r][l] == 1 && c < 2 {
				board[r][l] = willDead
			} else if board[r][l] == 1 && c > 3 {
				board[r][l] = willDead
			} else if board[r][l] == 0 && c == 3 {
				board[r][l] = willLive
			}
		}
	}

	for r, rows := range board {
		for l, _ := range rows {
			if board[r][l] == willDead {
				board[r][l] = 0
			} else if board[r][l] == willLive {
				board[r][l] = 1
			}
		}
	}
}

func makeCellStatus(r, l int, board [][]int) int {
	colCnt := len(board[0])
	rowCnt := len(board)
	if r < 0 || r+1 > rowCnt {
		return 0
	}
	if l < 0 || l+1 > colCnt {
		return 0
	}

	if board[r][l] == 1 || board[r][l] == willDead {
		return 1
	}
	return 0

}

// @lc code=end

