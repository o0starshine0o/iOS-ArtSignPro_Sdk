//
//  ExpertSignDetailResult.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ExpertSignDetailResult: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignDetailResultPriceKey: String = "price"
	internal let kExpertSignDetailResultVideoIntroductionKey: String = "video_introduction"
	internal let kExpertSignDetailResultPreferentialKey: String = "preferential"
	internal let kExpertSignDetailResultVideoPriceKey: String = "video_price"
	internal let kExpertSignDetailResultSignImgUrlKey: String = "sign_img_url"
    internal let kExpertSignDetailResultDetailsDesignImg1Key: String = "details_design_img1"
    internal let kExpertSignDetailResultDelayTimeKey: String = "delay_time"
    internal let kExpertSignDetailResultDeadlineTimeKey: String = "deadline_time"
    internal let kExpertSignDetailResultDeadlineTimeStampKey: String = "deadline_time_stamp"
    internal let kExpertSignDetailResultDesignerPortraitKey: String = "designer_portrait"
    internal let kExpertSignDetailResultPortraitUrlKey: String = "portrait_url"
	internal let kExpertSignDetailResultDesignPriceKey: String = "design_price"
	internal let kExpertSignDetailResultDetailsDesignImg3Key: String = "details_design_img3"
	internal let kExpertSignDetailResultExpertSignIdKey: String = "expert_sign_id"
	internal let kExpertSignDetailResultDetailsDesignImg2Key: String = "details_design_img2"
    internal let kExpertSignDetailResultDetailsDesignImageKey: String = "details_design_image"
    internal let kExpertSignDetailResultVideoUrlKey: String = "video_url"
    internal let kExpertSignDetailResultImageUrlKey: String = "image_url"
	internal let kExpertSignDetailResultIosPriceKey: String = "ios_price"
	internal let kExpertSignDetailResultDesignerIntroduceKey: String = "designer_introduce"
	internal let kExpertSignDetailResultSignNameKey: String = "sign_name"
	internal let kExpertSignDetailResultDesignerNameKey: String = "designer_name"
    internal let kExpertSignDetailResultDesignerIdentityKey: String = "designer_identity"
    internal let kExpertSignDetailResultIsVideoKey: String = "is_video"
    internal let kExpertSignDetailResultRegularKey: String = "regular"


    // MARK: Properties
	var price: Int?
	var videoIntroduction: String?
	var preferential: Int?
	var videoPrice: Int?
	var signImgUrl: String?
    var detailsDesignImg1: String?
    var delayTime: Int?
    var deadlineTime: String?
    var deadlineTimeStamp: Int?
    var designerPortrait: String?
    var portraitUrl: String?
	var designPrice: Int?
	var detailsDesignImg3: String?
	var expertSignId: Int?
	var detailsDesignImg2: String?
    var detailsDesignImage: [ExpertSignDetailDetailsDesignImage]?
    var videoUrl: String?
    var imageUrl: String?
	var iosPrice: Int?
	var designerIntroduce: String?
	var signName: String?
	var designerName: String?
    var designerIdentity: String?
    var isVideo: Int?
    var regular: String?


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
		price = json[kExpertSignDetailResultPriceKey].int
		videoIntroduction = json[kExpertSignDetailResultVideoIntroductionKey].string
		preferential = json[kExpertSignDetailResultPreferentialKey].int
		videoPrice = json[kExpertSignDetailResultVideoPriceKey].int
		signImgUrl = json[kExpertSignDetailResultSignImgUrlKey].string
        detailsDesignImg1 = json[kExpertSignDetailResultDetailsDesignImg1Key].string
        delayTime = json[kExpertSignDetailResultDelayTimeKey].int
        deadlineTime = json[kExpertSignDetailResultDeadlineTimeKey].string
        deadlineTimeStamp = json[kExpertSignDetailResultDeadlineTimeStampKey].int
        designerPortrait = json[kExpertSignDetailResultDesignerPortraitKey].string
        portraitUrl = json[kExpertSignDetailResultPortraitUrlKey].string
		designPrice = json[kExpertSignDetailResultDesignPriceKey].int
		detailsDesignImg3 = json[kExpertSignDetailResultDetailsDesignImg3Key].string
		expertSignId = json[kExpertSignDetailResultExpertSignIdKey].int
		detailsDesignImg2 = json[kExpertSignDetailResultDetailsDesignImg2Key].string
		detailsDesignImage = []
		if let items = json[kExpertSignDetailResultDetailsDesignImageKey].array {
			for item in items {
				detailsDesignImage?.append(ExpertSignDetailDetailsDesignImage(json: item))
			}
		} else {
			detailsDesignImage = nil
        }
        videoUrl = json[kExpertSignDetailResultVideoUrlKey].string
        imageUrl = json[kExpertSignDetailResultImageUrlKey].string
		iosPrice = json[kExpertSignDetailResultIosPriceKey].int
		designerIntroduce = json[kExpertSignDetailResultDesignerIntroduceKey].string
		signName = json[kExpertSignDetailResultSignNameKey].string
		designerName = json[kExpertSignDetailResultDesignerNameKey].string
		designerIdentity = json[kExpertSignDetailResultDesignerIdentityKey].string
		isVideo = json[kExpertSignDetailResultIsVideoKey].int
        regular = json[kExpertSignDetailResultRegularKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if price != nil {
			dictionary.updateValue(price! as AnyObject, forKey: kExpertSignDetailResultPriceKey)
		}
		if videoIntroduction != nil {
			dictionary.updateValue(videoIntroduction! as AnyObject, forKey: kExpertSignDetailResultVideoIntroductionKey)
		}
		if preferential != nil {
			dictionary.updateValue(preferential! as AnyObject, forKey: kExpertSignDetailResultPreferentialKey)
		}
		if videoPrice != nil {
			dictionary.updateValue(videoPrice! as AnyObject, forKey: kExpertSignDetailResultVideoPriceKey)
		}
		if signImgUrl != nil {
			dictionary.updateValue(signImgUrl! as AnyObject, forKey: kExpertSignDetailResultSignImgUrlKey)
		}
		if detailsDesignImg1 != nil {
			dictionary.updateValue(detailsDesignImg1! as AnyObject, forKey: kExpertSignDetailResultDetailsDesignImg1Key)
        }
        if delayTime != nil {
            dictionary.updateValue(delayTime! as AnyObject, forKey: kExpertSignDetailResultDelayTimeKey)
        }
        if deadlineTime != nil {
            dictionary.updateValue(deadlineTime! as AnyObject, forKey: kExpertSignDetailResultDeadlineTimeKey)
        }
        if deadlineTimeStamp != nil {
            dictionary.updateValue(deadlineTimeStamp! as AnyObject, forKey: kExpertSignDetailResultDeadlineTimeStampKey)
        }
        if designerPortrait != nil {
            dictionary.updateValue(designerPortrait! as AnyObject, forKey: kExpertSignDetailResultDesignerPortraitKey)
        }
        if portraitUrl != nil {
            dictionary.updateValue(portraitUrl! as AnyObject, forKey: kExpertSignDetailResultPortraitUrlKey)
        }
		if designPrice != nil {
			dictionary.updateValue(designPrice! as AnyObject, forKey: kExpertSignDetailResultDesignPriceKey)
		}
		if detailsDesignImg3 != nil {
			dictionary.updateValue(detailsDesignImg3! as AnyObject, forKey: kExpertSignDetailResultDetailsDesignImg3Key)
		}
		if expertSignId != nil {
			dictionary.updateValue(expertSignId! as AnyObject, forKey: kExpertSignDetailResultExpertSignIdKey)
		}
		if detailsDesignImg2 != nil {
			dictionary.updateValue(detailsDesignImg2! as AnyObject, forKey: kExpertSignDetailResultDetailsDesignImg2Key)
		}
		if detailsDesignImage?.count > 0 {
			var temp: [AnyObject] = []
			for item in detailsDesignImage! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kExpertSignDetailResultDetailsDesignImageKey)
        }
        if videoUrl != nil {
            dictionary.updateValue(videoUrl! as AnyObject, forKey: kExpertSignDetailResultVideoUrlKey)
        }
        if imageUrl != nil {
            dictionary.updateValue(imageUrl! as AnyObject, forKey: kExpertSignDetailResultImageUrlKey)
        }
		if iosPrice != nil {
			dictionary.updateValue(iosPrice! as AnyObject, forKey: kExpertSignDetailResultIosPriceKey)
		}
		if designerIntroduce != nil {
			dictionary.updateValue(designerIntroduce! as AnyObject, forKey: kExpertSignDetailResultDesignerIntroduceKey)
		}
		if signName != nil {
			dictionary.updateValue(signName! as AnyObject, forKey: kExpertSignDetailResultSignNameKey)
		}
		if designerName != nil {
			dictionary.updateValue(designerName! as AnyObject, forKey: kExpertSignDetailResultDesignerNameKey)
		}
		if designerIdentity != nil {
			dictionary.updateValue(designerIdentity! as AnyObject, forKey: kExpertSignDetailResultDesignerIdentityKey)
        }
        if isVideo != nil {
            dictionary.updateValue(isVideo! as AnyObject, forKey: kExpertSignDetailResultIsVideoKey)
        }
        if regular != nil {
            dictionary.updateValue(regular! as AnyObject, forKey: kExpertSignDetailResultRegularKey)
        }

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.price = aDecoder.decodeObject(forKey: kExpertSignDetailResultPriceKey) as? Int
		self.videoIntroduction = aDecoder.decodeObject(forKey: kExpertSignDetailResultVideoIntroductionKey) as? String
		self.preferential = aDecoder.decodeObject(forKey: kExpertSignDetailResultPreferentialKey) as? Int
		self.videoPrice = aDecoder.decodeObject(forKey: kExpertSignDetailResultVideoPriceKey) as? Int
		self.signImgUrl = aDecoder.decodeObject(forKey: kExpertSignDetailResultSignImgUrlKey) as? String
        self.detailsDesignImg1 = aDecoder.decodeObject(forKey: kExpertSignDetailResultDetailsDesignImg1Key) as? String
        self.delayTime = aDecoder.decodeObject(forKey: kExpertSignDetailResultDelayTimeKey) as? Int
        self.deadlineTime = aDecoder.decodeObject(forKey: kExpertSignDetailResultDeadlineTimeKey) as? String
        self.deadlineTimeStamp = aDecoder.decodeObject(forKey: kExpertSignDetailResultDeadlineTimeStampKey) as? Int
        self.designerPortrait = aDecoder.decodeObject(forKey: kExpertSignDetailResultDesignerPortraitKey) as? String
        self.portraitUrl = aDecoder.decodeObject(forKey: kExpertSignDetailResultPortraitUrlKey) as? String
		self.designPrice = aDecoder.decodeObject(forKey: kExpertSignDetailResultDesignPriceKey) as? Int
		self.detailsDesignImg3 = aDecoder.decodeObject(forKey: kExpertSignDetailResultDetailsDesignImg3Key) as? String
		self.expertSignId = aDecoder.decodeObject(forKey: kExpertSignDetailResultExpertSignIdKey) as? Int
		self.detailsDesignImg2 = aDecoder.decodeObject(forKey: kExpertSignDetailResultDetailsDesignImg2Key) as? String
        self.detailsDesignImage = aDecoder.decodeObject(forKey: kExpertSignDetailResultDetailsDesignImageKey) as? [ExpertSignDetailDetailsDesignImage]
        self.videoUrl = aDecoder.decodeObject(forKey: kExpertSignDetailResultVideoUrlKey) as? String
        self.imageUrl = aDecoder.decodeObject(forKey: kExpertSignDetailResultImageUrlKey) as? String
		self.iosPrice = aDecoder.decodeObject(forKey: kExpertSignDetailResultIosPriceKey) as? Int
		self.designerIntroduce = aDecoder.decodeObject(forKey: kExpertSignDetailResultDesignerIntroduceKey) as? String
		self.signName = aDecoder.decodeObject(forKey: kExpertSignDetailResultSignNameKey) as? String
		self.designerName = aDecoder.decodeObject(forKey: kExpertSignDetailResultDesignerNameKey) as? String
        self.designerIdentity = aDecoder.decodeObject(forKey: kExpertSignDetailResultDesignerIdentityKey) as? String
        self.isVideo = aDecoder.decodeObject(forKey: kExpertSignDetailResultIsVideoKey) as? Int
        self.regular = aDecoder.decodeObject(forKey: kExpertSignDetailResultRegularKey) as? String

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(price, forKey: kExpertSignDetailResultPriceKey)
		aCoder.encode(videoIntroduction, forKey: kExpertSignDetailResultVideoIntroductionKey)
		aCoder.encode(preferential, forKey: kExpertSignDetailResultPreferentialKey)
		aCoder.encode(videoPrice, forKey: kExpertSignDetailResultVideoPriceKey)
		aCoder.encode(signImgUrl, forKey: kExpertSignDetailResultSignImgUrlKey)
        aCoder.encode(detailsDesignImg1, forKey: kExpertSignDetailResultDetailsDesignImg1Key)
        aCoder.encode(delayTime, forKey: kExpertSignDetailResultDelayTimeKey)
        aCoder.encode(deadlineTime, forKey: kExpertSignDetailResultDeadlineTimeKey)
        aCoder.encode(deadlineTimeStamp, forKey: kExpertSignDetailResultDeadlineTimeStampKey)
        aCoder.encode(designerPortrait, forKey: kExpertSignDetailResultDesignerPortraitKey)
        aCoder.encode(portraitUrl, forKey: kExpertSignDetailResultPortraitUrlKey)
		aCoder.encode(designPrice, forKey: kExpertSignDetailResultDesignPriceKey)
		aCoder.encode(detailsDesignImg3, forKey: kExpertSignDetailResultDetailsDesignImg3Key)
		aCoder.encode(expertSignId, forKey: kExpertSignDetailResultExpertSignIdKey)
		aCoder.encode(detailsDesignImg2, forKey: kExpertSignDetailResultDetailsDesignImg2Key)
        aCoder.encode(detailsDesignImage, forKey: kExpertSignDetailResultDetailsDesignImageKey)
        aCoder.encode(videoUrl, forKey: kExpertSignDetailResultVideoUrlKey)
        aCoder.encode(imageUrl, forKey: kExpertSignDetailResultImageUrlKey)
		aCoder.encode(iosPrice, forKey: kExpertSignDetailResultIosPriceKey)
		aCoder.encode(designerIntroduce, forKey: kExpertSignDetailResultDesignerIntroduceKey)
		aCoder.encode(signName, forKey: kExpertSignDetailResultSignNameKey)
		aCoder.encode(designerName, forKey: kExpertSignDetailResultDesignerNameKey)
        aCoder.encode(designerIdentity, forKey: kExpertSignDetailResultDesignerIdentityKey)
        aCoder.encode(isVideo, forKey: kExpertSignDetailResultIsVideoKey)
        aCoder.encode(regular, forKey: kExpertSignDetailResultRegularKey)

    }

}
