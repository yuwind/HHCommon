//
//  DemoTableViewCell.m
//  HHCommon
//
//  Created by yufeng on 2022/5/13.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell

- (void)updateCellWithModel:(id)model {
    NSString *title = [model hh_as:NSString.class];
    self.textLabel.text = title;
    self.textLabel.textColor = [UIColor darkTextColor];
}

@end
