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

@interface ReturnRequestsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewReturnRequests;
@property (strong, nonatomic) NSArray *returnRequests;

@end

@implementation ReturnRequestsViewController



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

- (IBAction)tappedCreateReturnRequest:(UIBarButtonItem *)sender {
    printf("\ntappedCreateReturnRequest");
}
#pragma mark: UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return self.returnRequests.count;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReturnRequestsTableViewCell *cell = (ReturnRequestsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ReturnRequestsTableViewCell"];
    
    ReturnRequest *returnRequest = self.returnRequests[indexPath.row];
    cell.labelReturnRequestID.text = returnRequest.returnRequestId;
    cell.labelStatus.text = returnRequest.status;
    cell.labelServiceType.text = returnRequest.serviceType;
    cell.labelNumberOfItems.text = returnRequest.numberOfItems;
    cell.labelCreatedAt.text = returnRequest.createdAt;
    cell.labelAssociatedWholesaler.text = returnRequest.associatedWholesaler.wholesalerId;

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ReturnRequest *returnRequest = self.returnRequests[indexPath.row];
    // go to items screen
}

@end
