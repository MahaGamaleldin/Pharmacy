//
//  Pharmacy.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "Pharmacy.h"
#import "Wholesaler.h"

@implementation Pharmacy

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self)
    {
        self.pharmacyId = dictionary[@"id"];
        self.createdAt = dictionary[@"createdAt"];
        self.updatedAt= dictionary[@"updatedAt"];
        self.licenseState = dictionary[@"licenseState"];
        self.licenseStateCode = dictionary[@"licenseStateCode"];
        self.npi = dictionary[@"npi"];
        self.ein = dictionary[@"ein"];
        self.doingBusinessAs = dictionary[@"doingBusinessAs"];
        self.legalBusinessName = dictionary[@"legalBusinessName"];
        self.companyType = dictionary[@"companyType"];
        self.reimbursementType = dictionary[@"reimbursementType"];
        self.directDepositInfo = dictionary[@"directDepositInfo"];
        self.dea = dictionary[@"dea"];
        
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        
        self.wholesalers = [NSMutableArray new];
        for (NSDictionary *wholesalerDictionary in dictionary[@"wholesalers"]) {
            Wholesaler *wholesaler = [[Wholesaler alloc] initWithDictionary:wholesalerDictionary];
            [self.wholesalers addObject:wholesaler];
        }
        
        
        
    }
    return self;
}

@end
