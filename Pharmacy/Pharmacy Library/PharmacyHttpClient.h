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

- (void) getReturnRequestsForPharmacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

- (void) getItemsForReturnRequests:(NSString * )returnRequestId andPharmacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

- (void) getWholesalersForPharmacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

- (void) createReturnRequestForServiceType: (NSString *) serviceType
                              wholesalerId: (NSString *) wholesalerId
                             andPharmacyID: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

- (void) addItem: (NSDictionary *)itemDictionary
      toPharmacy: (NSString *)pharmacyId
andReturnRequest: (NSString *)returnRequestId withCompletion:(PharmacyCompletionBlock)completion;

- (void)deleteItem: (NSString *)itemId fromReturnRequest: (NSString *)returnRequestId ofPhamacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

- (void) updateItem: (NSString *)itemId withParams: (NSDictionary *) params fromReturnRequest: (NSString *)returnRequestId ofPhamacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion;

@end

