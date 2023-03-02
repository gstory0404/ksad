part of '../ksad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/17 09:38
/// @Email gstory0404@gmail.com
/// @Description: 开屏广告widget

class KSAdSplashWidget extends StatefulWidget {
  final String androidId;
  final String iosId;
  final KSAdSplashCallBack? callBack;

  const KSAdSplashWidget(
      {Key? key, required this.androidId, required this.iosId, this.callBack})
      : super(key: key);

  @override
  State<KSAdSplashWidget> createState() => _KSAdSplashWidgetState();
}

class _KSAdSplashWidgetState extends State<KSAdSplashWidget> {
  final String _viewType = "com.gstory.ksad/SplashView";
  MethodChannel? _channel;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        width: window.physicalSize.width,
        height: window.physicalSize.height,
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "androidId": widget.androidId,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Container(
        width: window.physicalSize.width,
        height: window.physicalSize.height,
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "iosId": widget.iosId,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else {
      return Container();
    }
  }

  //注册cannel
  void _registerChannel(int id) {
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      //显示广告
      case KSAdMethod.onShow:
        widget.callBack?.onShow!();
        break;
      //广告加载失败
      case KSAdMethod.onFail:
        Map map = call.arguments;
        widget.callBack?.onFail!(map["message"]);
        break;
      //点击
      case KSAdMethod.onClick:
        widget.callBack?.onClick!();
        break;
    //跳过
      case KSAdMethod.onSkip:
        widget.callBack?.onSkip!();
        break;
      //关闭
      case KSAdMethod.onClose:
        widget.callBack?.onClose!();
        break;
    }
  }
}
