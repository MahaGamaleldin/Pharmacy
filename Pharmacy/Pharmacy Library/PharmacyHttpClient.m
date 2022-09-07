//
//  PharmacyHttpClient.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//


#import "PharmacyHttpClient.h"
#import "AFNetworking.h"

NSString * const kUserLoginToken = @"userLoginToken";
NSString * const kHTTPHeaderAuthorizationkey = @"Authorization";

@interface PharmacyHttpClient ()

{
    
}

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation PharmacyHttpClient

+ (instancetype) sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once( &pred, ^{
        _sharedObject = [[self alloc] init];
    });
    
return _sharedObject;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        _sessionManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
        [self addUserTokenToSession];
    }
    return self;
}

- (void) addUserTokenToSession {
    NSString *userLoginToken = [[NSUserDefaults standardUserDefaults] stringForKey:kUserLoginToken];
    if(userLoginToken != nil) {
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSString *bearerToken = [NSString stringWithFormat:@"Bearer %@",userLoginToken];
        [_sessionManager.requestSerializer setValue:bearerToken forHTTPHeaderField:kHTTPHeaderAuthorizationkey];
       
        
        
        NSLog(@"\n----bearerToken: %@\n",bearerToken);
    }
}

- (NSString *)getUrlForResource:(NSString *)resource {
    NSString *baseUrl = @"https://portal-test.rxmaxreturns.com/rxmax";
    NSString *url = [NSString stringWithFormat:@"%@%@",baseUrl,resource];
    NSLog(@"----url: %@",url);
    return  url;
}

- (void)loginWithUserName:(NSString *)userName
                  password:(NSString *)password
                completion:(PharmacyCompletionBlock)completion {
    

    NSDictionary *params = @{@"username": userName,
                             @"password": password};
    [self.sessionManager POST:[self getUrlForResource:@"/auth"] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        if (completion) completion(responseObject, nil);
        // save auth token as header

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (completion) completion(nil, error.description);
    }];
    
}

-(void)getAllPharmaciesWithCompletion:(PharmacyCompletionBlock)completion {
    [self.sessionManager GET:[self getUrlForResource:@"/pharmacies"] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        printf("\n----pharmacies----\n");
        NSLog(@"%@",responseObject);
        printf("\n----------------------------------\n");
        if (completion) completion(responseObject, nil);

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (completion) completion(nil, error.description);
    }];
}

- (void) getReturnRequestsForPharmacy: (NSString *) pharmacyId withCompletion:(PharmacyCompletionBlock)completion {
    
    NSString *urlStr = [NSString stringWithFormat:@"/pharmacies/%@/returnrequests", pharmacyId];
    NSLog(@"\n--url: %@--\n", urlStr);
    [self.sessionManager GET:[self getUrlForResource:urlStr] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        printf("\n----returnrequests----\n");
        NSLog(@"%@",responseObject);
        printf("\n----------------------------------\n");
        if (completion) completion(responseObject, nil);

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (completion) completion(nil, error.description);
    }];
}

@end
