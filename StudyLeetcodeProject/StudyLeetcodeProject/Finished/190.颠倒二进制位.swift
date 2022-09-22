//
//  190.-颠倒二进制位.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation
class Solution190 {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var res = 0
        var p = 31
        while n != 0 {
            let b = n & 1
            res += b << p
            n >>= 1
            p -= 1
        }
        return res
    }
    
    func reverseBits_fenzhi(_ n: Int) -> Int {
        var rev = n
        //低16位与高16位交换
        rev = (rev >> 16) | (rev << 16)

        //每16位中低8位和高8位交换; 1111是f （这里每一个十六进制的数字都代表4位二进制）
        // 右移8位得到高位的8位，左移8位得到低位的8位
        rev = ((rev & 0xff00ff00) >> 8) | ((rev & 0x00ff00ff) << 8)

        //每8位中低4位和高4位交换;
        rev = ((rev & 0xf0f0f0f0) >> 4) | ((rev & 0x0f0f0f0f) << 4)

        //每4位中低2位和高2位交换; 1100是c, 0011是3
        rev = ((rev & 0xcccccccc) >> 2) | ((rev & 0x33333333) << 2)

        //每2位中低1位和高1位交换; 1010是a, 0101是5
        rev = ((rev & 0xaaaaaaaa) >> 1) | ((rev & 0x55555555) << 1)

        return rev
    }

}
