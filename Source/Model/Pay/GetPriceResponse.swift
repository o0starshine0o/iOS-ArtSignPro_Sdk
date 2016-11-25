//
//  GetPriceResponse.swift
//
//  Created by AbelHu on 2016/11/23
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetPriceResponse: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kGetPriceResponseStatusKey: String = "status"
	internal let kGetPriceResponseResultKey: String = "result"


    // MARK: Properties
	var status: Status?
	var result: GetPriceResult?


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
		status = Status(json: json[kGetPriceResponseStatusKey])
		result = GetPriceResult(json: json[kGetPriceResponseResultKey])

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!.dictionaryRepresentation() as AnyObject, forKey: kGetPriceResponseStatusKey)
		}
		if result != nil {
			dictionary.updateValue(result!.dictionaryRepresentation() as AnyObject, forKey: kGetPriceResponseResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObject(forKey: kGetPriceResponseStatusKey) as? Status
		self.result = aDecoder.decodeObject(forKey: kGetPriceResponseResultKey) as? GetPriceResult

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(status, forKey: kGetPriceResponseStatusKey)
		aCoder.encode(result, forKey: kGetPriceResponseResultKey)
    }

}
