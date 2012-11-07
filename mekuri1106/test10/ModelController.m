//
//  ModelController.m
//  test10
//
//  Created by creapp on 2012/10/22.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        
//3.viewの指定
 
        _creappView1 = [[CreApp alloc]initWithFrame:CGRectMake(0, 0, 320, 480) :[UIColor redColor] :@"1"];
        _creappView2 = [[CreApp alloc]initWithFrame:CGRectMake(0, 0, 40, 40) :[UIColor greenColor] :@"2"];
        _creappView3 = [[CreApp alloc]initWithFrame:CGRectMake(0, 0, 40, 40) :[UIColor purpleColor] :@"3"];
        _ghostView1 = [[GhostView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) :[UIColor whiteColor] :@"4"];
                       
//4.viewの追加
        _pageData = [NSArray arrayWithObjects: _creappView2, _creappView3,_creappView1, _ghostView1,nil];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.pageData[index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source


// 前のページで呼ばれるのかな？
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

// 次のページで呼ばれる
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
