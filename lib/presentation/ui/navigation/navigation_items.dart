part of 'navigation.dart';

enum NavigationItem {
  home,
  settings,
}

extension NavigationItemExtension on NavigationItem {
  Icon widget(BuildContext context) {
    switch (this) {
      case NavigationItem.home:
        return Icon(
          icon,
        );
      case NavigationItem.settings:
        return Icon(
          icon,
        );
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationItem.home:
        return Icons.home;
      case NavigationItem.settings:
        return Icons.settings;
    }
  }

  String l10n(BuildContext context) {
    switch (this) {
      case NavigationItem.home:
        return context.l10n.home;
      case NavigationItem.settings:
        return context.l10n.settings;
    }
  }
}
