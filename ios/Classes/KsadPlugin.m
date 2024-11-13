#import "KsadPlugin.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSRewardAd.h"
#import "KSLogUtil.h"
#import "KSEvent.h"
#import "KSNativeView.h"
#import "KSSplashView.h"
#import "KSInsertAd.h"

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
    //注册splash
    [registrar registerViewFactory:[[KSSplashViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.ksad/SplashView"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    //初始化
    if ([@"register" isEqualToString:call.method]) {
        NSString *appId = call.arguments[@"iosId"];
        BOOL debug = [call.arguments[@"debug"] boolValue];
        [[KSLogUtil sharedInstance] debug:debug];
        KSAdSDKConfiguration *configuration = [KSAdSDKConfiguration configuration];
        configuration.appId = appId;
        if(debug){
            [KSAdSDKManager setLoglevel:KSAdSDKLogLevelAll];
        }else{
            [KSAdSDKManager setLoglevel:KSAdSDKLogLevelOff];
        }
        // 启动SDK：SDK启动成功后，才可以继续进行后续的广告请求操作（异步）
        [KSAdSDKManager startWithCompletionHandler:^(BOOL success, NSError *error) {
            if (success) {
                result(@YES);
            }else{
                result(@NO);
            }
        }];
        BOOL personal =  [call.arguments[@"personal"] boolValue];
        // 个性化推荐开关：关闭后，看到的广告数量不变，相关度将降低。
        // 是否允许开启广告的个性化推荐（NO-关闭，YES-开启），由开发者通过SDK的接口来设置。不设置的话则默认为YES。
        [configuration setEnablePersonalRecommend:personal];
        BOOL programmatic =  [call.arguments[@"programmatic"] boolValue];
        // 程序化推荐开关：关闭后，看到的广告数量不变，但将不会为你推荐程序化广告。
        // 是否允许开启广告的程序化推荐（NO-关闭，YES-开启），由开发者通过SDK的接口来设置。不设置的话则默认为YES。
        [configuration setEnableProgrammaticRecommend:programmatic];
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
        //预加载插屏广告
    }else if([@"loadInsertAd" isEqualToString:call.method]){
        [[KSInsertAd sharedInstance] loadAd:call.arguments];
        result(@YES);
        //显示插屏广告
    }else if([@"showInsertAd" isEqualToString:call.method]){
        [[KSInsertAd sharedInstance] showAd];
        result(@YES);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
