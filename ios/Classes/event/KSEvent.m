//
//  KSEvent.m
//  ksad
//
//  Created by 郭维佳 on 2022/8/23.
//

#import "KSEvent.h"
#import <Flutter/Flutter.h>

@interface KSEvent()<FlutterStreamHandler>
@property(nonatomic,strong) FlutterEventSink eventSink;
@end

@implementation KSEvent

+ (instancetype)sharedInstance{
    static KSEvent *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[KSEvent alloc]init];
    }
    return myInstance;
}


- (void)initEvent:(NSObject<FlutterPluginRegistrar>*)registrar{
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.gstory.ksad/adevent"   binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:self];
}

-(void)sentEvent:(NSDictionary*)arguments{
    self.eventSink(arguments);
}



#pragma mark - FlutterStreamHandler
- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    self.eventSink = nil;
    return nil;
}

- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
    self.eventSink = events;
    return nil;
}@end

