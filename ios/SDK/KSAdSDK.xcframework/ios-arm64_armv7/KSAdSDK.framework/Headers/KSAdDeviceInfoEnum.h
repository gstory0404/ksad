//
//  KSAdDeviceInfoEnum.h
//  Pods
//
//  Created by chun on 2021/9/29.
//

#ifndef KSAdDeviceInfoEnum_h
#define KSAdDeviceInfoEnum_h

// 操作系统类型，选填 0: Unknown; 1: Android; 2: iOS
typedef NS_ENUM(NSInteger, KSAdOSType) {
    KSAdOSType_Unknown       =           0,
    KSAdOSType_Android       =           1,
    KSAdOSType_iOS           =           2,
};

typedef NS_ENUM(NSUInteger, KSAdScreenDirection) {
    KSAdScreenDirectionUnknown,     //未知方向
    KSAdScreenDirectionVertical,    //竖屏
    KSAdScreenDirectionHorizontal,  //横屏
};

// 运营商类型，选填 0: 未知的运营商; 1: 中国移动; 2: 中国电信; 3: 中国联通; 99: 其他运营商
typedef NS_ENUM(NSUInteger, KSAdCarrierType) {
    KSAdCarrierType_Unknown       = 0,    // 未知
    KSAdCarrierType_ChinaMobile   = 1,    // 中国移动
    KSAdCarrierType_ChinaUnicom   = 2,    // 中国联通
    KSAdCarrierType_Telecom       = 3,    // 中国电信
    KSAdCarrierType_Others        = 99,    // 其他运营商
};

// 隐私数据获取错误原因
typedef NS_ENUM(NSUInteger, KSAdPrivateDataErrorCode) {
    KSAdPrivateDataNoError                   = 0,    //正常
    KSAdPrivateDataErrorNoPermission         = 1,    //无权限
    KSAdPrivateDataErrorException            = 2,    //获取异常
    KSAdPrivateDataErrorFailed               = 3,    //有权限，获取失败
    KSAdPrivateDataErrorDeviceNotSupport     = 4,    //设备不支持
    KSAdPrivateDataErrorOthers               = 5,    //其他错误
};

#endif /* KSAdDeviceInfoEnum_h */
