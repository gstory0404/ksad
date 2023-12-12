//
//  KSMaterialMeta.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/10/11.
//  Copyright © 2019 KuaiShou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSAdImage.h"
#import "KSAdInteractionType.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(int, KSAdSourceLogoType) {
    KSAdSourceLogoTypeWhite,
    KSAdSourceLogoTypeGray,
};

@interface KSMaterialMeta : NSObject

/// interaction types supported by ads.
@property (nonatomic, assign) KSAdInteractionType interactionType;

/// material pictures.
@property (nonatomic, strong) NSArray<KSAdImage *> *imageArray;

/// ad logo, maybe null
- (NSString *)adSourceLogoURL:(KSAdSourceLogoType)type;
/// ad source.
@property (nonatomic, copy) NSString *adSource;

@property (nonatomic, strong, nullable) KSAdImage *appIconImage;

/// 0-5
@property (nonatomic, assign) CGFloat appScore;
/// downloadCountDesc.
@property (nonatomic, copy) NSString *appDownloadCountDesc;
/// ad description.
@property (nonatomic, copy) NSString *adDescription;

/// text displayed on the creative button.
@property (nonatomic, copy) NSString *actionDescription;

/// display format of the in-feed ad, other ads ignores it.
@property (nonatomic, assign) KSAdMaterialType materialType;

// video duration
@property (nonatomic, assign) NSInteger videoDuration;

@property (nonatomic, strong) KSAdImage *videoCoverImage;
@property (nonatomic, copy) NSString *videoUrl;
// app name
@property (nonatomic, copy) NSString *appName;
// product name (for h5)
@property (nonatomic, copy) NSString *productName;

@end

NS_ASSUME_NONNULL_END
