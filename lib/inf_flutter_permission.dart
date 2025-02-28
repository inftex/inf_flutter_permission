import 'inf_flutter_permission_platform_interface.dart';

export 'permission/permission_status.dart';
export 'permission/permission_type.dart';
export 'permission_manager.dart';
export 'permission_manager_abstract.dart';

class InfFlutterPermission {
  Future<String?> getPlatformVersion() {
    return InfFlutterPermissionPlatform.instance.getPlatformVersion();
  }
}
