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
    {
        self.returnRequestId = dictionary[@"id"];
        self.createdAt = dictionary[@"createdAt"];
        self.numberOfItems = dictionary[@"numberOfItems"];
        self.status = dictionary[@"status"];
        self.serviceType = dictionary[@"serviceType"];
        self.associatedWholesaler = [[Wholesaler alloc] initWithDictionary:dictionary[@"associatedWholesaler"]];
    }
    
    return self;
}

@end
