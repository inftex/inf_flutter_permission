import 'permission/permission_status.dart';
import 'permission/permission_type.dart';

abstract class IPermissionnManager {
  Future<PermissionStatus> requestPermission(PermissionType type);
  Future<PermissionStatus> checkPermission(PermissionType type);

  ///
  /// - Advertising ID Android
  /// <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
  ///
  /// - IDFA iOS
  /// Add to Info.plist
  /// <key>NSUserTrackingUsageDescription</key>
  /// <string>This identifier will be used to deliver personalized ads to you.</string>
  ///
  void requestAdvertisingId();
}
