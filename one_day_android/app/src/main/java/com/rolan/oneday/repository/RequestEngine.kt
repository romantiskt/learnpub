package com.jtjr99.jiayoubao.repository

import android.app.Application
import com.lzy.okgo.OkGo
import com.lzy.okgo.cache.CacheMode
import com.lzy.okgo.callback.Callback
import com.lzy.okgo.callback.StringCallback
import com.lzy.okgo.interceptor.HttpLoggingInterceptor
import com.lzy.okgo.model.Progress
import com.lzy.okgo.request.base.Request
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Response
import java.util.concurrent.TimeUnit
import java.util.logging.Level

/**
 * Created by wangyang on 2020/6/1.17:55
 */
object RequestEngine {

    fun init(app: Application) {
        val builder = OkHttpClient.Builder()
        val loggingInterceptor = HttpLoggingInterceptor("OkGo")
        loggingInterceptor.setPrintLevel(HttpLoggingInterceptor.Level.BODY)
        loggingInterceptor.setColorLevel(Level.INFO)
        builder.addInterceptor(loggingInterceptor)
        builder.readTimeout(10000, TimeUnit.MILLISECONDS)
        builder.writeTimeout(10000, TimeUnit.MILLISECONDS)
        builder.connectTimeout(10000, TimeUnit.MILLISECONDS)
        OkGo.getInstance().init(app)
            .setOkHttpClient(builder.build()).cacheMode = CacheMode.NO_CACHE
    }

    suspend fun get(url: String): Response = withContext(Dispatchers.IO) {
        OkGo.get<String>(url).execute()
    }
}