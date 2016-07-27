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

// MARK: - 任意圆角
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

// MARK: - 获取视图控制器
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UIView {
    
    public func resizeToFitSubviews() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            let aView = someView
            let newWidth = aView.frame.minX + aView.frame.minY
            let newHeight = aView.frame.minY + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
        }
        frame = CGRect(x: frame.minX, y: frame.minY, width: width, height: height)
    }
}

// MARK: Render Extensions
extension UIView {
    /// EZSwiftExtensions
    public func toImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, 0.0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}

extension UIView {
    ///EZSE: Loops until it finds the top root view.
    func rootView() -> UIView {
        guard let parentView = superview else {
            return self
        }
        return parentView.rootView()
    }
}
