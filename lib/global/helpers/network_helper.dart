import 'dart:io';

class NetworkHelper {
  static Future<bool> checkNetworkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));

      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        
        return true;
      }
    } catch (_) {}

    return false;
  }
}
