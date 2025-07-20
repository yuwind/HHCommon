//
//  ViewController.m
//  HHCommon
//
//  Created by yufeng on 2022/4/30.
//

#import "ViewController.h"
#import "HHCommon.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试数据";
    
    [self.view hh_addButton:^(UIButton * _Nonnull button) {
        [button setTitle:@"Action" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.darkTextColor forState:UIControlStateNormal];
        button.cent_.on_();
    } action:^(UIButton * _Nonnull sender) {
        NSLog(@"button action");
    }];
}

@end
