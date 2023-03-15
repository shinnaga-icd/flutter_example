import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: "lib/pigeon/param_api.dart",
  swiftOut: "../ios_UIKit/pigeon/ParamApi.swift",
  javaOut: "../android/app/src/main/java/com/shinnaga/pigeon/ParamApi.java",
  javaOptions: JavaOptions(package: "com.shinnaga.pigeon"),
))
class Param {
  String? a;
  int? b;
}

@FlutterApi()
abstract class FlutterParamApi {
  void setParams(Param param);
}
