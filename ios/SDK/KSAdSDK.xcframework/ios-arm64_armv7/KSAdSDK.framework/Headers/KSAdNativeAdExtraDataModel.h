//
//  KSAdNativeAdExtraDataModel.h
//  KSUNativeAd
//
//  Created by 崔婉莹 on 2022/10/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSAdNativeAdExtraDataModel : NSObject

/// 是否开启摇一摇，false或者不赋值，不开启，true开启
@property (nonatomic, assign) BOOL enableShake;

@end

NS_ASSUME_NONNULL_END
