#import "KsadPlugin.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSRewardAd.h"
#import "KSLogUtil.h"
#import "KSEvent.h"
#import "KSNativeView.h"

@implementation KsadPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"ksad"
                                     binaryMessenger:[registrar messenger]];
    KsadPlugin* instance = [[KsadPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    //注册event
    [[KSEvent sharedInstance]  initEvent:registrar];
    //注册native
    [registrar registerViewFactory:[[KSNativeFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.ksad/NativeView"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    //初始化
    if ([@"register" isEqualToString:call.method]) {
        NSString *appId = call.arguments[@"iosId"];
        BOOL debug = [call.arguments[@"debug"] boolValue];
        [[KSLogUtil sharedInstance] debug:debug];
        [KSAdSDKManager setAppId:appId];
        BOOL personalized =  [call.arguments[@"personalized"] boolValue];
        if(debug){
            [KSAdSDKManager setLoglevel:KSAdSDKLogLevelAll];
        }else{
            [KSAdSDKManager setLoglevel:KSAdSDKLogLevelOff];
        }
        //关闭个性化推荐
        [KSAdSDKManager setEnablePersonalRecommend:personalized];
        [KSAdSDKManager setEnableProgrammaticRecommend:personalized];
        //渠道id
        result(@YES);
        //sdk版本
    }else if([@"getSDKVersion" isEqualToString:call.method]){
        NSString *version = [KSAdSDKManager SDKVersion];
        result(version);
        //预加载激励广告
    }else if([@"loadRewardAd" isEqualToString:call.method]){
        [[KSRewardAd sharedInstance] loadAd:call.arguments];
        result(@YES);
        //显示激励广告
    }else if([@"showRewardAd" isEqualToString:call.method]){
        [[KSRewardAd sharedInstance] showAd];
        result(@YES);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
