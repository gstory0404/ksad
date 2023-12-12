//
//  KSDrawAdsManager.h
//  KSAdSDK
//
//  Created by xuzhijun on 2019/12/6.
//

#import <Foundation/Foundation.h>
#import "KSDrawAd.h"

@protocol KSDrawAdsManagerDelegate;



NS_ASSUME_NONNULL_BEGIN

@interface KSDrawAdsManager : NSObject

@property (nonatomic, copy, readonly) NSArray<KSDrawAd *> *data;
- (instancetype)initWithPosId:(NSString *)posId;
@property (nonatomic, weak, nullable) id<KSDrawAdsManagerDelegate> delegate;
/**
 The number of ads requested,The maximum is 5
 */
- (void)loadAdDataWithCount:(NSInteger)count;
/**
 server bidding load ad data
*/
- (void)loadAdDataWithResponse:(NSDictionary *)response;
/**
 server bidding load ad data plan 2
 */
- (void)loadAdDataWithResponseV2:(NSDictionary *)response;

@end

@protocol KSDrawAdsManagerDelegate <NSObject>

@optional
- (void)drawAdsManagerSuccessToLoad:(KSDrawAdsManager *)adsManager drawAds:(NSArray<KSDrawAd *> *_Nullable)drawAdDataArray;
- (void)drawAdsManager:(KSDrawAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error;

@end
NS_ASSUME_NONNULL_END
