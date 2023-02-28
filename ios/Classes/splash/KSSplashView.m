//
//  KSSPlashView.m
//  ksad
//
//  Created by gstory on 2023/2/17.
//

#import "KSSplashView.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSLogUtil.h"
#import "KSUIViewController+getCurrentVC.h"


#pragma mark - KSNativeFactory
@implementation KSSplashViewFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    KSSplashView * splshad = [[KSSplashView alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return splshad;
}
@end

@interface KSSplashView()<KSSplashAdViewDelegate>

@property (nonatomic, strong) KSSplashAdView *splashAdView;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@end

@implementation KSSplashView

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        NSDictionary *dic = args;
        self.frame = frame;
        self.viewId = viewId;
        self.codeId = dic[@"iosId"];
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.ksad/SplashView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        self.container = [[UIView alloc] initWithFrame:frame];
        [self loadSplashAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadSplashAd{
    [self.container removeFromSuperview];
    //初始化开屏广告
    self.splashAdView= [[KSSplashAdView alloc] initWithPosId:self.codeId];
    self.splashAdView.delegate=self;
    //开屏广告建议设置rootViewController，未设置取keyWindow的VC
    self.splashAdView.rootViewController=[UIViewController jsd_getCurrentViewController];
    //视频播放5s后进入小窗
    self.splashAdView.needShowMiniWindow=YES;
    //是否屏蔽摇一摇，false或者不赋值，不屏蔽，true屏蔽
    KSAdSplashAdExtraDataModel*extraModel= [[KSAdSplashAdExtraDataModel alloc]init];
    extraModel.disableShake=YES;
    //加载开屏广告
    [self.splashAdView loadAdData];
}

#pragma mark - KSNativeAdsManagerDelegate
/**
 * splash ad request done
 */
- (void)ksad_splashAdDidLoad:(KSSplashAdView *)splashAdView{
    [[KSLogUtil sharedInstance] print:(@"开屏广告展示")];
    
    [_channel invokeMethod:@"onShow" arguments:nil result:nil];
}
/**
 * splash ad material load, ready to display
 */
- (void)ksad_splashAdContentDidLoad:(KSSplashAdView *)splashAdView{
    [[KSLogUtil sharedInstance] print:(@"开屏广告物料加载成功")];
    self.splashAdView.frame= self.container.frame;
    [self.splashAdView showInView:self.container];
}
/**
 * splash ad (material) failed to load
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView didFailWithError:(NSError *)error{
    [[KSLogUtil sharedInstance] print:([NSString stringWithFormat:@"信息流广告拉取失败 %@",error])];
    NSDictionary *dictionary = @{@"message":error.description};
    [_channel invokeMethod:@"onFail" arguments:dictionary result:nil];
}
/**
 * splash ad did visible
 */
- (void)ksad_splashAdDidVisible:(KSSplashAdView *)splashAdView{
    [[KSLogUtil sharedInstance] print:(@"开屏广告可见")];
}
/**
 * splash ad video begin play
 * for video ad only
 */
- (void)ksad_splashAdVideoDidBeginPlay:(KSSplashAdView *)splashAdView{
    [[KSLogUtil sharedInstance] print:(@"开屏广告视频准备播放")];
}
/**
 * splash ad clicked
 * @param inMiniWindow whether click in mini window
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView didClick:(BOOL)inMiniWindow{
    [[KSLogUtil sharedInstance] print:(@"开屏广告点击")];
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}
/**
 * splash ad will zoom out, frame can be assigned
 * for video ad only
 * @param frame target frame
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView willZoomTo:(inout CGRect *)frame{
    
}
/**
 * splash ad zoomout view will move to frame
 * @param frame target frame
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView willMoveTo:(inout CGRect *)frame{
    
}
/**
 * splash ad skipped
 * @param showDuration  splash show duration (no subsequent callbacks, remove & release KSSplashAdView here)
 */
- (void)ksad_splashAd:(KSSplashAdView *)splashAdView didSkip:(NSTimeInterval)showDuration{
    [[KSLogUtil sharedInstance] print:(@"开屏广告跳过")];
    [_channel invokeMethod:@"onClose" arguments:nil result:nil];
}
/**
 * splash ad did enter conversion view controller
 */
- (void)ksad_splashAdDidOpenConversionVC:(KSSplashAdView *)splashAdView interactionType:(KSAdInteractionType)interactType{
    
}
/**
 * splash ad close conversion viewcontroller (no subsequent callbacks, remove & release KSSplashAdView here)
 */
- (void)ksad_splashAdDidCloseConversionVC:(KSSplashAdView *)splashAdView interactionType:(KSAdInteractionType)interactType{
    
}

/**
 * splash ad play finished & auto dismiss (no subsequent callbacks, remove & release KSSplashAdView here)
 */
- (void)ksad_splashAdDidAutoDismiss:(KSSplashAdView *)splashAdView{
    
}

/**
 * splash ad close by user (zoom out mode) (no subsequent callbacks, remove & release KSSplashAdView here)
 */
- (void)ksad_splashAdDidClose:(KSSplashAdView *)splashAdView{
    [[KSLogUtil sharedInstance] print:(@"开屏广告关闭")];
    [_channel invokeMethod:@"onClose" arguments:nil result:nil];
}

@end
