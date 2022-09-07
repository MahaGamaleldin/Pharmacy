//
//  ReturnRequest.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>
#import "Wholesaler.h"
#import "Pharmacy.h"

@interface ReturnRequest : NSObject

@property (nonatomic, strong) NSString *returnRequestId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *dateDispatched;
@property (nonatomic, strong) NSString *dateFulfilled;
@property (nonatomic, strong) NSString *disbursements;
@property (nonatomic, strong) NSString *serviceFee;
@property (nonatomic, strong) NSString *returnRequestStatus;
@property (nonatomic, strong) NSString *returnRequestStatusLabel;
@property (nonatomic, strong) NSString *serviceType;
@property (nonatomic, strong) NSString *preferredDate;
@property (nonatomic, strong) Wholesaler *wholesaler;
@property (nonatomic, strong) NSNumber *numberOfItems;
@property (nonatomic, strong) NSString *numberOfReports;
@property (nonatomic, strong) NSString *numberOfShipments;
@property (nonatomic, strong) Pharmacy *pharmacy;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


