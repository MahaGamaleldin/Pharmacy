//
//  ItemsTableViewController.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "ItemsTableViewController.h"
#import "Item.h"
#import "ItemsTableViewCell.h"

@interface ItemsTableViewController ()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation ItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.items = [NSMutableArray new];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[PharmacyHttpClient sharedInstance] getItemsForReturnRequests:self.returnRequest.returnRequestId andPharmacy:self.returnRequest.pharmacy.pharmacyId withCompletion:^(id responseObject, NSString *errorMessage) {
        if(responseObject) {
            [self parseItems:responseObject];
           
        } else {
            [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
        }
    }];
    
}

- (void) parseItems: (NSArray *)itemsArray {
    
    for (NSDictionary *itemDictionary in itemsArray) {
        Item *item = [[Item alloc] initWithDictionary:itemDictionary];
        [self.items addObject:item];
    }
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsTableViewCell *cell = (ItemsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ItemsTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Item *item = self.items[indexPath.row];
    cell.labelNDC.text = [NSString stringWithFormat:@"NDC: %@", item.ndc];
    cell.labelDescription.text = [NSString stringWithFormat:@"Description: %@", item.itemDescription];
    cell.labelManufacturer.text = [NSString stringWithFormat:@"Manufacturer: %@" ,item.manufacturer];
    cell.labelFullQuantity.text = [NSString stringWithFormat:@"Full Quantity: %@",item.fullQuantity];
    cell.labelPartialQuantity.text = [NSString stringWithFormat:@"Partial Quantity: %@",item.partialQuantity];
    cell.labelExpirationDate.text = [NSString stringWithFormat:@"expiration Date: %@",item.expirationDate];
    cell.labelLotNumber.text = [NSString stringWithFormat:@"lotNumber: %@",item.lotNumber];

    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Item *item = self.items[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        [[PharmacyHttpClient sharedInstance] deleteItem:item.itemId fromReturnRequest:self.returnRequest.returnRequestId ofPhamacy:self.returnRequest.pharmacy.pharmacyId withCompletion:^(id responseObject, NSString *errorMessage) {
            if(!errorMessage) {
               // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.items removeObject:item];
                [self.tableView reloadData];
               
            } else {
                [PharmacyAlert showErrorWithMessage:errorMessage fromViewController:self];
            }
            
        }];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
