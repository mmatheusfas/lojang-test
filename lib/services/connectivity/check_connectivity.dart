import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivity {
  static Future<bool> checkDeviceConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    return connectivityResult != ConnectivityResult.none;
  }
}
