//
//  Pharmacy.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Pharmacy : NSObject
/*
 {
 id
 createdAt
 updatedAt
 "user": {},
 licenseState
 licenseStateCode,
 npi
 ein
 doingBusinessAs
 legalBusinessName
 companyType
 reimbursementType
 directDepositInfo
 "wholesalers": [],
 dea
 }*/
@property (nonatomic, strong) NSString *pharmacyId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *licenseState;
@property (nonatomic, strong) NSString *licenseStateCode;
@property (nonatomic, strong) NSString *npi;
@property (nonatomic, strong) NSString *ein;
@property (nonatomic, strong) NSString *doingBusinessAs;
@property (nonatomic, strong) NSString *legalBusinessName;
@property (nonatomic, strong) NSString *companyType;
@property (nonatomic, strong) NSString *reimbursementType;
@property (nonatomic, strong) NSString *directDepositInfo;
@property (nonatomic, strong) NSString *dea;

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSMutableArray *wholesalers;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end



