//
//  RainbowView.h
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleLayer;
@class SecCircleLayer;
@class TrdCircleLayer;


@interface RainbowView : UIView{
    CircleLayer *arcToCircleLayer;
    SecCircleLayer *secCircleLayer;
    TrdCircleLayer *thdCircleLayer;
}
- (void)startAnimation;
-(void)stopAnimation;
@end
