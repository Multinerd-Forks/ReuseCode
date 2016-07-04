//
//  ViewController.swift
//  ReuseCode
//
//  Created by huanghe on 7/1/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let queueA = dispatch_queue_create("a", DISPATCH_QUEUE_SERIAL)
    let queueB = dispatch_queue_create("b", DISPATCH_QUEUE_SERIAL)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//       syncA()
        
        GCD_Cancel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func syncA() {
        dispatch_sync(queueB) { 
            self.syncB()
            print("a")
        }
    }
    
    func syncB() {
        dispatch_sync(queueA) {
//            print("b")
            self.syncA()
            print("b")
        }
    }
    
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

