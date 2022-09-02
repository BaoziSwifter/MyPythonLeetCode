//
//  1.3个线程顺序打印0-100.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/2.
//

import Foundation

// 但因需要再有主线程的app中

func threeThreadsPrint0_100() {
    let queueA = DispatchQueue(label: "com.print.a_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueB = DispatchQueue(label: "com.print.b_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let queueC = DispatchQueue(label: "com.print.c_queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    var index = 0
    let cond = NSCondition()
    queueA.async {
        while true {
            cond.lock()
            while index % 3 != 0 {
                cond.wait()
            }
            if index > 100 {
                cond.unlock()
                return
            }
            print("A == i = \(index)")
            index += 1
            cond.broadcast()
            cond.unlock()
        }
    }
    
    queueB.async {
        while true {
            cond.lock()
            while index % 3 != 1 {
                cond.wait()
            }
            if index > 100 {
                cond.unlock()
                return
            }
            print("B == i = \(index)")
            index += 1
            cond.broadcast()
            cond.unlock()
        }
    }
    
    queueC.async {
        while true {
            cond.lock()
            while index % 3 != 2 {
                cond.wait()
            }
            if index > 100 {
                cond.unlock()
                return
            }
            print("C == i = \(index)")
            index += 1
            cond.broadcast()
            cond.unlock()
        }
    }
    
}
