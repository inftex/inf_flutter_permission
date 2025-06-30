import 'permission/permission_status.dart';
import 'permission/permission_type.dart';

// post_install do |installer|
//   installer.pods_project.targets.each do |target|
//     flutter_additional_ios_build_settings(target)
//     target.build_configurations.each do |config|
//       # You can remove unused permissions here
//       # for more information: https://github.com/BaseflowIT/flutter-permission-handler/blob/master/permission_handler/ios/Classes/PermissionHandlerEnums.h
//       # e.g. when you don't need camera permission, just add 'PERMISSION_CAMERA=0'
//       config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
//         '$(inherited)',

//         'PERMISSION_NOTIFICATIONS=1',
//       ]
//     end
//   end
// end
abstract class IPermissionnManager {
  ///
  /// Open app settings to allow user to change permissions
  ///
  Future<bool> openAppSettings();

  ///
  /// Add permissions to AndroidManifest.xml and Podfile
  ///
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
