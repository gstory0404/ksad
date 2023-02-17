//
//  KSInsertAd.m
//  ksad
//
//  Created by gstory on 2023/2/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSInsertAd : NSObject

+ (instancetype)sharedInstance;
- (void)loadAd:(NSDictionary *)arguments;
- (void)showAd;

@end

NS_ASSUME_NONNULL_END
