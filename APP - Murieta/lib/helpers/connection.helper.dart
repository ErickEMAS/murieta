import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionHelper {
  static Future<bool> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none)
      return false;

    return true;
  }

  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('api.letsranking.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }

      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}