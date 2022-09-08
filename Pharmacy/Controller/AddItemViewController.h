//
//  AddItemViewController.h
//  Pharmacy
//
//  Created by Maha on 9/7/22.
//

#import <UIKit/UIKit.h>
#import "ReturnRequest.h"
#import "Pharmacy.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddItemViewController : UIViewController

@property (strong, nonatomic) ReturnRequest *returnRequest;
@property (strong, nonatomic) Pharmacy *pharmacy;

@end

NS_ASSUME_NONNULL_END
