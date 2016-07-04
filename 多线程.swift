//
//  多线程.swift
//  ReuseCode
//
//  Created by huanghe on 7/1/16.
//  Copyright © 2016 HH. All rights reserved.
//

import Foundation

public struct ThreadCode {
    
    /**
     用如下方式代替objective-c的@synchronized
     */
    public static func test_objc_sync_enter() {
        
        let objBeLock = NSObject()
        
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            objc_sync_enter(objBeLock)
            print("doing")
            sleep(2)
            objc_sync_exit(objBeLock)
        }
        
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            objc_sync_enter(objBeLock)
            print("doing too")
            objc_sync_exit(objBeLock)
        }
    }
    
    /**
     使用信号量来保持同步dispatch_semaphore_create
     */
    public static func test_dispatch_semaphore_create() {
        let semaphore = dispatch_semaphore_create(1)
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
            print("over")
            sleep(2)
            dispatch_semaphore_signal(semaphore)
        }
        
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
            print("over too")
            dispatch_semaphore_signal(semaphore)
        }
    }
    
    /**
     使用条件锁保持同步
     */
    public static func test_NSConditionLock() {
        
        let conditionLock = NSConditionLock(condition: 2)
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            conditionLock.lockWhenCondition(1)
            print("lock condition 1")
            sleep(3)
            conditionLock.unlock()
        }
        
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            conditionLock.lockWhenCondition(2)
            print("lock condition 2")
            sleep(3)
            conditionLock.unlockWithCondition(1)
        }
    }
    
    /**
     使用NSOperation
     */
    public static func test_NSOperationQueue() {
        
        let op1 = NSBlockOperation {
            print("1")
        }
        
        let op2 = NSBlockOperation {
            print(2)
            print(NSThread.currentThread())
            sleep(3)
        }
        
        op1.addDependency(op2)
        
        let myQueue = dispatch_queue_create("com.queue", DISPATCH_QUEUE_CONCURRENT)
        let queue = NSOperationQueue()
        queue.underlyingQueue = myQueue
        queue.addOperation(op1)
        queue.addOperation(op2)
    }
    
    /**
     GCD根据标识获取指定的queue
     */
    public static func test_Dispatch_specfi() {
        
        var queue = dispatch_queue_create("org.reactivecocoa.ReactiveCocoa.SignalProducer.buffer", DISPATCH_QUEUE_SERIAL)
        dispatch_queue_set_specific(queue, &queue, &queue, nil)
        
        if dispatch_get_specific(&queue) != nil {
            print("queue")
        } else {
            print("not the queue")
        }
        
        dispatch_async(queue) {
            if dispatch_get_specific(&queue) != nil {
                print("get the quee")
            }
        }
    }
    
    /**
     *  GCD取消block的执行，适用于iOS8.0后
     */
    @available(iOS 8.0, *)
    func GCD_Cancel() {
        
        let queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL)
        let block = dispatch_block_create(dispatch_block_flags_t(0)) {
            print("begin")
            sleep(2)
            print("end")
        }
        dispatch_async(queue, block)
        dispatch_block_cancel(block)
    }
}