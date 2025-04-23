import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    sharedPrefsProvider.overrideWithValue(sharedPrefs),
  ], child: const MyApp()));
}
