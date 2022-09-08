//
//  ReturnRequestsViewController.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "ReturnRequestsViewController.h"
#import "ReturnRequest.h"
#import "Wholesaler.h"
#import "ReturnRequestsTableViewCell.h"
#import "ItemsTableViewController.h"
#import "CreateReturnRequestViewController.h"

@interface ReturnRequestsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewReturnRequests;
@property (strong, nonatomic) NSMutableArray *returnRequests;

@end

@implementation ReturnRequestsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.returnRequests = [NSMutableArray new];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[PharmacyHttpClient sharedInstance] getReturnRequestsForPharmacy:self.pharmacy.pharmacyId withCompletion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            [self parseReturnRequests:responseObject];
           
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
        }
    }];
}

- (void) parseReturnRequests: (NSArray *)returnRequestsArray {
    
    for (NSDictionary *returnRequestDictionary in returnRequestsArray) {
        ReturnRequest *returnRequest = [[ReturnRequest alloc] initWithDictionary:returnRequestDictionary];
        [self.returnRequests addObject:returnRequest];
    }
    [self.tableViewReturnRequests reloadData];
}

- (IBAction)TappedCreateReturnRequest:(UIBarButtonItem *)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tappedCreateReturnRequest:(UIBarButtonItem *)sender {
    printf("\ntappedCreateReturnRequest");
    
    CreateReturnRequestViewController *createReturnRequestViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateReturnRequestViewController"];
    createReturnRequestViewController.pharmacy = self.pharmacy;
    [self.navigationController pushViewController:createReturnRequestViewController animated:YES];
}
#pragma mark: UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.returnRequests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReturnRequestsTableViewCell *cell = (ReturnRequestsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ReturnRequestsTableViewCell"];
    
    ReturnRequest *returnRequest = self.returnRequests[indexPath.row];
    cell.labelReturnRequestID.text = returnRequest.returnRequestId;
    cell.labelStatus.text = returnRequest.returnRequestStatus;
    cell.labelServiceType.text = returnRequest.serviceType;
    cell.labelNumberOfItems.text = [NSString stringWithFormat:@"%d", returnRequest.numberOfItems.intValue];
    cell.labelCreatedAt.text = returnRequest.createdAt;
    cell.labelAssociatedWholesaler.text = returnRequest.wholesaler.name;
    if (returnRequest.numberOfItems.intValue > 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ReturnRequest *returnRequest = self.returnRequests[indexPath.row];
    if (returnRequest.numberOfItems.intValue > 0) {
        // go to items screen
        ItemsTableViewController *itemsTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemsTableViewController"];
        itemsTableViewController.returnRequest = returnRequest;
        [self.navigationController pushViewController:itemsTableViewController animated:YES];
    }
}

@end
