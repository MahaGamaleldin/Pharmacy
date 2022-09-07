//
//  ReturnRequest.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>
#import "Wholesaler.h"

@interface ReturnRequest : NSObject
/*
 ID
 ii. Created At
 iii. Number of Items(alias: Items)
 iv. Status
 v. Service Type
 vi. Associated Wholesaler
 */

@property (nonatomic, strong) NSString *returnRequestId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *numberOfItems;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *serviceType;
@property (nonatomic, strong) Wholesaler *associatedWholesaler;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


