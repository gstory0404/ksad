import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'ksad_callback.dart';
part 'ksad_stream.dart';
part 'ksad_code.dart';
part 'widget/ksad_native_widget.dart';
part 'widget/ksad_splash_widget.dart';

class KSAd {
  static const MethodChannel _channel = MethodChannel('ksad');

  ///
  /// # SDK注册初始化
  ///
  /// [androidId] androidId 必填
  ///
  /// [iosId] iosId 必填
  ///
  /// [debug] debug日志
  ///
  /// [personal] personalized 是否开启个性化广告
  ///
  /// [programmatic] personalized 是否开启程序化广告
  ///
  static Future<bool> register({
    required String androidId,
    required String iosId,
    bool? personal,
    bool? programmatic,
    bool? debug,
  }) async {
    return await _channel.invokeMethod("register", {
      "androidId": androidId,
      "iosId": iosId,
      "debug": debug ?? false,
      "personal": personal ?? true,
      "programmatic": programmatic ?? true,
    });
  }

  ///
  /// # 获取SDK版本号
  ///
  static Future<String> getSDKVersion() async {
    return await _channel.invokeMethod("getSDKVersion");
  }

  ///
  /// # 激励视频广告预加载
  ///
  /// [androidId] android广告ID
  ///
  /// [iosId] ios广告ID
  ///
  /// [rewardName] 奖励名称
  ///
  /// [rewardAmount] 奖励金额
  ///
  /// [userID] 用户id
  ///
  /// [customData] 扩展参数，服务器回调使用
  ///
  static Future<bool> loadRewardAd({
    required String androidId,
    required String iosId,
    required String rewardName,
    required int rewardAmount,
    required String userId,
    String? customData,
  }) async {
    return await _channel.invokeMethod("loadRewardAd", {
      "androidId": androidId,
      "iosId": iosId,
      "rewardName": rewardName,
      "rewardAmount": rewardAmount,
      "userId": userId,
      "customData": customData ?? "",
    });
  }

  ///
  /// # 显示激励广告
  ///
  static Future<bool> showRewardAd() async {
    return await _channel.invokeMethod("showRewardAd", {});
  }

  ///
  /// # 插屏广告预加载
  ///
  /// [androidId] android广告ID
  ///
  /// [iosId] ios广告ID
  ///
  static Future<bool> loadInsertAd({
    required String androidId,
    required String iosId,
  }) async {
    return await _channel.invokeMethod("loadInsertAd", {
      "androidId": androidId,
      "iosId": iosId,
    });
  }

  ///
  /// # 显示激励广告
  ///
  static Future<bool> showInsertAd() async {
    return await _channel.invokeMethod("showInsertAd", {});
  }
}
