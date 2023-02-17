//
//  KSRewardedVideoAd.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/8/28.
//  Copyright © 2019 KuaiShou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KSVideoAd.h"
#import "KSRewardedVideoAdDefines.h"
#import "KSInnerVideoAd.h"

@class KSRewardedVideoModel;
@protocol KSRewardedVideoAdDelegate;

NS_ASSUME_NONNULL_BEGIN
@interface KSRewardedVideoAd : KSVideoAd

@property (nonatomic, strong) KSRewardedVideoModel *rewardedVideoModel;
@property (nonatomic, weak, nullable) id<KSRewardedVideoAdDelegate> delegate;
@property (nonatomic, weak, nullable) id<KSRewardedVideoAdDelegate> rewardPlayAgainInteractionDelegate;
@property (nonatomic, weak, nullable) id<KSInnerAdDelegate> innerDelegate;

- (instancetype)initWithPosId:(NSString *)posId rewardedVideoModel:(KSRewardedVideoModel *)rewardedVideoModel;

@end

@protocol KSRewardedVideoAdDelegate <NSObject>

@optional
/**
 This method is called when video ad material loaded successfully.
 */
- (void)rewardedVideoAdDidLoad:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 This method is called when cached successfully.
 */
- (void)rewardedVideoAdVideoDidLoad:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when video ad slot will be showing.
 */
- (void)rewardedVideoAdWillVisible:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when video ad slot has been shown.
 */
- (void)rewardedVideoAdDidVisible:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when video ad is about to close.
 */
- (void)rewardedVideoAdWillClose:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when video ad is closed.
 */
- (void)rewardedVideoAdDidClose:(KSRewardedVideoAd *)rewardedVideoAd;

/**
 This method is called when video ad is clicked.
 */
- (void)rewardedVideoAdDidClick:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(KSRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 This method is called when the user clicked skip button.
 */
- (void)rewardedVideoAdDidClickSkip:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when the user clicked skip button.
 @param currentTime played duration
 */
- (void)rewardedVideoAdDidClickSkip:(KSRewardedVideoAd *)rewardedVideoAd currentTime:(NSTimeInterval)currentTime;
/**
 This method is called when the video begin to play.
 */
- (void)rewardedVideoAdStartPlay:(KSRewardedVideoAd *)rewardedVideoAd;
/**
 This method is called when the user close video ad.
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd hasReward:(BOOL)hasReward;
/**
 This method is called when the user close video ad,support staged rewards.
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd
              hasReward:(BOOL)hasReward
               taskType:(KSAdRewardTaskType)taskType
        currentTaskType:(KSAdRewardTaskType)currentTaskType;
/**
 This method is called when the user close video ad,extra rewards verify.
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd extraRewardVerify:(KSAdExtraRewardType)extraRewardType;

@end

NS_ASSUME_NONNULL_END
