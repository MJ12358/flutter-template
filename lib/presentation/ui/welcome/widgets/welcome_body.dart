part of '../welcome.dart';

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
          onCompleted: () => context.read<WelcomeBloc>().onComplete(),
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
