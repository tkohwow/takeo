//
//  DataViewController.h
//  test10
//
//  Created by creapp on 2012/10/22.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelController;

@interface DataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *dataLabel;


@property (strong, nonatomic) id dataObject;

@end
