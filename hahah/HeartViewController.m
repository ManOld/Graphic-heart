//
//  HeartViewController.m
//  hahah
//
//  Created by admin on 2017/4/25.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "HeartViewController.h"
#import "DMHeartFlyView.h"
#import "CustomView.h"

@interface HeartViewController (){
  
        CGFloat _heartSize;
    
   
}

@end

@implementation HeartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _heartSize = 36;
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.userInteractionEnabled = YES;
  
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch)];
        [self.view addGestureRecognizer:tap];
   
}

-(void)touch{
      if (self.state==2) {
    DMHeartFlyView* heart = [[DMHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, _heartSize, _heartSize)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(150 + _heartSize/2.0, self.view.bounds.size.height - _heartSize/2.0 - 10);
    heart.center = fountainSource;
    [heart animateInView:self.view];
      }else{
          CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
          [self.view addSubview:customView];
      }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
