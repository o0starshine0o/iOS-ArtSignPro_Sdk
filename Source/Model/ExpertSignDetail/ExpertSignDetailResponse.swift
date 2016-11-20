//
//  ExpertSignDetailResponse.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExpertSignDetailResponse: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignDetailResponseStatusKey: String = "status"
	internal let kExpertSignDetailResponseResultKey: String = "result"


    // MARK: Properties
	var status: Status?
	var result: ExpertSignDetailResult?


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
		status = Status(json: json[kExpertSignDetailResponseStatusKey])
		result = ExpertSignDetailResult(json: json[kExpertSignDetailResponseResultKey])

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status!.dictionaryRepresentation() as AnyObject, forKey: kExpertSignDetailResponseStatusKey)
		}
		if result != nil {
			dictionary.updateValue(result!.dictionaryRepresentation() as AnyObject, forKey: kExpertSignDetailResponseResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.status = aDecoder.decodeObject(forKey: kExpertSignDetailResponseStatusKey) as? Status
		self.result = aDecoder.decodeObject(forKey: kExpertSignDetailResponseResultKey) as? ExpertSignDetailResult

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(status, forKey: kExpertSignDetailResponseStatusKey)
		aCoder.encode(result, forKey: kExpertSignDetailResponseResultKey)

    }

}
