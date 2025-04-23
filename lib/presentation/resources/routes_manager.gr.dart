// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes_manager.dart';

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfileScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<OrderDetails>? orderDetails,
    List<PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, orderDetails: orderDetails),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return HomeScreen(key: args.key, orderDetails: args.orderDetails);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.orderDetails});

  final Key? key;

  final List<OrderDetails>? orderDetails;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, orderDetails: $orderDetails}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [OrderListScreen]
class OrderListRoute extends PageRouteInfo<void> {
  const OrderListRoute({List<PageRouteInfo>? children})
    : super(OrderListRoute.name, initialChildren: children);

  static const String name = 'OrderListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrderListScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [ViewOrderScreen]
class ViewOrderRoute extends PageRouteInfo<ViewOrderRouteArgs> {
  ViewOrderRoute({
    Key? key,
    required String orderId,
    List<PageRouteInfo>? children,
  }) : super(
         ViewOrderRoute.name,
         args: ViewOrderRouteArgs(key: key, orderId: orderId),
         rawPathParams: {'orderId': orderId},
         initialChildren: children,
       );

  static const String name = 'ViewOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ViewOrderRouteArgs>(
        orElse:
            () => ViewOrderRouteArgs(orderId: pathParams.getString('orderId')),
      );
      return ViewOrderScreen(key: args.key, orderId: args.orderId);
    },
  );
}

class ViewOrderRouteArgs {
  const ViewOrderRouteArgs({this.key, required this.orderId});

  final Key? key;

  final String orderId;

  @override
  String toString() {
    return 'ViewOrderRouteArgs{key: $key, orderId: $orderId}';
  }
}
