package com.shinnaga.pigeon;

import android.os.Bundle;
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

                ParamApi.Param param = new ParamApi.Param.Builder()
                        .setA("test-java")
                        .setB(100L)
                        .build();

                ParamApi.FlutterParamApi api = new ParamApi.FlutterParamApi(flutterEngine.getDartExecutor().getBinaryMessenger());
                api.setParams(param, unused -> {});

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