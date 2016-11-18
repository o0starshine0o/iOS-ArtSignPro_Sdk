//
//  PayMethodResponse.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

open class Response: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kResponseStatusKey: String = "status"
	internal let kResponseResultKey: String = "result"


    // MARK: Properties
	open var status: Status?
	open var result: Any?


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
        status = Status(json: json[kResponseStatusKey])
        result = json[kResponseResultKey].object
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    open func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
        if status != nil {
            dictionary.updateValue(status!.dictionaryRepresentation() as AnyObject, forKey: kResponseStatusKey)
        }
        if result != nil {
            dictionary.updateValue(result as AnyObject, forKey: kResponseResultKey)
        }
        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObject(forKey: kResponseStatusKey) as? Status
		self.result = aDecoder.decodeObject(forKey: kResponseResultKey)

    }

    open func encode(with aCoder: NSCoder) {
		aCoder.encode(status, forKey: kResponseStatusKey)
		aCoder.encode(result, forKey: kResponseResultKey)

    }

}
