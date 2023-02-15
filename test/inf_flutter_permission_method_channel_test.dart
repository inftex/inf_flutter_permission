import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inf_flutter_permission/inf_flutter_permission_method_channel.dart';

void main() {
  MethodChannelInfFlutterPermission platform = MethodChannelInfFlutterPermission();
  const MethodChannel channel = MethodChannel('inf_flutter_permission');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
