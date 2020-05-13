//
//  SlidingInExtension.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension UIView {
    
    func slidingInFromWherever(duration: TimeInterval, completionDelegate: AnyObject? = nil, whichDirection: CATransitionSubtype) {
        
        let fromWherever = CATransition()
        
        if let delegate: AnyObject = completionDelegate {
            fromWherever.delegate = delegate as! CAAnimationDelegate
        }
        
        fromWherever.type = CATransitionType.fade
        fromWherever.subtype = whichDirection
        fromWherever.duration = duration
        fromWherever.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        fromWherever.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(fromWherever, forKey: "fromWherever")
        
    }
}


