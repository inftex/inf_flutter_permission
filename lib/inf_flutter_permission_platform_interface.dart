import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'inf_flutter_permission_method_channel.dart';

abstract class InfFlutterPermissionPlatform extends PlatformInterface {
  /// Constructs a InfFlutterPermissionPlatform.
  InfFlutterPermissionPlatform() : super(token: _token);

  static final Object _token = Object();

  static InfFlutterPermissionPlatform _instance =
      MethodChannelInfFlutterPermission();

  /// The default instance of [InfFlutterPermissionPlatform] to use.
  ///
  /// Defaults to [MethodChannelInfFlutterPermission].
  static InfFlutterPermissionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InfFlutterPermissionPlatform] when
  /// they register themselves.
  static set instance(InfFlutterPermissionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> requestIDFA();
}
