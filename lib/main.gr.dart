// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'dynamic/dynamic_page.dart' as _i3;
import 'home/home_page.dart' as _i1;
import 'second_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SecondRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SecondPage());
    },
    DynamicRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<DynamicRouteArgs>(
          orElse: () => DynamicRouteArgs(id: pathParams.getString('id')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DynamicPage(id: args.id));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(SecondRoute.name, path: '/second'),
        _i4.RouteConfig(DynamicRoute.name, path: '/dynamic/:id'),
        _i4.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.SecondPage]
class SecondRoute extends _i4.PageRouteInfo<void> {
  const SecondRoute() : super(name, path: '/second');

  static const String name = 'SecondRoute';
}

/// generated route for [_i3.DynamicPage]
class DynamicRoute extends _i4.PageRouteInfo<DynamicRouteArgs> {
  DynamicRoute({required String id})
      : super(name,
            path: '/dynamic/:id',
            args: DynamicRouteArgs(id: id),
            rawPathParams: {'id': id});

  static const String name = 'DynamicRoute';
}

class DynamicRouteArgs {
  const DynamicRouteArgs({required this.id});

  final String id;
}
