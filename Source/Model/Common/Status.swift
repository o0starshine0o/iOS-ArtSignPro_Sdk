//
//  PayMethodStatus.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

open class Status: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kPayMethodStatusCodeKey: String = "code"
	internal let kPayMethodStatusExtraKey: String = "extra"
	internal let kPayMethodStatusDescriptionValueKey: String = "description"


    // MARK: Properties
	open var code: String?
	open var extra: String?
	open var descriptionValue: String?


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
		code = json[kPayMethodStatusCodeKey].string
		extra = json[kPayMethodStatusExtraKey].string
		descriptionValue = json[kPayMethodStatusDescriptionValueKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    open func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if code != nil {
			dictionary.updateValue(code! as AnyObject, forKey: kPayMethodStatusCodeKey)
		}
		if extra != nil {
			dictionary.updateValue(extra! as AnyObject, forKey: kPayMethodStatusExtraKey)
		}
		if descriptionValue != nil {
			dictionary.updateValue(descriptionValue! as AnyObject, forKey: kPayMethodStatusDescriptionValueKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.code = aDecoder.decodeObject(forKey: kPayMethodStatusCodeKey) as? String
		self.extra = aDecoder.decodeObject(forKey: kPayMethodStatusExtraKey) as? String
		self.descriptionValue = aDecoder.decodeObject(forKey: kPayMethodStatusDescriptionValueKey) as? String

    }

    open func encode(with aCoder: NSCoder) {
		aCoder.encode(code, forKey: kPayMethodStatusCodeKey)
		aCoder.encode(extra, forKey: kPayMethodStatusExtraKey)
		aCoder.encode(descriptionValue, forKey: kPayMethodStatusDescriptionValueKey)

    }

}
