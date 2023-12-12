//
//  KSEUExtraInfo.h
//  KSAdSDK
//
//  Created by LFR on 2021/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSEUExtraInfo : NSObject

/// 推广位id，必传
@property (nonatomic, copy) NSString *promoteID;

/// 媒体自定义的备注，下单后可在订单平台查到，可不传
@property (nonatomic, copy) NSString *comment;

/// 用户自购时的媒体返佣比例，⚠️ 0-100 的整数，可不传
@property (nonatomic, assign) NSUInteger userCommRateBuying;

/// 用户分享时的媒体返佣比例，⚠️ 0-100 的整数，可不传
@property (nonatomic, assign) NSUInteger userCommRateSharing;

- (instancetype)initWithPromoteID:(NSString *)promoteID comment:(NSString *)comment;

- (NSDictionary *)jsonDic;

@end

NS_ASSUME_NONNULL_END
