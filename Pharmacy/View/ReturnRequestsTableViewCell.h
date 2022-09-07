//
//  ReturnRequestsTableViewCell.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReturnRequestsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelReturnRequestID;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;
@property (weak, nonatomic) IBOutlet UILabel *labelServiceType;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberOfItems;
@property (weak, nonatomic) IBOutlet UILabel *labelCreatedAt;
@property (weak, nonatomic) IBOutlet UILabel *labelAssociatedWholesaler;

@end

NS_ASSUME_NONNULL_END
