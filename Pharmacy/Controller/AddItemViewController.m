//
//  AddItemViewController.m
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import "AddItemViewController.h"
#import "Item.h"

@interface AddItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldNdc;
@property (weak, nonatomic) IBOutlet UITextField *textFieldItemDescription;
@property (weak, nonatomic) IBOutlet UITextField *textFieldManufacturer;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPackageSize;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRequestType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldStrength;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDosage;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFullQuantity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPartialQuantity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldExpirationDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldStatus;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLotNumber;

@property (strong, nonatomic) Item *item;

@end

@implementation AddItemViewController

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
- (IBAction)tappedAddItem:(UIButton *)sender {
    
    self.item = [Item new];
    self.item.ndc = self.textFieldNdc.text;
    self.item.itemDescription = self.textFieldItemDescription.text;
    self.item.manufacturer = self.textFieldManufacturer.text;
    self.item.packageSize = self.textFieldPackageSize.text;
    self.item.requestType = self.textFieldRequestType.text;
    self.item.name = self.textFieldName.text;
    self.item.strength = self.textFieldStrength.text;
    self.item.dosage = self.textFieldDosage.text;
    self.item.fullQuantity = self.textFieldFullQuantity.text;
    self.item.partialQuantity = self.textFieldPartialQuantity.text;
    self.item.expirationDate = self.textFieldExpirationDate.text;
    self.item.status = self.textFieldStatus.text;
    self.item.lotNumber = self.textFieldLotNumber.text;
    
    // call end point
    //on completion prompt add another or done-> items list
    [self showAddOrDoneAlert];
}

- (void) showAddOrDoneAlert {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Item Added Successfully"
                               message:@"What to do next?"
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* addButton = [UIAlertAction actionWithTitle:@"Add Item"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action)
    {
        NSLog(@"clear !");
        [self addNewItem];
    }];

    UIAlertAction* doneButton = [UIAlertAction actionWithTitle:@"Done"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action)
    {
        NSLog(@"go to items");
    }];

    [alert addAction:addButton];
    [alert addAction:doneButton];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) addNewItem {
    self.item = [Item new];
    self.textFieldNdc.text = @"";
    self.textFieldItemDescription.text = @"";
    self.textFieldManufacturer.text = @"";
    self.textFieldPackageSize.text = @"";
    self.textFieldRequestType.text = @"";
    self.textFieldName.text = @"";
    self.textFieldStrength.text = @"";
    self.textFieldDosage.text = @"";
    self.textFieldFullQuantity.text = @"";
    self.textFieldPartialQuantity.text = @"";
    self.textFieldExpirationDate.text = @"";
    self.textFieldStatus.text = @"";
    self.textFieldLotNumber.text = @"";
}

@end
