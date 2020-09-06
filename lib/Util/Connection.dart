import 'package:connectivity/connectivity.dart';

class Connection {
  static Future<bool> isConnected() async {
    return await (Connectivity().checkConnectivity()) !=
        ConnectivityResult.none;
  }
}
