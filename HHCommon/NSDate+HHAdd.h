//
//  NSDate+HHAdd.h
//  HHCommonDemo
//
//  Created by huxuewei on 2022/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define mOneDaySeconds (24 * 60 * 60)
#define HHNotFound -1

NSDateFormatter * dateFormatterInstance(void);
NSCalendar * calendarInstance(void);

@interface NSDate (HHAdd)

- (BOOL)hh_isToday;
- (BOOL)hh_isYestoday;
- (BOOL)hh_isTomorrow;
- (BOOL)hh_isPast;
- (BOOL)hh_isFuture;
- (BOOL)hh_isSameDay:(NSDate *)date;
- (BOOL)hh_isFirstDayInMonth;
- (BOOL)hh_isLastDayInMonth;
- (BOOL)hh_isFirstDayInWeek;
- (BOOL)hh_isLastDayInWeek;
- (NSInteger)hh_year;
- (NSInteger)hh_month;
- (NSInteger)hh_day;
- (NSInteger)hh_hour;
- (NSInteger)hh_minute;
- (NSInteger)hh_second;
- (NSInteger)hh_week;
- (NSString *)hh_toString;//yyyyMMdd
- (NSString *)hh_toStringWithEnLocale;//yyyyMMdd
- (NSString *)hh_stringWithDateFormat:(NSString *)dateFormat;
- (NSInteger)hh_dayCountSinceDate:(NSDate *)date;
- (NSInteger)hh_daysInMonth;
- (NSInteger)hh_daysInYear;
- (NSInteger)hh_dayIndexInWeek;
- (NSInteger)hh_dayIndexInMonth;
- (NSInteger)hh_dayIndexInYear;
- (NSInteger)hh_weeksInMonth;
- (NSInteger)hh_weeksInYear;
- (NSDate *)hh_dayWithoutTime;
- (NSDate *)hh_firstDayInWeek;
- (NSDate *)hh_lastDayInWeek;
- (NSDate *)hh_firstDayInMonth;
- (NSDate *)hh_lastDayInMonth;
- (NSDate *)hh_dayOffset:(NSInteger)offset;
- (NSDate *)hh_weekOffset:(NSInteger)offset;
- (NSDate *)hh_monthOffset:(NSInteger)offset;
- (NSDate *)hh_yearOffset:(NSInteger)offset;

@end

@interface NSString (HHDate)

- (NSDate *)hh_toDate;//yyyyMMdd
- (NSDate *)hh_toDateWithEnLocale;//yyyyMMdd
- (NSDate *)hh_dateWithDateFormat:(NSString *)dateFormat;

@end

NS_ASSUME_NONNULL_END
