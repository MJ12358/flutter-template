part of 'app.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with AutomaticKeepAliveClientMixin {
  late final GlobalKey _pageViewKey;
  late final PageController _pageController;

  final List<Widget> _pages = const <Widget>[
    Placeholder(),
    SettingsView(),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final int navIndex = context.read<NavigationBloc>().state.index;
    _pageViewKey = GlobalKey();
    _pageController = PageController(initialPage: navIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocListener<AppBloc, AppState>(
      listenWhen: (AppState previous, AppState current) {
        return previous.status != current.status;
      },
      listener: (BuildContext context, AppState state) {
        if (state.status == AppStatus.failure) {
          context.showSnackBar(Text(state.errorMessage));
        } else if (state.status == AppStatus.reset) {
          context.read<NavigationBloc>().reset();
        }
      },
      child: BlocListener<NavigationBloc, NavigationState>(
        listenWhen: (NavigationState previous, NavigationState current) {
          return previous.index != current.index;
        },
        listener: (BuildContext context, NavigationState state) {
          _syncPageController(state.index);
        },
        child: CustomOrientationBuilder(
          landscapeBuilder: (_) {
            return _Landscape(
              onWillPop: _onWillPop,
              pageView: _getPageView(),
            );
          },
          portraitBuilder: (_) {
            return _Portrait(
              onWillPop: _onWillPop,
              pageView: _getPageView(),
            );
          },
        ),
      ),
    );
  }

  Widget _getPageView() {
    return PageView(
      key: _pageViewKey,
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: _pages,
    );
  }

  void _syncPageController(int index) {
    if (!_pageController.hasClients) {
      return;
    }
    final int currentPage =
        _pageController.page?.round() ?? _pageController.initialPage;
    if (currentPage != index) {
      _pageController.jumpToPage(index);
    }
  }

  Future<bool> _onWillPop() async {
    final NavigationBloc navBloc = context.read<NavigationBloc>();
    if (navBloc.state.canPop) {
      navBloc.pop();
      return false; // prevent app exit
    }
    final AppState state = context.read<AppBloc>().state;
    if (!state.settings.confirmExit) {
      return true; // exit immediately
    }
    final bool? result = await context.showDialog<bool>(
      child: CustomDialog.alert(
        context: context,
        title: Text(context.l10n.confirmExit),
        child: Text(context.l10n.confirmExitMessage),
      ),
    );
    return result ?? false;
  }
}

class _Landscape extends StatelessWidget {
  const _Landscape({
    required this.onWillPop,
    required this.pageView,
  });

  final AsyncValueGetter<bool> onWillPop;
  final Widget pageView;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onWillPop: onWillPop,
      top: true,
      body: Row(
        children: <Widget>[
          const SideNavigation(),
          const VerticalDivider(),
          Expanded(
            child: pageView,
          ),
        ],
      ),
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({
    required this.onWillPop,
    required this.pageView,
  });

  final AsyncValueGetter<bool> onWillPop;
  final Widget pageView;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onWillPop: onWillPop,
      bottomNavigationBar: const BottomNavigation(),
      body: pageView,
    );
  }
}
