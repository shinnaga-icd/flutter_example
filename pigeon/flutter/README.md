## pigeon command

```
fvm flutter pub run pigeon \
  --input lib/pigeon/param_model.dart
```

## build command

```
fvm flutter build ios-framework
fvm flutter build aar
```
※iOSシミュレータ上でadd2appが動作しない場合、Release/App.xcframework内の「isolate_snapshot_data」「kernel_blob.bin」「vm_snapshot_data」をDebugから補充すること
※webview_flutterパッケージはapple code署名のみに利用（機能としては利用なし）、無いとビルド出力にFlutterPluginRegistrant.xcframeworkが出ない
