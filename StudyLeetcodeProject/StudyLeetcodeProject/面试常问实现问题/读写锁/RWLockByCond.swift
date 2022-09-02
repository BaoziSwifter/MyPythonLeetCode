//
//  RWLockByCond.swift
//  RWLockSwift
//
//  Created by beliefduan on 2022/8/25.
//

import Foundation

class RWLockByCond {
    fileprivate var readers = 0
    fileprivate var isWrite = false
    fileprivate var lock = pthread_mutex_t()
    fileprivate var cond = pthread_cond_t()

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
        pthread_mutex_lock(&lock)
        while isWrite {
            pthread_cond_wait(&cond, &lock)
        }
        
        readers += 1
        pthread_mutex_unlock(&lock)
    }
    
    fileprivate func rUnLock() {
        pthread_mutex_lock(&lock)
        readers -= 1
        if readers == 0 { pthread_cond_signal(&cond) }
        pthread_mutex_unlock(&lock)
    }
    
    fileprivate func wLock() {
        pthread_mutex_lock(&lock)
        while isWrite || readers > 0 {
            pthread_cond_wait(&cond, &lock)
        }
        isWrite = true
        pthread_mutex_unlock(&lock)
    }
    
    fileprivate func wUnLock() {
        pthread_mutex_lock(&lock)
        isWrite = true
        pthread_cond_broadcast(&cond)
        pthread_mutex_unlock(&lock)
    }
    
}
