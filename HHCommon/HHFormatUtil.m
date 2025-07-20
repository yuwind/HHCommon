//
//  HHFormatUtil.m
//  HHCommon
//
//  Created by huxuewei on 2024/8/27.
//

#import "HHFormatUtil.h"
#import "HHCommonMethod.h"

@implementation HHFormatUtil

+ (NSString *)zeroDecimalStringWithValue:(CGFloat)value {
    NSString *valueString = [NSString stringWithFormat:@"%.1lf",value];
    CGFloat number = round([valueString floatValue]);
    return [NSString stringWithFormat:@"%.0lf", number];
}

+ (NSString *)maxOneDecimalStringWithValue:(CGFloat)value {
    NSString *valueString = [NSString stringWithFormat:@"%.2lf", value];
    value = [valueString floatValue];
    NSString *format = @"";
    BOOL isZeroDecimal = [self isZeroDecimalWithValue:value];
    if (isZeroDecimal) {
        format = @"%.0lf";
    } else {
        format = @"%.1lf";
    }
    return [NSString stringWithFormat:format, value];
}

+ (NSString *)maxTwoDecimalStringWithValue:(CGFloat)value {
    NSString *valueString = [NSString stringWithFormat:@"%.3lf", value];
    value = [valueString floatValue];
    NSString *format = @"";
    BOOL isZeroDecimal = [self isZeroDecimalWithValue:value];
    BOOL isOneDecimal = [self isOneDecimalWithValue:value];
    if (isZeroDecimal) {
        format = @"%.0lf";
    } else if (isOneDecimal) {
        format = @"%.1lf";
    } else {
        format = @"%.2lf";
    }
    return [NSString stringWithFormat:format, value];
}

+ (BOOL)isZeroDecimalWithValue:(CGFloat)value {
    NSString *valueString = [NSString stringWithFormat:@"%.1lf",value];
    value = valueString.doubleValue;
    BOOL isSame = ceil(value) == value;
    return isSame;
}

+ (BOOL)isOneDecimalWithValue:(CGFloat)value {
    NSString *valueString = [NSString stringWithFormat:@"%.2lf",value];
    value = valueString.doubleValue;
    value = value * 10;
    BOOL isSame = ceil(value) == value;
    return isSame;
}

+ (NSAttributedString *)getHighlightAttribute:(NSString *)str withDefont:(UIFont *)defont withDefTextColor:(UIColor *)defColor withHighFont:(UIFont *)highFont withHighColor:(UIColor *)highColor withAlignment:(NSTextAlignment)alignment {
    if (isValidString(str)) {
        NSRange secendB = [str rangeOfString:@"</b>"];
        NSRange firstB = [str rangeOfString:@"<b>"];
        NSRange sessionRange = NSMakeRange(firstB.location + firstB.length, secendB.location - (firstB.location + firstB.length));
        
        NSMutableParagraphStyle *centerParagraphStyle = [[NSMutableParagraphStyle alloc] init];
        centerParagraphStyle.alignment = alignment;
        
        NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName:defColor,NSFontAttributeName:defont,NSParagraphStyleAttributeName:centerParagraphStyle}];
        
        UIFont *highlyFont = highFont?:defont;
        UIColor *highlyColor = highColor?:defColor;
        
        if (firstB.location != NSNotFound && secendB.location != NSNotFound && sessionRange.location != NSNotFound) {
            [attribute addAttributes:@{NSFontAttributeName:highlyFont,NSForegroundColorAttributeName:highlyColor} range:sessionRange];
            [attribute deleteCharactersInRange:secendB];
            [attribute deleteCharactersInRange:firstB];
        }
        return attribute;
    }
    return nil;
}

+ (NSAttributedString *)getHighlightAttribute:(NSString *)str withDefont:(UIFont *)defont withDefTextColor:(UIColor *)defColor withHighFont:(UIFont *)highFont withHighColor:(UIColor *)highColor withAlignment:(NSTextAlignment)alignment withTempArribute:(NSMutableAttributedString *)tempArribute {
    NSString *attributeStr = tempArribute.string;
    if (isValidString(str) && isValidString(attributeStr)) {
        NSAttributedString *attribute = [self getHighlightAttribute:str withDefont:defont withDefTextColor:defColor withHighFont:highFont withHighColor:highColor withAlignment:alignment];
        NSString *resultStr = attribute.string;
        BOOL hasBoldMark = [self checkBoldMark:resultStr];
        if (hasBoldMark){
            NSMutableAttributedString *tempAttribute = attribute.mutableCopy;
            NSAttributedString *attribute = [self getHighlightAttribute:str withDefont:defont withDefTextColor:defColor withHighFont:highFont withHighColor:highColor withAlignment:alignment withTempArribute:tempAttribute];
            return attribute;
        }
        return attribute;
    } else if (isValidString(attributeStr)) {
        NSString *resultStr = attributeStr;
        BOOL hasBoldMark = [self checkBoldMark:resultStr];
        if(hasBoldMark){
            UIColor *highlyColor = highColor?:defColor;
            UIFont *highlyFont = highFont?:defont;
            //还有标签
            NSRange secendB = [resultStr rangeOfString:@"</b>"];
            NSRange firstB = [resultStr rangeOfString:@"<b>"];
            NSRange sessionRange = NSMakeRange(firstB.location + firstB.length, secendB.location -(firstB.location + firstB.length));
            if (firstB.location != NSNotFound && secendB.location != NSNotFound && sessionRange.location != NSNotFound){
                [tempArribute addAttributes:@{NSFontAttributeName:highlyFont,NSForegroundColorAttributeName:highlyColor} range:sessionRange];
                [tempArribute deleteCharactersInRange:secendB];
                [tempArribute deleteCharactersInRange:firstB];
            }
            
            NSString *newStr = tempArribute.string;
            if([self checkBoldMark:newStr]){
                [self getHighlightAttribute:str withDefont:defont withDefTextColor:defColor withHighFont:highFont withHighColor:highColor withAlignment:alignment withTempArribute:tempArribute];
            }
        }
        return tempArribute.copy;
    }
    return nil;
}

+ (BOOL)checkBoldMark:(NSString *)text {
    NSRange secendB = [text rangeOfString:@"</b>"];
    NSRange firstB = [text rangeOfString:@"<b>"];
    NSRange sessionRange = NSMakeRange(firstB.location + firstB.length , secendB.location - (firstB.location + firstB.length));
    if (firstB.location != NSNotFound && secendB.location != NSNotFound && sessionRange.location != NSNotFound){
        return YES;
    }
    return NO;
}

@end
