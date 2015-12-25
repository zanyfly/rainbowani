//
//  CircleLayer.m
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import "CircleLayer.h"


// firstC = [UIColor redColor];



@implementation CircleLayer




- (UIColor*)flatAlizarinColor {
    return [UIColor colorWithRed:231.0f/255.0f
                           green:76.0f/255.0f
                            blue:60.0f/255.0f
                           alpha:1.0f];
}

- (UIColor*)flatPomegranateColor {
    return [UIColor colorWithRed:192.0f/255.0f
                           green:57.0f/255.0f
                            blue:43.0f/255.0f
                           alpha:1.0f];
}

- (UIColor*)flatCloudColor {
    return [UIColor colorWithRed:236.0f/255.0f
                           green:240.0f/255.0f
                            blue:241.0f/255.0f
                           alpha:1.0f];
}


-(id)initWithColors:(NSArray *)colors{

    
    self = [super init];

     return self;
}


+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx {
    NSLog(@"drawInContext.....%.2f", self.progress);
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2 - kLineWidth / 2;
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)+2);
    
    // O
//    CGFloat originStart = M_PI * 7 / 2;
//    CGFloat originEnd = M_PI * 2;
//    CGFloat currentOrigin = originStart - (originStart - originEnd) * self.progress;
    CGFloat currentOrigin=0;
    
    // D
//    CGFloat destStart = M_PI * 3;
//    CGFloat destEnd = 0;
    CGFloat currentDest = M_PI;
//    destStart - (destStart - destEnd) * self.progress;
    
    [path addArcWithCenter:center radius:radius startAngle: currentOrigin endAngle:currentDest clockwise:NO];
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, kLineWidth);
    CGContextSetStrokeColorWithColor(ctx, [self ret].CGColor);
    CGContextStrokePath(ctx);

}

-(UIColor *)midColorWithFromColor:(UIColor *)fromColor ToColor:(UIColor*)toColor Progress:(CGFloat)progress{
    
    if(progress<0){
        progress = 0;
    }
    
    if(progress>1){
        progress = 1;
    }
    
    CGFloat fromR = 0.0,fromG = 0.0,fromB = 0.0,fromAlpha = 0.0;
    [fromColor getRed:&fromR green:&fromG blue:&fromB alpha:&fromAlpha];
    CGFloat toR = 0.0,toG = 0.0,toB = 0.0,toAlpha = 0.0;
    [toColor getRed:&toR green:&toG blue:&toB alpha:&toAlpha];
    CGFloat oneR = fromR + (toR - fromR) * progress;
    CGFloat oneG = fromG + (toG - fromG) * progress;
    CGFloat oneB = fromB + (toB - fromB) * progress;
    CGFloat oneAlpha = fromAlpha + (toAlpha - fromAlpha) * progress;
    UIColor * onecolor = [UIColor colorWithRed:oneR green:oneG blue:oneB alpha:oneAlpha];
    return onecolor;
}

-(void)setColors{
    firstColor = FIR_CLOR;
    secondColor = SEN_CLOR;
    thirdColor = TRD_CLOR;

}

-(UIColor *)ret{
 
    [self setColors];
    
    UIColor *color =nil;
    
    if (self.progress == 1.01) {
        color = firstColor;
    }
    
    if(self.progress < 2){
        color = [self midColorWithFromColor:firstColor ToColor:secondColor Progress:(self.progress-1)/1];
    }

    
    else if(self.progress < 3){
        color = [self midColorWithFromColor:secondColor ToColor:thirdColor Progress:(self.progress-2)/1];
    }
    
    else if(self.progress < 4){
        color = [self midColorWithFromColor:thirdColor ToColor:firstColor Progress:(self.progress-3)/1];
    }
    
 
    return color;
}

//-(CAAnimationGroup *) animationGroup{
//    CAAnimationGroup *group;
//    CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
//
//    colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
//                               [NSNumber numberWithFloat:0.1667f],
//                               [NSNumber numberWithFloat:0.333f],
//                               [NSNumber numberWithFloat:0.5f],
//                               [NSNumber numberWithFloat:0.667f],
//                               [NSNumber numberWithFloat:0.833f],
//                               [NSNumber numberWithFloat:1.0f]];
//    colorKeyframe.values = @[(id)_firstColor.CGColor,
//                             (id)_firstColor.CGColor,
//                             (id)_secondColor.CGColor,
//                             (id)_secondColor.CGColor,
//                             (id)_thirdColor.CGColor,
//                             (id)_thirdColor.CGColor,
//                             (id)_firstColor.CGColor,];
//    colorKeyframe.duration = 3.0f;
//    colorKeyframe.repeatCount = HUGE_VAL;
// 
//    group = [CAAnimationGroup animation];
//    group.duration = 3.0f;
//    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    group.repeatCount  =HUGE_VAL;
//    group.animations = @[colorKeyframe];
//    
//    return group;
//}

//-(void) animate
//{
//    CAAnimationGroup * _animationGroup = [self animationGroup];
//    [self addAnimation:_animationGroup forKey:@"group"];
//}
-(void) startAnimation
{
//    [self animate];
    //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animate) userInfo:nil repeats:YES];
}

@end
