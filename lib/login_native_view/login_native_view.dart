import 'dart:io';

import 'package:flutter/material.dart';

import 'login_event_handler.dart';

class NativeViewWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _NativeViewWidget();
}

class _NativeViewWidget extends State<NativeViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // For Android, access the native view using AndroidView
      return AndroidView(
        viewType: '<native-view-type>', // Identifier for your Android native view
        onPlatformViewCreated: (int id) {
          // This function is called when the Android native view is created
        },
      );
    } else if (Platform.isIOS) {
      // For iOS, access the native view using UiKitView
      return UiKitView(
        viewType: 'native-view-type', // Identifier for your iOS native view
        onPlatformViewCreated: (int id) {
          // This function is called when the iOS native view is created
        },
      );
    } else {
      return const Text('Native views are not supported on this platform.');
    }
  }
}