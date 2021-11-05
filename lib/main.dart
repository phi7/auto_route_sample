import 'package:auto_route_sample/second_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'dynamic/dynamic_page.dart';
import 'home/home_page.dart';
import 'main.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, initial: true),
    AutoRoute(path: '/second', page: SecondPage),
    AutoRoute(path: '/dynamic/:id', page: DynamicPage),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)

class $AppRouter {}
