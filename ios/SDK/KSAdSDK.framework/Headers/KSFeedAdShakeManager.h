//
//  KSFeedAdShakeManager.h
//  KSUFeedAd
//
//  Created by 李姝谊 on 2022/6/21.
//

#import <Foundation/Foundation.h>
@class KSFeedAd;
NS_ASSUME_NONNULL_BEGIN

@interface KSFeedAdShakeManager : NSObject

+ (instancetype)sharedInstance;
- (void)addWeakFeedAd:(KSFeedAd *)feedAd;
- (void)stopDeviceMotionMonitor;

@end

NS_ASSUME_NONNULL_END
