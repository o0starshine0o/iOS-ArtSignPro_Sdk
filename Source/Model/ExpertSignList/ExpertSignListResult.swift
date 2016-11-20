//
//  ExpertSignListResult.swift
//
//  Created by AbelHu on 16/5/6
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExpertSignListResult: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignListResultTotalKey: String = "total"
	internal let kExpertSignListResultUserSignsKey: String = "user_signs"
	internal let kExpertSignListResultExpertSignsKey: String = "expert_signs"


    // MARK: Properties
	var total: Int?
	var userSigns: [ExpertSignListUserSigns]?
	var expertSigns: [ExpertSignListExpertSigns]?


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
		total = json[kExpertSignListResultTotalKey].int
		userSigns = []
		if let items = json[kExpertSignListResultUserSignsKey].array {
			for item in items {
				userSigns?.append(ExpertSignListUserSigns(json: item))
			}
		} else {
			userSigns = nil
		}
		expertSigns = []
		if let items = json[kExpertSignListResultExpertSignsKey].array {
			for item in items {
				expertSigns?.append(ExpertSignListExpertSigns(json: item))
			}
		} else {
			expertSigns = nil
		}

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if total != nil {
			dictionary.updateValue(total! as AnyObject, forKey: kExpertSignListResultTotalKey)
		}
		if (userSigns?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in userSigns! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kExpertSignListResultUserSignsKey)
		}
		if (expertSigns?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in expertSigns! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kExpertSignListResultExpertSignsKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.total = aDecoder.decodeObject(forKey: kExpertSignListResultTotalKey) as? Int
		self.userSigns = aDecoder.decodeObject(forKey: kExpertSignListResultUserSignsKey) as? [ExpertSignListUserSigns]
		self.expertSigns = aDecoder.decodeObject(forKey: kExpertSignListResultExpertSignsKey) as? [ExpertSignListExpertSigns]

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(total, forKey: kExpertSignListResultTotalKey)
		aCoder.encode(userSigns, forKey: kExpertSignListResultUserSignsKey)
		aCoder.encode(expertSigns, forKey: kExpertSignListResultExpertSignsKey)

    }

}
