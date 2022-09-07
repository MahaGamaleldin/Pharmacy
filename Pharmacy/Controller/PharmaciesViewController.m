//
//  PharmaciesViewController.m
//  Pharmacy
//
//  Created by Maha on 9/6/22.
//

#import "PharmaciesViewController.h"
#import "Pharmacy.h"
#import "ReturnRequestsViewController.h"

@interface PharmaciesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewPharmacies;
@property (strong, nonatomic) NSMutableArray *pharmacies;

@end

@implementation PharmaciesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pharmacies = [NSMutableArray new];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PharmacyHttpClient *client = [PharmacyHttpClient sharedInstance];
    [client getAllPharmaciesWithCompletion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            [self parsePharmacies:responseObject];
           
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
        }
    }];
    
}

- (void) parsePharmacies: (NSArray *)pharmaciesArray {
    
    for (NSDictionary *pharmacyDictionary in pharmaciesArray) {
        Pharmacy *pharmacy = [[Pharmacy alloc] initWithDictionary:pharmacyDictionary];
        [self.pharmacies addObject:pharmacy];
    }
    [self.tableViewPharmacies reloadData];
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
    printf("\n--- self.pharmacies.count = %d ---", self.pharmacies.count);
    return self.pharmacies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PharmaciesTableViewCell"];
    //delete + button from ui
    Pharmacy *pharmacy = self.pharmacies[indexPath.row];
    cell.textLabel.text = pharmacy.legalBusinessName;
    if (pharmacy.wholesalers.count > 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Pharmacy *pharmacy = self.pharmacies[indexPath.row];
    if (pharmacy.wholesalers.count > 0) {
        // go to return requests screen
        ReturnRequestsViewController *returnRequestsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ReturnRequestsViewController"];
        returnRequestsViewController.pharmacy = pharmacy;
        [self.navigationController pushViewController:returnRequestsViewController animated:YES];
    }
}

@end
