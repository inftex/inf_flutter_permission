import 'dart:io';
import 'package:inf_flutter_permission/inf_flutter_permission_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart' as phr;
import 'permission/permission_status.dart';
import 'permission/permission_type.dart';
import 'permission_manager_abstract.dart';

class PermissionnManager extends IPermissionnManager {
  static PermissionnManager? _instance;
  PermissionnManager._();
  static PermissionnManager get instance {
    _instance ??= PermissionnManager._();
    return _instance!;
  }

  @override
  Future<PermissionStatus> checkPermission(PermissionType type) async {
    phr.PermissionStatus status;
    switch (type) {
      case PermissionType.notification:
        status = await phr.Permission.notification.status;
        break;
      default:
        status = phr.PermissionStatus.denied;
    }
    return _toBaseStatus(status);
  }

  @override
  Future<PermissionStatus> requestPermission(PermissionType type) async {
    phr.PermissionStatus status = await _toConcretePermission(type).request();
    return _toBaseStatus(status);
  }

  phr.Permission _toConcretePermission(PermissionType type) {
    phr.Permission p;
    switch (type) {
      case PermissionType.notification:
        p = phr.Permission.notification;
        break;
      case PermissionType.camera:
        p = phr.Permission.camera;
        break;
      case PermissionType.photos:
        p = phr.Permission.photos;
        break;
      case PermissionType.microphone:
        p = phr.Permission.microphone;
        break;
      default:
        p = phr.Permission.notification;
        break;
    }
    return p;
  }

  PermissionStatus _toBaseStatus(phr.PermissionStatus status) {
    PermissionStatus s;
    switch (status) {
      case phr.PermissionStatus.granted:
        s = PermissionStatus.granted;
        break;
      case phr.PermissionStatus.denied:
        s = PermissionStatus.denied;
        break;
      case phr.PermissionStatus.restricted:
        s = PermissionStatus.restricted;
        break;
      case phr.PermissionStatus.permanentlyDenied:
        s = PermissionStatus.permanentlyDenied;
        break;
      default:
        s = PermissionStatus.denied;
    }
    return s;
  }

  @override
  void requestAdvertisingId() {
    if (Platform.isIOS) {
      InfFlutterPermissionPlatform.instance.requestIDFA();
    }
  }
}
