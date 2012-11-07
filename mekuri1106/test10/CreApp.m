//
//  CreApp.m
//  test10
//
//  Created by creapp on 2012/11/02.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import "CreApp.h"

@implementation CreApp

- (id)initWithFrame:(CGRect)frame:(UIColor*)hogehoge:(NSString *)str
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = hogehoge;
        
        _touchStr = [[NSString alloc]initWithString:str];
        
        _image_standard = [UIImage imageNamed:@"Project03_1.png"];
        _image_push     = [UIImage imageNamed:@"Project03_2.png"];
        _switch         = 0;    // 最初は0を入れておく
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if(_switch == 0){
        // 画像を表示(320 x 320のサイズで描画)
        [_image_standard drawInRect:CGRectMake(0,60, 320, 320)];
    }
    
    // _switchが1なら、push画像を描画
    if(_switch == 1){
        // 画像を表示(320 x 320のサイズで描画)
        [_image_push drawInRect:CGRectMake(0,60, 320, 320)];
    }

}

// タッチ開始イベント
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	_switch = 1;               // _switchを1に変更
    [self setNeedsDisplay];    // 再描画（drawRectが呼ばれる）
}


// タッチ移動イベント
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
}


// タッチ終了イベント
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	_switch = 0;               // _switchを0に変更
    [self setNeedsDisplay];    // 再描画（drawRectが呼ばれる）
}


// タッチキャンセルイベント
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
	_switch = 0;               // _switchを0に変更
    [self setNeedsDisplay];    // 再描画（drawRectが呼ばれる）
}



@end
