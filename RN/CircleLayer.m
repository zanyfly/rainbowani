//
//  CircleLayer.m
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import "CircleLayer.h"
#import "COLOR.h"


@implementation CircleLayer


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
    
 
//    NSLog(@"%f", progress);
    
    if (progress == 0.99) {
        NSLog(@"0.99~~~~~~~~~");
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
 
//    NSLog(@"drawInContext.....%.2f", self.progress);

    [self setColors];
    
    UIColor *color =nil;
    
    if (self.progress == 1) {
        color = firstColor;
    }
    
    if(self.progress < 1.5){
        color = [self midColorWithFromColor:firstColor ToColor:secondColor Progress:(self.progress-1)/0.5];
    }

    
//    else if(self.progress == 2.99){
//        NSLog(@"self.progress == 3");
//    }
//    
    
    else if(self.progress < 2){
        color = [self midColorWithFromColor:secondColor ToColor:thirdColor Progress:(self.progress-1.5)/0.5];
    }
    

    
    
    else if(self.progress < 2.5){
        color = [self midColorWithFromColor:thirdColor ToColor:firstColor Progress:(self.progress-2)/0.5];
    }
    
 
 
    return color;
}
 
-(void) startAnimation
{

}

@end
