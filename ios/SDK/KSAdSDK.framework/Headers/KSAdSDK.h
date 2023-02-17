//
//  KSAdSDK.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/9/5.
//  Copyright © 2019 KuaiShou. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<KSAdSDK/KSAdSDKError.h>)
#import <KSAdSDK/KSAdSDKError.h>
#endif

#if __has_include(<KSAdSDK/KSMaterialMeta.h>)
#import <KSAdSDK/KSMaterialMeta.h>
#endif

#if __has_include(<KSAdSDK/KSAdImage.h>)
#import <KSAdSDK/KSAdImage.h>
#endif

#if __has_include(<KSAdSDK/KSAdUserInfo.h>)
#import <KSAdSDK/KSAdUserInfo.h>
#endif

#if __has_include(<KSUAdSDKManager/KSAdSDKManager.h>)
#import <KSUAdSDKManager/KSAdSDKManager.h>
#else
#import "KSAdSDKManager.h"
#endif

#if __has_include(<KSUExportLog/KSAdExportManager.h>)
#import <KSUExportLog/KSAdExportManager.h>
#else
#import "KSAdExportManager.h"
#endif

#if __has_include(<KSUDrawAd/KSDrawAd.h>)
    #import <KSUDrawAd/KSDrawAd.h>
    #import <KSUDrawAd/KSDrawAdsManager.h>
#elif __has_include(<KSAdSDK/KSDrawAd.h>)
    #import <KSAdSDK/KSDrawAd.h>
    #import <KSAdSDK/KSDrawAdsManager.h>
#endif

#if __has_include(<KSUSplashAd/KSSplashAdView.h>)
    #import <KSUSplashAd/KSSplashAdView.h>
    #import <KSUSplashAd/KSAdSplashAdExtraDataModel.h>
#elif __has_include(<KSAdSDK/KSSplashAdView.h>)
    #import <KSAdSDK/KSSplashAdView.h>
    #import <KSAdSDK/KSAdSplashAdExtraDataModel.h>
#endif

#if __has_include(<KSUInterstitialAd/KSInterstitialAd.h>)
    #import <KSUInterstitialAd/KSInterstitialAd.h>
#elif __has_include(<KSAdSDK/KSInterstitialAd.h>)
    #import <KSAdSDK/KSInterstitialAd.h>
#endif


#if __has_include(<KSUVideoView/KSVideoAdView.h>)
    #import <KSUVideoView/KSVideoAdView.h>
#elif __has_include(<KSAdSDK/KSVideoAdView.h>)
    #import <KSAdSDK/KSVideoAdView.h>
#endif

#if __has_include(<KSUFeedAd/KSFeedAd.h>)
    #import <KSUFeedAd/KSFeedAd.h>
    #import <KSUFeedAd/KSFeedAdsManager.h>
#elif __has_include(<KSAdSDK/KSFeedAd.h>)
    #import <KSAdSDK/KSFeedAd.h>
    #import <KSAdSDK/KSFeedAdsManager.h>
#endif

#if __has_include(<KSUNativeAd/KSNativeAd.h>)
    #import <KSUNativeAd/KSNativeAd.h>
    #import <KSUNativeAd/KSNativeAdsManager.h>
    #import <KSUNativeAd/KSNativeAdRelatedView.h>
#elif __has_include(<KSAdSDK/KSNativeAd.h>)
    #import <KSAdSDK/KSNativeAd.h>
    #import <KSAdSDK/KSNativeAdsManager.h>
    #import <KSAdSDK/KSNativeAdRelatedView.h>
#endif


#if __has_include(<KSUVideoAd/KSRewardedVideoAd.h>)
    #import <KSUVideoAd/KSFullscreenVideoAd.h>
    #import <KSUVideoAd/KSRewardedVideoAd.h>
    #import <KSUVideoAd/KSRewardedVideoModel.h>
#elif __has_include(<KSAdSDK/KSRewardedVideoAd.h>)
    #import <KSAdSDK/KSFullscreenVideoAd.h>
    #import <KSAdSDK/KSRewardedVideoAd.h>
    #import <KSAdSDK/KSRewardedVideoModel.h>
#endif

#if __has_include(<KSUVideoAd/KSAdPlayableDemoViewController.h>)
    #import <KSUVideoAd/KSAdPlayableDemoViewController.h>
#elif __has_include(<KSAdSDK/KSAdPlayableDemoViewController.h>)
    #import <KSAdSDK/KSAdPlayableDemoViewController.h>
#endif

#if __has_include(<KSUPermission/KSAdPermission.h>)
    #import <KSUPermission/KSAdPermission.h>
#elif __has_include(<KSAdSDK/KSAdPermission.h>)
    #import <KSAdSDK/KSAdPermission.h>
#endif
