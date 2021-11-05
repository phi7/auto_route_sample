import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  DynamicPage({@PathParam('id') required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Dynamic page')));
  }
}