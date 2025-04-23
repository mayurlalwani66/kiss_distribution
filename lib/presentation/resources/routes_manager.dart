import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/edit_profile.dart/edit_profile.dart';
import 'package:k_distribution/presentation/order_list/order_list.dart';
import 'package:k_distribution/presentation/view_order/view_order.dart';

import '../../domain/model/order_model.dart';
import '../common/common_provider/auth_gaurd.dart';
import '../login/login.dart';
import '../home/home_page.dart';
import '../splash/splash.dart';
// import 'strings_manager.dart';

part 'routes_manager.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;
  AppRouter({required this.authGuard});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: OrderListRoute.page),
        AutoRoute(page: ViewOrderRoute.page),
      ];
}
