//
//  RainbowView.h
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleLayer.h"
#import "SecCircleLayer.h"
#import "TrdCircleLayer.h"

@interface RainbowView : UIView{
    CircleLayer *arcToCircleLayer;
    SecCircleLayer *secCircleLayer;
    TrdCircleLayer *thdCircleLayer;
}
- (void)startAnimation;

@end
