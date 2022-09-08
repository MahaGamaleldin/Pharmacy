//
//  ReturnRequest.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "ReturnRequest.h"

@implementation ReturnRequest

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self)
    {//returnRequestDictionary[@"returnRequest"]
        NSDictionary *returnRequestDictionary = dictionary[@"returnRequest"];
        self.returnRequestId = [NSString stringWithFormat:@"%d", [returnRequestDictionary[@"id"] intValue]];
        self.createdAt = returnRequestDictionary[@"createdAt"];
        self.updatedAt = returnRequestDictionary[@"updatedAt"];
        self.dateDispatched = returnRequestDictionary[@"dateDispatched"];
        self.dateFulfilled = returnRequestDictionary[@"dateFulfilled"];
        self.disbursements = returnRequestDictionary[@"disbursements"];
        self.serviceFee = returnRequestDictionary[@"serviceFee"];
        self.returnRequestStatusLabel = returnRequestDictionary[@"returnRequestStatusLabel"];
        self.preferredDate = returnRequestDictionary[@"preferredDate"];
        self.serviceType = returnRequestDictionary[@"serviceType"];
        self.returnRequestStatus = returnRequestDictionary[@"returnRequestStatus"];

        if (returnRequestDictionary[@"wholesaler"] != [NSNull null]) {
            self.wholesaler = [[Wholesaler alloc] initWithDictionary:returnRequestDictionary[@"wholesaler"]];
        }
        if (returnRequestDictionary[@"pharmacy"] != [NSNull null]) {
            self.pharmacy = [[Pharmacy alloc] initWithDictionary:returnRequestDictionary[@"pharmacy"]];
        }
        
        self.numberOfReports = dictionary[@"numberOfReports"];
        self.numberOfShipments = dictionary[@"numberOfShipments"];
        self.numberOfItems = [NSNumber numberWithInt:[dictionary[@"numberOfItems"] intValue]];
        
        
        
    }
    
    return self;
}

@end
