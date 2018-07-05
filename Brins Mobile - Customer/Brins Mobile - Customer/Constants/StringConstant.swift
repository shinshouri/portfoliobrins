//
//  StringConstant.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import Foundation

//MARK : REGULAR EXPRESSION

public let STRING_REGULAREXPRESSION_PERSONNAME: String = "^[A-Za-z\\s]{1,}[\\.]{0,1}[A-Za-z\\s]{0,}$"
public let STRING_REGULAREXPRESSION_ALPHABET: String = "^[a-zA-Z]+$"
public let STRING_REGULAREXPRESSION_NUMERIC: String = "^[0-9]*$"
public let STRING_REGULAREXPRESSION_ALPHABETNUMERIC: String = "^[a-zA-Z0-9]+$"
public let STRING_REGULAREXPRESSION_EMAIL: String = "^[\\w!#$%&'*+\\-/=?\\^_`{|}~]+" +
"(\\" +
".[\\w!#$%&'*+\\-/=?\\^_`{|}~]+)*@(" +
"(" + "([\\-\\w]+\\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\\.){3}[0-9]{1,3}))$";
public let STRING_REGULAREXPRESSION_MOBILEPHONE: String = "\\+" +
"(9[976]\\d|8[987530]\\d|6[987]\\d|5[90]\\d|42\\d|3[875]\\d|2" +
"[98654321]\\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210" +
"]|2[70]|7|1)\\d{1,14}$"


//MARK : PRODUCT

/* ASRI */

public let STRING_PRODUCT_ASRI_CODE: String = "0117"
public let STRING_PRODUCT_ASRI_CONSTRUCTION: String = "I"
public let STRING_PRODUCT_ASRI_RISKOCCUPATION: String = "2976"
public let STRING_PRODUCT_ASRI_RISKCATEGORY: String = "I"

/* OTO */

public let STRING_PRODUCT_OTO_CODE: String = "0206"


//MARK : BUNDLE

/* GENERAL RESULT */

public let STRING_GENERAL_RESULT_HEADERFORMTITLE: String = "general_result_headerformtitle"
public let STRING_GENERAL_RESULT_TITLE: String = "general_result_title"
public let STRING_GENERAL_RESULT_DESCRIPTION: String = "general_result_description"
public let STRING_GENERAL_RESULT_PROGRESSBARSECTION: String = "general_result_progressbarsection"
public let STRING_GENERAL_RESULT_PROGRESSBARCURRENTSECTION: String = "general_result_progressbarcurrentsection"
public let STRING_GENERAL_RESULT_PROGRESSBARTOTALSECTION: String = "general_result_progressbartotalsection"

public let STRING_APPLICATION_PRODUCT: String = "application_product"
public let STRING_APPLICATION_PACKAGE: String = "application_package"
public let STRING_APPLICATION_PRODUCT_ASRI: String = "application_product_asri"
public let STRING_APPLICATION_PRODUCT_OTO: String = "application_product_oto"
public let STRING_APPLICATION_PRODUCT_PERSONALACCIDENT: String = "application_product_personalaccident"
public let STRING_APPLICATION_CUSTOMER: String = "application_customer"

public let STRING_PACKAGE_PRODUCT: String = "package_product"
public let STRING_PACKAGE_PACKAGE: String = "package_package"


//MARK : LANGUAGE CULTURE

public let STRING_CULTURE_INDONESIAN: String = "id-ID"
public let STRING_CULTURE_ENGLISH: String = "en-US"

public let STRING_RESPONSE_CODE_NO_INTERNET: String = "000001"
public let STRING_HTML_CODE_NO_INTERNET: String = "404"
public let STRING_RESPONSE_CODE_LOCKNULL: String = "000002"
public let STRING_HTML_CODE_LOCKNULL: String = "405"


//MARK : KEY

//Request
public let STRING_SERVER_KEY_REQUEST_PRIVATE: String = "2F2B9A548B65E9D6"
public let STRING_SERVER_KEY_REQUEST_PUBLIC: String = "C3RHC2l1BNBHBG1lCMFO"
//Response
public let STRING_SERVER_KEY_RESPONSE_PRIVATE: String = "069D1D5B28385806"
public let STRING_SERVER_KEY_RESPONSE_PUBLIC: String = "C3VUZGFRZWXHCGE"

public let STRING_ECRYPT_MODE: Bool = true;


//MARK : CHARACTER

public let STRING_CHARACTER_SEPARATOR_DATE_VIEW: String = "/"
public let STRING_CHARACTER_SEPARATOR_DATE_SERVER: String = "-"
public let STRING_CHARACTER_SEPARATOR_DATETIME_SERVER: String = "'T'"
public let STRING_CHARACTER_SEPARATOR_TIME_VIEW: String = ":"
public let STRING_CHARACTER_SEPARATOR_TIMEZONE_VIEW: String = "Z"
public let STRING_CHARACTER_SEPARATOR_DECIMAL: String = "."
public let STRING_CHARACTER_SEPARATOR_THOUSAND: String = ","


//MARK : DATE

public let STRING_DATE_SERVER_DEFAULT: String = "0000" + STRING_CHARACTER_SEPARATOR_DATE_SERVER + "00" + STRING_CHARACTER_SEPARATOR_DATE_SERVER + "00"
public let STRING_TIME_SERVER_DEFAULT: String = "00" + STRING_CHARACTER_SEPARATOR_TIME_VIEW + "00" + STRING_CHARACTER_SEPARATOR_TIME_VIEW + "00" + STRING_CHARACTER_SEPARATOR_TIMEZONE_VIEW
public let STRING_DATETIME_SERVER_DEFAULT: String = STRING_DATE_SERVER_DEFAULT + STRING_CHARACTER_SEPARATOR_DATETIME_SERVER + STRING_TIME_SERVER_DEFAULT
public let INT_TIME_SERVER_COMPONENT: UInt32 = 3

public let STRING_DATE_SERVER_FORMAT: String = "yyyy-MM-dd"
public let STRING_TIME_SERVER_FORMAT: String = "HH:mm:ss"
public let STRING_DATETIME_SERVER_FORMAT: String = STRING_DATE_SERVER_FORMAT + STRING_CHARACTER_SEPARATOR_DATETIME_SERVER + STRING_TIME_SERVER_FORMAT + STRING_CHARACTER_SEPARATOR_TIMEZONE_VIEW
public let STRING_DATETIME_SERVER_FORMATWITHOUTTIMEZONE: String = STRING_DATE_SERVER_FORMAT + STRING_CHARACTER_SEPARATOR_DATETIME_SERVER + STRING_TIME_SERVER_FORMAT

public let STRING_DATE_VIEW_FORMAT: String = "dd/MM/yyyy"
public let STRING_TIME_VIEW_FORMAT: String = "HH:mm:ss"
public let STRING_TIME_VIEW_FORMATSHORT: String = "HH:mm"
public let STRING_DATETIME_VIEW_FORMAT: String = STRING_DATE_VIEW_FORMAT + " " + STRING_TIME_VIEW_FORMAT
public let STRING_DATETIME_VIEW_FORMATSHORT: String = STRING_DATE_VIEW_FORMAT + " " + STRING_TIME_VIEW_FORMATSHORT
public let STRING_TIMEZONE_VIEW_FORMAT: String = "GMT+07:00"
