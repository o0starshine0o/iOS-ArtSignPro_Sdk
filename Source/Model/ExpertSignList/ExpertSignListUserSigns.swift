//
//  ExpertSignListUserSigns.swift
//
//  Created by AbelHu on 16/5/6
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExpertSignListUserSigns: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kExpertSignListUserSignsExpertSignSignNameKey: String = "expert_sign__sign_name"
	internal let kExpertSignListUserSignsAdditionVideoStatusKey: String = "addition_video_status"
    internal let kExpertSignListUserSignsIsAdditionVideoKey: String = "is_addition_video"
    internal let kExpertSignListUserSignsCreateTimeKey: String = "create_time"
    internal let kExpertSignListUserSignsCreateTimeStampKey: String = "create_time_stamp"
    internal let kExpertSignListUserSignsDeadlineTimeKey: String = "deadline_time"
    internal let kExpertSignListUserSignsDeadlineTimeStampKey: String = "deadline_time_stamp"
	internal let kExpertSignListUserSignsSignTypeKey: String = "sign_type"
	internal let kExpertSignListUserSignsSignStatusKey: String = "sign_status"
	internal let kExpertSignListUserSignsUserSignIdKey: String = "user_sign_id"
	internal let kExpertSignListUserSignsAdditionContentKey: String = "addition_content"
	internal let kExpertSignListUserSignsAdditionVideoContentKey: String = "addition_video_content"
	internal let kExpertSignListUserSignsSignVideoKey: String = "sign_video"
	internal let kExpertSignListUserSignsSignUserNameKey: String = "sign_user_name"
	internal let kExpertSignListUserSignsVideoUrlKey: String = "video_url"
	internal let kExpertSignListUserSignsExpertSignKey: String = "expert_sign"
	internal let kExpertSignListUserSignsSignSourceKey: String = "sign_source"
	internal let kExpertSignListUserSignsUpdateTimeKey: String = "update_time"
	internal let kExpertSignListUserSignsSignImageKey: String = "sign_image"
	internal let kExpertSignListUserSignsUserKey: String = "user"
	internal let kExpertSignListUserSignsImageUrlKey: String = "image_url"
	internal let kExpertSignListUserSignsStateKey: String = "state"


    // MARK: Properties
	var expertSignSignName: String?
	var additionVideoStatus: Int?
    var isAdditionVideo: Int?
    var createTime: String?
    var deadlineTime: String?
    var createTimeStamp: Int?
    var deadlineTimeStamp: Int?
	var signType: Int?
	var signStatus: Int?
	var userSignId: Int?
	var additionContent: String?
	var additionVideoContent: String?
	var signVideo: String?
	var signUserName: String?
	var videoUrl: String?
	var expertSign: Int?
	var signSource: String?
	var updateTime: String?
	var signImage: String?
	var user: Int?
	var imageUrl: String?
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
		expertSignSignName = json[kExpertSignListUserSignsExpertSignSignNameKey].string
		additionVideoStatus = json[kExpertSignListUserSignsAdditionVideoStatusKey].int
        isAdditionVideo = json[kExpertSignListUserSignsIsAdditionVideoKey].int
        createTime = json[kExpertSignListUserSignsCreateTimeKey].string
        deadlineTime = json[kExpertSignListUserSignsDeadlineTimeKey].string
        createTimeStamp = json[kExpertSignListUserSignsCreateTimeStampKey].int
        deadlineTimeStamp = json[kExpertSignListUserSignsDeadlineTimeStampKey].int
		signType = json[kExpertSignListUserSignsSignTypeKey].int
		signStatus = json[kExpertSignListUserSignsSignStatusKey].int
		userSignId = json[kExpertSignListUserSignsUserSignIdKey].int
		additionContent = json[kExpertSignListUserSignsAdditionContentKey].string
		additionVideoContent = json[kExpertSignListUserSignsAdditionVideoContentKey].string
		signVideo = json[kExpertSignListUserSignsSignVideoKey].string
		signUserName = json[kExpertSignListUserSignsSignUserNameKey].string
		videoUrl = json[kExpertSignListUserSignsVideoUrlKey].string
		expertSign = json[kExpertSignListUserSignsExpertSignKey].int
		signSource = json[kExpertSignListUserSignsSignSourceKey].string
		updateTime = json[kExpertSignListUserSignsUpdateTimeKey].string
		signImage = json[kExpertSignListUserSignsSignImageKey].string
		user = json[kExpertSignListUserSignsUserKey].int
		imageUrl = json[kExpertSignListUserSignsImageUrlKey].string
		state = json[kExpertSignListUserSignsStateKey].int
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if expertSignSignName != nil {
			dictionary.updateValue(expertSignSignName! as AnyObject, forKey: kExpertSignListUserSignsExpertSignSignNameKey)
		}
		if additionVideoStatus != nil {
			dictionary.updateValue(additionVideoStatus! as AnyObject, forKey: kExpertSignListUserSignsAdditionVideoStatusKey)
		}
		if isAdditionVideo != nil {
			dictionary.updateValue(isAdditionVideo! as AnyObject, forKey: kExpertSignListUserSignsIsAdditionVideoKey)
        }
        if createTime != nil {
            dictionary.updateValue(createTime! as AnyObject, forKey: kExpertSignListUserSignsCreateTimeKey)
        }
        if deadlineTime != nil {
            dictionary.updateValue(deadlineTime! as AnyObject, forKey: kExpertSignListUserSignsDeadlineTimeKey)
        }
        if createTimeStamp != nil {
            dictionary.updateValue(createTimeStamp! as AnyObject, forKey: kExpertSignListUserSignsCreateTimeStampKey)
        }
        if deadlineTimeStamp != nil {
            dictionary.updateValue(deadlineTimeStamp! as AnyObject, forKey: kExpertSignListUserSignsDeadlineTimeStampKey)
        }
		if signType != nil {
			dictionary.updateValue(signType! as AnyObject, forKey: kExpertSignListUserSignsSignTypeKey)
		}
		if signStatus != nil {
			dictionary.updateValue(signStatus! as AnyObject, forKey: kExpertSignListUserSignsSignStatusKey)
		}
		if userSignId != nil {
			dictionary.updateValue(userSignId! as AnyObject, forKey: kExpertSignListUserSignsUserSignIdKey)
		}
		if additionContent != nil {
			dictionary.updateValue(additionContent! as AnyObject, forKey: kExpertSignListUserSignsAdditionContentKey)
		}
		if additionVideoContent != nil {
			dictionary.updateValue(additionVideoContent! as AnyObject, forKey: kExpertSignListUserSignsAdditionVideoContentKey)
		}
		if signVideo != nil {
			dictionary.updateValue(signVideo! as AnyObject, forKey: kExpertSignListUserSignsSignVideoKey)
		}
		if signUserName != nil {
			dictionary.updateValue(signUserName! as AnyObject, forKey: kExpertSignListUserSignsSignUserNameKey)
		}
		if videoUrl != nil {
			dictionary.updateValue(videoUrl! as AnyObject, forKey: kExpertSignListUserSignsVideoUrlKey)
		}
		if expertSign != nil {
			dictionary.updateValue(expertSign! as AnyObject, forKey: kExpertSignListUserSignsExpertSignKey)
		}
		if signSource != nil {
			dictionary.updateValue(signSource! as AnyObject, forKey: kExpertSignListUserSignsSignSourceKey)
		}
		if updateTime != nil {
			dictionary.updateValue(updateTime! as AnyObject, forKey: kExpertSignListUserSignsUpdateTimeKey)
		}
		if signImage != nil {
			dictionary.updateValue(signImage! as AnyObject, forKey: kExpertSignListUserSignsSignImageKey)
		}
		if user != nil {
			dictionary.updateValue(user! as AnyObject, forKey: kExpertSignListUserSignsUserKey)
		}
		if imageUrl != nil {
			dictionary.updateValue(imageUrl! as AnyObject, forKey: kExpertSignListUserSignsImageUrlKey)
		}
		if state != nil {
			dictionary.updateValue(state! as AnyObject, forKey: kExpertSignListUserSignsStateKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
		self.expertSignSignName = aDecoder.decodeObject(forKey: kExpertSignListUserSignsExpertSignSignNameKey) as? String
		self.additionVideoStatus = aDecoder.decodeObject(forKey: kExpertSignListUserSignsAdditionVideoStatusKey) as? Int
        self.isAdditionVideo = aDecoder.decodeObject(forKey: kExpertSignListUserSignsIsAdditionVideoKey) as? Int
        self.createTime = aDecoder.decodeObject(forKey: kExpertSignListUserSignsCreateTimeKey) as? String
        self.deadlineTime = aDecoder.decodeObject(forKey: kExpertSignListUserSignsDeadlineTimeKey) as? String
        self.createTimeStamp = aDecoder.decodeObject(forKey: kExpertSignListUserSignsDeadlineTimeStampKey) as? Int
        self.deadlineTimeStamp = aDecoder.decodeObject(forKey: kExpertSignListUserSignsDeadlineTimeStampKey) as? Int
		self.signType = aDecoder.decodeObject(forKey: kExpertSignListUserSignsSignTypeKey) as? Int
		self.signStatus = aDecoder.decodeObject(forKey: kExpertSignListUserSignsSignStatusKey) as? Int
		self.userSignId = aDecoder.decodeObject(forKey: kExpertSignListUserSignsUserSignIdKey) as? Int
		self.additionContent = aDecoder.decodeObject(forKey: kExpertSignListUserSignsAdditionContentKey) as? String
		self.additionVideoContent = aDecoder.decodeObject(forKey: kExpertSignListUserSignsAdditionVideoContentKey) as? String
		self.signVideo = aDecoder.decodeObject(forKey: kExpertSignListUserSignsSignVideoKey) as? String
		self.signUserName = aDecoder.decodeObject(forKey: kExpertSignListUserSignsSignUserNameKey) as? String
		self.videoUrl = aDecoder.decodeObject(forKey: kExpertSignListUserSignsVideoUrlKey) as? String
		self.expertSign = aDecoder.decodeObject(forKey: kExpertSignListUserSignsExpertSignKey) as? Int
		self.signSource = aDecoder.decodeObject(forKey: kExpertSignListUserSignsSignSourceKey) as? String
		self.updateTime = aDecoder.decodeObject(forKey: kExpertSignListUserSignsUpdateTimeKey) as? String
		self.signImage = aDecoder.decodeObject(forKey: kExpertSignListUserSignsSignImageKey) as? String
		self.user = aDecoder.decodeObject(forKey: kExpertSignListUserSignsUserKey) as? Int
		self.imageUrl = aDecoder.decodeObject(forKey: kExpertSignListUserSignsImageUrlKey) as? String
		self.state = aDecoder.decodeObject(forKey: kExpertSignListUserSignsStateKey) as? Int

    }

    func encode(with aCoder: NSCoder) {
		aCoder.encode(expertSignSignName, forKey: kExpertSignListUserSignsExpertSignSignNameKey)
		aCoder.encode(additionVideoStatus, forKey: kExpertSignListUserSignsAdditionVideoStatusKey)
        aCoder.encode(isAdditionVideo, forKey: kExpertSignListUserSignsIsAdditionVideoKey)
        aCoder.encode(createTime, forKey: kExpertSignListUserSignsCreateTimeKey)
        aCoder.encode(deadlineTime, forKey: kExpertSignListUserSignsDeadlineTimeKey)
        aCoder.encode(createTimeStamp, forKey: kExpertSignListUserSignsCreateTimeStampKey)
        aCoder.encode(deadlineTimeStamp, forKey: kExpertSignListUserSignsDeadlineTimeStampKey)
		aCoder.encode(signType, forKey: kExpertSignListUserSignsSignTypeKey)
		aCoder.encode(signStatus, forKey: kExpertSignListUserSignsSignStatusKey)
		aCoder.encode(userSignId, forKey: kExpertSignListUserSignsUserSignIdKey)
		aCoder.encode(additionContent, forKey: kExpertSignListUserSignsAdditionContentKey)
		aCoder.encode(additionVideoContent, forKey: kExpertSignListUserSignsAdditionVideoContentKey)
		aCoder.encode(signVideo, forKey: kExpertSignListUserSignsSignVideoKey)
		aCoder.encode(signUserName, forKey: kExpertSignListUserSignsSignUserNameKey)
		aCoder.encode(videoUrl, forKey: kExpertSignListUserSignsVideoUrlKey)
		aCoder.encode(expertSign, forKey: kExpertSignListUserSignsExpertSignKey)
		aCoder.encode(signSource, forKey: kExpertSignListUserSignsSignSourceKey)
		aCoder.encode(updateTime, forKey: kExpertSignListUserSignsUpdateTimeKey)
		aCoder.encode(signImage, forKey: kExpertSignListUserSignsSignImageKey)
		aCoder.encode(user, forKey: kExpertSignListUserSignsUserKey)
		aCoder.encode(imageUrl, forKey: kExpertSignListUserSignsImageUrlKey)
		aCoder.encode(state, forKey: kExpertSignListUserSignsStateKey)

    }

}
