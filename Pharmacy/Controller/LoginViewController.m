//
//  LoginViewController.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "LoginViewController.h"
#import "PharmacyAlert.h"
#import "PharmacyHttpClient.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    [PharmacyHttpClient loginWithUserName:self.textFieldUserName.text password:self.textFieldPassword.text completion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            NSLog(@"login responseObject: %@",responseObject);
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];

        }
    }];
}

@end
