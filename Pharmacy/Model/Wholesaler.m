//
//  Wholesaler.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "Wholesaler.h"

@implementation Wholesaler

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self)
    {
        self.wholesalerId = dictionary[@"id"];
        self.createdAt = dictionary[@"createdAt"];
        self.updatedAt = dictionary[@"updatedAt"];
        self.name = dictionary[@"name"];
        
    }
    return self;
}

@end
