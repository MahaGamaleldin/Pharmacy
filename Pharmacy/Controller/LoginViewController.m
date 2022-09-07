//
//  LoginViewController.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "LoginViewController.h"
#import "PharmaciesViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tappedLoginButton:(UIButton *)sender {
    if ([self isValidInput]) {
        

        [self login];
    }
}

- (BOOL)isValidInput {
    
    if (self.textFieldUserName.text.length == 0) {
        [PharmacyAlert showErrorWithMessage:@"Enter user name" fromViewController:self];
        
        return  NO;
    }
    
    if (self.textFieldPassword.text.length == 0) {
        [PharmacyAlert showErrorWithMessage:@"Enter password" fromViewController:self];
        return  NO;
    }
    
    return  YES;
}

- (void) login {
    PharmacyHttpClient *client = [PharmacyHttpClient sharedInstance];
    [client loginWithUserName:@"ghazala" password:@"ghazala123" completion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            NSString *token = responseObject[@"token"];
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:kUserLoginToken];
            [client addUserTokenToSession];
            [self goToPharmaciesViewControllerAnimated];
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];

        }
    }];
}

- (void) goToPharmaciesViewControllerAnimated{
    
    UINavigationController *pharmaciesNavigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"PharmaciesNavigationController"];
    pharmaciesNavigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:pharmaciesNavigationController animated:YES completion:nil];
}

@end
