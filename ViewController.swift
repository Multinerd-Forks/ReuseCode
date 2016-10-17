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

        UIStoryboard.storyboard(storyboard: .Main).instantiateVC(ViewController.self)?.syncA()
        
        CCV.loadFromNib().te()
        
        let path = NSIndexPath(index: 1)
        UITableView().dequeueReusableCell(indexPath: path, cellType: CCV.self).te()

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
