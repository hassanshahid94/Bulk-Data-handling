//
//  Extension.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/26/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func fadeTo(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: false)
        
    }
    
    func fadeOut(_ viewController: UIViewController){
        
        let transition: CATransition = CATransition()

        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade

        viewController.view.window?.layer.add(transition, forKey: "kCATransition")
        popViewController(animated: false)

    }
}
