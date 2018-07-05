//
//  CryptoViewController.h
//  BrinsAPI
//
//  Created by Naveen on 12/06/2018.
//  Copyright © 2018 IFC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CommonCrypto/CommonCryptor.h>
#import <Foundation/Foundation.h>

#define FBENCRYPT_ALGORITHM     kCCAlgorithmDES
#define FBENCRYPT_BLOCK_SIZE    kCCBlockSizeDES
#define FBENCRYPT_KEY_SIZE      kCCKeySizeDES

@interface CryptoViewController : UIViewController


+ (NSData *)tripleDesEncryptString:(NSString *)input key:(NSString *)key error:(NSError **)error;

+ (NSString *)tripleDesDecryptData:(NSData *)input key:(NSString *)key error:(NSError **)error;

+ (void) testEncryptionAndDecryption;





//-----------------
// API (raw data)
//-----------------
+ (NSData*)generateIv;
+ (NSData*)encryptData:(NSData*)data key:(NSData*)key iv:(NSData*)iv;
+ (NSData*)decryptData:(NSData*)data key:(NSData*)key iv:(NSData*)iv;


//-----------------
// API (base64)
//-----------------
// the return value of encrypteMessage: and 'encryptedMessage' are encoded with base64.
//
+ (NSString*)encryptBase64String:(NSString*)string keyString:(NSString*)keyString separateLines:(BOOL)separateLines;
+ (NSString*)decryptBase64String:(NSString*)encryptedBase64String keyString:(NSString*)keyString;

//-----------------
// API (utilities)
//-----------------
+ (NSString*)hexStringForData:(NSData*)data;
+ (NSData*)dataForHexString:(NSString*)hexString;


@end
