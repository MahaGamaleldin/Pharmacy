//
//  ReturnRequest.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "ReturnRequest.h"

@implementation ReturnRequest
/**
 {
"returnRequest": {

"updatedAt": "2022-08-07 06:10:52",

"dateDispatched": null,
"dateFulfilled": null,
"disbursements": null,
"serviceFee": null,
"returnRequestStatusLabel": "Preparing in pharmacy",
"preferredDate": "2022-08-19 12:00:00",


"numberOfReports": 0,
"numberOfShipments": 0
},
 */
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
        self.numberOfReports = dictionary[@"numberOfReports"];
        self.serviceType = returnRequestDictionary[@"serviceType"];
        
        if (returnRequestDictionary[@"wholesaler"] != [NSNull null]) {
            self.wholesaler = [[Wholesaler alloc] initWithDictionary:dictionary[@"wholesaler"]];
        }
        if (returnRequestDictionary[@"pharmacy"] != [NSNull null]) {
            self.pharmacy = [[Pharmacy alloc] initWithDictionary:dictionary[@"pharmacy"]];
        }
        
        self.numberOfShipments = dictionary[@"numberOfShipments"];
        self.numberOfItems = [NSNumber numberWithInt:[dictionary[@"numberOfItems"] intValue]];
        self.returnRequestStatus = returnRequestDictionary[@"returnRequestStatus"];
        
    }
    
    return self;
}

@end
