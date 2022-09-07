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
        self.wholesalerId = dictionary[@"wholesalerId"];
        
    }
    return self;
}

@end
