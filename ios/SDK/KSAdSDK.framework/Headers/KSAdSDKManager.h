//
//  KSAdSDKManager.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/8/28.
//  Copyright © 2019 KuaiShou. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<KSUSDKInfo/KSAdSDKError.h>)
#import <KSUSDKInfo/KSAdSDKError.h>
#else
#import "KSAdSDKError.h"
#endif

#if __has_include(<KSUDefine/KSAdSDKLogLevelDefine.h>)
#import <KSUDefine/KSAdSDKLogLevelDefine.h>
#else
#import "KSAdSDKLogLevelDefine.h"
#endif

#if __has_include(<KSUPermission/KSAdPermission.h>)
#import <KSUPermission/KSAdPermission.h>
#else
#import "KSAdPermission.h"
#endif

#if __has_include(<KSUSDKInfo/KSAdUserInfo.h>)
#import <KSUSDKInfo/KSAdUserInfo.h>
#else
#import "KSAdUserInfo.h"
#endif

#if __has_include(<KSUServerBidding/KSAdBiddingAdModel.h>)
#import <KSUServerBidding/KSAdBiddingAdModel.h>
#else
#import "KSAdBiddingAdModel.h"
#endif

NS_ASSUME_NONNULL_BEGIN

// 视频自动播放选项
typedef NS_ENUM(NSInteger, KSAdFeedVideoAutoPlayType) {
    KSAdFeedVideoAutoPlayTypeUnknown          = 0,
    KSAdFeedVideoAutoPlayTypeAllNet           = 1,     //有网络（WiFi及流量）自动播放
    KSAdFeedVideoAutoPlayTypeOnlyWifi         = 2,     //仅Wi-Fi下自动播放
    KSAdFeedVideoAutoPlayTypeNon              = 3      //不自动播放
};

@interface KSAdSDKManager : NSObject

/// SDK 版本号
@property (nonatomic, readonly, class) NSString *SDKVersion;

/// Auto play video on Non Wi-Fi environment or not, default is NO
@property (nonatomic, assign, class) BOOL dataFlowAutoStart;
/// Auto play video on all environment, default is Unknown
@property (nonatomic, assign, class) KSAdFeedVideoAutoPlayType feedVideoAutoPlayType;
/**
 * @brief start ad sdk
 * @param appId             ad app id
 */
/// 内容联盟SDK、广告联盟SDK使用
+ (void)setAppId:(NSString *)appId;
/// 仅使用电商联盟SDK，初始化时使用，appKey，wbIndex 需要联系商务申请
+ (KSAdErrorCode)startWithAppId:(NSString *)appId appKey:(NSString *)appKey wbIndex:(NSString *)wbIndex;

// optional
+ (void)setAppName:(NSString *)appName;
// optional
+ (void)setUserInfoBlock:(void(^)(KSAdUserInfo *))userInfoBlock;
// optional
+ (void)setAppTag:(NSString *)appTag;
// optional, enable personalized recommendation, default is YES
+ (void)setEnablePersonalRecommend:(BOOL)enable;
// optional, enable programmatic recommendation, default is YES
+ (void)setEnableProgrammaticRecommend:(BOOL)enable;
/// Configure user info.
/// @param age optional 年龄段
/// @param gender optional 性别
/// @param interest optional 兴趣标签
+ (void)setUserAge:(KSAdUserInfoThirdAgeType)age
            gender:(KSAdUserInfoThirdGengerType)gender
          interest:(NSString *_Nullable)interest;
/// Configure appInfo content.
/// @param prevTitle optional 内容标签（广告展示前文章标题）
/// @param postTitle optional 内容标签（广告展示后文章标题）
/// @param historyTitle optional 内容标签（用户最近浏览文章标题）
/// @param channel optional 频道标签
+ (void)setContentPrevTitle:(NSString *_Nullable)prevTitle
                  postTitle:(NSString *_Nullable)postTitle
               historyTitle:(NSString *_Nullable)historyTitle
                    channel:(NSString *_Nullable)channel;
// optional 媒体底价
+ (void)setCpmBidFloor:(NSInteger)cpmBidFloor;
/**
 Configure development mode.
 @param level : default KSAdSDKLogLevelNone
 */
// optional
+ (void)setLoglevel:(KSAdSDKLogLevel)level;

+ (void)setAutoHideUIRemoteKeyboardWindow:(BOOL)autoHideUIRemoteKeyboardWindow;

// optional, disable use location status, default is NO
+ (void)setDisableUseLocationStatus:(BOOL)disable;

+ (void)setLocationBlock:(LocationBlock)locationBlock;

// optional, disable use phone status, default is NO
+ (void)setDisableUsePhoneStatus:(BOOL)disable;
// optional, 设置idfa，请传原始值，不需要加密
+ (void)setIdfaBlock:(IdfaBlock)idfaBlock;
// optional, 设置idfv，请传原始值，不需要加密
+ (void)setIdfvBlock:(IdfvBlock)idfvBlock;
// optional, 设置接入方deviceId
+ (void)setDeviceIdBlock:(DeviceIdBlock)deviceIdBlock;

// optional, disable use network status, default is NO
+ (void)setDisableUseNetworkStatus:(BOOL)disable;

+ (NSString *)appId;

+ (NSString *)deviceId; //获取did
/**
 * 获取SDK的bid请求报文token
 * @param model 中posId是必传的，其余参数可参考各类广告调用
 * @return 返回SDK的token
*/
+ (NSString *)getBidRequestToken:(KSAdBiddingAdModel *)model;
/// 获取服务端竞价V2的请求报文token
/// @param model 不需要传posId 但是在向服务端请求的时候posId必传
+ (NSString *)getBidRequestTokenV2:(KSAdBiddingAdV2Model *)model;
@end

NS_ASSUME_NONNULL_END
