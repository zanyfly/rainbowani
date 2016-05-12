//
//  Config.h
//  RN
//
//  Created by zengyuan on 16/5/12.
//  Copyright © 2016年 ZengYuan. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define RGBA(r,g,b,a) [UIColor colorWithRed:((r)/255.0f) green:((g)/255.0f) blue:((b)/255.0f) alpha:(a)]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//rainbow
#define T1_COLOR RGB(253,176,199)
#define T2_COLOR RGB(238,251,131)
#define T3_COLOR RGB(104,232,230)

#endif /* Config_h */
