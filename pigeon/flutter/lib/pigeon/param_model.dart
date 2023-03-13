import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: "lib/pigeon/param_api.dart",
  swiftOut: "build/pigeon/ParamApi.swift",
  javaOut: "build/pigeon/ParamApi.java",
  javaOptions: JavaOptions(package: "com.example.pigeon"),
))
class Param {
  String? a;
  int? b;
}

@FlutterApi()
abstract class FlutterParamApi {
  void setParams(Param param);
}
