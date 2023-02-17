package com.gstory.ksad

import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.gstory.ksad.insert.KsadInsertAd
import com.gstory.ksad.reward.KsadRewardAd
import com.kwad.sdk.api.KsAdSDK
import com.kwad.sdk.api.SdkConfig

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** KsadPlugin */
class KsadPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var applicationContext: Context? = null
    private var mActivity: Activity? = null
    private var mFlutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        mActivity = binding.activity
        Log.d("======>","${mFlutterPluginBinding == null}   ${mActivity == null}")
        //注册view
        KsadViewPlugin.registerWith(mFlutterPluginBinding!!, mActivity!!)
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ksad")
        channel.setMethodCallHandler(this)
        applicationContext = flutterPluginBinding.applicationContext
        mFlutterPluginBinding = flutterPluginBinding
        //注册event
        KsadEvent().onAttachedToEngine(flutterPluginBinding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        mActivity = null
    }

    override fun onDetachedFromActivity() {
        mActivity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        mActivity = binding.activity
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        //初始化
        if (call.method == "register") {
            val appId = call.argument<String>("androidId")
            val debug = call.argument<Boolean>("debug")
            KsAdSDK.init(mActivity, SdkConfig.Builder().apply {
                appId(appId)
                showNotification(true)
                debug(debug!!)
            }.build())
            result.success(true)
            //获取sdk版本
        } else if (call.method == "getSDKVersion") {
            result.success(KsAdSDK.getSDKVersion())
            //预加载激励广告
        } else if (call.method == "loadRewardAd") {
            val codeId = call.argument<String>("androidId")
            val rewardName = call.argument<String>("rewardName")
            val rewardAmount = call.argument<Int>("rewardAmount")
            KsadRewardAd.loadAd(mActivity!!,codeId,rewardAmount,rewardName)
            result.success(true)
            //展示激励广告
        } else if (call.method == "showRewardAd") {
            KsadRewardAd.showAd()
            result.success(true)
            //预加载插屏广告
        } else if (call.method == "loadInsertAd") {
            val codeId = call.argument<String>("androidId")
            KsadInsertAd.loadAd(mActivity!!,codeId)
            result.success(true)
            //展示激励广告
        } else if (call.method == "showInsertAd") {
            KsadInsertAd.showAd()
            result.success(true)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
