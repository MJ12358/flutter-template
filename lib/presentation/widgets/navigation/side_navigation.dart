import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class FlutterTemplateSideNavigation extends StatelessWidget {
  const FlutterTemplateSideNavigation({
    super.key,
    required this.onTap,
    this.initialIndex,
  });

  final ValueChanged<int> onTap;
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return CustomNavigationRail(
      selectedIndex: initialIndex,
      onDestinationSelected: onTap,
      labelType: NavigationRailLabelType.all,
      leading: SizedBox(height: context.theme.appBarTheme.toolbarHeight),
      useIndicator: true,
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: const Icon(Icons.home),
          label: Text(context.l10n.home),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.settings),
          label: Text(context.l10n.settings),
        ),
      ],
    );
  }
}
