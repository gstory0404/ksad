//
//  KSAdServerBidLogMacro.h
//  KSUServerBidding
//
//  Created by 李姝谊 on 2022/1/18.
//

#import <KSULog/KSAdLogMacro.h>
#ifndef KSAdServerBidLogMacro_h
#define KSAdServerBidLogMacro_h

#define KSAdBidLogError(frmt, ...)     KSAdLogError(@"[ServerBid]" frmt, ##__VA_ARGS__)
#define KSAdBidLogWarn(frmt, ...)      KSAdLogWarn(@"[ServerBid]" frmt, ##__VA_ARGS__)
#define KSAdBidLogInfo(frmt, ...)      KSAdLogInfo(@"[ServerBid]" frmt, ##__VA_ARGS__)
#define KSAdBidLogDebug(frmt, ...)     KSAdLogDebug(@"[ServerBid]" frmt, ##__VA_ARGS__)
#define KSAdBidLogVerbose(frmt, ...)   KSAdLogVerbose(@"[ServerBid]" frmt, ##__VA_ARGS__)

#endif /* KSAdServerBidLogMacro_h */
