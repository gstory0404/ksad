//
//  KSAdBiddingAdModel.h
//  KSUServerBidding
//
//  Created by 李姝谊 on 2021/11/1.
//

#import <Foundation/Foundation.h>
#import "KSAdRewardVideoModel.h"
#if __has_include(<KSUSDKInfo/KSAdUserInfo.h>)
#import <KSUSDKInfo/KSAdUserInfo.h>
#else
#import "KSAdUserInfo.h"
#endif
#if __has_include(<KSUDevice/KSAdDeviceInfoEnum.h>)
#import <KSUDevice/KSAdDeviceInfoEnum.h>
#else
#import "KSAdDeviceInfoEnum.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface KSAdBiddingAdV2Model : NSObject

@property (nonatomic, assign) NSInteger adCount; // 默认为1
@property (nonatomic, assign) KSAdScreenDirection direction;
@property (nonatomic, assign) NSInteger cpmBidFloor;
@property (nonatomic, copy, nullable) NSString *prevTitle;        // 内容标签（广告展示前文章标题）
@property (nonatomic, copy, nullable) NSString *postTitle;        // 内容标签（广告展示后文章标题）
@property (nonatomic, copy, nullable) NSString *historyTitle;     // 内容标签（用户最近浏览文章标题）
@property (nonatomic, copy, nullable) NSString *channel;          // 频道标签
@property (nonatomic, copy, nullable) NSDictionary *appTag;
@property (nonatomic, strong, nullable) KSAdUserInfo *userInfo;
@property (nonatomic, strong, nullable) KSAdRewardVideoModel *rewardVideoModel; //激励视频数据

@end

@interface KSAdBiddingAdModel : KSAdBiddingAdV2Model

@property (nonatomic, copy) NSString *posId; // 必设

@end

NS_ASSUME_NONNULL_END
