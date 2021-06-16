package com.rongxianren.flutter_app;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

public class NativeView implements PlatformView {
    @NonNull
    private final WebView webView;

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
//        textView = new TextView(context);
//        textView.setTextSize(72);
//        textView.setBackgroundColor(Color.rgb(255, 255, 255));
//        textView.setText("Rendered on a native Android view (id: " + id + ")");
        webView = new WebView(context);
        WebSettings mWebSettings = webView.getSettings();
        mWebSettings.setJavaScriptEnabled(true);
        mWebSettings.setDomStorageEnabled(true);
        webView.setWebViewClient(new WebViewClient());
        webView.loadUrl("https://www.baidu.com/");
    }

    @NonNull
    @Override
    public View getView() {
        return webView;
    }

    @Override
    public void dispose() {
    }
}
