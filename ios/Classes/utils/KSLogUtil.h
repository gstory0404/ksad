//
//  KSLogUtil.h
//  ksad
//
//  Created by 郭维佳 on 2022/8/23.
//


#ifdef DEBUG
#define GLog(...) NSLog(@"%s\n %@\n\n", __func__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define GLog(...)
#endif

NS_ASSUME_NONNULL_BEGIN

@interface KSLogUtil : NSObject
+ (instancetype)sharedInstance;
- (void)debug:(BOOL)isDebug;
- (void)print:(NSString *)message;
@end

NS_ASSUME_NONNULL_END

