part of 'ksad.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/23 18:01
/// @Email gstory0404@gmail.com
/// @Description: 快手广告 EventChannel监听

const EventChannel tencentAdEventEvent =
    EventChannel("com.gstory.ksad/adevent");

class KSAdStream {
  static StreamSubscription initAdStream({KSAdRewardCallBack? rewardCallBack,KSAdInsertCallBack? insertCallBack}) {
    return tencentAdEventEvent.receiveBroadcastStream().listen((data) {
      switch (data[KSAdType.adType]) {
        ///激励广告
        case KSAdType.rewardAd:
          switch (data[KSAdMethod.onAdMethod]) {
            case KSAdMethod.onShow:
              if (rewardCallBack?.onShow != null) {
                rewardCallBack?.onShow!();
              }
              break;
            case KSAdMethod.onClose:
              if (rewardCallBack?.onClose != null) {
                rewardCallBack?.onClose!();
              }
              break;
            case KSAdMethod.onFail:
              if (rewardCallBack?.onFail != null) {
                rewardCallBack?.onFail!(data["message"]);
              }
              break;
            case KSAdMethod.onClick:
              if (rewardCallBack?.onClick != null) {
                rewardCallBack?.onClick!();
              }
              break;
            case KSAdMethod.onVerify:
              if (rewardCallBack?.onVerify != null) {
                rewardCallBack?.onVerify!(data["hasReward"], data["rewardName"],
                    data["rewardAmount"]);
              }
              break;
            case KSAdMethod.onReady:
              if (rewardCallBack?.onReady != null) {
                rewardCallBack?.onReady!();
              }
              break;
            case KSAdMethod.onUnReady:
              if (rewardCallBack?.onUnReady != null) {
                rewardCallBack?.onUnReady!();
              }
              break;
          }
          break;
      ///插屏广告
        case KSAdType.insertAd:
          switch (data[KSAdMethod.onAdMethod]) {
            case KSAdMethod.onShow:
              if (insertCallBack?.onShow != null) {
                insertCallBack?.onShow!();
              }
              break;
            case KSAdMethod.onClose:
              if (insertCallBack?.onClose != null) {
                insertCallBack?.onClose!();
              }
              break;
            case KSAdMethod.onFail:
              if (insertCallBack?.onFail != null) {
                insertCallBack?.onFail!(data["message"]);
              }
              break;
            case KSAdMethod.onClick:
              if (insertCallBack?.onClick != null) {
                insertCallBack?.onClick!();
              }
              break;
            case KSAdMethod.onReady:
              if (insertCallBack?.onReady != null) {
                insertCallBack?.onReady!();
              }
              break;
            case KSAdMethod.onUnReady:
              if (insertCallBack?.onUnReady != null) {
                insertCallBack?.onUnReady!();
              }
              break;
          }
          break;
      }
    });
  }
}
