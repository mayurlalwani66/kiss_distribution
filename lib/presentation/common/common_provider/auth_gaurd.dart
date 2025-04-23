import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resources/routes_manager.dart';
import 'user_provider.dart';

final authGuardProvider = Provider<AutoRouteGuard>((ref) {
  return AuthGuard(ref);
});

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final prefs = AppPreferences(ref.read(sharedPrefsProvider));
    final token = prefs.getToken();
    final isAuthenticated = token.isNotEmpty;

    if (isAuthenticated) {
      ref.read(dioProvider).options.headers["Authorization"] = "Bearer $token";
      await ref.read(userProvider.notifier).getUserData();
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
