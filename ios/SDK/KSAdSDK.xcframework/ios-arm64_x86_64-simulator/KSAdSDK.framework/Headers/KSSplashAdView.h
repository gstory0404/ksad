//
//  KSSplashAdView.h
//  KSAdSDK
//
//  Created by zhangchuntao on 2021/3/3.
//

#import <Foundation/Foundation.h>

#import "KSAd.h"
#import "KSAdInteractionType.h"
#import "KSAdSplashAdExtraDataModel.h"
#if __has_include(<KSUModel/KSAdInfoData.h>)
#import <KSUModel/KSAdInfoData.h>
#else
#import "KSAdInfoData.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class KSSplashAdView;

@protocol KSSplashAdViewDelegate <NSObject>
@optional
/**
 * splash ad request done
 */
- (void)ksad_splashAdDidLoad:(KSSplashAdView *)splashAdView;
/**
 * splash ad material load, ready to display
 */
- (void)ksad_splashAdContentDidLoad:(KSSplashAdView *)splashAdView;
/**
 * splash ad (material) failed to load
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView didFailWithError:(NSError *)error;
/**
 * splash ad did visible
 */
- (void)ksad_splashAdDidVisible:(KSSplashAdView *)splashAdView;
/**
 * splash ad video begin play
 * for video ad only
 */
- (void)ksad_splashAdVideoDidBeginPlay:(KSSplashAdView *)splashAdView;
/**
 * 已废弃，使用下面的"ksad_splashAdDidClick:"替代
 * splash ad clicked
 * @param inMiniWindow whether click in mini window
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView didClick:(BOOL)inMiniWindow DEPRECATED_MSG_ATTRIBUTE("Replaced with -ksad_splashAdDidClick:");
/**
 * splash ad clicked
 */
- (void)ksad_splashAdDidClick:(KSSplashAdView *)splashAdView;
/**
 * splash ad skipped
 * @param showDuration  splash show duration (no subsequent callbacks, remove & release KSSplashAdView here)
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView didSkip:(NSTimeInterval)showDuration;
/**
 * splash ad did enter conversion view controller
 */
- (void)ksad_splashAdDidOpenConversionVC:(KSSplashAdView *)splashAdView interactionType:(KSAdInteractionType)interactType;
/**
 * splash ad close conversion viewcontroller or jump with deeplink
 */
- (void)ksad_splashAdDidCloseConversionVC:(KSSplashAdView *)splashAdView interactionType:(KSAdInteractionType)interactType;
/**
 * splash ad play finished & auto dismiss (no subsequent callbacks, remove & release KSSplashAdView here)
 */
- (void)ksad_splashAdDidAutoDismiss:(KSSplashAdView *)splashAdView;

@end

@interface KSSplashAdView : UIView<KSAdProtocol>

@property (nonatomic, weak) id<KSSplashAdViewDelegate> delegate;

@property (nonatomic, weak) UIViewController *rootViewController;
/// max timeout interval, default is 5
@property (nonatomic, assign) NSTimeInterval timeoutInterval;
/// ad interaction type, avaliable after ksad_splashAdContentDidLoad:
@property (nonatomic, assign, readonly) KSAdInteractionType interactionType;
/// ad material type, avaliable after ksad_splashAdContentDidLoad:
@property (nonatomic, assign, readonly) KSAdMaterialType materialType;
@property (nonatomic, strong, readonly, nullable) KSAdInfoData *adInfoData;

- (id)initWithPosId:(NSString *)posId;
- (void)setExtraData:(KSAdSplashAdExtraDataModel *)extraDataModel;
/// load ad data
- (void)loadAdData;
/// server bidding load ad data
- (void)loadAdDataWithResponse:(NSDictionary *)response;
/**
 server bidding load ad data plan 2
 */
- (void)loadAdDataWithResponseV2:(NSDictionary *)response;
/// show splash ad in view, should be called after ksad_splashAdContentDidLoad:
- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
