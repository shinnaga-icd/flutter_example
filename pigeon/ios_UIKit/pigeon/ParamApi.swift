// Autogenerated from Pigeon (v9.0.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

/// Generated class from Pigeon that represents data sent in messages.
struct Param {
  var str: String? = nil
  var num: Int64? = nil
  var color: ParamColor? = nil
  var image: String? = nil

  static func fromList(_ list: [Any]) -> Param? {
    let str = list[0] as! String? 
    let num = list[1] as! Int64? 
    var color: ParamColor? = nil
    if let colorList = list[2] as! [Any]? {
      color = ParamColor.fromList(colorList as [Any])
    }
    let image = list[3] as! String? 

    return Param(
      str: str,
      num: num,
      color: color,
      image: image
    )
  }
  func toList() -> [Any?] {
    return [
      str,
      num,
      color?.toList(),
      image,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct ParamColor {
  var a: Int64? = nil
  var r: Int64? = nil
  var g: Int64? = nil
  var b: Int64? = nil

  static func fromList(_ list: [Any]) -> ParamColor? {
    let a = list[0] as! Int64? 
    let r = list[1] as! Int64? 
    let g = list[2] as! Int64? 
    let b = list[3] as! Int64? 

    return ParamColor(
      a: a,
      r: r,
      g: g,
      b: b
    )
  }
  func toList() -> [Any?] {
    return [
      a,
      r,
      g,
      b,
    ]
  }
}
private class FlutterParamApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Param.fromList(self.readValue() as! [Any])
      case 129:
        return ParamColor.fromList(self.readValue() as! [Any])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class FlutterParamApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Param {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? ParamColor {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class FlutterParamApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return FlutterParamApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return FlutterParamApiCodecWriter(data: data)
  }
}

class FlutterParamApiCodec: FlutterStandardMessageCodec {
  static let shared = FlutterParamApiCodec(readerWriter: FlutterParamApiCodecReaderWriter())
}

/// Generated class from Pigeon that represents Flutter messages that can be called from Swift.
class FlutterParamApi {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return FlutterParamApiCodec.shared
  }
  func setParams(param paramArg: Param, completion: @escaping () -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.FlutterParamApi.setParams", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([paramArg] as [Any?]) { _ in
      completion()
    }
  }
}
