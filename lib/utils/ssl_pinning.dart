import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class SslPinning {
  static Future<HttpClient> customHttpClient() async {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    try {
      List<int> bytes = [];
      bytes = (await rootBundle.load('certificates/certificates.pem'))
          .buffer
          .asUint8List();
      context.setTrustedCertificatesBytes(bytes);
    } catch (_) {
      rethrow;
    }

    HttpClient httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback = (cert, host, port) => false;

    return httpClient;
  }

  static Future<http.Client> createLEClient() async =>
      IOClient(await customHttpClient());

  static Future<http.Client> get _instance async =>
      _clientInstance ??= await createLEClient();

  static http.Client? _clientInstance;

  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async => _clientInstance = await _instance;
}
