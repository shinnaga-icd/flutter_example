package com.shinnaga.pigeon;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class FlutterParamApi extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine){
        super.configureFlutterEngine(flutterEngine);

        ParamApi.Param param = new ParamApi.Param.Builder()
                .setA("test")
                .setB(100L)
                .build();

        ParamApi.FlutterParamApi api = new ParamApi.FlutterParamApi(flutterEngine.getDartExecutor().getBinaryMessenger());
        api.setParams(param, unused -> {});
    }
}
