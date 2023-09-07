import 'package:flutter/material.dart';

class CustomTabBar extends TabBar {
  CustomTabBar({
    super.key,
    required super.tabs,
  }) : super(onTap: (_) => FocusManager.instance.primaryFocus?.unfocus());
}
