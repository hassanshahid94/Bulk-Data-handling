//
//	VirtaLogin.swift
//
//	Create by Hassan Shahid on 24/4/2020
//	Copyright © 2020. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class VirtaLogin : NSObject, NSCoding{

	var accessToken : String!
	var expiresIn : Int!
	var token : String!
	var tokenType : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accessToken = dictionary["access_token"] as? String
		expiresIn = dictionary["expires_in"] as? Int
		token = dictionary["token"] as? String
		tokenType = dictionary["token_type"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accessToken != nil{
			dictionary["access_token"] = accessToken
		}
		if expiresIn != nil{
			dictionary["expires_in"] = expiresIn
		}
		if token != nil{
			dictionary["token"] = token
		}
		if tokenType != nil{
			dictionary["token_type"] = tokenType
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accessToken = aDecoder.decodeObject(forKey: "access_token") as? String
         expiresIn = aDecoder.decodeObject(forKey: "expires_in") as? Int
         token = aDecoder.decodeObject(forKey: "token") as? String
         tokenType = aDecoder.decodeObject(forKey: "token_type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accessToken != nil{
			aCoder.encode(accessToken, forKey: "access_token")
		}
		if expiresIn != nil{
			aCoder.encode(expiresIn, forKey: "expires_in")
		}
		if token != nil{
			aCoder.encode(token, forKey: "token")
		}
		if tokenType != nil{
			aCoder.encode(tokenType, forKey: "token_type")
		}

	}

}