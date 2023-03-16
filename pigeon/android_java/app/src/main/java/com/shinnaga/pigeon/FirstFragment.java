package com.shinnaga.pigeon;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import com.shinnaga.pigeon.databinding.FragmentFirstBinding;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import com.shinnaga.pigeon.*;

public class FirstFragment extends Fragment {

    private FragmentFirstBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

        binding = FragmentFirstBinding.inflate(inflater, container, false);
        return binding.getRoot();

    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        binding.buttonFirst.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                FlutterEngine flutterEngine = new FlutterEngine(view.getContext());
                String engineID = "param_engine";

                flutterEngine.getDartExecutor().executeDartEntrypoint(
                        DartExecutor.DartEntrypoint.createDefault()
                );

                FlutterEngineCache.getInstance()
                                .put(engineID, flutterEngine);

                Bitmap bitmap = BitmapFactory.decodeResource(getResources(), R.raw.usa);

                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
                byte[] byteArray = byteArrayOutputStream.toByteArray();

                String encoded = Base64.encodeToString(byteArray, Base64.NO_WRAP);


                ParamApi.ParamColor paramColor = new ParamApi.ParamColor.Builder().setA(155L).setR(20L).setG(15L).setB(255L).build();

                ParamApi.Param param = new ParamApi.Param.Builder()
                        .setStr("test-java")
                        .setNum(100L)
                        .setColor(paramColor)
                        .setImage(encoded)
                        .build();

                new ParamApi.FlutterParamApi(flutterEngine.getDartExecutor().getBinaryMessenger()).setParams(param, unused -> {});

                startActivity(
                        FlutterActivity.withCachedEngine(engineID).build(view.getContext())
                );
                NavHostFragment.findNavController(FirstFragment.this)
                        .navigate(R.id.action_FirstFragment_to_SecondFragment);
            }
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}