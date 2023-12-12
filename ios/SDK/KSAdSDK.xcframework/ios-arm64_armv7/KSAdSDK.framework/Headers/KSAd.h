//
//  KSAd.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/10/30.
//  Copyright © 2019 KuaiShou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KSAdInteractionType.h"
#import "KSAdExposureReportParam.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KSAdProtocol <NSObject>

@optional
// 单位:分，只有视频资源下载成功后，这个才可能有值
@property (nonatomic, readonly) NSInteger ecpm;
/// 媒体用来获取部分信息的字典
@property (nonatomic, readonly) NSDictionary *mediaExtraInfo;
/**
 * @brief 设置竞价价格，单位（分）
 * @param ecpm 竞价价格
 */
- (void)setBidEcpm:(NSInteger)ecpm;
/**
 * @brief 设置竞价价格，单位（分）
 * @param ecpm              竞价价格
 * @param highestLossEcpm   最大竞价失败方出价
 */
- (void)setBidEcpm:(NSInteger)ecpm
   highestLossEcpm:(NSInteger)highestLossEcpm;
/**
 * @brief 广告曝光失败后上报失败原因
 * @param failureCode 曝光失败原因类型
 * @param reportParam 曝光失败原因描述
 *        reportParam.winEcpm 胜出者的ecpm报价（单位：分）
 *        reportParam.adnType 胜出方，见KSAdExposureReportParam.h 中KSAdExposureAdnType定义
 *        reportParam.adnName 胜出平台名，见KSAdExposureReportParam.h 中KSAdADNType平台定义
 */
- (void)reportAdExposureFailed:(KSAdExposureFailureCode)failureCode reportParam:(KSAdExposureReportParam *)reportParam;

@end

@interface KSAd : NSObject<KSAdProtocol>

/// ad interaction type, avaliable after ad load
@property (nonatomic, assign, readonly) KSAdInteractionType interactionType;
/// ad material type, avaliable after ad load
@property (nonatomic, assign, readonly) KSAdMaterialType materialType;
/**
 server bidding load ad data
*/
- (void)loadAdDataWithResponse:(NSDictionary *)response;
/**
 server bidding load ad data plan 2
 
 @param response adx server传回来的response（媒体adx需替换bidEcpm为>0的数值）
 */
- (void)loadAdDataWithResponseV2:(NSDictionary *)response;
@end

NS_ASSUME_NONNULL_END
