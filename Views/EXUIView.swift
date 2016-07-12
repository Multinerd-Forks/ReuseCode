//
//  EXUIView.swift
//  ReuseCode
//
//  Created by huanghe on 7/5/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     caculate frame when view's anchorPoint is not（0.5, 0.5)
     - parameter view: the view for calculate
     - returns: the frame for view
     */
    func frameForAnchorPointUnCenter() -> CGRect {
        
        let view = UIView(frame: self.frame)
        
        let anch = view.layer.anchorPoint
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let frame = view.frame
        
        let x = frame.minX + frame.width / 2 - frame.width * anch.x
        let y = frame.minY + frame.height / 2 - frame.height * anch.y
        
        return CGRect(x: x, y: y, width: frame.width, height: frame.height)
    }
}


extension UIView {
    
    enum RoundedCornerMask {
        case None, TopLeft, TopRight, BottomLeft, BottomRight, All
    }
    
    func roundedCorners(corners: RoundedCornerMask... , radius: CGFloat)  {
        
        let minx = bounds.minX
        let midx = bounds.midX
        let maxx = bounds.maxX
        let miny = bounds.minY
        let midy = bounds.midY
        let maxy = bounds.maxY
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, minx, midy)
        
        CGPathAddArcToPoint(path, nil, minx, miny, midx, miny, corners.contains(.TopLeft) ? radius : 0)
        CGPathAddArcToPoint(path, nil, maxx, miny, maxx, midy, corners.contains(.TopRight) ? radius : 0)
        CGPathAddArcToPoint(path, nil, maxx, maxy, midx, maxy, corners.contains(.BottomRight) ? radius : 0)
        CGPathAddArcToPoint(path, nil, minx, maxy, minx, midy, corners.contains(.BottomLeft) ? radius : 0)
        CGPathCloseSubpath(path)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path
        layer.mask = nil
        layer.mask = maskLayer
        
    }
}
