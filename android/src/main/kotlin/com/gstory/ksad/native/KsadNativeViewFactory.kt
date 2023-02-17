package com.gstory.ksad.native

import android.app.Activity
import android.content.Context
import com.gstory.ksad.splash.KsadSplashView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * @Author: gstory
 * @CreateDate: 2023/2/17 16:10
 * @Description: java类作用描述
 */

class KsadNativeViewFactory(private val messenger: BinaryMessenger, private val activity: Activity) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, id: Int, args: Any?): PlatformView {
        val params = args as Map<String?, Any?>
        return KsadNativeView(context!!, activity, messenger, id, params)
    }
}