//
//  2. 启动三个线程A，B，C，打印10次 按照ABC的顺序输出.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/2.
//

import Foundation

let printCnt = 10

// 使用NSConditionLock
func printABC_1() {
    let queueA = DispatchQueue(label: "com.print.a_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueB = DispatchQueue(label: "com.print.b_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueC = DispatchQueue(label: "com.print.c_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let condLock = NSConditionLock(condition: 0)
    queueA.async {
        for i in 0..<printCnt {
            condLock.lock(whenCondition: 0)
            print("A = \(i)")
            condLock.unlock(withCondition: 1)
        }
    }
    queueB.async {
        for i in 0..<printCnt {
            condLock.lock(whenCondition: 1)
            print("B = \(i)")
            condLock.unlock(withCondition: 2)
        }
    }
    queueC.async {
        for i in 0..<printCnt {
            condLock.lock(whenCondition: 2)
            print("C = \(i)")
            print("current \(i+1) fininshed, will begin next")
            condLock.unlock(withCondition: 0)
        }
    }
}

// 使用三把NSLock
func printABC_2() {
    let queueA = DispatchQueue(label: "com.print.a_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueB = DispatchQueue(label: "com.print.b_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueC = DispatchQueue(label: "com.print.c_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let lockA = NSLock()
    let lockB = NSLock()
    let lockC = NSLock()
    
    lockB.lock()
    lockC.lock()
    
    queueA.async {
        for i in 0..<printCnt {
            lockA.lock()
            print("A === \(i)")
            lockB.unlock()
        }
    }
    queueB.async {
        for i in 0..<printCnt {
            lockB.lock()
            print("B === \(i)")
            lockC.unlock()
        }
    }
    queueC.async {
        for i in 0..<printCnt {
            lockC.lock()
            print("C === \(i)")
            print("current \(i+1) fininshed, will begin next")
            lockA.unlock()
        }
    }
}

func printABC_3() {
    let queueA = DispatchQueue(label: "com.print.a_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueB = DispatchQueue(label: "com.print.b_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueC = DispatchQueue(label: "com.print.c_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    
    let semaA = DispatchSemaphore(value: 1)
    let semaB = DispatchSemaphore(value: 0)
    let semaC = DispatchSemaphore(value: 0)
    
    queueA.async {
        for i in 0..<printCnt {
            semaA.wait()
            print("A == \(i)")
            semaB.signal()
        }
    }
    
    queueB.async {
        for i in 0..<printCnt {
            semaB.wait()
            print("B == \(i)")
            semaC.signal()
        }
    }
    
    queueC.async {
        for i in 0..<printCnt {
            semaC.wait()
            print("C == \(i)")
            print("current \(i+1) fininshed, will begin next")
            semaA.signal()
        }
    }
}
