//
//  Item.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property (nonatomic, strong) NSString *ndc;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *manufacturer;
@property (nonatomic, strong) NSString *packageSize;
@property (nonatomic, strong) NSString *requestType;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *strength;
@property (nonatomic, strong) NSString *dosage;
@property (nonatomic, strong) NSString *fullQuantity;
@property (nonatomic, strong) NSString *partialQuantity;
@property (nonatomic, strong) NSString *expirationDate;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *lotNumber;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
