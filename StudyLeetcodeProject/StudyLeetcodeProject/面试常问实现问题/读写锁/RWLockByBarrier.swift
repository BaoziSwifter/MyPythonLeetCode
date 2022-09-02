//
//  RWLockByBarrier.swift
//  RWLockSwift
//
//  Created by beliefduan on 2022/8/25.
//

import Foundation


class RWLockByBarrier {
    
    fileprivate var queue = DispatchQueue(label: "com.study.rwlock_barrier",
                                          qos: .default,
                                          attributes: .concurrent,
                                          autoreleaseFrequency: .inherit,
                                          target: nil)
   
    func read(_ action: RWActionBlock?) {
        guard let a = action else {
            return
        }
        // 读操作为啥同步dispatch_sync
        // 读的话通常都是直接想要结果，需要同步返回结果，如果是异步获取的话就根网络请求一样了。
        queue.sync(execute: a)
    }
    
    func write(_ action: RWActionBlock?) {
        guard let a = action else {
            return
        }
        // 写操作为啥异步dispatch_barrier_async
        // 写操作是因为不需要等待写操作完成，所以用异步。
        let workAction = DispatchWorkItem(qos: .default, flags: .barrier, block: a)
        queue.async(execute: workAction)
    }
}


