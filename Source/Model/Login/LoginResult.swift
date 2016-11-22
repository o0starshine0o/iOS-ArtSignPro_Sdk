//
//  LoginResult.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginResult: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kLoginResultUserIdKey: String = "user_id"
    internal let kLoginResultUserNameKey: String = "user_name"
    internal let kLoginResultUserPhoneKey: String = "user_phone"


    // MARK: Properties
    var userId: Int?
    var userName: String?
    var userPhone:String?


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
        userId = json[kLoginResultUserIdKey].int
        userName = json[kLoginResultUserNameKey].string
        userPhone = json[kLoginResultUserPhoneKey].string
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
        if userId != nil {
            dictionary.updateValue(userId! as AnyObject, forKey: kLoginResultUserIdKey)
        }
        if userName != nil {
            dictionary.updateValue(userName! as AnyObject, forKey: kLoginResultUserNameKey)
        }
        if userPhone != nil {
            dictionary.updateValue(userPhone! as AnyObject, forKey: kLoginResultUserPhoneKey)
        }
        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeObject(forKey: kLoginResultUserIdKey) as? Int
        self.userName = aDecoder.decodeObject(forKey: kLoginResultUserNameKey) as? String
        self.userPhone = aDecoder.decodeObject(forKey: kLoginResultUserPhoneKey) as? String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey: kLoginResultUserIdKey)
        aCoder.encode(userName, forKey: kLoginResultUserNameKey)
        aCoder.encode(userPhone, forKey: kLoginResultUserPhoneKey)
    }

}
