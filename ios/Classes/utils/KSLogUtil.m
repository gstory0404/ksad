//
//  KSLogUtil.m
//  ksad
//
//  Created by gstory on 2022/8/23.
//

#import <Foundation/Foundation.h>
#import "KSLogUtil.h"

@interface KSLogUtil()
@property(nonatomic,assign) BOOL isDebug;
@end


@implementation KSLogUtil

+ (instancetype)sharedInstance{
    static KSLogUtil *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[KSLogUtil alloc]init];
    }
    return myInstance;
}

- (void)debug:(BOOL)isDebug{
    _isDebug = isDebug;
}

- (void)print:(NSString *)message{
    if(_isDebug){
        GLog(@"%@", message);
    }
}

@end

