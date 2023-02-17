part of '../ksad.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/24 10:12
/// @Email gstory0404@gmail.com
/// @Description: 快手信息流广告widget

class KSAdNativeWidget extends StatefulWidget {
  final String androidId;
  final String iosId;
  final int viewWidth;
  final int viewHeight;
  final KSAdNativeCallBack? callBack;

  const KSAdNativeWidget(
      {Key? key,
      required this.androidId,
      required this.iosId,
      required this.viewWidth,
      required this.viewHeight,
      this.callBack})
      : super(key: key);

  @override
  State<KSAdNativeWidget> createState() => _KSAdNativeWidgetState();
}

class _KSAdNativeWidgetState extends State<KSAdNativeWidget> {
  final String _viewType = "com.gstory.ksad/NativeView";

  MethodChannel? _channel;

  //广告是否显示
  bool _isShowAd = true;

  double _width = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();
    _width = widget.viewWidth.toDouble();
    _height = widget.viewHeight.toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowAd) {
      return Container();
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        width: _width,
        height: _height,
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "androidId": widget.androidId,
            "viewWidth": widget.viewWidth,
            "viewHeight": widget.viewHeight,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Container(
        width: _width,
        height: _height,
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "iosId": widget.iosId,
            "viewWidth": widget.viewWidth,
            "viewHeight": widget.viewHeight,
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
        Map map = call.arguments;
        if (mounted) {
          setState(() {
            _width = map["width"];
            _height = map["height"];
            _isShowAd = true;
          });
        }
        widget.callBack?.onShow!();
        break;
      //广告加载失败
      case KSAdMethod.onFail:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
        }
        Map map = call.arguments;
        widget.callBack?.onFail!(map["message"]);
        break;
      //点击
      case KSAdMethod.onClick:
        widget.callBack?.onClick!();
        break;
      //关闭
      case KSAdMethod.onClose:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
        }
        widget.callBack?.onClose!();
        break;
    }
  }
}
