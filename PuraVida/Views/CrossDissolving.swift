//
//  CrossDissolving.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension UINavigationController {
        
    func crossDissolving(_ dissolvedVC: UIViewController) {
        let cdTransition = CATransition()
        cdTransition.duration = 0.33
        cdTransition.type = CATransitionType.fade
        view.layer.add(cdTransition, forKey: nil)
        pushViewController(dissolvedVC, animated: false)           
    }
     
}
