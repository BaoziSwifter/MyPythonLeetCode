"""
报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：

1.     1
2.     11
3.     21
4.     1211
5.     111221
1 被读作  "one 1"  ("一个一") , 即 11。
11 被读作 "two 1s" ("两个一"）, 即 21。
21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。

给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。

注意：整数顺序将表示为一个字符串。

 

示例 1:

输入: 1
输出: "1"
示例 2:

输入: 4
输出: "1211"
"""

def say(n):
    


class Solution:
    def countAndSay(self, n):
        """
        :type n: int
        :rtype: str
        """
        i = 1
        sayStr = "1"
        while i <= n and n > 1:
            nextSay=""
            j = 0
            
            sayLength = len(sayStr)
            while j < sayLength :

                if j + 1 < sayLength:
                    tmp = sayStr[j]
                    tmpLength = 1
                    if int(tmp) != int(sayStr[j+1]):
                        nextSay = nextSay + str(tmpLength)+tmp
                        tmp = sayStr[j+1]
                        tmpLength = 1
                    else:
                        tmpLength = tmpLength + 1
                    j = j + 1
                else:
                    nextSay = nextSay + "1"+sayStr[j]
                    j = j + 1
            sayStr = nextSay 
            i = i+1

        return sayStr 


