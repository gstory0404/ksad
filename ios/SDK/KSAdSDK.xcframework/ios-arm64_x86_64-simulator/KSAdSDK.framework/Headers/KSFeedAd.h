//
//  KSFeedAd.h
//  KSAdSDK
//
//  Created by xuzhijun on 2019/11/22.
//

#import <Foundation/Foundation.h>

#import "KSAd.h"
#import "KSAdInteractionType.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KSFeedAdDelegate;

@interface KSFeedAd : KSAd

@property (nonatomic, readonly) UIView *feedView;
@property (nonatomic, assign) BOOL materialReady;
@property (nonatomic, assign) BOOL disableToVideoCache; // 不缓存视频

@property (nonatomic, weak) id<KSFeedAdDelegate> delegate;

- (void)setVideoSoundEnable:(BOOL)enable;

@end

@protocol KSFeedAdDelegate <NSObject>
@optional
/**
 This method is called when feed ad show everytime. Please don‘t use for exposure count. Please use 'feedAdDidShow' for exposure count.
 */
- (void)feedAdViewWillShow:(KSFeedAd *)feedAd;
- (void)feedAdDidClick:(KSFeedAd *)feedAd;
- (void)feedAdDislike:(KSFeedAd *)feedAd;
- (void)feedAdDidShowOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType;
- (void)feedAdDidCloseOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType;
/**
 This method is called when feed ad show. Each ad is called back only once
 */
- (void)feedAdDidShow:(KSFeedAd *)feedAd;

@end

NS_ASSUME_NONNULL_END
