import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/edit_profile.dart/edit_profile.dart';
import 'package:k_distribution/presentation/order_list/order_list.dart';
import 'package:k_distribution/presentation/view_order/view_order.dart';

import '../login/login.dart';
import '../home/home_page.dart';
import '../splash/splash.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String editProfileRoute = '/editProfile';
  static const String orderListRoute = '/orderListRoute';
  static const String viewOrderRoute = '/viewOrderRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.editProfileRoute:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case Routes.orderListRoute:
        return MaterialPageRoute(builder: (_) => OrderListScreen());
      case Routes.viewOrderRoute:
        return MaterialPageRoute(builder: (_) => ViewOrderScreen(orderId: ''));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
