//
//  Pharmacy.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>

@interface Pharmacy : NSObject

@property (nonatomic, strong) NSString *pharmacyId;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end



