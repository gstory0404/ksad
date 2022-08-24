import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ksad/ksad.dart';
import 'package:ksad_example/native_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isRegister = false;
  String _sdkVersion = "";

  StreamSubscription? _adStream;

  @override
  void initState() {
    super.initState();
    _register();
    _adStream = KSAdStream.initAdStream(
      //激励广告
      rewardCallBack: KSAdRewardCallBack(
        onShow: () {
          print("激励广告显示");
        },
        onClick: () {
          print("激励广告点击");
        },
        onFail: (message) {
          print("激励广告失败 $message");
        },
        onClose: () {
          print("激励广告关闭");
        },
        onReady: () async {
          print("激励广告预加载准备就绪");
          await KSAd.showRewardAd();
        },
        onUnReady: () {
          print("激励广告预加载未准备就绪");
        },
        onVerify: (hasReward, rewardName, rewardAmount) {
          print("激励广告奖励  $hasReward   $rewardName   $rewardAmount");
        },
      ),
    );
  }

  ///初始化
  Future<void> _register() async {
    _isRegister = await KSAd.register(
      //androidId
      androidId: "1070600001",
      //iosId
      iosId: "1070600001",
      //是否显示日志log
      debug: true,
      //是否显示个性化推荐广告
      personalized: true,
    );
    _sdkVersion = await KSAd.getSDKVersion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('快手广告插件'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('快手SDK初始化: $_isRegister\n'),
            Text('SDK版本: $_sdkVersion\n'),
            //激励广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('激励广告'),
              onPressed: () async {
                await KSAd.loadRewardAd(
                  //android广告id
                  androidId: "10706000001",
                  //ios广告id
                  iosId: "10706000001",
                  //用户id
                  userID: "123",
                  //奖励
                  rewardName: "100金币",
                  //奖励数
                  rewardAmount: 100,
                  //扩展参数 服务器回调使用
                  customData: "",
                );
              },
            ),
            //信息流广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('信息流广澳'),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const NativePage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
