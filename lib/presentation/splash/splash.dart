import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../../app/di.dart';
import '../common/common_provider/form_data_provider.dart';
import '../common/common_provider/user_provider.dart';
import '../resources/routes_manager.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashScreen> {
  Timer? _timer;
  _startDelay() {
    _timer =
        Timer(Duration(seconds: DurationConstant.d5), _checkAuthAndNavigate);
  }

  void _checkAuthAndNavigate() {
    final prefs = ref.read(appPreferencesProvider);
    final token = prefs.getToken();

    if (token != "") {
      print(token);
      ref.read(dioProvider).options.headers["Authorization"] = "Bearer $token";
      Future.microtask(() {
        ref.read(userProvider.notifier).getUserData();
        ref
            .read(formDataControlKeyProvider.notifier)
            .getDynamicFormDataByControlKeys(ref);
      });
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          ImageAssets.logobgImg,
        ),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Image.asset(
          ImageAssets.logoImg,
        ),
      ),
    );
  }
}
