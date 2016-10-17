////
////  多线程.swift
////  ReuseCode
////
////  Created by huanghe on 7/1/16.
////  Copyright © 2016 HH. All rights reserved.
////
//
//import Foundation
//
//public struct ThreadCode {
//    
//    /**
//     用如下方式代替objective-c的@synchronized
//     */
//    public static func test_objc_sync_enter() {
//        
//        let objBeLock = NSObject()
//        
//        DispatchQueue.global(priority: .low).async {
//            objc_sync_enter(objBeLock)
//            print("doing")
//            sleep(2)
//            objc_sync_exit(objBeLock)
//        }
//        
//        DispatchQueue.global(priority: 0).async {
//            objc_sync_enter(objBeLock)
//            print("doing too")
//            objc_sync_exit(objBeLock)
//        }
//    }
//    
//    /**
//     使用信号量来保持同步dispatch_semaphore_create
//     */
//    public static func test_dispatch_semaphore_create() {
//        let semaphore = DispatchSemaphore(value: 1)
//        DispatchQueue.global(priority: 0).async {
//            semaphore.wait(timeout: DispatchTime.distantFuture)
//            print("over")
//            sleep(2)
//            semaphore.signal()
//        }
//        
//        DispatchQueue.global(priority: 0).async {
//            semaphore.wait(timeout: DispatchTime.distantFuture)
//            print("over too")
//            semaphore.signal()
//        }
//    }
//    
//    /**
//     使用条件锁保持同步
//     */
//    public static func test_NSConditionLock() {
//        
//        let conditionLock = NSConditionLock(condition: 2)
//        DispatchQueue.global(priority: 0).async {
//            conditionLock.lock(whenCondition: 1)
//            print("lock condition 1")
//            sleep(3)
//            conditionLock.unlock()
//        }
//        
//        DispatchQueue.global(priority: 0).async {
//            conditionLock.lock(whenCondition: 2)
//            print("lock condition 2")
//            sleep(3)
//            conditionLock.unlock(withCondition: 1)
//        }
//    }
//    
//    /**
//     使用NSOperation
//     */
//    public static func test_NSOperationQueue() {
//        
//        let op1 = BlockOperation {
//            print("1")
//        }
//        
//        let op2 = BlockOperation {
//            print(2)
//            print(Thread.current)
//            sleep(3)
//        }
//        
//        op1.addDependency(op2)
//        
//        let myQueue = DispatchQueue(label: "com.queue", attributes: DispatchQueue.Attributes.concurrent)
//        let queue = OperationQueue()
//        queue.underlyingQueue = myQueue
//        queue.addOperation(op1)
//        queue.addOperation(op2)
//    }
//    
//    /**
//     GCD根据标识获取指定的queue
//     */
//    public static func test_Dispatch_specfi() {
//        
//        var queue = DispatchQueue(label: "org.reactivecocoa.ReactiveCocoa.SignalProducer.buffer", attributes: [])
//        queue.setSpecific(key: /*Migrator FIXME: Use a variable of type DispatchSpecificKey*/ &queue, value: &queue)
//        
//        if DispatchQueue.getSpecific(&queue) != nil {
//            print("queue")
//        } else {
//            print("not the queue")
//        }
//        
//        queue.async {
//            if DispatchQueue.getSpecific(&queue) != nil {
//                print("get the quee")
//            }
//        }
//    }
//    
//    /**
//     *  GCD取消block的执行，适用于iOS8.0后
//     */
//    @available(iOS 8.0, *)
//    func GCD_Cancel() {
//        
//        let queue = DispatchQueue(label: "queue", attributes: [])
//        let block = dispatch_block_create(dispatch_block_flags_t(0)) {
//            print("begin")
//            sleep(2)
//            print("end")
//        }
//        queue.async(execute: block)
//        dispatch_block_cancel(block)
//    }
//}
