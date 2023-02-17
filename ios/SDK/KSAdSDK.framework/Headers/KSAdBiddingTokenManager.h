//
//  KSAdBiddingTokenManager.h
//  KSUServerBidding
//
//  Created by 李姝谊 on 2021/10/29.
//

#import <Foundation/Foundation.h>
@class KSAdBiddingAdModel;
@class KSAdBiddingAdV2Model;

@interface KSAdBiddingTokenManager : NSObject

/// 服务端竞价V1：返回token json字符串 是请求广告的参数
+ (NSString *)biddingTokenWithModel:(KSAdBiddingAdModel *)model;
/// 服务端竞价V2：返回token json字符串 是请求广告的参数
+ (NSString *)biddingTokenWithModelV2:(KSAdBiddingAdV2Model *)model;

@end
