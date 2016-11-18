//
//  PayMethodResponse.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

open class PayResponse: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kPayResponseStatusKey: String = "status"
	internal let kPayResponseResultKey: String = "result"


    // MARK: Properties
	open var status: Status?
	open var result: PayResult?


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
        status = Status(json: json[kPayResponseStatusKey])
        result = PayResult(json: json[kPayResponseResultKey])
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    open func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
        if status != nil {
            dictionary.updateValue(status!.dictionaryRepresentation() as AnyObject, forKey: kPayResponseStatusKey)
        }
        if result != nil {
            dictionary.updateValue(result!.dictionaryRepresentation() as AnyObject, forKey: kPayResponseResultKey)
        }
        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObject(forKey: kPayResponseStatusKey) as? Status
		self.result = aDecoder.decodeObject(forKey: kPayResponseResultKey) as? PayResult

    }

    open func encode(with aCoder: NSCoder) {
		aCoder.encode(status, forKey: kPayResponseStatusKey)
		aCoder.encode(result, forKey: kPayResponseResultKey)

    }

}
