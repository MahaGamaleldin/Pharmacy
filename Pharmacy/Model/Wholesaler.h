//
//  Wholesaler.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>

@interface Wholesaler : NSObject

@property (nonatomic, strong) NSString *wholesalerId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


