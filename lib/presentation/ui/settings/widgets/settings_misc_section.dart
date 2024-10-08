part of '../settings.dart';

class SettingsMiscSection extends StatelessWidget {
  const SettingsMiscSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: context.l10n.misc,
      tiles: const <Widget>[
        _Import(),
        _Export(),
      ],
    );
  }
}

class _Import extends StatelessWidget {
  const _Import();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.status != current.status;
      },
      builder: (BuildContext context, SettingsState state) {
        return ListTile(
          title: Text(context.l10n.import),
          leading: const Icon(Icons.drive_folder_upload),
          trailing: state.status == SettingsStatus.importInProgress
              ? const CircularProgressIndicator()
              : null,
          onTap: () => context.showAlertDialog(
            Text(context.l10n.areYouSureImport),
            onAccept: () => context.read<SettingsBloc>().onImport(),
          ),
        );
      },
    );
  }
}

class _Export extends StatelessWidget {
  const _Export();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (SettingsState previous, SettingsState current) {
        return previous.status != current.status;
      },
      builder: (BuildContext context, SettingsState state) {
        return ListTile(
          title: Text(context.l10n.export),
          leading: const Icon(Icons.downloading),
          trailing: state.status == SettingsStatus.exportInProgress
              ? const CircularProgressIndicator()
              : null,
          onTap: () => context.read<SettingsBloc>().onExport(),
        );
      },
    );
  }
}
