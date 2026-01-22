// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart'; // For platform checks

Future<String> deviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceDetails = 'Unknown device';

  if (kIsWeb) {
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    deviceDetails = '${webBrowserInfo.userAgent}';
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceDetails = '${androidInfo.model}';
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceDetails = '${iosInfo.utsname.machine}';
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
    deviceDetails = '${windowsInfo.computerName}';
  } else if (defaultTargetPlatform == TargetPlatform.macOS) {
    MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
    deviceDetails = '${macInfo.model}';
  } else if (defaultTargetPlatform == TargetPlatform.linux) {
    LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
    deviceDetails = '${linuxInfo.name}';
  }

  print(deviceDetails);
  return deviceDetails;
}
