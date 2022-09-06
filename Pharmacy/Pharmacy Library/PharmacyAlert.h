//
//  PharmacyAlert.h
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PharmacyAlert : NSObject


+ (void) showErrorWithMessage:(NSString *) message fromViewController:(UIViewController *) currentViewController;

+ (void) showAlertWithTitle:(NSString *) title AndMessage:(NSString *) message fromViewController:(UIViewController *) currentViewController;

@end

NS_ASSUME_NONNULL_END
