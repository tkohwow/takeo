//
//  GhostView.m
//  test10
//
//  Created by creapp on 2012/11/06.
//  Copyright (c) 2012年 Creative Application. All rights reserved.
//

#import "GhostView.h"

@implementation GhostView

- (id)initWithFrame:(CGRect)frame:(UIColor*)hogehoge:(NSString *)str
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = hogehoge;
        
        // NSTimerを設定
        _timer = [NSTimer
                  scheduledTimerWithTimeInterval:0.01f
                  target:self
                  selector:@selector(renew:)  // この関数を呼ぶ
                  userInfo:nil      // null
                  repeats:YES// 繰り返し
                  ];
        
        _timerCount = 0;
        _switch = 0;
        _ghost_x     = 100;
        _ghost_y     = 200;
        _ghost_w     = 70;
        _ghost_h     = 70;
        
        
		// 画像の読み込み
		_image_standard = [UIImage imageNamed:@"_akaiGhost.png"];
        _viewImgGhost = [[UIImageView alloc] initWithFrame:CGRectMake(_ghost_x, _ghost_y, _ghost_w, _ghost_h)];
        
        _viewImgGhost.image = _image_standard;
        
        [self addSubview:_viewImgGhost];
	}
    return self;
}





-(void)renew:(NSTimer*)timer{
    if(_switch == 0){
        _ghost_y += 0.1;
        _ghost_x += 0.1;
        _ghost_h += 0.1;
        _ghost_w += 0.1;
    }
    else if(_switch == 1){
        _ghost_y -=0;
        _ghost_x -=1;
        _ghost_h -= 1;
        _ghost_w -= 1;
    }
    else if(_switch == 2){
        _ghost_y -=3;
        _ghost_x +=1;
        _ghost_h += 0.5;
        _ghost_w += 0.5;
    }
    else if(_switch == 3){
        _ghost_y +=2;
        _ghost_x -=1;
        _ghost_h += 1;
        _ghost_w += 1;
    }
    
    else if(_switch == 4){
        _ghost_y +=0.3;
        _ghost_x -=1.5;
        _ghost_h -= 0.4;
        _ghost_w -= 0.4;
    }
    
    else if(_switch == 5){
        _ghost_y -=0.3;
        _ghost_x +=0.5;
        _ghost_h -= 0.2;
        _ghost_w -= 0.2;
    }
    if(_switch >= 6){
        _switch = 0;
    }
    //BOOL=中にtrue(yes)かfalse(no)を入れる箱。if文の条件に入れると、trueだと通る。
    if (_viewImgGhost.alpha >= 1.0) {
        pm = YES;
    }else if(_viewImgGhost.alpha < 0.0){
        pm = NO;
    }
    
    if (pm) {
        _viewImgGhost.alpha -= 0.01;
    }else {
        _viewImgGhost.alpha += 0.01;
    }
    
    [self setNeedsDisplay];
}



// 画面に何かを描くとき使います
- (void)drawRect:(CGRect)rect {
    
    // ビューを位置を変更
    _viewImgGhost.frame = CGRectMake(_ghost_x, _ghost_y, _ghost_w, _ghost_h);
    
    // 画面に貼り付ける
    [self addSubview:_viewImgGhost];
    
}


// タッチ開始イベント
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {

    _switch += 1;
    NSLog(@"%d",_switch);
   
}


// タッチ移動イベント
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
}


// タッチ終了イベント
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  
}


// タッチキャンセルイベント
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
    _switch = 0;               // _switchを0に変更
    [self setNeedsDisplay];    // 再描画（drawRectが呼ばれる）
}

@end
