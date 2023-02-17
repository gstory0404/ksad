//
//  KSRewardAd.h
//  ksad
//
//  Created by gstory on 2022/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSRewardAd : NSObject

+ (instancetype)sharedInstance;
- (void)loadAd:(NSDictionary *)arguments;
- (void)showAd;

@end

NS_ASSUME_NONNULL_END
