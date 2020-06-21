//
//	VirtaStationDetailListResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import CoreLocation

class VirtaStationDetailListResponse : NSObject, NSCoding{

	var address : String!
	var city : String!
	var eichrechtType : String!
	var evses : [VirtaEvse]!
	var icon : Int!
	var id : Int!
	var isV2G : Bool!
	var latitude : Double!
	var longitude : Double!
	var name : String!
	var openHours : String!
	var pictures : [AnyObject]!
	var providers : String!
	var termsAndConditionsUrlActingEmp : AnyObject!
	var termsLink : String!
    var isRemoved : Bool!
    var isPrivate : Bool!
    var distance : Int!
    var distanceString : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		address = dictionary["address"] as? String
		city = dictionary["city"] as? String
		eichrechtType = dictionary["eichrechtType"] as? String
		evses = [VirtaEvse]()
		if let evsesArray = dictionary["evses"] as? [[String:Any]]{
			for dic in evsesArray{
				let value = VirtaEvse(fromDictionary: dic)
				evses.append(value)
			}
		}
		icon = dictionary["icon"] as? Int
		id = dictionary["id"] as? Int
		isV2G = dictionary["isV2G"] as? Bool
		latitude = dictionary["latitude"] as? Double
		longitude = dictionary["longitude"] as? Double
		name = dictionary["name"] as? String
		openHours = dictionary["openHours"] as? String
		pictures = dictionary["pictures"] as? [AnyObject]
		providers = dictionary["providers"] as? String
		termsAndConditionsUrlActingEmp = dictionary["termsAndConditionsUrlActingEmp"] as? AnyObject
		termsLink = dictionary["termsLink"] as? String
        isRemoved = dictionary["isRemoved"] as? Bool
        isPrivate = dictionary["isPrivate"] as? Bool
        distance = dictionary["distance"] as? Int
        distanceString = dictionary["distanceString"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if address != nil{
			dictionary["address"] = address
		}
		if city != nil{
			dictionary["city"] = city
		}
		if eichrechtType != nil{
			dictionary["eichrechtType"] = eichrechtType
		}
		if evses != nil{
			var dictionaryElements = [[String:Any]]()
			for evsesElement in evses {
				dictionaryElements.append(evsesElement.toDictionary())
			}
			dictionary["evses"] = dictionaryElements
		}
		if icon != nil{
			dictionary["icon"] = icon
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isV2G != nil{
			dictionary["isV2G"] = isV2G
		}
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if longitude != nil{
			dictionary["longitude"] = longitude
		}
		if name != nil{
			dictionary["name"] = name
		}
		if openHours != nil{
			dictionary["openHours"] = openHours
		}
		if pictures != nil{
			dictionary["pictures"] = pictures
		}
		if providers != nil{
			dictionary["providers"] = providers
		}
		if termsAndConditionsUrlActingEmp != nil{
			dictionary["termsAndConditionsUrlActingEmp"] = termsAndConditionsUrlActingEmp
		}
		if termsLink != nil{
			dictionary["termsLink"] = termsLink
		}
        if isRemoved != nil{
            dictionary["isRemoved"] = isRemoved
        }
        if isPrivate != nil{
            dictionary["isPrivate"] = isPrivate
        }
        if distance != nil{
            dictionary["distance"] = distance
        }
        if distanceString != nil{
            dictionary["distanceString"] = distanceString
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "address") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         eichrechtType = aDecoder.decodeObject(forKey: "eichrechtType") as? String
         evses = aDecoder.decodeObject(forKey :"evses") as? [VirtaEvse]
         icon = aDecoder.decodeObject(forKey: "icon") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isV2G = aDecoder.decodeObject(forKey: "isV2G") as? Bool
         latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
         longitude = aDecoder.decodeObject(forKey: "longitude") as? Double
         name = aDecoder.decodeObject(forKey: "name") as? String
         openHours = aDecoder.decodeObject(forKey: "openHours") as? String
         pictures = aDecoder.decodeObject(forKey: "pictures") as? [AnyObject]
         providers = aDecoder.decodeObject(forKey: "providers") as? String
         termsAndConditionsUrlActingEmp = aDecoder.decodeObject(forKey: "termsAndConditionsUrlActingEmp") as? AnyObject
         termsLink = aDecoder.decodeObject(forKey: "termsLink") as? String
        isRemoved = aDecoder.decodeObject(forKey: "isRemoved") as? Bool
        isPrivate = aDecoder.decodeObject(forKey: "isPrivate") as? Bool
         distance = aDecoder.decodeObject(forKey: "distance") as? Int
        distanceString = aDecoder.decodeObject(forKey: "distanceString") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if eichrechtType != nil{
			aCoder.encode(eichrechtType, forKey: "eichrechtType")
		}
		if evses != nil{
			aCoder.encode(evses, forKey: "evses")
		}
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isV2G != nil{
			aCoder.encode(isV2G, forKey: "isV2G")
		}
		if latitude != nil{
			aCoder.encode(latitude, forKey: "latitude")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "longitude")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if openHours != nil{
			aCoder.encode(openHours, forKey: "openHours")
		}
		if pictures != nil{
			aCoder.encode(pictures, forKey: "pictures")
		}
		if providers != nil{
			aCoder.encode(providers, forKey: "providers")
		}
		if termsAndConditionsUrlActingEmp != nil{
			aCoder.encode(termsAndConditionsUrlActingEmp, forKey: "termsAndConditionsUrlActingEmp")
		}
		if termsLink != nil{
			aCoder.encode(termsLink, forKey: "termsLink")
		}
        if isRemoved != nil{
            aCoder.encode(isRemoved, forKey: "isRemoved")
        }
        if isPrivate != nil{
            aCoder.encode(isPrivate, forKey: "isPrivate")
        }
        if distance != nil{
            aCoder.encode(distance, forKey: "distance")
        }
        if distanceString != nil{
            aCoder.encode(distanceString, forKey: "distanceString")
        }
	}

}
