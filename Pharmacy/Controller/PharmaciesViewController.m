//
//  PharmaciesViewController.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "PharmaciesViewController.h"

@interface PharmaciesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewPharmacies;

@end

@implementation PharmaciesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PharmacyHttpClient *client = [PharmacyHttpClient sharedInstance];
    [client getAllPharmaciesWithCompletion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
           
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
            printf("---error----");
            NSLog(@"%@",errorMessage);
        }
    }];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark: UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PharmaciesTableViewCell"];
    //delete + button from ui
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
