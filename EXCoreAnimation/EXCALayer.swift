//
//  EXCALayer.swift
//  ReuseCode
//
//  Created by huanghe on 8/17/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit


extension CAAnimation {
    
    static func createBasicAnimation(_ fromValue: AnyObject,
                                     toValue: AnyObject,
                                     keyPath: String,
                                     duration: CFTimeInterval = 0.3) -> CABasicAnimation {
        
        let basicAnimation = CABasicAnimation(keyPath: keyPath)
        basicAnimation.fromValue = fromValue
        basicAnimation.toValue = toValue
        basicAnimation.duration = duration
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = MAXFLOAT
        basicAnimation.isRemovedOnCompletion = false /// 如果不设置，进入后台动画会被移除
        
        return basicAnimation
    }
}

extension CALayer {
    /// 需要把图层的removedOnCompletion设置为false
    
    /// 应用切换到后台，暂停图层动画
    func stopAnimation() {
        let pausedTime = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0
        timeOffset = pausedTime
    }
    
    /// 应用切换到前台，开始图层动画
    func resumeAnimation()  {
        let pausedTime = timeOffset
        speed = 1
        timeOffset = 0
        beginTime = 0
        let timeSincePause = convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        beginTime = timeSincePause
    }
}


struct CoreAnimationKeys {
    
    static let Scale     = "transform.scale"
    static let RotationX    = "transform.rotation.x"
    static let RotationY    = "transform.rotation.y"
    static let RotationZ   = "transform.rotation.z"
    static let Rotation    = "transform.rotation"
    
    static let KeyFrame  = "contents"
    static let PositionY = "position.y"
    static let Opacity   = "opacity"
    static let StrokeStart     = "strokeStart"
    static let StrokeEnd  = "strokeEnd"
    
    static let Path = "path"
    
    
}
