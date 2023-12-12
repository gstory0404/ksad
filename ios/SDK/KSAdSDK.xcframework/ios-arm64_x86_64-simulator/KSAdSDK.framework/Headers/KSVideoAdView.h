//
//  KSVideoAdView.h
//  KSAdSDK
//
//  Created by 徐志军 on 2019/10/16.
//  Copyright © 2019 KuaiShou. All rights reserved.
//  本类仅用于feed和自渲染

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSVideoAdView : UIView

@property (nonatomic, assign, readwrite) BOOL videoSoundEnable;
@property (nonatomic, assign, readwrite) BOOL playFinished;
@property (nonatomic, assign, readwrite) BOOL playStarted; // 已经上报过播放开始
@property (nonatomic, assign, readwrite) BOOL lastIsPlay; // YES:上次状态是播放 NO:上次状态是暂停
// CoverView是否显示appIcon和appName
@property (nonatomic, assign, readwrite) BOOL isShowAppInfo;

@end

NS_ASSUME_NONNULL_END
