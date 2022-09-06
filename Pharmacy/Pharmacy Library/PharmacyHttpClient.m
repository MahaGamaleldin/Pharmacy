//
//  PharmacyHttpClient.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//


#import "PharmacyHttpClient.h"
#import "AFNetworking.h"

NSString * const kUserLoginToken = @"userLoginToken";

@interface PharmacyHttpClient ()

{
}
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation PharmacyHttpClient

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        _sessionManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    }
    return self;
}

- (NSString *)getUrlForResource:(NSString *)resource {
    NSString *baseUrl = @"https://portal-test.rxmaxreturns.com/rxmax";
    NSString *url = [NSString stringWithFormat:@"%@%@",baseUrl,resource];
    NSLog(@"url: %@",url);
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


@end
