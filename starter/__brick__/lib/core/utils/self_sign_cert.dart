import 'dart:io';

/// Use only for development purpose like
/// if you want to intercept or modify request/response
/// with security tools like burpsuite
class SelfSignCert extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
