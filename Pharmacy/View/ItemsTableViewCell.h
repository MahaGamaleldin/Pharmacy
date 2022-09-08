//
//  ItemsTableViewCell.h
//  Pharmacy
//
//  Created by Maha on 9/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelNDC;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelManufacturer;
@property (weak, nonatomic) IBOutlet UILabel *labelFullQuantity;
@property (weak, nonatomic) IBOutlet UILabel *labelPartialQuantity;
@property (weak, nonatomic) IBOutlet UILabel *labelExpirationDate;

@property (weak, nonatomic) IBOutlet UILabel *labelLotNumber;
@end

NS_ASSUME_NONNULL_END
