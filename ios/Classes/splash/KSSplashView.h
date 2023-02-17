//
//  KSSplashView.h
//  ksad
//
//  Created by gstory on 2023/2/17.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN
@interface KSSplashViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

@end

@interface KSSplashView : NSObject<FlutterPlatformView>

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
