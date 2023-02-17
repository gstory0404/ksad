import 'package:flutter/material.dart';
import 'package:ksad/ksad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/17 09:44
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return KSAdSplashWidget(
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
    );
  }
}
