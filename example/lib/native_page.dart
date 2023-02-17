import 'package:flutter/material.dart';
import 'package:ksad/ksad.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/24 14:54
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class NativePage extends StatefulWidget {
  const NativePage({Key? key}) : super(key: key);

  @override
  State<NativePage> createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("信息流"),
      ),
      body: Container(
        child: Column(
          children: [
            KSAdNativeWidget(
              //andorid广告位id
              androidId: "10511000008",
              //ios广告位id
              iosId: "10511000007",
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
          ],
        ),
      ),
    );
  }
}
