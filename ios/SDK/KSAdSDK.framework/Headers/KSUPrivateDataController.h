//
//  KSUPrivateDataController.h
//  AFNetworking
//
//  Created by chun on 2021/8/4.
//

#import <Foundation/Foundation.h>
#import <KSUDevice/KSAdDeviceInfoEnum.h>

@interface KSUPrivateDataController : NSObject

+ (KSUPrivateDataController *)sharedInstance;

//返回格式{"userSet":true|false,"value":"xxxx","errorCode":KSAdPrivateDataErrorCode}
//定义见：KSAdDeviceInfoEnum.h->KSAdPrivateDataErrorCode
- (NSString *)getIdfa;

- (NSString *)getIdfv;

- (NSString *)getIp;

- (NSString *)getMac;
//value:{latitude:xxx, longitude:xxx}
- (NSString *)getLocation;
//value:{latitude:xxx, longitude:xxx}，获取媒体设置的location
- (NSString *)getMediaLocation;
//value:[{ssid:xxx, bssid:xxx},...]
- (NSString *)getWifiList;

@end
