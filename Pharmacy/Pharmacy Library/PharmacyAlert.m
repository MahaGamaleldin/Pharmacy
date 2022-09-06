//
//  PharmacyAlert.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "PharmacyAlert.h"

@implementation PharmacyAlert

+ (void) showErrorWithMessage:(NSString *) message fromViewController:(UIViewController *) currentViewController {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];

    [alert addAction:defaultAction];
    [currentViewController presentViewController:alert animated:YES completion:nil];
}

+ (void) showAlertWithTitle:(NSString *) title AndMessage:(NSString *) message fromViewController:(UIViewController *) currentViewController {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];

    [alert addAction:defaultAction];
    [currentViewController presentViewController:alert animated:YES completion:nil];
}






@end
