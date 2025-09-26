import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract interface for network connectivity information
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Concrete implementation of NetworkInfo using connectivity_plus package
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}