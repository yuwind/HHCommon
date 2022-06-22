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

@property (nonatomic, assign) BOOL toggle;
@property (nonatomic, strong) UILabel *label1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试数据";
    
    NSString *dataString = @"2022-01-01";
    NSDate *futureDate = dataString.hh_toDate;
    NSDate *date = [NSDate date];
    NSDate *result = [futureDate hh_lastDateInWeek];
    NSLog(@"%@",result);
    NSTimeInterval interval = CFAbsoluteTimeGetCurrent();
    NSLog(@"%lf",interval);
    NSMutableArray *arrayM1 = @[].mutableCopy;
    for (NSInteger i = 1; i < 4; i++) {
        NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
        NSString *workoutMark = formatString(@"%ld%.0lf",i, interval);
        [arrayM1 hh_addObjectSafely:workoutMark];
    }
    
    NSMutableArray *arrayM2 = @[].mutableCopy;
    for (NSInteger i = 2; i < 6; i++) {
        NSTimeInterval interval = [[NSDate date] timeIntervalSinceReferenceDate] * 1000;
        NSString *workoutMark = formatString(@"%ld%.0lf",i, interval);
        [arrayM2 hh_addObjectSafely:workoutMark];
    }
    
    NSArray *localArray = nil;
    NSArray *cloudArray = @[@"3",@"4",@"5"];
    NSMutableSet *localSetM = [NSMutableSet setWithArray:localArray];
    NSMutableSet *cloudSetM = [NSMutableSet setWithArray:arrayM2];
    [localSetM unionSet:cloudSetM];
    NSLog(@"%@", localSetM.allObjects);
    
    [self.containerView hh_addLabel:^(UILabel * _Nonnull label) {
        self.label1 = label;
        label.text = @"第一个label";
        label.textColor = UIColor.magentaColor;
        [label sizeToFit];
        label.cent_.equalTo(self.view).offsets_(@0,@-150,nil).on_();
        @weakly(self);
        [label hh_addClickAction:^(UIView * _Nonnull sender) {
            @strongly(self);
            NSLog(@"click label action");
            [self.navigationController pushViewController:[DemoTableViewController new] animated:YES];
            
//            [self showNavBar:self.toggle animation:YES];
//            self.toggle = !self.toggle;
        }];
    }];
    
    UILabel *label2 = [UILabel new];
    [self.containerView addSubview:label2];
    label2.text = @"第二个label";
    label2.textColor = UIColor.redColor;
    label2.top_.centX_.equalTo((self.label1.bott_)).offset_(20).on_();
    
    UILabel *label3 = [UILabel new];
    [self.containerView addSubview:label3];
    label3.text = @"label3";
    label3.backgroundColor = [UIColor greenColor];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.top_.equalTo((label2.bott_)).offset_(100).on_();
    label3.left_.offset_(80).on_();
    
    UILabel *label4 = [UILabel new];
    [self.containerView addSubview:label4];
    label4.text = @"label4";
    label4.backgroundColor = [UIColor greenColor];
    label4.textAlignment = NSTextAlignmentCenter;
    //label4的左边等于label3的右边同时偏移20point，宽和高等于100，centerY等于label3
    label4.left_.widt_.heit_.centY_.equalTo(label3.righ_).offsets_(@20,@100,@100,nil).on_();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.label1.centX_cs.constant = 100;
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.label1.centX_cs.constant = 0;
        [UIView animateWithDuration:1 animations:^{
            [self.view layoutIfNeeded];
        }];
    }];
}

- (void)dealloc {
    NSLog(@"dealloc %@", self);
}

@end
