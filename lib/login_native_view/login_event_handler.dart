import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class YourStreamHandlers {
  // Email Stream Controller
  final _emailController = StreamController<String>();
  Stream<String> get emailStream => _emailController.stream;

  // Password Stream Controller
  final _passwordController = StreamController<String>();
  Stream<String> get passwordStream => _passwordController.stream;

  // Method to send email and password data to the native side
   YourStreamHandlers()  {
    const channel = EventChannel('email_password_event_channel');

    try {
      channel.receiveBroadcastStream().listen(_onEvent,onError: _onError);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _onEvent(dynamic event) {
    final data = Map<String, dynamic>.from(event);
    _emailController.add(data["email"]??"");
    _passwordController.add(data["password"]??"");
   debugPrint("Event: $event");
  }

  void _onError(dynamic error) {
    // Handle errors, if any
    debugPrint('Error: $error');
  }
}