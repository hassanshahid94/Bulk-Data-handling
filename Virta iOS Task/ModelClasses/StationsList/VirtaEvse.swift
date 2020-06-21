//
//	VirtaEvse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class VirtaEvse : NSObject, NSCoding{

	var available : Bool!
	var connectors : [VirtaConnector]!
	var currency : String!
	var evseId : String!
	var id : Int!
	var isFree : Bool!
	var isV2G : Bool!
	var minutesWithoutTimeCharge : Int!
	var occupied : Bool!
	var oneTimeMinimum : Int!
	var oneTimePayment : Bool!
	var oneTimePaymentInAppEnabled : Bool!
	var oneTimePricing : [VirtaOneTimePricing]!
	var oneTimePricingRatio : Float!
	var pricing : [VirtaOneTimePricing]!
	var reservable : Bool!
	var reserved : Bool!
	var status : Int!
    var groupName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		available = dictionary["available"] as? Bool
		connectors = [VirtaConnector]()
		if let connectorsArray = dictionary["connectors"] as? [[String:Any]]{
			for dic in connectorsArray{
				let value = VirtaConnector(fromDictionary: dic)
				connectors.append(value)
			}
		}
		currency = dictionary["currency"] as? String
		evseId = dictionary["evseId"] as? String
		id = dictionary["id"] as? Int
		isFree = dictionary["isFree"] as? Bool
		isV2G = dictionary["isV2G"] as? Bool
		minutesWithoutTimeCharge = dictionary["minutesWithoutTimeCharge"] as? Int
		occupied = dictionary["occupied"] as? Bool
		oneTimeMinimum = dictionary["oneTimeMinimum"] as? Int
		oneTimePayment = dictionary["oneTimePayment"] as? Bool
		oneTimePaymentInAppEnabled = dictionary["oneTimePaymentInAppEnabled"] as? Bool
		oneTimePricing = [VirtaOneTimePricing]()
		if let oneTimePricingArray = dictionary["oneTimePricing"] as? [[String:Any]]{
			for dic in oneTimePricingArray{
				let value = VirtaOneTimePricing(fromDictionary: dic)
				oneTimePricing.append(value)
			}
		}
		oneTimePricingRatio = dictionary["oneTimePricingRatio"] as? Float
		pricing = [VirtaOneTimePricing]()
		if let pricingArray = dictionary["pricing"] as? [[String:Any]]{
			for dic in pricingArray{
				let value = VirtaOneTimePricing(fromDictionary: dic)
				pricing.append(value)
			}
		}
		reservable = dictionary["reservable"] as? Bool
		reserved = dictionary["reserved"] as? Bool
		status = dictionary["status"] as? Int
        groupName = dictionary["groupName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if available != nil{
			dictionary["available"] = available
		}
		if connectors != nil{
			var dictionaryElements = [[String:Any]]()
			for connectorsElement in connectors {
				dictionaryElements.append(connectorsElement.toDictionary())
			}
			dictionary["connectors"] = dictionaryElements
		}
		if currency != nil{
			dictionary["currency"] = currency
		}
		if evseId != nil{
			dictionary["evseId"] = evseId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isFree != nil{
			dictionary["isFree"] = isFree
		}
		if isV2G != nil{
			dictionary["isV2G"] = isV2G
		}
		if minutesWithoutTimeCharge != nil{
			dictionary["minutesWithoutTimeCharge"] = minutesWithoutTimeCharge
		}
		if occupied != nil{
			dictionary["occupied"] = occupied
		}
		if oneTimeMinimum != nil{
			dictionary["oneTimeMinimum"] = oneTimeMinimum
		}
		if oneTimePayment != nil{
			dictionary["oneTimePayment"] = oneTimePayment
		}
		if oneTimePaymentInAppEnabled != nil{
			dictionary["oneTimePaymentInAppEnabled"] = oneTimePaymentInAppEnabled
		}
		if oneTimePricing != nil{
			var dictionaryElements = [[String:Any]]()
			for oneTimePricingElement in oneTimePricing {
				dictionaryElements.append(oneTimePricingElement.toDictionary())
			}
			dictionary["oneTimePricing"] = dictionaryElements
		}
		if oneTimePricingRatio != nil{
			dictionary["oneTimePricingRatio"] = oneTimePricingRatio
		}
		if pricing != nil{
			var dictionaryElements = [[String:Any]]()
			for pricingElement in pricing {
				dictionaryElements.append(pricingElement.toDictionary())
			}
			dictionary["pricing"] = dictionaryElements
		}
		if reservable != nil{
			dictionary["reservable"] = reservable
		}
		if reserved != nil{
			dictionary["reserved"] = reserved
		}
		if status != nil{
			dictionary["status"] = status
		}
        if groupName != nil{
            dictionary["groupName"] = groupName
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         available = aDecoder.decodeObject(forKey: "available") as? Bool
         connectors = aDecoder.decodeObject(forKey :"connectors") as? [VirtaConnector]
         currency = aDecoder.decodeObject(forKey: "currency") as? String
         evseId = aDecoder.decodeObject(forKey: "evseId") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isFree = aDecoder.decodeObject(forKey: "isFree") as? Bool
         isV2G = aDecoder.decodeObject(forKey: "isV2G") as? Bool
         minutesWithoutTimeCharge = aDecoder.decodeObject(forKey: "minutesWithoutTimeCharge") as? Int
         occupied = aDecoder.decodeObject(forKey: "occupied") as? Bool
         oneTimeMinimum = aDecoder.decodeObject(forKey: "oneTimeMinimum") as? Int
         oneTimePayment = aDecoder.decodeObject(forKey: "oneTimePayment") as? Bool
         oneTimePaymentInAppEnabled = aDecoder.decodeObject(forKey: "oneTimePaymentInAppEnabled") as? Bool
         oneTimePricing = aDecoder.decodeObject(forKey :"oneTimePricing") as? [VirtaOneTimePricing]
         oneTimePricingRatio = aDecoder.decodeObject(forKey: "oneTimePricingRatio") as? Float
         pricing = aDecoder.decodeObject(forKey :"pricing") as? [VirtaOneTimePricing]
         reservable = aDecoder.decodeObject(forKey: "reservable") as? Bool
         reserved = aDecoder.decodeObject(forKey: "reserved") as? Bool
         status = aDecoder.decodeObject(forKey: "status") as? Int
        groupName = aDecoder.decodeObject(forKey: "groupName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if available != nil{
			aCoder.encode(available, forKey: "available")
		}
		if connectors != nil{
			aCoder.encode(connectors, forKey: "connectors")
		}
		if currency != nil{
			aCoder.encode(currency, forKey: "currency")
		}
		if evseId != nil{
			aCoder.encode(evseId, forKey: "evseId")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isFree != nil{
			aCoder.encode(isFree, forKey: "isFree")
		}
		if isV2G != nil{
			aCoder.encode(isV2G, forKey: "isV2G")
		}
		if minutesWithoutTimeCharge != nil{
			aCoder.encode(minutesWithoutTimeCharge, forKey: "minutesWithoutTimeCharge")
		}
		if occupied != nil{
			aCoder.encode(occupied, forKey: "occupied")
		}
		if oneTimeMinimum != nil{
			aCoder.encode(oneTimeMinimum, forKey: "oneTimeMinimum")
		}
		if oneTimePayment != nil{
			aCoder.encode(oneTimePayment, forKey: "oneTimePayment")
		}
		if oneTimePaymentInAppEnabled != nil{
			aCoder.encode(oneTimePaymentInAppEnabled, forKey: "oneTimePaymentInAppEnabled")
		}
		if oneTimePricing != nil{
			aCoder.encode(oneTimePricing, forKey: "oneTimePricing")
		}
		if oneTimePricingRatio != nil{
			aCoder.encode(oneTimePricingRatio, forKey: "oneTimePricingRatio")
		}
		if pricing != nil{
			aCoder.encode(pricing, forKey: "pricing")
		}
		if reservable != nil{
			aCoder.encode(reservable, forKey: "reservable")
		}
		if reserved != nil{
			aCoder.encode(reserved, forKey: "reserved")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
        if groupName != nil{
            aCoder.encode(groupName, forKey: "groupName")
        }

	}

}
