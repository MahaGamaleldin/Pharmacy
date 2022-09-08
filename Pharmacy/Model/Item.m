//
//  Item.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self)
    {
        self.ndc = dictionary[@"ndc"];
        self.itemDescription = dictionary[@"description"];
        self.manufacturer = dictionary[@"manufacturer"];
        self.packageSize = dictionary[@"packageSize"];
        self.requestType = dictionary[@"requestType"];
        self.name = dictionary[@"name"];
        self.strength = dictionary[@"strength"];
        self.dosage = dictionary[@"dosage"];
        self.fullQuantity = [NSString stringWithFormat:@"%@", dictionary[@"fullQuantity"]];
        self.partialQuantity = dictionary[@"partialQuantity"];
        self.expirationDate = dictionary[@"expirationDate"];
        self.status = dictionary[@"status"];
        self.lotNumber = dictionary[@"lotNumber"];
       
        self.itemId = dictionary[@"id"];
        self.createdAt = dictionary[@"createdAt"];
        self.updatedAt = dictionary[@"updatedAt"];
        self.expectedReturnValue = dictionary[@"expectedReturnValue"];
        self.actualReturnValue = dictionary[@"actualReturnValue"];
        self.adminComment = dictionary[@"adminComment"];
    }
    
    return self;
}

@end
