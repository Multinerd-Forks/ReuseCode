//
//  UIScreen+Extension.swift
//
//  Created by Augus on 9/8/15.
//  Copyright © 2015 iAugus. All rights reserved.
//

import UIKit

extension UIScreen {
    
    var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.height
    }
}
