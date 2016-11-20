//
//  ExpertSignListExpertSigns.swift
//
//  Created by AbelHu on 16/5/6
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExpertSignListExpertSigns: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignListExpertSignsSignDesignerDesignerNameKey: String = "sign_designer__designer_name"
	internal let kExpertSignListExpertSignsPriceKey: String = "price"
	internal let kExpertSignListExpertSignsVideoIntroductionKey: String = "video_introduction"
	internal let kExpertSignListExpertSignsPreferentialKey: String = "preferential"
	internal let kExpertSignListExpertSignsVideoPriceKey: String = "video_price"
	internal let kExpertSignListExpertSignsSignImgUrlKey: String = "sign_img_url"
	internal let kExpertSignListExpertSignsSignDesignerKey: String = "sign_designer"
	internal let kExpertSignListExpertSignsDetailsDesignImg1Key: String = "details_design_img1"
	internal let kExpertSignListExpertSignsRegularKey: String = "regular"
	internal let kExpertSignListExpertSignsDelayTimeKey: String = "delay_time"
	internal let kExpertSignListExpertSignsDesignPriceKey: String = "design_price"
	internal let kExpertSignListExpertSignsIsDesignKey: String = "is_design"
	internal let kExpertSignListExpertSignsDetailsDesignImg3Key: String = "details_design_img3"
	internal let kExpertSignListExpertSignsIosProductPayIdKey: String = "ios_product_pay_id"
	internal let kExpertSignListExpertSignsExpertSignIdKey: String = "expert_sign_id"
	internal let kExpertSignListExpertSignsDetailsDesignImg2Key: String = "details_design_img2"
	internal let kExpertSignListExpertSignsVideoUrlKey: String = "video_url"
	internal let kExpertSignListExpertSignsIosPriceKey: String = "ios_price"
	internal let kExpertSignListExpertSignsSignNameKey: String = "sign_name"
	internal let kExpertSignListExpertSignsImageUrlKey: String = "image_url"
	internal let kExpertSignListExpertSignsIsVideoKey: String = "is_video"
	internal let kExpertSignListExpertSignsStateKey: String = "state"


    // MARK: Properties
	var signDesignerDesignerName: String?
	var price: Int?
    var videoIntroduction: String?
	var preferential: Int?
	var videoPrice: Int?
	var signImgUrl: String?
	var signDesigner: Int?
	var detailsDesignImg1: String?
	var regular: String?
	var delayTime: Int?
	var designPrice: Int?
	var isDesign: Int?
	var detailsDesignImg3: String?
	var iosProductPayId: String?
	var expertSignId: Int?
	var detailsDesignImg2: String?
	var videoUrl: String?
	var iosPrice: Int?
	var signName: String?
	var imageUrl: String?
	var isVideo: Int?
	var state: Int?


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
		signDesignerDesignerName = json[kExpertSignListExpertSignsSignDesignerDesignerNameKey].string
		price = json[kExpertSignListExpertSignsPriceKey].int
		videoIntroduction = json[kExpertSignListExpertSignsVideoIntroductionKey].string
		preferential = json[kExpertSignListExpertSignsPreferentialKey].int
		videoPrice = json[kExpertSignListExpertSignsVideoPriceKey].int
		signImgUrl = json[kExpertSignListExpertSignsSignImgUrlKey].string
		signDesigner = json[kExpertSignListExpertSignsSignDesignerKey].int
		detailsDesignImg1 = json[kExpertSignListExpertSignsDetailsDesignImg1Key].string
		regular = json[kExpertSignListExpertSignsRegularKey].string
		delayTime = json[kExpertSignListExpertSignsDelayTimeKey].int
		designPrice = json[kExpertSignListExpertSignsDesignPriceKey].int
		isDesign = json[kExpertSignListExpertSignsIsDesignKey].int
		detailsDesignImg3 = json[kExpertSignListExpertSignsDetailsDesignImg3Key].string
		iosProductPayId = json[kExpertSignListExpertSignsIosProductPayIdKey].string
		expertSignId = json[kExpertSignListExpertSignsExpertSignIdKey].int
		detailsDesignImg2 = json[kExpertSignListExpertSignsDetailsDesignImg2Key].string
		videoUrl = json[kExpertSignListExpertSignsVideoUrlKey].string
		iosPrice = json[kExpertSignListExpertSignsIosPriceKey].int
		signName = json[kExpertSignListExpertSignsSignNameKey].string
		imageUrl = json[kExpertSignListExpertSignsImageUrlKey].string
		isVideo = json[kExpertSignListExpertSignsIsVideoKey].int
		state = json[kExpertSignListExpertSignsStateKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if signDesignerDesignerName != nil {
			dictionary.updateValue(signDesignerDesignerName! as AnyObject, forKey: kExpertSignListExpertSignsSignDesignerDesignerNameKey)
		}
		if price != nil {
			dictionary.updateValue(price! as AnyObject, forKey: kExpertSignListExpertSignsPriceKey)
		}
		if videoIntroduction != nil {
			dictionary.updateValue(videoIntroduction! as AnyObject, forKey: kExpertSignListExpertSignsVideoIntroductionKey)
		}
		if preferential != nil {
			dictionary.updateValue(preferential! as AnyObject, forKey: kExpertSignListExpertSignsPreferentialKey)
		}
		if videoPrice != nil {
			dictionary.updateValue(videoPrice! as AnyObject, forKey: kExpertSignListExpertSignsVideoPriceKey)
		}
		if signImgUrl != nil {
			dictionary.updateValue(signImgUrl! as AnyObject, forKey: kExpertSignListExpertSignsSignImgUrlKey)
		}
		if signDesigner != nil {
			dictionary.updateValue(signDesigner! as AnyObject, forKey: kExpertSignListExpertSignsSignDesignerKey)
		}
		if detailsDesignImg1 != nil {
			dictionary.updateValue(detailsDesignImg1! as AnyObject, forKey: kExpertSignListExpertSignsDetailsDesignImg1Key)
		}
		if regular != nil {
			dictionary.updateValue(regular! as AnyObject, forKey: kExpertSignListExpertSignsRegularKey)
		}
		if delayTime != nil {
			dictionary.updateValue(delayTime! as AnyObject, forKey: kExpertSignListExpertSignsDelayTimeKey)
		}
		if designPrice != nil {
			dictionary.updateValue(designPrice! as AnyObject, forKey: kExpertSignListExpertSignsDesignPriceKey)
		}
		if isDesign != nil {
			dictionary.updateValue(isDesign! as AnyObject, forKey: kExpertSignListExpertSignsIsDesignKey)
		}
		if detailsDesignImg3 != nil {
			dictionary.updateValue(detailsDesignImg3! as AnyObject, forKey: kExpertSignListExpertSignsDetailsDesignImg3Key)
		}
		if iosProductPayId != nil {
			dictionary.updateValue(iosProductPayId! as AnyObject, forKey: kExpertSignListExpertSignsIosProductPayIdKey)
		}
		if expertSignId != nil {
			dictionary.updateValue(expertSignId! as AnyObject, forKey: kExpertSignListExpertSignsExpertSignIdKey)
		}
		if detailsDesignImg2 != nil {
			dictionary.updateValue(detailsDesignImg2! as AnyObject, forKey: kExpertSignListExpertSignsDetailsDesignImg2Key)
		}
		if videoUrl != nil {
			dictionary.updateValue(videoUrl! as AnyObject, forKey: kExpertSignListExpertSignsVideoUrlKey)
		}
		if iosPrice != nil {
			dictionary.updateValue(iosPrice! as AnyObject, forKey: kExpertSignListExpertSignsIosPriceKey)
		}
		if signName != nil {
			dictionary.updateValue(signName! as AnyObject, forKey: kExpertSignListExpertSignsSignNameKey)
		}
		if imageUrl != nil {
			dictionary.updateValue(imageUrl! as AnyObject, forKey: kExpertSignListExpertSignsImageUrlKey)
		}
		if isVideo != nil {
			dictionary.updateValue(isVideo! as AnyObject, forKey: kExpertSignListExpertSignsIsVideoKey)
		}
		if state != nil {
			dictionary.updateValue(state! as AnyObject, forKey: kExpertSignListExpertSignsStateKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.signDesignerDesignerName = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsSignDesignerDesignerNameKey) as? String
		self.price = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsPriceKey) as? Int
		self.videoIntroduction = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsVideoIntroductionKey) as? String
		self.preferential = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsPreferentialKey) as? Int
		self.videoPrice = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsVideoPriceKey) as? Int
		self.signImgUrl = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsSignImgUrlKey) as? String
		self.signDesigner = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsSignDesignerKey) as? Int
		self.detailsDesignImg1 = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsDetailsDesignImg1Key) as? String
		self.regular = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsRegularKey) as? String
		self.delayTime = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsDelayTimeKey) as? Int
		self.designPrice = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsDesignPriceKey) as? Int
		self.isDesign = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsIsDesignKey) as? Int
		self.detailsDesignImg3 = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsDetailsDesignImg3Key) as? String
		self.iosProductPayId = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsIosProductPayIdKey) as? String
		self.expertSignId = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsExpertSignIdKey) as? Int
		self.detailsDesignImg2 = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsDetailsDesignImg2Key) as? String
		self.videoUrl = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsVideoUrlKey) as? String
		self.iosPrice = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsIosPriceKey) as? Int
		self.signName = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsSignNameKey) as? String
		self.imageUrl = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsImageUrlKey) as? String
		self.isVideo = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsIsVideoKey) as? Int
		self.state = aDecoder.decodeObject(forKey: kExpertSignListExpertSignsStateKey) as? Int

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(signDesignerDesignerName, forKey: kExpertSignListExpertSignsSignDesignerDesignerNameKey)
		aCoder.encode(price, forKey: kExpertSignListExpertSignsPriceKey)
		aCoder.encode(videoIntroduction, forKey: kExpertSignListExpertSignsVideoIntroductionKey)
		aCoder.encode(preferential, forKey: kExpertSignListExpertSignsPreferentialKey)
		aCoder.encode(videoPrice, forKey: kExpertSignListExpertSignsVideoPriceKey)
		aCoder.encode(signImgUrl, forKey: kExpertSignListExpertSignsSignImgUrlKey)
		aCoder.encode(signDesigner, forKey: kExpertSignListExpertSignsSignDesignerKey)
		aCoder.encode(detailsDesignImg1, forKey: kExpertSignListExpertSignsDetailsDesignImg1Key)
		aCoder.encode(regular, forKey: kExpertSignListExpertSignsRegularKey)
		aCoder.encode(delayTime, forKey: kExpertSignListExpertSignsDelayTimeKey)
		aCoder.encode(designPrice, forKey: kExpertSignListExpertSignsDesignPriceKey)
		aCoder.encode(isDesign, forKey: kExpertSignListExpertSignsIsDesignKey)
		aCoder.encode(detailsDesignImg3, forKey: kExpertSignListExpertSignsDetailsDesignImg3Key)
		aCoder.encode(iosProductPayId, forKey: kExpertSignListExpertSignsIosProductPayIdKey)
		aCoder.encode(expertSignId, forKey: kExpertSignListExpertSignsExpertSignIdKey)
		aCoder.encode(detailsDesignImg2, forKey: kExpertSignListExpertSignsDetailsDesignImg2Key)
		aCoder.encode(videoUrl, forKey: kExpertSignListExpertSignsVideoUrlKey)
		aCoder.encode(iosPrice, forKey: kExpertSignListExpertSignsIosPriceKey)
		aCoder.encode(signName, forKey: kExpertSignListExpertSignsSignNameKey)
		aCoder.encode(imageUrl, forKey: kExpertSignListExpertSignsImageUrlKey)
		aCoder.encode(isVideo, forKey: kExpertSignListExpertSignsIsVideoKey)
		aCoder.encode(state, forKey: kExpertSignListExpertSignsStateKey)

    }

}
