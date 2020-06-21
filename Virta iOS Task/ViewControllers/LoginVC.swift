//
//  LoginVC.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    //MARK:- Outlets
    @IBOutlet var lblLoginAndCharge: UILabel!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var txtPwd: UITextField!
    @IBOutlet var txtUserName: UITextField!
    
    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLogin.layer.masksToBounds = false
        btnLogin.layer.shadowOffset = CGSize(width: -1, height: 1)
        btnLogin.layer.shadowRadius = 1
        btnLogin.layer.shadowOpacity = 0.5
        btnLogin.layer.cornerRadius = 10

    }
    
    //MARK:- Actions
    @IBAction func btnLoginAction(_ sender: UIButton) {
        
        if txtUserName.text == ""
        {
            showAlertMessage(message: "Please enter your username")
        }
        else if txtPwd.text == ""
        {
            showAlertMessage(message: "Please enter your password")
        }
        else
        {
            showGlobalProgressHUDWithTitle("Please wait...")
            ServerManager.loginWithEmail(email: txtUserName.text!, password: txtPwd.text!) { (status) in
                self.dismissGlobalHUD()
                if status == "success"
                {
                    let stationsVC = self.storyboard?.instantiateViewController(withIdentifier: "StationsVC") as! StationsVC
                    self.navigationController?.fadeTo(stationsVC)
                }
                else
                {
                    self.showAlertMessage(message: status)
                }
            }
        }
        
    }

}
