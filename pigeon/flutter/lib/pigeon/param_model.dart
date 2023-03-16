import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: "lib/pigeon/param_api.dart",
  swiftOut: "../ios_UIKit/pigeon/ParamApi.swift",
  javaOut:
      "../android_kotlin/app/src/main/java/com/shinnaga/pigeon/ParamApi.java",
  javaOptions: JavaOptions(package: "com.shinnaga.pigeon"),
))
class Param {
  String? str;
  int? num;
  ParamColor? color;
  String? image;
}

class ParamColor {
  ParamColor(this.a, this.r, this.g, this.b);
  int? a;
  int? r;
  int? g;
  int? b;
}

@FlutterApi()
abstract class FlutterParamApi {
  void setParams(Param param);
}
