//
//  PharmacyHttpClient.h
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import <Foundation/Foundation.h>

extern NSString * const kUserLoginToken;
extern NSString * const kHTTPHeaderAuthorizationkey;
typedef void(^PharmacyCompletionBlock)(id responseObject, NSString *errorMessage);

@interface PharmacyHttpClient : NSObject

+ (instancetype) sharedInstance;

- (void)loginWithUserName:(NSString *)userName
                  password:(NSString *)password
                completion:(PharmacyCompletionBlock)completion;


- (void) addUserTokenToSession;

- (void) getAllPharmaciesWithCompletion:(PharmacyCompletionBlock)completion;

- (void) getWholesalersForPharmacy: (NSString *) pharmacyId andCompletion:(PharmacyCompletionBlock)completion;

- (void) createReturnRequestWithserviceType: (NSString *) serviceType wholesalerId: (NSString *) wholesalerId andCompletion:(PharmacyCompletionBlock)completion;

- (void) getReturnRequestsForPharmacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

- (void) getItemsForReturnRequests:(NSString * )returnRequestId andPharmacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;


@end

