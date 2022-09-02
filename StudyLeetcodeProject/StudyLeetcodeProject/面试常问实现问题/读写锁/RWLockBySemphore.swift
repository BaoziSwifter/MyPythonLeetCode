//
//  RWLockBySemphore.swift
//  RWLockSwift
//
//  Created by beliefduan on 2022/8/25.
//

import Foundation

class RWLockBySemphore {
    private var r_sem = DispatchSemaphore(value: 1)
    private var w_sem = DispatchSemaphore(value: 1)
    private var readers = 0
    
    func read(_ action: RWActionBlock?) {
        guard let a = action else {
            return
        }
        self.rLock()
        a()
        self.rUnLock()
    }
    
    func write(_ action: RWActionBlock?) {
        guard let a = action else {
            return
        }
        self.wLock()
        a()
        self.wUnLock()
    }
    
    // MARK: - Inner Methods
    
    fileprivate func rLock() {
        r_sem.wait()
        if readers == 0 {
            w_sem.wait()
        }
        readers += 1
        r_sem.signal()
    }
    fileprivate func rUnLock() {
        r_sem.wait()
        readers -= 1
        if readers == 0 { w_sem.signal() }
        r_sem.signal()
    }
    
    fileprivate func wLock() {
        w_sem.wait()
    }
    fileprivate func wUnLock() {
        w_sem.signal()
    }
}
