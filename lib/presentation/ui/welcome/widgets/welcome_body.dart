import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_template/presentation/ui/welcome/welcome.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      buildWhen: (WelcomeState previous, WelcomeState current) {
        return previous.status != current.status;
      },
      builder: (BuildContext context, WelcomeState state) {
        if (state.status == WelcomeStatus.loading) {
          return CustomProgressIndicator.circular();
        }

        return Welcome(
          skip: Text(context.l10n.skip),
          start: Text(context.l10n.start),
          onCompleted: () =>
              context.read<WelcomeBloc>().add(const WelcomeCompleted()),
          pages: <Widget>[
            WelcomeContent(
              asset: Asset.welcome1Image,
              description: context.l10n.welcome1Description,
              title: context.l10n.welcome1Title,
              color: context.colorScheme.primary,
            ),
            WelcomeContent(
              asset: Asset.welcome2Image,
              description: context.l10n.welcome2Description,
              title: context.l10n.welcome2Title,
              color: context.colorScheme.primary,
            ),
          ],
        );
      },
    );
  }
}
