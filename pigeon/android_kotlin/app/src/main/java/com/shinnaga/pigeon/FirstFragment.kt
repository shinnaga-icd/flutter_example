package com.shinnaga.pigeon

import android.net.Uri
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.shinnaga.pigeon.ParamApi.Param
import com.shinnaga.pigeon.databinding.FragmentFirstBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import android.util.Base64

/**
 * A simple [Fragment] subclass as the default destination in the navigation.
 */
class FirstFragment : Fragment() {

    private var _binding: FragmentFirstBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentFirstBinding.inflate(inflater, container, false)
        return binding.root

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        lateinit var flutterEngine : FlutterEngine
        var engineID = "param_engine"
        binding.buttonFirst.setOnClickListener {
            flutterEngine = FlutterEngine(requireActivity().applicationContext)

            flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )

            FlutterEngineCache
                .getInstance()
                .put(engineID, flutterEngine)

            val inputStream = context?.resources?.openRawResource(R.drawable.usa)
            val bytes = inputStream?.readBytes()
            val encoded = Base64.encodeToString(bytes, Base64.NO_WRAP)

            val param = Param.Builder()
                .setStr("test-kotlin")
                .setNum(0xFF000000)
                .setColor(ParamApi.ParamColor.Builder().setA(50).setR(0).setG(130).setB(220).build())
                .setImage(encoded)
                .setListStr(listOf(encoded, encoded, encoded, encoded, encoded, encoded, encoded, encoded, encoded, encoded, encoded, encoded))
                .build()

            ParamApi.FlutterParamApi(flutterEngine.dartExecutor.binaryMessenger).setParams(param) {
            }

            startActivity(
                FlutterActivity
                    .withCachedEngine(engineID)
                    .build(requireActivity().applicationContext)
            )
            findNavController().navigate(R.id.action_FirstFragment_to_SecondFragment)
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}