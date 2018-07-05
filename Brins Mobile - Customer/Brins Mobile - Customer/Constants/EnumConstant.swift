//
//  EnumConstant.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation

/*
    ENUM_MESSAGE_STATE - START
    Description : Set of constants for message state.
    Author : Michael Carolius.
    Created on : Sunday, 18 April 2018.                Updated on : Sunday, 18 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_MESSAGE_STATE: Int
{
    case Success = 0
    case Warning = 1
    case Fail = 2
    case Information = 3
    case Nothing = 4
}

/* ENUM_MESSAGE_STATE - END */

/*
    ENUM_GENERAL_STATE - START
    Description : Set of constants for general state.
    Author : Michael Carolius.
    Created on : Sunday, 18 April 2018.                Updated on : Sunday, 18 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_GENERAL_STATE: Int
{
    case Active = 0
    case Inactive = 1
}

/* ENUM_GENERAL_STATE - END */

/*
    ENUM_PRODUCT_STATE - START
    Description : Set of constants for product state.
    Author : Michael Carolius.
    Created on : Sunday, 18 April 2018.                Updated on : Sunday, 18 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_PRODUCT_STATE : Int
{
    case Completed = 0
    case OnProgress = 1
    case Submitted = 2
    case Surveyed = 3
    case Approved = 4
    case Rejected = 5
    case PendingForPayment = 6
    case Paid = 7
    case Active = 8
    case Expired = 9
    case Others = 10
}

/* ENUM_PRODUCT_STATE - END */

/*
    ENUM_REGISTRATION_STATE - START
    Description : Set of constants for registration state.
    Author : Michael Carolius.
    Created on : Sunday, 18 April 2018.                Updated on : Sunday, 18 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_REGISTRATION_STATE : Int
{
    case Success = 0
    case Verified = 1
    case NotVerified = 2
}

/* ENUM_REGISTRATION_STATE - END */

/*
    ENUM_DOCUMENTCAPTURE_NAME - START
    Description : Set of constants for registration state.
    Author : Michael Carolius.
    Created on : Sunday, 18 April 2018.                Updated on : Sunday, 18 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_DOCUMENTCAPTURE_NAME : String
{
    case IdentityCard = "KTP"
    case BuildingFront = "Tampak Depan"
    case BuildingBack = "Tampak Belakang"
    case BuildingLeft = "Tampak Kiri"
    case BuildingRight = "Tampak Kanan"
    case GeneralInterior = "Interior"
    case AssuredSTNK = "STNK"
    case VehicleFront = "Depan"
    case VehicleBack = "Belakang"
    case VehicleLeft = "Kiri"
    case VehicleRight = "Kanan"

    case STRING_CURRENCY_PATTERN = "#"
}

/* ENUM_DOCUMENTCAPTURE_NAME - END */

/*
    ENUM_CLAIM_STATE - START
    Description : Set of constants for claim state.
    Author : Michael Carolius.
    Created on : Sunday, 18 April 2018.                Updated on : Sunday, 18 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_CLAIM_STATE : Int
{
    case PendingForSurvey = 0
    case Adjustment = 1
    case Approved = 2
    case Rejected = 3
    case Paid = 4
}

/* ENUM_CLAIM_STATE - END */

/*
    ENUM_FONT_FAMILY - START
    Description : Set of constants for font family state.
    Author : Michael Carolius.
    Created on : Monday, 23 April 2018.                Updated on : Monday, 23 April 2018.
    Created by : Michael Carolius.                     Updated by : Michael Carolius.
    Version : 1.0:1.
*/

public enum ENUM_FONT_FAMILY : String
{
    case Primary = "HelveticakNeueLTStd-Roman"
    case Secondary = "HelveticaNeueLTStd-Bd"
    case Tertiary = "HelveticaNeueLTStd-Lt"
}

/* ENUM_FONT_FAMILY - END */
