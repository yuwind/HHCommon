//
//  DemoTableViewController.m
//  HHCommon
//
//  Created by yufeng on 2022/5/13.
//

#import "DemoTableViewController.h"
#import "DemoTableViewCell.h"

@interface DemoTableViewController ()

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"Demo TableView";
    self.backButton.tintColor = [UIColor cyanColor];
    
    [self.view hh_addButton:^(UIButton * _Nonnull button) {
        [button setTitle:@"Action" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        button.cent_.on_();
    } action:^(UIButton * _Nonnull sender) {
        
    }];
    
    [self hh_afterDeallocCallBack:^{
        NSLog(@"first dealloc DemoTableViewController");
    }];
    [self hh_afterDeallocCallBack:^{
        NSLog(@"second dealloc DemoTableViewController");
    }];
}

- (NSArray *)modelArray {
    return @[@"test1",@"test2",@"test3"];
}

- (NSArray<Class> *)registerReusableCell {
    return @[DemoTableViewCell.class];
}

- (void)dealloc {
    NSLog(@"dealloc %@", self);
}

@end
