//
//  KSAdSplashAdExtraDataModel.h
//  KSUSplashAd
//
//  Created by 臧密娜 on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSAdSplashAdExtraDataModel : NSObject
/// 是否屏蔽摇一摇，false或者不赋值，不屏蔽，true屏蔽
@property (nonatomic, assign) BOOL disableShake;
/// 是否屏蔽扭一扭，false或者不赋值，不屏蔽，true屏蔽
@property (nonatomic, assign) BOOL disableRotate;
/// 是否屏蔽手势滑动转化，false或者不赋值，不屏蔽，true屏蔽
@property (nonatomic, assign) BOOL disableSlide;

@end

NS_ASSUME_NONNULL_END
