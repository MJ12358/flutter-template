import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class FlutterTemplateBottomNavigation extends StatelessWidget {
  const FlutterTemplateBottomNavigation({
    super.key,
    required this.onTap,
    this.initialIndex,
  });

  final ValueChanged<int> onTap;
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigationBar(
      currentIndex: initialIndex,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: context.l10n.settings,
        ),
      ],
    );
  }
}
