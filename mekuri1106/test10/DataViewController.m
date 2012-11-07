//
//  DataViewController.m
//  test10
//
//  Created by creapp on 2012/10/22.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import "DataViewController.h"
#import "ModelController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.dataLabel addSubview:self.dataObject];
 }

@end
