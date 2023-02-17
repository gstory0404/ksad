package com.gstory.ksad.native

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.View
import android.widget.FrameLayout
import com.gstory.ksad.KsadConfig
import com.kwad.sdk.api.KsAdSDK
import com.kwad.sdk.api.KsFeedAd
import com.kwad.sdk.api.KsLoadManager
import com.kwad.sdk.api.KsScene
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

/**
 * @Author: gstory
 * @CreateDate: 2023/2/17 16:08
 * @Description: java类作用描述
 */
internal class KsadNativeView(
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

    private var nativeAd: KsFeedAd? = null

    init {
        mCodeId = params["androidId"] as String?
        mContainer = FrameLayout(activity)
        channel = MethodChannel(messenger, KsadConfig.NativeAdView + "_" + id)
        loadNativeAd()
    }

    override fun getView(): View {
        return mContainer!!
    }

    override fun dispose() {
        mContainer?.removeAllViews()
    }

    private fun loadNativeAd() {
        mContainer?.removeAllViews()
        var scene = KsScene.Builder(this.mCodeId!!.toLong())
                .adNum(1)
                .build()
        KsAdSDK.getLoadManager()?.loadConfigFeedAd(scene, object : KsLoadManager.FeedAdListener {
            override fun onError(p0: Int, p1: String?) {
                Log.d(TAG, "信息流广告加载失败 $p0 $p1")
                channel?.invokeMethod("onFail", mutableMapOf("message" to "$p0 $p1"))
            }

            override fun onFeedAdLoad(p0: MutableList<KsFeedAd>?) {
                Log.d(TAG, "信息流广告加载成功")
                if (p0 == null || p0.size == 0) {
                    return
                }
                nativeAd = p0[0]
                nativeAd?.setAdInteractionListener(object : KsFeedAd.AdInteractionListener {
                    override fun onAdClicked() {
                        Log.d(TAG, "信息流广告点击")
                        channel?.invokeMethod("onClick", null)
                    }

                    override fun onAdShow() {
                        Log.d(TAG, "信息流广告显示")
                        channel?.invokeMethod("onShow", mutableMapOf("width" to nativeAd?.getFeedView(activity)?.width, "height" to nativeAd?.getFeedView(activity)?.height))
                    }

                    override fun onDislikeClicked() {
                        Log.d(TAG, "信息流广告点击不喜欢")
                        channel?.invokeMethod("onClose", null)
                    }

                    override fun onDownloadTipsDialogShow() {
                        Log.d(TAG, "信息流广告下载提示显示")
                    }

                    override fun onDownloadTipsDialogDismiss() {
                        Log.d(TAG, "信息流广告下载提示消失")
                    }

                })
            }

        })
    }

}
