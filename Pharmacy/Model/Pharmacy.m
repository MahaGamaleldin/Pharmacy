//
//  Pharmacy.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "Pharmacy.h"

@implementation Pharmacy

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self)
    {
        self.pharmacyId = dictionary[@"pharmacyId"];
        
    }
    return self;
}

@end
