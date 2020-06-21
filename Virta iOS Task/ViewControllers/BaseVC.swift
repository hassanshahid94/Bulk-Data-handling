//
//  BaseVC.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseVC: UIViewController {

    // MARK: - Variables
    var hud:MBProgressHUD = MBProgressHUD()
    
    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    public func showAlertMessage(message:String)
    {
        let alert = UIAlertController(title: "Virta", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    public  func showGlobalProgressHUDWithTitle(_ title:String)
    {
        hud.mode = MBProgressHUDMode.indeterminate
        hud = MBProgressHUD.showAdded(to: (self.view)!, animated: true)
        hud.label.numberOfLines = 0
        hud.label.text = title
    }
    
    public func dismissGlobalHUD()
    {
        hud.hide(animated: true)
    }
    
    func cacheData(data: AnyObject, keyValue: String)
    {
        //#CACHE#
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
        UserDefaults.standard.set(encodedData, forKey: keyValue)
        UserDefaults.standard.synchronize()
    }

}
