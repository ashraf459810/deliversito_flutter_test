import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInf {
  String get baseUrl;
  Future<bool> get isConnected;
}

class NetworkInfImpl implements NetworkInf {
  CheckInternetConnectivity connectionChecker = CheckInternetConnectivity();

  NetworkInfImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.checkInternetConnectivity();

  @override
  String get baseUrl => 'https://dog.ceo/api';
}

class CheckInternetConnectivity {
  CheckInternetConnectivity();
  Future<bool> checkInternetConnectivity() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile) {
        // Connected to mobile data network.
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // Connected to WiFi network.
        return true;
      } else {
        // No internet connectivity.
        return false;
      }
    } catch (e) {
      // Handle any exceptions and return false in case of errors.
      return false;
    }
  }
}
