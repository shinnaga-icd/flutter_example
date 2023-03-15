## pigeon command

```
fvm flutter pub run pigeon \
  --input lib/pigeon/param_model.dart
```

## build command

```
fvm flutter build ios-framework --no-profile --output=../ios/Flutter/
```
※Release/App.xcframework内の「isolate_snapshot_data」「kernel_blob.bin」「vm_snapshot_data」をDebugから補充すること

