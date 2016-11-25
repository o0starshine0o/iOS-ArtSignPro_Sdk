//
//  GetPriceResult.swift
//
//  Created by AbelHu on 2016/11/23
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetPriceResult: NSObject, NSCoding {


    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kGetPriceResultPriceKey: String = "price"


    // MARK: Properties
	var price: Float?


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
		price = json[kGetPriceResultPriceKey].float

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if price != nil {
			dictionary.updateValue(price! as AnyObject, forKey: kGetPriceResultPriceKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.price = aDecoder.decodeObject(forKey: kGetPriceResultPriceKey) as? Float

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(price, forKey: kGetPriceResultPriceKey)
    }

}
