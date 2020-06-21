//
//	VirtaConnector.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class VirtaConnector : NSObject, NSCoding{

	var connectorID : Int!
	var currentType : String!
	var maxKw : Double!
	var maxKwh : Double!
	var status : String!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		connectorID = dictionary["connectorID"] as? Int
		currentType = dictionary["currentType"] as? String
		maxKw = dictionary["maxKw"] as? Double
		maxKwh = dictionary["maxKwh"] as? Double
		status = dictionary["status"] as? String
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if connectorID != nil{
			dictionary["connectorID"] = connectorID
		}
		if currentType != nil{
			dictionary["currentType"] = currentType
		}
		if maxKw != nil{
			dictionary["maxKw"] = maxKw
		}
		if maxKwh != nil{
			dictionary["maxKwh"] = maxKwh
		}
		if status != nil{
			dictionary["status"] = status
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         connectorID = aDecoder.decodeObject(forKey: "connectorID") as? Int
         currentType = aDecoder.decodeObject(forKey: "currentType") as? String
         maxKw = aDecoder.decodeObject(forKey: "maxKw") as? Double
         maxKwh = aDecoder.decodeObject(forKey: "maxKwh") as? Double
         status = aDecoder.decodeObject(forKey: "status") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if connectorID != nil{
			aCoder.encode(connectorID, forKey: "connectorID")
		}
		if currentType != nil{
			aCoder.encode(currentType, forKey: "currentType")
		}
		if maxKw != nil{
			aCoder.encode(maxKw, forKey: "maxKw")
		}
		if maxKwh != nil{
			aCoder.encode(maxKwh, forKey: "maxKwh")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
