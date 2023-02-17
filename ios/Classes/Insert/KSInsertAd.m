//
//  KSInterstitialAd.m
//  ksad
//
//  Created by gstory on 2023/2/17.
//

#import "KSInsertAd.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSLogUtil.h"
#import "KSUIViewController+getCurrentVC.h"
#import "KSEvent.h"

@interface KSInsertAd()<KSInterstitialAdDelegate>

@property(nonatomic,strong) KSInterstitialAd *interstitialAd;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,strong) NSString *rewardName;
@property(nonatomic,strong) NSString *rewardAmount;
@property(nonatomic,strong) NSString *userId;
@property(nonatomic,strong) NSString *customData;

@end

@implementation KSInsertAd

+ (instancetype)sharedInstance{
    static KSInsertAd *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[KSInsertAd alloc]init];
    }
    return myInstance;
}

//预加载激励广告
-(void)loadAd:(NSDictionary*)arguments{
    NSDictionary *dic = arguments;
    self.codeId = dic[@"iosId"];
    self.interstitialAd = [[KSInterstitialAd alloc] initWithPosId:self.codeId];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAdData];
}

- (void)showAd{
    if(self.interstitialAd == nil || !self.interstitialAd.isValid){
        NSDictionary *dictionary = @{@"adType":@"insertAd",@"onAdMethod":@"onUnReady"};
        [[KSEvent sharedInstance] sentEvent:dictionary];
        return;
    }
    [[KSLogUtil sharedInstance] print:(@"插屏广告触发showAd")];
    self.interstitialAd.videoSoundEnabled = true;
    [self.interstitialAd showFromViewController:[UIViewController jsd_getRootViewController]];
}

#pragma mark - 广告请求delegate
/**
 * interstitial ad data loaded
 */
- (void)ksad_interstitialAdDidLoad:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告加载成功")];
  
}
/**
 * interstitial ad render success
 */
- (void)ksad_interstitialAdRenderSuccess:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告渲染成功")];
    NSDictionary *dictionary = @{@"adType":@"insertAd",@"onAdMethod":@"onReady"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 * interstitial ad load or render failed
 */
- (void)ksad_interstitialAdRenderFail:(KSInterstitialAd *)interstitialAd error:(NSError * _Nullable)error{
    [[KSLogUtil sharedInstance] print:([NSString stringWithFormat:@"插屏广告渲染失败 %@",error])];
    NSDictionary *dictionary = @{@"adType":@"insertAd",@"onAdMethod":@"onFail",@"code":@(0),@"message":error.description};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 * interstitial ad will visible
 */
- (void)ksad_interstitialAdWillVisible:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告将要显示")];
}
/**
 * interstitial ad did visible
 */
- (void)ksad_interstitialAdDidVisible:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告显示")];
    NSDictionary *dictionary = @{@"adType":@"insertAd",@"onAdMethod":@"onShow"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 * interstitial ad did click
 */
- (void)ksad_interstitialAdDidClick:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告点击")];
    NSDictionary *dictionary = @{@"adType":@"insertAd",@"onAdMethod":@"onClick"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 * interstitial ad did click skip
 */
- (void)ksad_interstitialAdDidClickSkip:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告点击跳过")];
}
/**
 * interstitial ad will close
 */
- (void)ksad_interstitialAdWillClose:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告将要关闭")];
}
/**
 * interstitial ad did close
 */
- (void)ksad_interstitialAdDidClose:(KSInterstitialAd *)interstitialAd{
    [[KSLogUtil sharedInstance] print:(@"插屏广告关闭")];
    NSDictionary *dictionary = @{@"adType":@"insertAd",@"onAdMethod":@"onClose"};
    [[KSEvent sharedInstance] sentEvent:dictionary];
}
/**
 * interstitial ad did close other controller
 */
- (void)ksad_interstitialAdDidCloseOtherController:(KSInterstitialAd *)interstitialAd interactionType:(KSAdInteractionType)interactionType{
    
}

@end
