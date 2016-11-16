//
//  PayMethodResponse.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

open class PayMethodResponse: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kPayMethodResponseStatusKey: String = "status"
	internal let kPayMethodResponseResultKey: String = "result"


    // MARK: Properties
	open var status: PayMethodStatus?
	open var result: [PayMethodResult]?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		status = PayMethodStatus(json: json[kPayMethodResponseStatusKey])
		result = []
		if let items = json[kPayMethodResponseResultKey].array {
			for item in items {
				result?.append(PayMethodResult(json: item))
			}
		} else {
			result = nil
		}

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    open func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!.dictionaryRepresentation() as AnyObject, forKey: kPayMethodResponseStatusKey)
		}
		if (result?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in result! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kPayMethodResponseResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObject(forKey: kPayMethodResponseStatusKey) as? PayMethodStatus
		self.result = aDecoder.decodeObject(forKey: kPayMethodResponseResultKey) as? [PayMethodResult]

    }

    open func encode(with aCoder: NSCoder) {
		aCoder.encode(status, forKey: kPayMethodResponseStatusKey)
		aCoder.encode(result, forKey: kPayMethodResponseResultKey)

    }

}
