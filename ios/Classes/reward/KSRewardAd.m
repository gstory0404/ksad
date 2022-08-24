//
//  KSRewardAd.m
//  ksad
//
//  Created by 郭维佳 on 2022/8/23.
//

#import "KSRewardAd.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSLogUtil.h"
#import "KSUIViewController+getCurrentVC.h"
#import "KSEvent.h"

@interface KSRewardAd()<KSRewardedVideoAdDelegate>

@property(nonatomic,strong) KSRewardedVideoAd *reward;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,strong) NSString *rewardName;
@property(nonatomic,strong) NSString *rewardAmount;
@property(nonatomic,strong) NSString *userId;
@property(nonatomic,strong) NSString *customData;

@end

@implementation KSRewardAd

+ (instancetype)sharedInstance{
    static KSRewardAd *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[KSRewardAd alloc]init];
    }
    return myInstance;
}

//预加载激励广告
-(void)loadAd:(NSDictionary*)arguments{
    NSDictionary *dic = arguments;
    self.codeId = dic[@"iosId"];
    self.rewardName = dic[@"rewardName"];
    self.rewardAmount = dic[@"rewardAmount"];
    self.userId =dic[@"userID"];
    self.customData = dic[@"customData"];
    KSRewardedVideoModel *model = [KSRewardedVideoModel new];
    //如果开启服务端回调的话，userId和extra会通过回调接⼝回传给接⼊⽅
    model.userId = self.userId;
    model.extra = self.customData;
    self.reward = [[KSRewardedVideoAd alloc] initWithPosId:self.codeId
                                        rewardedVideoModel:model];
    self.reward.delegate = self;
    [self.reward loadAdData];
}

- (void)showAd{
    if(self.reward == nil){
        NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onUnReady"};
        [[KSEvent sharedInstance] sentEvent:dictionary];
        return;
    }
    [self.reward showAdFromRootViewController:[UIViewController jsd_getCurrentViewController]];
}

#pragma mark - 广告请求delegate

/**
 该方法在视频广告素材加载成功时调用。
 */
- (void)rewardedVideoAdDidLoad:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告素材加载成功")];
   
}
/**
 当视频广告素材加载失败时调用此方法。
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    [[KSLogUtil sharedInstance] print:([NSString stringWithFormat:@"激励广告素材加载失败 %@",error.description])];
    NSInteger code = error.code;
    NSString *message = error.description;
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onFail",@"code":@(code),@"message":message};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 缓存成功时调用该方法。
 */
- (void)rewardedVideoAdVideoDidLoad:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告缓存成功")];
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onReady"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 此方法在视频广告位将要显示时调用。
 */
- (void)rewardedVideoAdWillVisible:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告将要显示")];
}
/**
 此方法在视频广告位已显示时调用。
 */
- (void)rewardedVideoAdDidVisible:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告显示")];
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onShow"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 该方法在视频广告即将关闭时调用。
 */
- (void)rewardedVideoAdWillClose:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告即将关闭")];
}
/**
 该方法在视频广告关闭时调用。
 */
- (void)rewardedVideoAdDidClose:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告关闭")];
}

/**
 点击视频广告时调用此方法。
 */
- (void)rewardedVideoAdDidClick:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告点击")];
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onClick"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 当视频广告播放完成或发生错误时调用此方法。
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(KSRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    [[KSLogUtil sharedInstance] print:(@"激励广告播放完成或发生错误")];
}
/**
 当用户单击跳过按钮时调用此方法。
 */
- (void)rewardedVideoAdDidClickSkip:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告单击跳过按钮")];
}
/**
 当用户单击跳过按钮时调用此方法。
 @param currentTime played duration
 */
- (void)rewardedVideoAdDidClickSkip:(KSRewardedVideoAd *)rewardedVideoAd currentTime:(NSTimeInterval)currentTime{
    [[KSLogUtil sharedInstance] print:(@"激励广告单击跳过按钮")];
}
/**
 当视频开始播放时调用此方法。
 */
- (void)rewardedVideoAdStartPlay:(KSRewardedVideoAd *)rewardedVideoAd{
    [[KSLogUtil sharedInstance] print:(@"激励广告视频开始播放")];
}
/**
 当用户关闭视频广告时调用此方法。
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd hasReward:(BOOL)hasReward{
    [[KSLogUtil sharedInstance] print:(@"激励广告关闭")];
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onClose"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 该方法在用户关闭视频广告时调用，支持分阶段奖励。
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd
              hasReward:(BOOL)hasReward
               taskType:(KSAdRewardTaskType)taskType
        currentTaskType:(KSAdRewardTaskType)currentTaskType{
    [[KSLogUtil sharedInstance] print:(@"激励广告关闭,发放奖励")];
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onVerify",@"hasReward":[NSNumber numberWithBool:hasReward ],@"rewardAmount":self.rewardAmount,@"rewardName":self.rewardName};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 该方法在用户关闭视频广告时调用，额外奖励验证。
 */
- (void)rewardedVideoAd:(KSRewardedVideoAd *)rewardedVideoAd extraRewardVerify:(KSAdExtraRewardType)extraRewardType{
    [[KSLogUtil sharedInstance] print:(@"激励广告关闭,发放额外奖励")];
}


@end

