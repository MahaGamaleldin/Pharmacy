//
//  Wholesaler.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>

@interface Wholesaler : NSObject

@property (nonatomic, strong) NSString *wholesalerId;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


