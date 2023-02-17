package com.gstory.ksad

import android.app.Activity
import com.gstory.ksad.native.KsadNativeViewFactory
import com.gstory.ksad.splash.KsadSplashViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * @Author: gstory
 * @CreateDate: 2023/2/17 14:07
 * @Description: java类作用描述
 */

object KsadViewPlugin {
    fun registerWith(binding: FlutterPlugin.FlutterPluginBinding, activity: Activity) {
        //注册开屏广告
        binding.platformViewRegistry.registerViewFactory(KsadConfig.SplashAdView, KsadSplashViewFactory(binding.binaryMessenger, activity))
        //注册信息流广告
        binding.platformViewRegistry.registerViewFactory(KsadConfig.NativeAdView, KsadNativeViewFactory(binding.binaryMessenger, activity))
    }
}