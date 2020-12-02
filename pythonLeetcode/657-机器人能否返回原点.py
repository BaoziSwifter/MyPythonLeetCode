#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/8/30 18:40
# @Author  : Beliefei
# @File    : 判断路线成圈.py
# @Software: PyCharm
"""

初始位置 (0, 0) 处有一个机器人。给出它的一系列动作，判断这个机器人的移动路线是否形成一个圆圈，换言之就是判断它是否会移回到原来的位置。

移动顺序由一个字符串表示。每一个动作都是由一个字符来表示的。机器人有效的动作有 R（右），L（左），U（上）和 D（下）。输出应为 true 或 false，表示机器人移动路线是否成圈。

示例 1:

输入: "UD"
输出: true
示例 2:

输入: "LL"
输出: false
"""


class Solution:
    def judgeCircle(self, moves):
        """
        :type moves: str
        :rtype: bool
        """
        y_ax = 0
        x_ax = 0
        isBegin = 0
        for m in moves:

            if m=="U":
                y_ax+=1
            elif m=="L":
                x_ax-=1
            elif m=="D":
                y_ax-=1
            else:
                x_ax+=1
            if y_ax==0 and x_ax==0:
                return "true"
        return "false"

