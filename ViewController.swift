//
//  ViewController.swift
//  ReuseCode
//
//  Created by huanghe on 7/1/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let queueA = DispatchQueue(label: "a", attributes: [])
    let queueB = DispatchQueue(label: "b", attributes: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    @IBAction func action(_ sender: UIButton) {
        do {
            _ = try throwMe(shouldThrow: true)
        }catch {
            //print(error)
            alert(title: "lai", message:  "\(error)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func syncA() {
        print("gggg")
    }
    
    func syncB() {
        queueA.sync {
//            print("b")
            self.syncA()
            print("b")
        }
    }


}

class CCV: UITableViewCell, Reusable {
    func te() {}
}
