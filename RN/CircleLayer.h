//
//  CircleLayer.h
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>



#define FIR_CLOR [UIColor redColor]
#define SEN_CLOR [UIColor yellowColor]
#define TRD_CLOR [UIColor blueColor]



#define kLineWidth 5.f

#define kRadius    22.f


@interface CircleLayer : CALayer
{
//    int index;
    UIColor *firstColor;
    UIColor *secondColor;
    UIColor *thirdColor;

}
// First, second, third color for animating

@property (nonatomic) CGFloat progress;

-(id)init;
//
//@property (weak, nonatomic) UIColor *firstColor;
//@property (weak, nonatomic) UIColor *secondColor;
//@property (weak, nonatomic) UIColor *thirdColor;


-(void) startAnimation;

@end
