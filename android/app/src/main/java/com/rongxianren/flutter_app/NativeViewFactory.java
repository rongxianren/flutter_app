package com.rongxianren.flutter_app;

import android.content.Context;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugin.common.StandardMessageCodec;

public class NativeViewFactory extends PlatformViewFactory {
    
    @NonNull
    private final BinaryMessenger messenger;
    @NonNull
    private final View containerView;

    NativeViewFactory(@NonNull BinaryMessenger messenger, @NonNull View containerView) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.containerView = containerView;
    }

    @NonNull
    @Override
    public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        return new NativeView(context, id, creationParams);
    }
}
