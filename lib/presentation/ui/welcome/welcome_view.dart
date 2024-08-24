part of 'welcome.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (_) => Injector.sl<WelcomeBloc>()..onInit(),
      child: BlocListener<WelcomeBloc, WelcomeState>(
        listenWhen: (WelcomeState previous, WelcomeState current) {
          return previous.status != current.status;
        },
        listener: (BuildContext context, WelcomeState state) {
          if (state.status == WelcomeStatus.failure) {
            context.showSnackBar(Text(state.errorMessage));
          } else if (state.status == WelcomeStatus.complete) {
            context.pushAndRemove(const AppView());
          }
        },
        child: CustomScaffold(
          semanticLabel: context.l10n.welcomeView,
          body: const WelcomeBody(),
        ),
      ),
    );
  }
}
