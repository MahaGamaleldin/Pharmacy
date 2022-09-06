//
//  PharmacyHttpClient.h
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import <Foundation/Foundation.h>



typedef void(^PharmacyCompletionBlock)(id responseObject, NSString *errorMessage);

@interface PharmacyHttpClient : NSObject

+ (void)loginWithUserName:(NSString *)userName
                  password:(NSString *)password
                completion:(PharmacyCompletionBlock)completion;

@end

