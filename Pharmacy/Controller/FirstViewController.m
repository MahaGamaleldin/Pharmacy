//
//  FirstViewController.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#import "PharmaciesViewController.h"
#import "PharmacyHttpClient.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([[NSUserDefaults standardUserDefaults] stringForKey:kUserLoginToken]) {
        
        UINavigationController *pharmaciesNavigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"PharmaciesNavigationController"];
        pharmaciesNavigationController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:pharmaciesNavigationController animated:NO completion:nil];
        
    } else {
        LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        loginViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:loginViewController animated:NO completion:nil];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
