package com.gstory.ksad.insert

import android.app.Activity
import android.util.Log
import com.gstory.ksad.KsadEvent
import com.gstory.ksad.reward.KsadRewardAd
import com.kwad.sdk.api.*
import com.kwad.sdk.api.KsInterstitialAd.AdInteractionListener

/**
 * @Author: gstory
 * @CreateDate: 2023/2/17 14:59
 * @Description: java类作用描述
 */

object KsadInsertAd {
    private var TAG = this.javaClass.javaClass.name

    var mActivity: Activity? = null

    //广告所需参数
    private var mCodeId: String? = null

    private var interstitialAd: KsInterstitialAd? = null

    fun loadAd(mActivity: Activity, mCodeId: String?) {
        this.mCodeId = mCodeId
        this.mActivity = mActivity
        var scene = KsScene.Builder(mCodeId!!.toLong()).build()
        KsAdSDK.getLoadManager()?.loadInterstitialAd(scene,object : KsLoadManager.InterstitialAdListener {
            override fun onError(p0: Int, p1: String?) {
                Log.d(TAG, "插屏广告加载失败 $p0 $p1")
                KsadEvent.sendContent(mutableMapOf("adType" to "insertAd", "onAdMethod" to "onFail","message" to "$p0 $p1"))
            }

            override fun onRequestResult(p0: Int) {
                Log.d(TAG, "插屏广告加载结果 $p0")
            }

            override fun onInterstitialAdLoad(p0: MutableList<KsInterstitialAd>?) {
                Log.d(TAG, "插屏广告加载成功")
                if(p0 !=null && p0.size > 0){
                    interstitialAd = p0[0]
                    KsadEvent.sendContent(mutableMapOf("adType" to "insertAd", "onAdMethod" to "onReady"))
                }
            }

        })
    }

    fun showAd(){
        if(interstitialAd == null){
            Log.d(TAG, "插屏广告interstitialAd不存在")
            return
        }
        var config = KsVideoPlayConfig.Builder().build()
        interstitialAd?.setAdInteractionListener(object : AdInteractionListener{
            override fun onAdClicked() {
                Log.d(TAG, "插屏广告点击")
                KsadEvent.sendContent(mutableMapOf("adType" to "insertAd", "onAdMethod" to "onClick"))
            }

            override fun onAdShow() {
                Log.d(TAG, "插屏广告显示")
                KsadEvent.sendContent(mutableMapOf("adType" to "insertAd", "onAdMethod" to "onShow"))
            }

            override fun onAdClosed() {
                Log.d(TAG, "插屏广告关闭")
                KsadEvent.sendContent(mutableMapOf("adType" to "insertAd", "onAdMethod" to "onClose"))
            }

            override fun onPageDismiss() {
                Log.d(TAG, "插屏广告页面消失")
            }

            override fun onVideoPlayError(p0: Int, p1: Int) {
                Log.d(TAG, "插屏广告视频播放失败 $p0 $p1")
            }

            override fun onVideoPlayEnd() {
                Log.d(TAG, "插屏广告视频播放结束")
            }

            override fun onVideoPlayStart() {
                Log.d(TAG, "插屏广告视频开始播放")
            }

            override fun onSkippedAd() {
                Log.d(TAG, "插屏广告跳过")
            }

        })
        interstitialAd?.showInterstitialAd(mActivity,config)
    }
}