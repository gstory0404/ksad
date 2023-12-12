//
//  KSAdUserInfo.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/8/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KSAdUserInfoThirdAgeType) {
    KSAdUserInfoThirdAgeTypeUnknown         = 0,    // 未知
    KSAdUserInfoThirdAgeTypeYoung           = 1,    // 18-23
    KSAdUserInfoThirdAgeTypeBelowThirty     = 2,    // 24-30
    KSAdUserInfoThirdAgeTypeBelowForty      = 3,    // 31-40
    KSAdUserInfoThirdAgeTypeBelowFifty      = 4,    // 41-49
    KSAdUserInfoThirdAgeTypeAboveFifty      = 5,    // 50+
};

typedef NS_ENUM(NSUInteger, KSAdUserInfoThirdGengerType) {
    KSAdUserInfoThirdGengerTypeUnknown      = 0,    // 未知
    KSAdUserInfoThirdGengerTypeMale         = 1,    // 男性
    KSAdUserInfoThirdGengerTypeFemale       = 2,    // 女性
};

@interface KSAdUserInfo : NSObject

@property (nonatomic, assign) long userId;           // 用户id，目前是必填
@property (nonatomic, copy) NSString *thirdUserId;      //媒体用户id，目前用在激励视频回调
@property (nonatomic, copy) NSString *gender;         // 用户性别，选填 F: 女性 M:男性
@property (nonatomic, copy) NSArray *interestArray;   // 用户兴趣，选填

// 新增广告请求字段
@property (nonatomic, assign) KSAdUserInfoThirdAgeType thirdAge;          // 年龄
@property (nonatomic, assign) KSAdUserInfoThirdGengerType thirdGender;    // 性别
@property (nonatomic, copy) NSString *thirdInterest;                      // 兴趣标签

@end

NS_ASSUME_NONNULL_END
