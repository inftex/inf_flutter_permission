import 'package:flutter_test/flutter_test.dart';
import 'package:inf_flutter_permission/inf_flutter_permission.dart';
import 'package:inf_flutter_permission/inf_flutter_permission_platform_interface.dart';
import 'package:inf_flutter_permission/inf_flutter_permission_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInfFlutterPermissionPlatform
    with MockPlatformInterfaceMixin
    implements InfFlutterPermissionPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> requestIDFA() {
    // TODO: implement requestIDFA
    throw UnimplementedError();
  }
}

void main() {
  final InfFlutterPermissionPlatform initialPlatform =
      InfFlutterPermissionPlatform.instance;

  test('$MethodChannelInfFlutterPermission is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInfFlutterPermission>());
  });

  test('getPlatformVersion', () async {
    InfFlutterPermission infFlutterPermissionPlugin = InfFlutterPermission();
    MockInfFlutterPermissionPlatform fakePlatform =
        MockInfFlutterPermissionPlatform();
    InfFlutterPermissionPlatform.instance = fakePlatform;

    expect(await infFlutterPermissionPlugin.getPlatformVersion(), '42');
  });
}
