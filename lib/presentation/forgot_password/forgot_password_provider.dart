import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final forgotPasswordProvider = Provider((ref) {
  final Uri url = Uri.parse('https://kissdistribution.com.au');
  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  return _launchUrl();
});
