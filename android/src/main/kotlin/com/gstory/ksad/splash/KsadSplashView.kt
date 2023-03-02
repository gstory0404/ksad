package com.gstory.ksad.splash

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.View
import android.widget.FrameLayout
import com.gstory.ksad.KsadConfig
import com.kwad.sdk.api.KsAdSDK
import com.kwad.sdk.api.KsLoadManager
import com.kwad.sdk.api.KsScene
import com.kwad.sdk.api.KsSplashScreenAd
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

/**
 * @Author: gstory
 * @CreateDate: 2023/2/17 15:10
 * @Description: java类作用描述
 */

internal class KsadSplashView(
        var context: Context,
        var activity: Activity,
        messenger: BinaryMessenger,
        id: Int,
        params: Map<String?, Any?>
) : PlatformView {
    private val TAG = this.javaClass.name
    private var mContainer: FrameLayout? = null

    //广告所需参数
    private var mCodeId: String?

    private var channel: MethodChannel?
    private var splashAd: KsSplashScreenAd? = null

    init {
        mCodeId = params["androidId"] as String?
        mContainer = FrameLayout(activity)
        channel = MethodChannel(messenger, KsadConfig.SplashAdView + "_" + id)
        loadSplashAd()
    }

    override fun getView(): View {
        return mContainer!!
    }

    override fun dispose() {
        mContainer?.removeAllViews()
    }


    private fun loadSplashAd() {
        mContainer?.removeAllViews()
        var scene = KsScene.Builder(this.mCodeId!!.toLong())
                .build()
        KsAdSDK.getLoadManager()?.loadSplashScreenAd(scene,object : KsLoadManager.SplashScreenAdListener {
            override fun onError(p0: Int, p1: String?) {
                Log.d(TAG, "开屏广告加载失败 $p0 $p1")
                channel?.invokeMethod("onFail", mutableMapOf("message" to "$p0 $p1"))
            }

            override fun onRequestResult(p0: Int) {
                Log.d(TAG, "开屏广告加载成功 $p0")
            }

            override fun onSplashScreenAdLoad(p0: KsSplashScreenAd?) {
                Log.d(TAG, "开屏广告加载成功")
                splashAd = p0;
                var view =  splashAd?.getView(activity,object : KsSplashScreenAd.SplashScreenAdInteractionListener{
                    override fun onAdClicked() {
                        Log.d(TAG, "开屏广告点击")
                        channel?.invokeMethod("onClick", null)
                    }

                    override fun onAdShowError(p0: Int, p1: String?) {
                        Log.d(TAG, "开屏广告显示错误 $p0 $p1")
                        channel?.invokeMethod("onFail", mutableMapOf("message" to "$p0 $p1"))
                    }

                    override fun onAdShowEnd() {
                        Log.d(TAG, "开屏广告结束展示")
                        channel?.invokeMethod("onClose", null)
                    }

                    override fun onAdShowStart() {
                        Log.d(TAG, "开屏广告开始展示")
                    }

                    override fun onSkippedAd() {
                        Log.d(TAG, "开屏广告跳过")
                        channel?.invokeMethod("onSkip", null)
                    }

                    override fun onDownloadTipsDialogShow() {
                        Log.d(TAG, "开屏广告显示下载提示")
                    }

                    override fun onDownloadTipsDialogDismiss() {
                        Log.d(TAG, "开屏广告影藏下载提示")
                    }

                    override fun onDownloadTipsDialogCancel() {
                        Log.d(TAG, "开屏广告下载提示取消")
                    }

                })
                mContainer?.addView(view)
            }

        })
    }
}