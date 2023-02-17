//
//  KSAdSDKLogLevelDefine.h
//  Pods
//
//  Created by zhengjiajun on 2021/8/2.
//

#ifndef KSAdSDKLogLevelDefine_h
#define KSAdSDKLogLevelDefine_h

typedef NS_ENUM(NSInteger, KSAdSDKLogLevel) {
    KSAdSDKLogLevelAll      =       0,
    KSAdSDKLogLevelVerbose,  // 此类别的日记不会记录到日志文件中
    KSAdSDKLogLevelDebug,
    KSAdSDKLogLevelVerify,
    KSAdSDKLogLevelInfo,
    KSAdSDKLogLevelWarn,
    KSAdSDKLogLevelError,
    KSAdSDKLogLevelOff,
};

#endif /* KSAdSDKLogLevelDefine_h */
