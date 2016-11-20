//
//  PayResult.swift
//
//  Created by AbelHu on 16/4/21
//  Copyright (c) QiCode. All rights reserved.
//

import Foundation
import SwiftyJSON

class PayResult: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kPayResultChargeIdKey: String = "charge_id"
    internal let kPayResultChargeKey: String = "charge"
    internal let kPayResultPayStatusKey: String = "pay_status"


    // MARK: Properties
    var chargeId: Int?
    var charge: Any?
    var payStatus:String?


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
        chargeId = json[kPayResultChargeIdKey].int
        charge = json[kPayResultChargeKey].object
        payStatus = json[kPayResultPayStatusKey].string
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
        if chargeId != nil {
            dictionary.updateValue(chargeId! as AnyObject, forKey: kPayResultChargeIdKey)
        }
        if charge != nil {
            dictionary.updateValue(charge! as AnyObject, forKey: kPayResultChargeKey)
        }
        if payStatus != nil {
            dictionary.updateValue(payStatus! as AnyObject, forKey: kPayResultPayStatusKey)
        }
        return dictionary
    }

    // MARK: NSCoding Protocol
    required init(coder aDecoder: NSCoder) {
        self.chargeId = aDecoder.decodeObject(forKey: kPayResultChargeIdKey) as? Int
        self.charge = aDecoder.decodeObject(forKey: kPayResultChargeKey)
        self.payStatus = aDecoder.decodeObject(forKey: kPayResultPayStatusKey) as? String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(chargeId, forKey: kPayResultChargeIdKey)
        aCoder.encode(charge, forKey: kPayResultChargeKey)
        aCoder.encode(payStatus, forKey: kPayResultPayStatusKey)
    }

}
