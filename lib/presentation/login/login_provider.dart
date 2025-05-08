import 'dart:convert';

import 'package:dart_des/dart_des.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/di.dart';
import 'package:k_distribution/domain/model/auth_model.dart';
import 'package:k_distribution/domain/usecase/auth_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/user_provider.dart';
import 'package:k_distribution/presentation/resources/routes_manager.dart';

class LoginNotifier extends StateNotifier<AsyncValue<Authentication?>> {
  final LoginUseCase _loginUseCase;
  final LoginWithQrUseCase _loginWithQrUseCase;
  final Ref ref;
  LoginNotifier(this._loginUseCase, this.ref, this._loginWithQrUseCase)
      : super(AsyncValue.data(null));

  login(
    String email,
    String phoneNumber,
    String password,
  ) async {
    final appPreferences = ref.watch(appPreferencesProvider);
    state = AsyncValue.loading();

    final request = await _loginUseCase
        .execute(LoginUsecaseInput(phoneNumber, email, password));

    request.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      state = AsyncValue.data(data);

      appPreferences.setToken(data.token);
      String token = appPreferences.getToken();
      if (token != "") {
        ref.read(dioProvider).options.headers["Authorization"] =
            "Bearer $token";
        ref.read(userProvider.notifier).getUserData();
      }
    });
  }

  Future<void> loginWithQrCode(String input, BuildContext context) async {
    final appPreferences = ref.watch(appPreferencesProvider);
    final key = encryptTripleDES(input);
    final request =
        await _loginWithQrUseCase.execute(LoginWithQrUseCaseInput(key));

    request.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      state = AsyncValue.data(data);

      appPreferences.setToken(data.token);
      String token = appPreferences.getToken();
      if (token != "") {
        ref.read(dioProvider).options.headers["Authorization"] =
            "Bearer $token";
        ref.read(userProvider.notifier).getUserData();
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }
    });
  }

  String encryptTripleDES(String text, {String key = 'sblw-3hn8-sqoy19'}) {
    // Pad key to 24 bytes (192 bits) for DES-EDE3
    final paddedKey = key.padRight(24, '0').substring(0, 24);

    final des3 = DES3(
      key: utf8.encode(paddedKey),
      mode: DESMode.ECB,
      paddingType: DESPaddingType.PKCS7,
    );

    final encryptedBytes = des3.encrypt(utf8.encode(text));
    print("cipher text  $encryptedBytes");
    return base64.encode(encryptedBytes);
  }
}

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<Authentication?>>((ref) {
  return LoginNotifier(ref.watch(loginUseCaseProvider), ref,
      ref.watch(loginWithQrUseCaseProvider));
});
