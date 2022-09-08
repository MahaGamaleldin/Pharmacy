//
//  User.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "User.h"

@implementation User


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self)
    {
        self.userId = dictionary[@"id"];
        self.createdAt = dictionary[@"createdAt"];
        self.updatedAt = dictionary[@"updatedAt"];
        self.username = dictionary[@"username"];
        self.password = dictionary[@"password"];
        self.email = dictionary[@"email"];
        self.role = dictionary[@"role"];
        self.phoneNumber = dictionary[@"phoneNumber"];
        self.activated = [dictionary[@"activated"] boolValue];
    }
    
    return self;
}
@end
