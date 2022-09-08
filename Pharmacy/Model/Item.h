//
//  Item.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject
/*
 *
 
 "ndc": "docsl",
 "description": "asdaewadwe",
 "manufacturer": "Nicolas LLC",
 "packageSize": "824",
 "requestType": "csc",
 "name": "name",
 "strength": "strong",
 "dosage": "alot",
 "fullQuantity": 501,
 "partialQuantity": 794,
 "expirationDate": "2021-08",
 "status": "PENDING",
 "lotNumber": "1231313",
 
 "id": 108,
 "createdAt": "2022-09-04 05:39:01",
 "updatedAt": "2022-09-06 12:11:48",
 "expectedReturnValue": 0,
 "actualReturnValue": 0,
 "adminComment": null
 */
@property (nonatomic, strong) NSString *ndc;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *manufacturer;
@property (nonatomic, strong) NSString *packageSize;
@property (nonatomic, strong) NSString *requestType;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *strength;
@property (nonatomic, strong) NSString *dosage;
@property (nonatomic, strong) NSString *fullQuantity;
@property (nonatomic, strong) NSString *partialQuantity;
@property (nonatomic, strong) NSString *expirationDate;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *lotNumber;

@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *expectedReturnValue;
@property (nonatomic, strong) NSString *actualReturnValue;
@property (nonatomic, strong) NSString *adminComment;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
