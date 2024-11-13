package com.gstory.ksad.reward

import android.app.Activity
import android.util.Log
import com.gstory.ksad.KsadEvent
import com.kwad.sdk.api.*
import com.kwad.sdk.api.KsLoadManager.RewardVideoAdListener
import org.json.JSONException
import org.json.JSONObject

object KsadRewardAd {
    private var TAG = this.javaClass.javaClass.name

    var mActivity: Activity? = null

    //广告所需参数
    private var mCodeId: String? = null
    private var rewardAmount: Int? = 0
    private var rewardName: String? = null
    private var extraData: String? = null

    private var rewardVideoAd: KsRewardVideoAd? = null

    fun loadAd(mActivity: Activity, mCodeId: String?, rewardAmount: Int?, rewardName: String?,extraData : String?) {
        this.mActivity = mActivity
        this.mCodeId = mCodeId
        this.rewardAmount = rewardAmount
        this.rewardName = rewardName
        this.extraData = extraData
        var scene = KsScene.Builder(this.mCodeId!!.toLong()).rewardCallbackExtraData(jsonToMap(extraData)).build()
        KsAdSDK.getLoadManager()?.loadRewardVideoAd(scene, object : RewardVideoAdListener {
            override fun onError(p0: Int, p1: String?) {
                Log.d(TAG, "激励广告加载失败 $p0 $p1")
                KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onFail","message" to "$p0 $p1"))
            }

            override fun onRewardVideoResult(p0: MutableList<KsRewardVideoAd>?) {
                Log.d(TAG, "激励视频广告数据请求成功")
            }

            override fun onRewardVideoAdLoad(p0: MutableList<KsRewardVideoAd>?) {
                Log.d(TAG, "激励视频广告数据请求且资源缓存成功")
                if (p0 != null && p0.size > 0) {
                    rewardVideoAd = p0[0]
                    KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onReady"))
                }
            }

        })
    }

    fun jsonToMap(jsonString: String?): Map<String, String>? {
        val jsonObject: JSONObject
        try {
            jsonObject = JSONObject(jsonString)
            val keyIter: Iterator<String> = jsonObject.keys()
            var key: String
            var value: Any
            var valueMap = mutableMapOf<String, String>()
            while (keyIter.hasNext()) {
                key = keyIter.next()
                value = jsonObject[key].toString()
                valueMap[key] = value
            }
            return valueMap
        } catch (e: JSONException) {
            return mutableMapOf()
        }
    }


    fun showAd() {
        if (rewardVideoAd == null || rewardVideoAd?.isAdEnable == false) {
            Log.d(TAG, "激励视频广告为准备就绪")
            KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onUnReady"))
            return
        }
        rewardVideoAd?.setRewardAdInteractionListener(object : KsRewardVideoAd.RewardAdInteractionListener {
            override fun onAdClicked() {
                Log.d(TAG, "激励视频广告点击")
                KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onClick"))
            }

            override fun onPageDismiss() {
                Log.d(TAG, "激励视频广告页面消失")
                KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onClose"))
            }

            override fun onVideoPlayError(p0: Int, p1: Int) {
                Log.d(TAG, "激励视频广告播放拨错 $p0  $p1")
                KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onFail","message" to "$p0 $p1"))
            }

            override fun onVideoPlayEnd() {
                Log.d(TAG, "激励视频广告播放结束")
            }

            override fun onVideoSkipToEnd(p0: Long) {
                Log.d(TAG, "激励视频广告视频跳过")
            }

            override fun onVideoPlayStart() {
                Log.d(TAG, "激励视频广告开始播放视频")
                KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onShow"))
            }

            override fun onRewardVerify() {
                Log.d(TAG, "激励视频广告验证")
                KsadEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onVerify", "hasReward" to true, "rewardAmount" to rewardAmount, "rewardName" to rewardName))
            }

            override fun onRewardVerify(p0: MutableMap<String, Any>?) {
                Log.d(TAG, "激励视频广告验证$p0")
            }

            override fun onRewardStepVerify(p0: Int, p1: Int) {
                Log.d(TAG, "激励视频广告分阶段验证 $p0  $p1")
            }

            override fun onExtraRewardVerify(p0: Int) {
                Log.d(TAG, "激励视频广告验证 $p0")
            }

        })
        var config = KsVideoPlayConfig.Builder().showLandscape(false).build()
        rewardVideoAd?.showRewardVideoAd(mActivity, config)
    }
}