//
//  GhostView.h
//  test10
//
//  Created by creapp on 2012/11/06.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GhostView : UIView{
    UIImageView*    _viewImgGhost;
    UIImage*        _image_standard;// 画像(普通)
    NSTimer*        _timer;     // タイマー
    UIButton*       _button;
    int             _timerCount;
    
    double             _ghost_x;    // x座標
    double             _ghost_y;    // y座標
    double             _ghost_w;    // 幅
    double             _ghost_h;    // 高さ
    double             _touch_x;
    double             _touch_y;
    int             _switch;
    BOOL            pm;
}
- (id)initWithFrame:(CGRect)frame:(UIColor*)hogehoge:(NSString *)str;

@end
