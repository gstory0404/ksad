# 快手广告Flutter版本

<p>
<a href="https://pub.flutter-io.cn/packages/ksad"><img src=https://img.shields.io/pub/v/ksad?color=orange></a>
<a href="https://pub.flutter-io.cn/packages/ksad"><img src=https://img.shields.io/pub/likes/ksad></a>
<a href="https://pub.flutter-io.cn/packages/ksad"><img src=https://img.shields.io/pub/points/ksad></a>
<a href="https://github.com/gstory0404/ksad/commits"><img src=https://img.shields.io/github/last-commit/gstory0404/ksad></a>
<a href="https://github.com/gstory0404/ksad"><img src=https://img.shields.io/github/stars/gstory0404/ksad></a>
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
ksad: ^latest
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

### 4、开屏广告
```dart
KSAdSplashWidget(
    androidId: "10511000010",
    iosId: "10511000009",
    callBack: KSAdSplashCallBack(
        onShow: (){
          print("开屏广告显示");
        },
        onClick: (){
          print("开屏广告点击");
        },
        onClose: (){
          print("开屏广告关闭");
          Navigator.of(context).pop();
        },
        onFail: (msg){
          print("开屏广告错误  $msg");
          Navigator.of(context).pop();
        }
     ),
)
```

### 5、激励广告
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
                  //json扩展参数 服务器回调使用
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

### 6、插屏广告
预加载广告
```dart
await KSAd.loadInsertAd(
                  //android广告id
                  androidId: "10706000001",
                  //ios广告id
                  iosId: "10706000001",
                );
```
显示广告

```dart
await KSAd.showInsertAd();
```

广告监听
```dart
KSAdStream.initAdStream(
    //插屏广告
    insertCallBack: KSAdInsertCallBack(
        onShow: () {
          print("插屏广告显示");
        },
        onClick: () {
          print("插屏广告点击");
        },
        onFail: (message) {
          print("插屏广告失败 $message");
        },
        onClose: () {
          print("插屏广告关闭");
        },
        onReady: () async {
          print("插屏广告预加载准备就绪");
          await KSAd.showInsertAd();
        },
        onUnReady: () {
          print("插屏广告预加载未准备就绪");
        },
    )
)
```
## 插件链接

|Flutter插件|地址|
|:----|:----|
|字节-穿山甲广告插件|[flutter_unionad](https://github.com/gstory0404/flutter_unionad)|
|腾讯-优量汇广告插件|[flutter_tencentad](https://github.com/gstory0404/flutter_tencentad)|
|百度-百青藤广告插件|[baiduad](https://github.com/gstory0404/baiduad)|
|字节-Gromore聚合广告|[gromore](https://github.com/gstory0404/gromore)|
|Sigmob广告|[sigmobad](https://github.com/gstory0404/sigmobad)|
|信天翁广告|[quakerbirdad](https://github.com/gstory0404/quakerbirdad)|
|快手广告|[ksad](https://github.com/gstory0404/ksad)|
|聚合广告插件(迁移至GTAds)|[flutter_universalad](https://github.com/gstory0404/flutter_universalad)|
|GTAds聚合广告|[GTAds](https://github.com/gstory0404/GTAds)|
|字节穿山甲内容合作插件|[flutter_pangrowth](https://github.com/gstory0404/flutter_pangrowth)|
|文档预览插件|[file_preview](https://github.com/gstory0404/file_preview)|
|滤镜|[gpu_image](https://github.com/gstory0404/gpu_image)|

### 开源不易，觉得有用的话可以请作者喝杯奶茶🧋
<img src="https://github.com/gstory0404/flutter_unionad/blob/master/image/weixin.jpg" width = "200" height = "160" alt="打赏"/>


## 联系方式
* Email: gstory0404@gmail.com
* blog：https://www.gstory.cn/

* QQ群: <a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=4j2_yF1-pMl58y16zvLCFFT2HEmLf6vQ&jump_from=webapi"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="649574038" title="flutter交流"></a>
* [Telegram](https://t.me/flutterex)
