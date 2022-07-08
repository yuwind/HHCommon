//
//  ViewController.m
//  HHCommon
//
//  Created by yufeng on 2022/4/30.
//

#import "ViewController.h"
#import "HHCommon.h"
#import "DemoTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试数据";
    
    NSDate *now = [NSDate date];
    NSDate *date = [now hh_yearOffset:1];
    NSLog(@"%@  %@",now ,date);
}

- (void)dealloc {
    NSLog(@"dealloc %@", self);
}

@end
