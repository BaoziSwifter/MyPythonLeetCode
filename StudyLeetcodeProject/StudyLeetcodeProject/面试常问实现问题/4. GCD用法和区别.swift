//
//  4. GCD用法和区别.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/2.
//

import Foundation

/**
 dispatch_sync 和 dispath_barrier_sync
 二者因为是sync提交，所以都是阻塞当前提交Block主线程。
 而它俩唯一的区别是：dispatch_sync 不能阻塞并行队列 dispatch_barrier_sync 可以阻塞并行队列
 */
func syn_barriersyn() {
    let queue = DispatchQueue(label: "com.my_gcd_con", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    queue.sync {
        queue.async {
            print("2 ")
        }
        queue.async {
            print("3 ")
        }
        print("1 ")
    }
    //输出结果: 任务三 任务二 任务一   或：2、1、3   或：3、1、2  或：2、3、1   或3、2、1
    //（一、二、三 顺序不固定，很显然，并行队列没有被sync所阻塞。）
}

// dispatch_barrier_sync、dispatch_barrier_sync 可以阻塞并行队列，栅栏任务先执行（栅栏作用的体现）
func case1() {
    let queue = DispatchQueue(label: "com.my_gcd_con1", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    let work = DispatchWorkItem(qos: .default, flags: .barrier) {
        print("-----")
        queue.async {
            print("2 ")
        }
        queue.async {
            print("3")
        }
        print("1")
    }
    queue.sync(execute: work)
    //输出结果: 任务一 任务二 任务三 （一首先，二、三顺序不固定）
}
