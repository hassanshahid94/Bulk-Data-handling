//
//  ServerManager.swift
//  Virta iOS Task
//
//  Created by Hassan on 4/24/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager {
    
    public static func loginWithEmail(email: String, password: String, completion: @escaping (String) -> Void)
    {
        let url = "\(Constants.BaseURL)\(VirtaAPIEndpoints.login.rawValue)"

        let params = ["email": email, "code": password]
        
        Alamofire.request(url, method: .post, parameters: params)
            .responseJSON { response in
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200: //success
                        //to get JSON return value
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            Globals.tokens = VirtaLogin(fromDictionary: jdict as! [String: Any])
                            Globals.tokens.accessToken = "Bearer \(Globals.tokens.accessToken!)"
                            
                            // #CACHE#
                            let encodedData = NSKeyedArchiver.archivedData(withRootObject: Globals.tokens)
                            UserDefaults.standard.set(encodedData, forKey: CacheValue.AuthToken)
                            UserDefaults.standard.synchronize()
                            completion("success")
                            
                            
                        }
                    case 401:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String)
                        }
                        else{
                            
                            completion("Something went wrong. Please try again.")
                        }
                        
                    case 500:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String)
                        }
                        else{
                            completion("Something went wrong. Please try again.")
                        }
                        
                    default:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            let error = jdict["message"]
                            completion(error as! String)
                            
                        }
                        else{
                            completion("Something went wrong. Please try again.")
                        }
                        
                    }
                } else {
                    completion((response.error?.localizedDescription)!)
                }
        }
    }
    
    public static func getListOfStations(token: String, latMin: Double, longMin:Double, latMax: Double, longMax: Double, limit: Int, completion: @escaping (String) -> Void)
    {
        
        let url = "\(Constants.BaseURL)\(VirtaAPIEndpoints.getAllStations.rawValue)"
        
        let header = ["Authorization": token]
        let params = ["latMin": latMin, "longMin": longMin, "latMax": latMax, "longMax": longMax, "limit": limit] as [String : Any]
        
        Alamofire.request(url, method: .get, parameters: params, headers: header)
            .responseJSON { response in
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200: //success
                        //to get JSON return value
                        if let result = response.result.value {
                            let jdict = result as! NSArray
                            
                            Globals.arrStationsList = jdict.map { VirtaStationDetailListResponse(fromDictionary: $0 as! [String:Any]) }
                            
                            // #CACHE#
                            let encodedData = NSKeyedArchiver.archivedData(withRootObject: Globals.arrStationsList)
                            UserDefaults.standard.set(encodedData, forKey: CacheValue.StationsList)
                            UserDefaults.standard.synchronize()
                            completion("success")
                            
                            
                        }
                    case 401:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String)
                        }
                        else{
                            
                            completion("Something went wrong. Please try again.")
                        }
                        
                    case 500:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String)
                        }
                        else{
                            completion("Something went wrong. Please try again.")
                        }
                        
                    default:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            let error = jdict["message"]
                            completion(error as! String)
                            
                        }
                        else{
                            completion("Something went wrong. Please try again.")
                        }
                        
                    }
                } else {
                    completion((response.error?.localizedDescription)!)
                }
        }
    }
    
    public static func stationDetail(token: String, stationId: Int, completion: @escaping (String, VirtaStationDetailListResponse) -> Void)
    {
        let url = "\(Constants.BaseURL)\(VirtaAPIEndpoints.getDetailOfStation.rawValue)\(stationId)"
        
        let header = ["Authorization": token]
        
        Alamofire.request(url, method: .get, headers: header)
            .responseJSON { response in
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200: //success
                        //to get JSON return value
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let data = VirtaStationDetailListResponse(fromDictionary: jdict as! [String: Any])
                            
                            completion("success", data)
                            
                            
                        }
                    case 401:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String, VirtaStationDetailListResponse(fromDictionary: [:]))
                        }
                        else{
                            
                            completion("Something went wrong. Please try again.",VirtaStationDetailListResponse(fromDictionary: [:]))
                        }
                        
                    case 500:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String, VirtaStationDetailListResponse(fromDictionary: [:]))
                        }
                        else{
                            completion("Something went wrong. Please try again.", VirtaStationDetailListResponse(fromDictionary: [:]))
                        }
                        
                    default:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            let error = jdict["message"]
                            completion(error as! String, VirtaStationDetailListResponse(fromDictionary: [:]))
                            
                        }
                        else{
                            completion("Something went wrong. Please try again.", VirtaStationDetailListResponse(fromDictionary: [:]))
                        }
                        
                    }
                } else {
                    completion((response.error?.localizedDescription)!, VirtaStationDetailListResponse(fromDictionary: [:]))
                }
        }
    }
    
    public static func logout(token: String, completion: @escaping (String) -> Void)
    {
        let url = "\(Constants.BaseURL)\(VirtaAPIEndpoints.login.rawValue)"

        let header = ["Authorization": token]
        
        Alamofire.request(url, method: .delete, parameters: nil, headers: header)
            .responseJSON { response in
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200: //success
                        //to get JSON return value
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            completion("success")
                        }
                    case 400:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String)
                        }
                        else{
                            
                            completion("Something went wrong. Please try again.")
                        }
                        
                    case 500:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            
                            let error = jdict["message"]
                            completion(error as! String)
                        }
                        else{
                            completion("Something went wrong. Please try again.")
                        }
                        
                    default:
                        if let result = response.result.value {
                            let jdict = result as! NSDictionary
                            let error = jdict["message"]
                            completion(error as! String)
                            
                        }
                        else{
                            completion("Something went wrong. Please try again.")
                        }
                        
                    }
                } else {
                    completion((response.error?.localizedDescription)!)
                }
        }
    }
}

enum VirtaAPIEndpoints: String
{
    //Rest API URL
    case login                   = "auth"
    case getAllStations          = "stations"
    case getDetailOfStation      = "stations/"
}




