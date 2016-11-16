//
//  ExpertSignListStatus.swift
//
//  Created by AbelHu on 16/5/6
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

open class ExpertSignListStatus: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignListStatusCodeKey: String = "code"
	internal let kExpertSignListStatusExtraKey: String = "extra"
	internal let kExpertSignListStatusDescriptionValueKey: String = "description"


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
		code = json[kExpertSignListStatusCodeKey].string
		extra = json[kExpertSignListStatusExtraKey].string
		descriptionValue = json[kExpertSignListStatusDescriptionValueKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    open func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if code != nil {
			dictionary.updateValue(code! as AnyObject, forKey: kExpertSignListStatusCodeKey)
		}
		if extra != nil {
			dictionary.updateValue(extra! as AnyObject, forKey: kExpertSignListStatusExtraKey)
		}
		if descriptionValue != nil {
			dictionary.updateValue(descriptionValue! as AnyObject, forKey: kExpertSignListStatusDescriptionValueKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.code = aDecoder.decodeObject(forKey: kExpertSignListStatusCodeKey) as? String
		self.extra = aDecoder.decodeObject(forKey: kExpertSignListStatusExtraKey) as? String
		self.descriptionValue = aDecoder.decodeObject(forKey: kExpertSignListStatusDescriptionValueKey) as? String

    }

    open func encode(with aCoder: NSCoder) {
		aCoder.encode(code, forKey: kExpertSignListStatusCodeKey)
		aCoder.encode(extra, forKey: kExpertSignListStatusExtraKey)
		aCoder.encode(descriptionValue, forKey: kExpertSignListStatusDescriptionValueKey)

    }

}
