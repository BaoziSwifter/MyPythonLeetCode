// leetcode 122.买卖股票的最佳时机 II.swift
class StockMaxProfitII {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxV = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                maxV += (prices[i] - prices[i-1])
            }
        }
        return maxV
    }
}
