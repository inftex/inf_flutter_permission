import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'inf_flutter_permission_platform_interface.dart';

/// An implementation of [InfFlutterPermissionPlatform] that uses method channels.
class MethodChannelInfFlutterPermission extends InfFlutterPermissionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('inf_flutter_permission');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> requestIDFA() async {
    try {
      await methodChannel.invokeMethod('requestIDFA');
    } on PlatformException catch (e) {}
  }
}
