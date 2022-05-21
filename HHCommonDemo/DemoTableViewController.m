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
