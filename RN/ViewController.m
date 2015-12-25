//
//  ViewController.m
//  RN
//
//  Created by ZengYuan on 15/12/21.
//  Copyright © 2015年 ZengYuan. All rights reserved.
//

#import "ViewController.h"
#import "RainbowView.h"

@interface ViewController ()
{
    IBOutlet RainbowView *rv;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [rv startAnimation];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
