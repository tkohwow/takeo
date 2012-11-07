//
//  ModelController.h
//  test10
//
//  Created by creapp on 2012/10/22.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

//1.クラスをインポート

#import <UIKit/UIKit.h>
#import "CreApp.h"
#import "GhostView.h"

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>{
  
//2.クラスを変数に入れる
    GhostView* _ghostView1;
    CreApp* _creappView1;
    CreApp* _creappView2;
    CreApp* _creappView3; 
 }
- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
