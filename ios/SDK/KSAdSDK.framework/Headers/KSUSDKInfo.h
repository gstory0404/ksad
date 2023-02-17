//
//  KSUSDKInfo.h
//  KSUSDKInfo
//
//  Created by Dylan Sun on 2021/6/9.
//

#import <Foundation/Foundation.h>
#import <KSUDefine/KSAdCommonDefine.h>
#import "KSAdUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KSAdSDKType) {
    KSAdSDKTypeAD = 1, // 广告联盟 SDK
    KSAdSDKTypeCU = 2, // 内容联盟 SDK
    KSAdSDKTypeEU = 3, // 直播电商 SDK
    KSAdSDKTypePureCU = 4,// 纯内容联盟SDK,广告逻辑不执行不加载
};

@interface KSUSDKInfo : NSObject

// 用户兴趣标签
@property (nonatomic, copy) NSString *appTag;
@property (nonatomic, copy, getter=appId) NSString *appId;
@property (nonatomic, copy, getter=getAppName) NSString *appName;
@property (nonatomic, assign) BOOL personalizedRecommendation;
@property (nonatomic, assign) BOOL programmaticRecommendation;
@property (nonatomic, copy) void (^userInfoBlock)(KSAdUserInfo *);
@property (nonatomic, readonly) KSAdUserInfo *userInfo;
#ifdef KSADIsDebugging
/// 只能调试使用，会直接覆盖currentApiHost的内容，线上严禁调用
@property (nonatomic, copy) NSString *currentApiHostDebug;
#endif
@property (nonatomic, copy, readonly) NSString *currentApiHost;
@property (nonatomic, copy) NSString *currentEUApiHost;
@property (nonatomic, copy) NSString *currentLiveHost;

+ (instancetype)sharedInstance;

+ (NSString *)SDKVersion;

+ (NSString *)TKVersion;

+ (NSString *)protocolVersion;

+ (KSAdSDKType)sdkType;

+ (int64_t)sdkVersionCode;

@end

NS_ASSUME_NONNULL_END
