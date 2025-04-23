import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/presentation/resources/routes_manager.dart';

import '../presentation/common/common_provider/auth_gaurd.dart';
import '../presentation/resources/theme_manager.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(authGuard: AuthGuard(ref));
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Kiss Distribution',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      theme: getApplicationTheme(),
    );
  }
}
