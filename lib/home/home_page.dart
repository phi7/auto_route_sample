import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:auto_route_sample/main.gr.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Home page!'),
        ElevatedButton(
            onPressed: () {
              context.router.navigate(SecondRoute());
            },
            child: Text("次のページへ")),
        SizedBox(),
        ElevatedButton(
            onPressed: () {
              context.router.navigate(DynamicRoute());
            },
            child: Text("動的なページへ"))
      ],
    )));
  }
}
