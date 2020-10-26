import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectivityStatus {
  Future<bool> checkConnectivity() async {
    return await DataConnectionChecker()
        .hasConnection
        .timeout(Duration(seconds: 5));
  }
}
