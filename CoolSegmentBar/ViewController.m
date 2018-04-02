//
//  ViewController.m
//  CoolSegmentBar
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "ViewController.h"
#import "CoolSegmentBar.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - life style

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CoolSegmentBar *bar = [[CoolSegmentBar alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 32.0f) items:@[@"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8", @"test9", @"test10", @"test11", @"test12"] itemSelectedIndex:0 font:[UIFont systemFontOfSize:12.0f] selectedFont:[UIFont boldSystemFontOfSize:14.0f] textColor:[UIColor blackColor] selectedTextColor:[UIColor redColor] lineViewColor:[UIColor grayColor] animateLineViewColor:[UIColor redColor]];
    [self.view addSubview:bar];
    __weak typeof(self) weakSelf = self;
    bar.segmentButtonClick = ^(NSInteger index) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"点击了第%zd个",index);
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    
}


#pragma mark - private method



@end
