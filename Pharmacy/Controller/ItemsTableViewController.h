//
//  ItemsTableViewController.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <UIKit/UIKit.h>
#import "ReturnRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemsTableViewController : UITableViewController

@property(strong, nonatomic) ReturnRequest *returnRequest;

@end

NS_ASSUME_NONNULL_END
