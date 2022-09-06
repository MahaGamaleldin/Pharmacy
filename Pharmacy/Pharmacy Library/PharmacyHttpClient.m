//
//  PharmacyHttpClient.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "PharmacyHttpClient.h"
#import "AFNetworking.h"

@interface PharmacyHttpClient ()

{
    
}

@end

@implementation PharmacyHttpClient

+ (NSString *)getUrlForResource:(NSString *)resource {
    NSString *baseUrl = @"https://portal-test.rxmaxreturns.com/rxmax";
    NSString *url = [NSString stringWithFormat:@"%@%@",baseUrl,resource];
    NSLog(@"url: %@",url);
    return  url;
}

+ (void)loginWithUserName:(NSString *)userName
                  password:(NSString *)password
                completion:(PharmacyCompletionBlock)completion {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{@"username": userName,
                             @"password": password};
    [manager POST:[self getUrlForResource:@"/auth"] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"login response: %@", responseObject);
        completion(responseObject, nil);
        // save auth token as header

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"login error: %@", error);
        completion(nil, error.description);

        
    }];
    
}


@end
