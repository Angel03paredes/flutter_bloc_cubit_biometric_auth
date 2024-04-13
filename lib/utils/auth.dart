import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_darwin/local_auth_darwin.dart';

class Auth {
  static final LocalAuthentication auth = LocalAuthentication();
  static Future<bool> canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await canAuthenticate()) return false;

      return await auth.authenticate(
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true),
          localizedReason: 'Please authenticate to show account balance',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ]);
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
