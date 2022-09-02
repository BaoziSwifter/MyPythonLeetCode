//
//  3. 生产者消费者模型.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/2.
//

import Foundation

let maxOrder = 10
var currentOrder = [Int]()

let producer = DispatchQueue(label: "com.run.producer", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
let consumer = DispatchQueue(label: "com.run.consumer", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
let normalTime = 0.03
let sem = DispatchSemaphore(value: 1)

func runModel() {
    while true {
        producer.async {
            if currentOrder.count < maxOrder {
                sem.wait()
                let orderID = Int(arc4random())
                currentOrder.append(orderID)
                print("当前线程名称及地址: \(producer.label)<\(String.init(format: "%p", Thread.current))>"
                      + " 正在提交的订单: [订单编号: \(orderID)]"
                      + " 服务台订单数量: \(currentOrder.count)")
                Thread.sleep(forTimeInterval: normalTime)
                sem.signal()
            }
        }
        
        consumer.async {
            if currentOrder.count > 0 {
                sem.wait()
                let curOrderId = currentOrder.removeFirst()
                print("当前线程名称及地址: \(consumer.label)<\(String.init(format: "%p", Thread.current))>"
                      + " 正在消费订单: [订单编号: \(curOrderId)]"
                      + " 服务台订单数量: \(currentOrder.count)")
                Thread.sleep(forTimeInterval: normalTime)
                sem.signal()
            }
        }
    }
}
