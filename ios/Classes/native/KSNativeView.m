//
//  KSNativeView.m
//  ksad
//
//  Created by gstory on 2022/8/24.
//

#import "KSNativeView.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSLogUtil.h"
#import "KSUIViewController+getCurrentVC.h"


#pragma mark - KSNativeFactory
@implementation KSNativeFactory{
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
    KSNativeView * nativeAd = [[KSNativeView alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return nativeAd;
}
@end

@interface KSNativeView()<KSFeedAdsManagerDelegate,KSFeedAdDelegate>

@property (nonatomic, strong) KSFeedAd *native;
@property (nonatomic, strong) KSFeedAdsManager *nativeAdsManager;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,assign) NSInteger width;
@property(nonatomic,assign) NSInteger height;
@end

#pragma mark - KSNativeView
@implementation KSNativeView

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        NSDictionary *dic = args;
        self.frame = frame;
        self.viewId = viewId;
        self.codeId = dic[@"iosId"];
        self.width =[dic[@"viewWidth"] intValue];
        self.height =[dic[@"viewHeight"] intValue];
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.ksad/NativeView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        self.container = [[UIView alloc] initWithFrame:frame];
        [self loadNativeAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadNativeAd{
    [self.container removeFromSuperview];
    self.nativeAdsManager = [[KSFeedAdsManager alloc] initWithPosId:self.codeId
                                                               size:CGSizeMake(self.width, self.height)];
    self.nativeAdsManager.delegate = self;
    [self.nativeAdsManager loadAdDataWithCount:1];
}

#pragma mark - KSNativeAdsManagerDelegate

- (void)feedAdsManagerSuccessToLoad:(KSFeedAdsManager *)adsManager nativeAds:(NSArray<KSFeedAd *> *_Nullable)feedAdDataArray{
    [[KSLogUtil sharedInstance] print:(@"信息流广告拉取成功")];
    if(feedAdDataArray.count == 0){
        return;
    }
    self.native = feedAdDataArray[0];
    self.native.delegate = self;
    [self.container addSubview:self.native.feedView];
    //    self.native.rootViewController = [UIViewController jsd_getCurrentViewController];
}


- (void)feedAdsManager:(KSFeedAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error{
    [[KSLogUtil sharedInstance] print:([NSString stringWithFormat:@"信息流广告拉取失败 %@",error])];
    [_channel invokeMethod:@"onFail" arguments:error.description result:nil];
}


#pragma mark - KSFeedAdDelegate

- (void)feedAdViewWillShow:(KSFeedAd *)feedAd{
    
}
- (void)feedAdDidClick:(KSFeedAd *)feedAd{
    [[KSLogUtil sharedInstance] print:(@"信息流广告点击")];
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}
- (void)feedAdDislike:(KSFeedAd *)feedAd{
    [[KSLogUtil sharedInstance] print:(@"信息流广告点击")];
    [_channel invokeMethod:@"onClose" arguments:nil result:nil];
}

- (void)feedAdDidShowOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
}

- (void)feedAdDidCloseOtherController:(KSFeedAd *)nativeAd interactionType:(KSAdInteractionType)interactionType{
    
}
/**
 This method is called when feed ad show. Each ad is called back only once
 */
- (void)feedAdDidShow:(KSFeedAd *)feedAd{
    [[KSLogUtil sharedInstance] print:(@"信息流广告展示")];
    NSDictionary *dictionary = @{@"width": @(feedAd.feedView.frame.size.width),@"height":@(feedAd.feedView.frame.size.height)};
    [_channel invokeMethod:@"onShow" arguments:dictionary result:nil];
}


@end
