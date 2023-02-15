import 'inf_flutter_permission_platform_interface.dart';

class InfFlutterPermission {
  Future<String?> getPlatformVersion() {
    return InfFlutterPermissionPlatform.instance.getPlatformVersion();
  }
}
