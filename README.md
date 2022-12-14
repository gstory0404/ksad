# 快手广告 Flutter版本

<p>
<a href="https://pub.flutter-io.cn/packages/flutter_unionad"><img src=https://img.shields.io/badge/ksad-v0.0.2-success></a>
</p>

## 官方文档
* [Android]()
* [IOS](https://static.yximgs.com/udata/pkg/KSAdSDKTarGz/doc/ksadsdk-iOS-readme-ad-3.3.28--1182.pdf)

## 版本更新

[更新日志](https://github.com/gstory0404/ksad/blob/master/CHANGELOG.md)

## 本地开发环境
```
[✓] Flutter (Channel stable, 3.0.4, on macOS 12.5 21G72 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0-rc1)
[✓] Xcode - develop for iOS and macOS (Xcode 13.4.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.2)
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1.1)
[✓] VS Code (version 1.69.2)
[✓] Connected device (3 available)
[✓] HTTP Host Availability
```

## 集成步骤
#### 1、pubspec.yaml
```Dart
ksad: ^0.0.2
```
引入
```Dart
import 'package:ksad/ksad.dart';
```

## 使用

### 1、SDK初始化
```dart
await KSAd.register(
      //androidId
      androidId: "1070600001",
      //iosId
      iosId: "1070600001",
      //是否显示日志log
      debug: true,
      //是否显示个性化推荐广告
      personalized: true,
    )
```

### 2、获取SDK版本
```Dart
 await KSAd.getSDKVersion();
```

### 3、信息流广告（模版）
```dart
KSAdNativeWidget(
    //andorid广告位id
    androidId: "10706000004",
    //ios广告位id
    iosId: "10706000004",
    //广告宽
    viewWidth: 300,
    //广告高 加载成功后会自动修改为sdk返回广告高
    viewHeight: 200,
    //广告回调
    callBack: KSAdNativeCallBack(
    onShow: (){
      print("信息流广告显示");
    },
    onClose: (){
      print("信息流广告关闭");
    },
    onFail: (message){
      print("信息流广告出错 $message");
    },
    onClick: (){
      print("信息流广告点击");
    }
  ),
)
```

### 4、激励广告
预加载广告
```dart
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
```
显示广告

```dart
await KSAd.showRewardAd();
```

广告监听
```dart
KSAdStream.initAdStream(
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
```
