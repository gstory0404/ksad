//
//  KSAdExposureReportParam.h
//  KSUModel
//
//  Created by xuzaihu on 2021/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KSAdExposureFailureCode) {
    KSAdExposureFailureOther                   = 0,    // 其他
    KSAdExposureFailureMediaBasePriceFilter    = 1,    // 媒体侧底价过滤
    KSAdExposureFailureBidFailed               = 2,    // 广告竞价失败
    KSAdExposureFailureCacheInvalid            = 3,    // 缓存失效
    KSAdExposureFailureExposurePriorityReduce  = 4,    // 曝光优先级降低
};

typedef NS_ENUM(NSUInteger, KSAdExposureAdnType) {
    KSAdExposureAdnTypeKuaishou         = 1,    // 输给快手联盟其他广告
    KSAdExposureAdnTypeOther            = 2,    // 输给其他ADN
    KSAdExposureAdnTypeSelfSale         = 3,    // 输给自售广告主
};

typedef NSString* KSAdADNName;
//平台定义
extern KSAdADNName const KSAdADNNameChuanshanjia;
extern KSAdADNName const KSAdADNNameGuangdiantong;
extern KSAdADNName const KSAdADNNameBaidu;
extern KSAdADNName const KSAdADNNameOther;

@interface KSAdExposureReportParam : NSObject

// 胜出者的ecpm报价
@property (nonatomic, assign) NSInteger winEcpm;
// 竞胜平台类型
@property (nonatomic, assign) KSAdExposureAdnType adnType;
// 竞胜平台名称，adnType=KSAdExposureAdnTypeOther时可以设置
@property (nonatomic, copy) KSAdADNName adnName;

@end

NS_ASSUME_NONNULL_END
