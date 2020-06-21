//
//  FakeLaunchScreenVC.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import UIKit

class FakeLaunchScreenVC: BaseVC {

    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadDefaults()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.checkDefaults()
        }
        
    }
    
    // MARK: - Functions
    func checkDefaults(){
        
        if Globals.tokens != nil
        {
            let stationsVC = self.storyboard?.instantiateViewController(withIdentifier: "StationsVC") as! StationsVC
            self.navigationController?.fadeTo(stationsVC)
        }
        else
        {
            Globals.tokens = VirtaLogin(fromDictionary: [:])
            Globals.arrStationsList = [VirtaStationDetailListResponse]()
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.fadeTo(loginVC)
        }
        
    }
    
    func loadDefaults(){
        
        if UserDefaults.standard.object(forKey: CacheValue.AuthToken) != nil {
            Globals.tokens = (NSKeyedUnarchiver.unarchiveObject(with: (UserDefaults.standard.object(forKey: CacheValue.AuthToken) as? Data)!) as? VirtaLogin)!

        } else {
            Globals.tokens = nil
        }
        
        if UserDefaults.standard.object(forKey: CacheValue.StationsList) != nil {
            Globals.arrStationsList = (NSKeyedUnarchiver.unarchiveObject(with: (UserDefaults.standard.object(forKey: CacheValue.StationsList) as? Data)!) as? [VirtaStationDetailListResponse])!
            
        } else {
            Globals.arrStationsList = nil
        }
    }

}
