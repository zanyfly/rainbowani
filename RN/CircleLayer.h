//
//  CircleLayer.h
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


#define FIR_CLOR T1_COLOR
#define SEN_CLOR T2_COLOR
#define TRD_CLOR T3_COLOR



#define kLineWidth 8.f

#define kRadius    40.f


@interface CircleLayer : CALayer
{
//    int index;
    UIColor *firstColor;
    UIColor *secondColor;
    UIColor *thirdColor;

}
// First, second, third color for animating

@property (nonatomic) CGFloat progress;

-(void) startAnimation;

@end
