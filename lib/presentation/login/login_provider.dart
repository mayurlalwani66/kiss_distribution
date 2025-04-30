import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/di.dart';
import 'package:k_distribution/domain/model/auth_model.dart';
import 'package:k_distribution/domain/usecase/auth_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/user_provider.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import '../common/common_widgets/app_snakbar.dart';
import '../resources/routes_manager.dart';

class LoginNotifier extends StateNotifier<AsyncValue<Authentication?>> {
  final LoginUseCase _loginUseCase;
  final Ref ref;
  LoginNotifier(this._loginUseCase, this.ref) : super(AsyncValue.data(null));

  login(String email, String phoneNumber, String password,
      BuildContext context) async {
    final appPreferences = ref.watch(appPreferencesProvider);
    state = AsyncValue.loading();

    final request = await _loginUseCase
        .execute(LoginUsecaseInput(phoneNumber, email, password));

    request.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
      AppSnackbar.show(context, AppStrings.loginFailedMsg);
    }, (data) {
      state = AsyncValue.data(data);

      appPreferences.setToken(data.token);
      String token = appPreferences.getToken();
      if (token != "") {
        ref.read(dioProvider).options.headers["Authorization"] =
            "Bearer $token";
        ref.read(userProvider.notifier).getUserData();

        context.replaceRoute(HomeRoute());
      }
    });
  }
}

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<Authentication?>>((ref) {
  return LoginNotifier(ref.watch(loginUseCaseProvider), ref);
});
