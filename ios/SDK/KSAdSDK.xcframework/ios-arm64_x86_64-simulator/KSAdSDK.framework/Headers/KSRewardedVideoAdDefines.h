//
//  KSRewardedVideoAdDefines.h
//  Pods
//
//  Created by xuzaihu on 2021/8/20.
//

#ifndef KSRewardedVideoAdDefines_h
#define KSRewardedVideoAdDefines_h

typedef NS_ENUM(NSInteger, KSAdRewardTaskType) {
    KSAdRewardTaskTypeWatchVideo               = 0,    // 观看时长
    KSAdRewardTaskTypeWatchDetailBrowse        = 1,    // 浏览落地页
};

typedef NS_ENUM(NSUInteger, KSAdDetailBrowseTaskStep) {
    KSAdDetailBrowseTaskStepBeforeVideo                     = 0,        //未观看完视频
    KSAdDetailBrowseTaskStepBeforeDetailBrowse              = 1,        //看完视频
    KSAdDetailBrowseTaskStepFinish                          = 2,        //浏览落地页
};

typedef NS_ENUM(NSInteger, KSAdExtraRewardType) {
    KSAdExtraRewardClick        = 1,    // 点击激励
};

#endif /* KSRewardedVideoAdDefines_h */

