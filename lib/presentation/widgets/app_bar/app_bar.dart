import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    super.actions,
    super.bottom,
    required String title,
    String? subtitle,
  }) : super(
          centerTitle: false,
          title: _buildTitle(title, subtitle),
        );

  static Widget _buildTitle(String title, String? subtitle) {
    if (subtitle == null) {
      return Text(title);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.left,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
