//
//	VirtaOneTimePricing.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class VirtaOneTimePricing : NSObject, NSCoding{

	var currency : String!
	var name : String!
	var priceCents : Int!
	var priceCentsVat : Int!
	var priceCentsWithoutVat : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		currency = dictionary["currency"] as? String
		name = dictionary["name"] as? String
		priceCents = dictionary["priceCents"] as? Int
		priceCentsVat = dictionary["priceCentsVat"] as? Int
		priceCentsWithoutVat = dictionary["priceCentsWithoutVat"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if currency != nil{
			dictionary["currency"] = currency
		}
		if name != nil{
			dictionary["name"] = name
		}
		if priceCents != nil{
			dictionary["priceCents"] = priceCents
		}
		if priceCentsVat != nil{
			dictionary["priceCentsVat"] = priceCentsVat
		}
		if priceCentsWithoutVat != nil{
			dictionary["priceCentsWithoutVat"] = priceCentsWithoutVat
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         currency = aDecoder.decodeObject(forKey: "currency") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         priceCents = aDecoder.decodeObject(forKey: "priceCents") as? Int
         priceCentsVat = aDecoder.decodeObject(forKey: "priceCentsVat") as? Int
         priceCentsWithoutVat = aDecoder.decodeObject(forKey: "priceCentsWithoutVat") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if currency != nil{
			aCoder.encode(currency, forKey: "currency")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if priceCents != nil{
			aCoder.encode(priceCents, forKey: "priceCents")
		}
		if priceCentsVat != nil{
			aCoder.encode(priceCentsVat, forKey: "priceCentsVat")
		}
		if priceCentsWithoutVat != nil{
			aCoder.encode(priceCentsWithoutVat, forKey: "priceCentsWithoutVat")
		}

	}

}