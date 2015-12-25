
//
//  RainbowView.m
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import "RainbowView.h"

@interface RainbowView ()
@end

@implementation RainbowView

#pragma mark - public
- (void)startAnimation {
    [self reset];
    [self step];
//    [self doStep1];
}

#pragma mark - animation
- (void)reset {
    [arcToCircleLayer removeFromSuperlayer];
}


-(void)step{
    
    arcToCircleLayer = [[CircleLayer alloc]init];
    
    [self.layer addSublayer:arcToCircleLayer];
    
//    宽40  彩虹宽4
    
    arcToCircleLayer.bounds = CGRectMake(0, 0, kRadius * 2 + kLineWidth, kRadius * 2 + kLineWidth);
    arcToCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    //    [arcToCircleLayer setNeedsDisplay];
    
    //    [arcToCircleLayer startAnimation];
    
    secCircleLayer=[[SecCircleLayer alloc]init];
    [self.layer addSublayer:secCircleLayer];
    secCircleLayer.bounds = CGRectMake(0, 0, arcToCircleLayer.bounds.size.width -  2*kLineWidth, arcToCircleLayer.bounds.size.width -  2*kLineWidth);
    secCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    
    thdCircleLayer=[[TrdCircleLayer alloc]init];
    [self.layer addSublayer:thdCircleLayer];
    thdCircleLayer.bounds = CGRectMake(0, 0, secCircleLayer.bounds.size.width -  2*kLineWidth, secCircleLayer.bounds.size.width -  2*kLineWidth);
    thdCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 4;
    animation.fromValue = @1;
    animation.toValue = @4;
    animation.repeatCount = MAXFLOAT;
    [arcToCircleLayer addAnimation:animation forKey:nil];
    
    
    animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 4;
    animation.fromValue = @1;
    animation.toValue = @4;
    animation.repeatCount = MAXFLOAT;
    [secCircleLayer addAnimation:animation forKey:nil];
    
    animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 4;
    animation.fromValue = @1;
    animation.toValue = @4;
    animation.repeatCount = MAXFLOAT;
    [thdCircleLayer addAnimation:animation forKey:nil];

}

//- (void)doStep1 {
//    self.arcToCircleLayer2 = [ArcToCircleLayer layer];
//    [self.layer addSublayer:self.arcToCircleLayer2];
//    
//    self.arcToCircleLayer2.bounds = CGRectMake(0, 0, kRadius * 2 + kLineWidth, kRadius * 2 + kLineWidth);
//    self.arcToCircleLayer2.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
//    
//    // animation
//    self.arcToCircleLayer2.progress = 1; // end status
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
//    animation.duration = kStep1Duration;
//    animation.fromValue = @0.0;
//    animation.toValue = @1.0;
//    [self.arcToCircleLayer2 addAnimation:animation forKey:nil];
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
