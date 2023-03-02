part of 'ksad.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/23 17:58
/// @Email gstory0404@gmail.com
/// @Description: 快手广告相关回调

///显示
typedef KSOnShow = void Function();

///失败
typedef KSOnFail = void Function(dynamic message);

///点击
typedef KSOnClick = void Function();

///跳过
typedef KSOnSkip = void Function();

///关闭
typedef KSOnClose = void Function();

///加载超时
typedef KSOnTimeOut = void Function();

///广告预加载完成
typedef KSOnReady = void Function();

///广告预加载未完成
typedef KSOnUnReady = void Function();

///广告奖励验证
typedef KSOnVerify = void Function(
    bool hasReward, String rewardName, int rewardAmount);

///激励广告回调
class KSAdRewardCallBack {
  KSOnShow? onShow;
  KSOnClose? onClose;
  KSOnFail? onFail;
  KSOnClick? onClick;
  KSOnVerify? onVerify;
  KSOnReady? onReady;
  KSOnUnReady? onUnReady;

  KSAdRewardCallBack(
      {this.onShow,
      this.onClick,
      this.onClose,
      this.onFail,
      this.onVerify,
      this.onReady,
      this.onUnReady});
}

///信息流广告回调
class KSAdNativeCallBack {
  KSOnShow? onShow;
  KSOnClose? onClose;
  KSOnFail? onFail;
  KSOnClick? onClick;

  KSAdNativeCallBack({this.onShow, this.onClick, this.onClose, this.onFail});
}

///开屏广告回调
class KSAdSplashCallBack {
  KSOnShow? onShow;
  KSOnClose? onClose;
  KSOnFail? onFail;
  KSOnClick? onClick;
  KSOnSkip? onSkip;

  KSAdSplashCallBack({this.onShow, this.onClick, this.onClose, this.onFail,this.onSkip});
}

///插屏广告回调
class KSAdInsertCallBack {
  KSOnShow? onShow;
  KSOnClose? onClose;
  KSOnFail? onFail;
  KSOnClick? onClick;
  KSOnReady? onReady;
  KSOnUnReady? onUnReady;

  KSAdInsertCallBack(
      {this.onShow,
      this.onClick,
      this.onClose,
      this.onFail,
      this.onReady,
      this.onUnReady});
}
