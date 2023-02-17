//
//  KSInnerVideoAd.h
//  KSUVideoAd
//
//  Created by mohao on 2022/1/6.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KSInnerAdType) {
    KSInnerAdUnKnown        =       0,//未知
    KSInnerAdAggregation    =       1,//激励聚合
    KSInnerAdReflow         =       2,//激励视频回流页
};

@protocol KSInnerAdDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface KSInnerVideoAd : NSObject

@property (nonatomic, assign) KSInnerAdType adType;

@end

@protocol KSInnerAdDelegate <NSObject>

@optional

- (void)onInnerAdClick:(KSInnerVideoAd *)innerAd;

- (void)onInnerAdShow:(KSInnerVideoAd *)innerAd;

@end

NS_ASSUME_NONNULL_END
