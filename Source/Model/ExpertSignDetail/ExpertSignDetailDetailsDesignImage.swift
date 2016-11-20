//
//  ExpertSignDetailDetailsDesignImage.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExpertSignDetailDetailsDesignImage: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignDetailDetailsDesignImageHeightKey: String = "height"
	internal let kExpertSignDetailDetailsDesignImageSortKey: String = "sort"
    internal let kExpertSignDetailDetailsDesignImageWidthKey: String = "width"
    internal let kExpertSignDetailDetailsDesignImageImageUrlKey: String = "image_url"
    internal let kExpertSignDetailDetailsDesignImageUrlKey: String = "url"
	internal let kExpertSignDetailDetailsDesignImageInternalIdentifierKey: String = "id"
	internal let kExpertSignDetailDetailsDesignImageExpertSignKey: String = "expert_sign"


    // MARK: Properties
	var height: Int?
	var sort: Int?
    var width: Int?
    var imageUrl: String?
    var url: String?
	var internalIdentifier: Int?
	var expertSign: Int?


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
		height = json[kExpertSignDetailDetailsDesignImageHeightKey].int
		sort = json[kExpertSignDetailDetailsDesignImageSortKey].int
        width = json[kExpertSignDetailDetailsDesignImageWidthKey].int
        imageUrl = json[kExpertSignDetailDetailsDesignImageImageUrlKey].string
        url = json[kExpertSignDetailDetailsDesignImageUrlKey].string
		internalIdentifier = json[kExpertSignDetailDetailsDesignImageInternalIdentifierKey].int
		expertSign = json[kExpertSignDetailDetailsDesignImageExpertSignKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if height != nil {
			dictionary.updateValue(height! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageHeightKey)
		}
		if sort != nil {
			dictionary.updateValue(sort! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageSortKey)
		}
		if width != nil {
			dictionary.updateValue(width! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageWidthKey)
        }
        if imageUrl != nil {
            dictionary.updateValue(imageUrl! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageImageUrlKey)
        }
        if url != nil {
            dictionary.updateValue(url! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageUrlKey)
        }
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageInternalIdentifierKey)
		}
		if expertSign != nil {
			dictionary.updateValue(expertSign! as AnyObject, forKey: kExpertSignDetailDetailsDesignImageExpertSignKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.height = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageHeightKey) as? Int
		self.sort = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageSortKey) as? Int
        self.width = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageWidthKey) as? Int
        self.imageUrl = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageImageUrlKey) as? String
        self.url = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageUrlKey) as? String
		self.internalIdentifier = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageInternalIdentifierKey) as? Int
		self.expertSign = aDecoder.decodeObject(forKey: kExpertSignDetailDetailsDesignImageExpertSignKey) as? Int

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(height, forKey: kExpertSignDetailDetailsDesignImageHeightKey)
		aCoder.encode(sort, forKey: kExpertSignDetailDetailsDesignImageSortKey)
        aCoder.encode(width, forKey: kExpertSignDetailDetailsDesignImageWidthKey)
        aCoder.encode(imageUrl, forKey: kExpertSignDetailDetailsDesignImageImageUrlKey)
        aCoder.encode(url, forKey: kExpertSignDetailDetailsDesignImageUrlKey)
		aCoder.encode(internalIdentifier, forKey: kExpertSignDetailDetailsDesignImageInternalIdentifierKey)
		aCoder.encode(expertSign, forKey: kExpertSignDetailDetailsDesignImageExpertSignKey)

    }

}
