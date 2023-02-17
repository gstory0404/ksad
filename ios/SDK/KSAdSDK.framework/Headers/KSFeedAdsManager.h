//
//  KSFeedAdsManager.h
//  KSAdSDK
//
//  Created by xuzhijun on 2019/11/22.
//

#import <Foundation/Foundation.h>
#import "KSFeedAd.h"
NS_ASSUME_NONNULL_BEGIN
@protocol KSFeedAdsManagerDelegate;


@interface KSFeedAdsManager : NSObject


@property (nonatomic, copy, readonly) NSArray<KSFeedAd *> *data;


/**
 @param size expected ad view size，when size.height is zero, acture height will match size.width
 */
- (instancetype)initWithPosId:(NSString *)posId size:(CGSize)size;
@property (nonatomic, weak, nullable) id<KSFeedAdsManagerDelegate> delegate;
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

@protocol KSFeedAdsManagerDelegate <NSObject>

@optional

- (void)feedAdsManagerSuccessToLoad:(KSFeedAdsManager *)adsManager nativeAds:(NSArray<KSFeedAd *> *_Nullable)feedAdDataArray;

- (void)feedAdsManager:(KSFeedAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error;

@end

NS_ASSUME_NONNULL_END
