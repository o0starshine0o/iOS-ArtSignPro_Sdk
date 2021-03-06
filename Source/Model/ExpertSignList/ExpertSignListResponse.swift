//
//  ExpertSignListResponse.swift
//
//  Created by AbelHu on 16/5/6
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExpertSignListResponse: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignListResponseStatusKey: String = "status"
	internal let kExpertSignListResponseResultKey: String = "result"


    // MARK: Properties
	var status: Status?
	var result: ExpertSignListResult?


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
		status = Status(json: json[kExpertSignListResponseStatusKey])
		result = ExpertSignListResult(json: json[kExpertSignListResponseResultKey])

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!.dictionaryRepresentation() as AnyObject, forKey: kExpertSignListResponseStatusKey)
		}
		if result != nil {
			dictionary.updateValue(result!.dictionaryRepresentation() as AnyObject, forKey: kExpertSignListResponseResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObject(forKey: kExpertSignListResponseStatusKey) as? Status
		self.result = aDecoder.decodeObject(forKey: kExpertSignListResponseResultKey) as? ExpertSignListResult

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(status, forKey: kExpertSignListResponseStatusKey)
		aCoder.encode(result, forKey: kExpertSignListResponseResultKey)

    }

}
