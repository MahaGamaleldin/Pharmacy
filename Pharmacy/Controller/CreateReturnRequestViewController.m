//
//  CreateReturnRequestViewController.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "CreateReturnRequestViewController.h"
#import "ReturnRequest.h"
#import "Wholesaler.h"

@interface CreateReturnRequestViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewWholesalers;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlSelectServiceType;

@property (strong, nonatomic) NSMutableArray *wholesalers;
@property (strong, nonatomic) Wholesaler *selectedWholesaler;
@property (strong, nonatomic) NSString *selectedServiceType;

@end

@implementation CreateReturnRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.wholesalers = [NSMutableArray new];
    self.selectedServiceType = @"EXPRESS_SERVICE";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[PharmacyHttpClient sharedInstance] getWholesalersForPharmacy:self.pharmacy.pharmacyId withCompletion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            [self parseWholesalers:responseObject];
           
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
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
- (IBAction)tappedSubmit:(UIButton *)sender {
    
    switch (self.segmentedControlSelectServiceType.selectedSegmentIndex) {
        case 1:
            self.selectedServiceType = @"FULL_SERVICE";
            break;
            
        default:
            self.selectedServiceType = @"EXPRESS_SERVICE";
            break;
    }
    if (self.selectedWholesaler == nil) {
        [PharmacyAlert showErrorWithMessage:@"Select Wholesaler!" fromViewController:self];
    }
    else {
        [self submitReturnRequest];
    }
    NSLog(@"\n--selectedWholesaler: %@ -- self.selectedServiceType: %@---",self.selectedWholesaler.name, self.selectedServiceType);
    
    
}

- (void) parseWholesalers: (NSArray *)wholesalersArray {
    
    for (NSDictionary *wholesalerDictionary in wholesalersArray) {
        Wholesaler *wholesaler = [[Wholesaler alloc] initWithDictionary:wholesalerDictionary];
        [self.wholesalers addObject:wholesaler];
    }
    [self.tableViewWholesalers reloadData];
}

- (void) submitReturnRequest {
    
    [[PharmacyHttpClient sharedInstance] createReturnRequestForServiceType:self.selectedServiceType wholesalerId:self.selectedWholesaler.wholesalerId andPharmacyID:self.pharmacy.pharmacyId withCompletion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            printf("GO TO ADD ITEM");
           
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
        }
    }];
}

#pragma mark: UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.wholesalers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wholesalersTableViewCell"];
    
    Wholesaler *wholesaler = self.wholesalers[indexPath.row];
    cell.textLabel.text = wholesaler.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedWholesaler = self.wholesalers[indexPath.row];

}

@end
