//
//  RWLockByTwoLocks.swift
//  RWLockSwift
//
//  Created by beliefduan on 2022/8/25.
//

import Foundation

class RWLockByTwoLocks {
    
    fileprivate var r_mutuex = pthread_mutex_t()
    fileprivate var w_mutuex = pthread_mutex_t()
    fileprivate var readers = 0
    
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
    
    // MARK: Inner Method
    
    fileprivate func rLock() {
        pthread_mutex_lock(&r_mutuex)
        if readers == 0 { pthread_mutex_unlock(&w_mutuex) }
        readers += 1
        pthread_mutex_unlock(&r_mutuex)
    }
    
    fileprivate func rUnLock() {
        pthread_mutex_lock(&r_mutuex)
         readers -= 1
        if readers == 0 { pthread_mutex_unlock(&w_mutuex) }
        pthread_mutex_unlock(&r_mutuex)
    }
    
    fileprivate func wLock() {
        pthread_mutex_lock(&w_mutuex)
    }
    
    fileprivate func wUnLock() {
        pthread_mutex_unlock(&w_mutuex)
    }
}
// xititi


