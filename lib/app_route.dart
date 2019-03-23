import 'package:flutter/material.dart';

class AppPageRoute extends MaterialPageRoute{
  @override
  final WidgetBuilder builder;

  AppPageRoute(this.builder):super();
  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}