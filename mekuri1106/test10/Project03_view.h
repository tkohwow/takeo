//
//  CreApp.h
//  test10
//
//  Created by creapp on 2012/11/02.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Project03_view : UIView
{
    NSString* _touchStr;
    UIImage*        _image_standard;// 画像(普通)
    UIImage*        _image_push;    // 画像(押したとき）
    int             _switch;        // 切り替え(0 = 普通, 1 = 押したとき)
}
- (id)initWithFrame:(CGRect)frame:(UIColor*)hogehoge:(NSString *)str;
@end
