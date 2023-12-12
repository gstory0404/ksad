//
//  KSAdPermission.h
//  KSUPermission
//
//  Created by 崔祥龙 on 2021/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KSLocation;

typedef KSLocation *_Nullable(^LocationBlock)(void);
typedef NSString *_Nullable(^IdfaBlock)(void);
typedef NSString *_Nullable(^IdfvBlock)(void);
typedef NSString *_Nullable(^DeviceIdBlock)(void);

@interface KSLocation : NSObject

@property (nonatomic, assign) CGFloat longitude;

@property (nonatomic, assign) CGFloat latitude;

@end

@interface KSAdPermission : NSObject

@property (nonatomic, copy) LocationBlock locationBlock;

@property (nonatomic, copy) IdfaBlock idfaBlock;

@property (nonatomic, copy) IdfvBlock idfvBlock;

@property (nonatomic, copy) DeviceIdBlock deviceIdBlock;

@end

NS_ASSUME_NONNULL_END
