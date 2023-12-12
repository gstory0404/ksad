//
//  KSAdInfoData.h
//  KSUModel
//
//  Created by 李姝谊 on 2023/7/6.
//

#import <Foundation/Foundation.h>
#import "KSAdInteractionType.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSAdInfoData : NSObject

// 广告描述
@property (nonatomic, copy) NSString *adDescription;
// 产品名称
@property (nonatomic, copy) NSString *productName;
// 广告来源
@property (nonatomic, copy, nullable) NSString *adSource;
// 广告图片url集合，单图和组图类型广告素材有返回，视频类素材返回空
@property (nonatomic, copy) NSArray<NSString *> *imageUrlArray;
// 视频类型广告素材,返回视频资源地址，非视频类素材返回为空
@property (nonatomic, copy) NSString *videoUrl;
// 视频类型广告首图url地址，非视频类素材返回为空
@property (nonatomic, copy) NSString *videoCoverImageUrl;
//广告素材类型：视频，单图，组图
@property (nonatomic, assign) KSAdMaterialType materialType;
// appIconUrl
@property (nonatomic, copy) NSString *appIconUrl;
// appName
@property (nonatomic, copy) NSString *appName;
// 跳转类型
@property (nonatomic, assign) KSAdInteractionType interactionType;

@end

NS_ASSUME_NONNULL_END
