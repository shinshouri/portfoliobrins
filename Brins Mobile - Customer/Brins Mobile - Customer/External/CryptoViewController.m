//
//  CryptoViewController.m
//  BrinsAPI
//
//  Created by Naveen on 12/06/2018.
//  Copyright © 2018 IFC. All rights reserved.
//

#import "CryptoViewController.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSData+Base64.h"

@interface CryptoViewController ()

@end

@implementation CryptoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NSData *)tripleDesEncryptString:(NSString *)input
                               key:(NSString *)key
                             error:(NSError **)error
{
    NSParameterAssert(input);
    NSParameterAssert(key);
    
    NSData *inputData = [input dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t outLength;
    
   // NSAssert(keyData.length == kCCKeySize3DES, @"the keyData is an invalid size");
    
    NSMutableData *outputData = [NSMutableData dataWithLength:(inputData.length  +  kCCBlockSize3DES)];
    
    CCCryptorStatus
    result = CCCrypt(kCCEncrypt, // operation
                     kCCAlgorithm3DES, // Algorithm
                     kCCOptionPKCS7Padding | kCCOptionECBMode, // options
                     keyData.bytes, // key
                     keyData.length, // keylength
                     nil,// iv
                     inputData.bytes, // dataIn
                     inputData.length, // dataInLength,
                     outputData.mutableBytes, // dataOut
                     outputData.length, // dataOutAvailable
                     &outLength); // dataOutMoved
    
    if (result != kCCSuccess) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.your_domain.your_project_name.your_class_name."
                                         code:result
                                     userInfo:nil];
        }
        return nil;
    }
    [outputData setLength:outLength];
    return outputData;
}



+ (NSString *)tripleDesDecryptData:(NSData *)input
                               key:(NSString *)key
                             error:(NSError **)error
{
    NSParameterAssert(input);
    NSParameterAssert(key);
    
    NSData *inputData = input;
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t outLength;
    
    NSAssert(keyData.length == kCCKeySize3DES, @"the keyData is an invalid size");
    
    NSMutableData *outputData = [NSMutableData dataWithLength:(inputData.length  +  kCCBlockSize3DES)];
    
    CCCryptorStatus
    result = CCCrypt(kCCDecrypt, // operation
                     kCCAlgorithm3DES, // Algorithm
                     kCCOptionPKCS7Padding | kCCOptionECBMode, // options
                     keyData.bytes, // key
                     keyData.length, // keylength
                     nil,// iv
                     inputData.bytes, // dataIn
                     inputData.length, // dataInLength,
                     outputData.mutableBytes, // dataOut
                     outputData.length, // dataOutAvailable
                     &outLength); // dataOutMoved
    
    if (result != kCCSuccess) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.your_domain.your_project_name.your_class_name."
                                         code:result
                                     userInfo:nil];
        }
        return nil;
    }
    [outputData setLength:outLength];
    return [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
}


+ (void) testEncryptionAndDecryption {
    
    NSData *encrypted = [self tripleDesEncryptString:@"test" key:@"123456789123456789123456" error:nil];
    NSLog(@"encrypted data length: %lu", (unsigned long)encrypted.length);
    NSString *decrypted = [self tripleDesDecryptData:encrypted key:@"123456789123456789123456" error:nil];
    NSLog(@"decrypted text: %@", decrypted);
}

+ (NSData*)encryptData:(NSData*)data key:(NSData*)key iv:(NSData*)iv;
{
    NSData* result = nil;
    
    // setup key
    unsigned char cKey[FBENCRYPT_KEY_SIZE];
    bzero(cKey, sizeof(cKey));
    [key getBytes:cKey length:FBENCRYPT_KEY_SIZE];
    
    // setup iv
    char cIv[FBENCRYPT_BLOCK_SIZE];
    bzero(cIv, FBENCRYPT_BLOCK_SIZE);
    if (iv) {
        [iv getBytes:cIv length:FBENCRYPT_BLOCK_SIZE];
    }
    
    // setup output buffer
    size_t bufferSize = [data length] + FBENCRYPT_BLOCK_SIZE;
    void *buffer = malloc(bufferSize);
    
    // do encrypt
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          FBENCRYPT_ALGORITHM,
                                          kCCOptionPKCS7Padding,
                                          cKey,
                                          FBENCRYPT_KEY_SIZE,
                                          cIv,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:encryptedSize];
    } else {
        free(buffer);
        NSLog(@"[ERROR] failed to encrypt|CCCryptoStatus: %d", cryptStatus);
    }
    
    return result;
}

+ (NSData*)decryptData:(NSData*)data key:(NSData*)key iv:(NSData*)iv;
{
    NSData* result = nil;
    
    
    // setup key
    unsigned char cKey[FBENCRYPT_KEY_SIZE];
    bzero(cKey, sizeof(cKey));
    [key getBytes:cKey length:FBENCRYPT_KEY_SIZE];
    
    // setup iv
    char cIv[FBENCRYPT_BLOCK_SIZE];
    bzero(cIv, FBENCRYPT_BLOCK_SIZE);
    if (iv) {
        [iv getBytes:cIv length:FBENCRYPT_BLOCK_SIZE];
    }
    
    // setup output buffer
    size_t bufferSize = [data length] + FBENCRYPT_BLOCK_SIZE;
    void *buffer = malloc(bufferSize);
    
    // do decrypt
    size_t decryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          FBENCRYPT_ALGORITHM,
                                          kCCOptionPKCS7Padding,
                                          cKey,
                                          FBENCRYPT_KEY_SIZE,
                                          cIv,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &decryptedSize);
    
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:decryptedSize];
    } else {
        free(buffer);
        NSLog(@"[ERROR] failed to decrypt| CCCryptoStatus: %d", cryptStatus);
    }
    
    return result;
}


+ (NSString*)encryptBase64String:(NSString*)string keyString:(NSString*)keyString separateLines:(BOOL)separateLines
{
    NSData* data = [self encryptData:[string dataUsingEncoding:NSUTF8StringEncoding]
                                 key:[keyString dataUsingEncoding:NSUTF8StringEncoding]
                                  iv:nil];

   // NSData* data = [self tripleDesEncryptString:string key:keyString  error:nil];
    return [data base64EncodedStringWithSeparateLines:separateLines];
}

+ (NSString*)decryptBase64String:(NSString*)encryptedBase64String keyString:(NSString*)keyString
{
    NSData* encryptedData = [NSData dataFromBase64String:encryptedBase64String];
    NSData* data = [self decryptData:encryptedData
                                 key:[keyString dataUsingEncoding:NSUTF8StringEncoding]
                                  iv:nil];
    if (data) {
        return [[NSString alloc] initWithData:data
                                      encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}


#define FBENCRYPT_IV_HEX_LEGNTH (FBENCRYPT_BLOCK_SIZE*2)

+ (NSData*)generateIv
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        srand(time(NULL));
    });
    
    char cIv[FBENCRYPT_BLOCK_SIZE];
    for (int i=0; i < FBENCRYPT_BLOCK_SIZE; i++) {
        cIv[i] = rand() % 256;
    }
    return [NSData dataWithBytes:cIv length:FBENCRYPT_BLOCK_SIZE];
}


+ (NSString*)hexStringForData:(NSData*)data
{
    if (data == nil) {
        return nil;
    }
    
    NSMutableString* hexString = [NSMutableString string];
    
    const unsigned char *p = [data bytes];
    
    for (int i=0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    return hexString;
}

+ (NSData*)dataForHexString:(NSString*)hexString
{
    if (hexString == nil) {
        return nil;
    }
    
    const char* ch = [[hexString lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* data = [NSMutableData data];
    while (*ch) {
        char byte = 0;
        if ('0' <= *ch && *ch <= '9') {
            byte = *ch - '0';
        } else if ('a' <= *ch && *ch <= 'f') {
            byte = *ch - 'a' + 10;
        }
        ch++;
        byte = byte << 4;
        if (*ch) {
            if ('0' <= *ch && *ch <= '9') {
                byte += *ch - '0';
            } else if ('a' <= *ch && *ch <= 'f') {
                byte += *ch - 'a' + 10;
            }
            ch++;
        }
        [data appendBytes:&byte length:1];
    }
    return data;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
