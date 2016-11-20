//
//  PayMethodResult.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class PayMethodResult: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kPayMethodResultSymbolKey: String = "symbol"
	internal let kPayMethodResultWeightKey: String = "weight"
	internal let kPayMethodResultBuffKey: String = "buff"
	internal let kPayMethodResultInternalIdentifierKey: String = "id"
	internal let kPayMethodResultStatusKey: String = "status"
	internal let kPayMethodResultNameKey: String = "name"


    // MARK: Properties
	var symbol: String?
	var weight: Int?
	var buff: Float?
	var internalIdentifier: Int?
	var status: Int?
	var name: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    init(json: JSON) {
		symbol = json[kPayMethodResultSymbolKey].string
		weight = json[kPayMethodResultWeightKey].int
		buff = json[kPayMethodResultBuffKey].float
		internalIdentifier = json[kPayMethodResultInternalIdentifierKey].int
		status = json[kPayMethodResultStatusKey].int
		name = json[kPayMethodResultNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if symbol != nil {
			dictionary.updateValue(symbol! as AnyObject, forKey: kPayMethodResultSymbolKey)
		}
		if weight != nil {
			dictionary.updateValue(weight! as AnyObject, forKey: kPayMethodResultWeightKey)
		}
		if buff != nil {
			dictionary.updateValue(buff! as AnyObject, forKey: kPayMethodResultBuffKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kPayMethodResultInternalIdentifierKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kPayMethodResultStatusKey)
		}
		if name != nil {
			dictionary.updateValue(name! as AnyObject, forKey: kPayMethodResultNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.symbol = aDecoder.decodeObject(forKey: kPayMethodResultSymbolKey) as? String
		self.weight = aDecoder.decodeObject(forKey: kPayMethodResultWeightKey) as? Int
		self.buff = aDecoder.decodeObject(forKey: kPayMethodResultBuffKey) as? Float
		self.internalIdentifier = aDecoder.decodeObject(forKey: kPayMethodResultInternalIdentifierKey) as? Int
		self.status = aDecoder.decodeObject(forKey: kPayMethodResultStatusKey) as? Int
		self.name = aDecoder.decodeObject(forKey: kPayMethodResultNameKey) as? String

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(symbol, forKey: kPayMethodResultSymbolKey)
		aCoder.encode(weight, forKey: kPayMethodResultWeightKey)
		aCoder.encode(buff, forKey: kPayMethodResultBuffKey)
		aCoder.encode(internalIdentifier, forKey: kPayMethodResultInternalIdentifierKey)
		aCoder.encode(status, forKey: kPayMethodResultStatusKey)
		aCoder.encode(name, forKey: kPayMethodResultNameKey)

    }

}
