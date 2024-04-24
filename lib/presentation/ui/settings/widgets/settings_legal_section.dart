import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class SettingsLegalSection extends StatelessWidget {
  const SettingsLegalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: context.l10n.legal,
      tiles: const <Widget>[
        _Licenses(),
      ],
    );
  }
}

class _Licenses extends StatelessWidget {
  const _Licenses();

  @override
  Widget build(BuildContext context) {
    return SettingsTile.licenses(context: context);
  }
}
