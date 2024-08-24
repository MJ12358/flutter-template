part of 'app.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView>
    with AutomaticKeepAliveClientMixin, RestorationMixin {
  final RestorableInt _currentPage = RestorableInt(0);
  final GlobalKey _key = GlobalKey();
  final PageController _pageController = PageController();

  final List<Widget> _pages = const <Widget>[
    Placeholder(),
    SettingsView(),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  String get restorationId => 'app_view';

  @override
  void restoreState(_, __) {
    registerForRestoration(_currentPage, 'current_page');
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
        }
      },
      child: CustomOrientationBuilder(
        landscapeBuilder: (_) {
          return _Landscape(
            index: _currentPage.value,
            onPageChanged: _onPageChanged,
            pageView: _getPageView(),
          );
        },
        portraitBuilder: (_) {
          return _Portrait(
            index: _currentPage.value,
            onPageChanged: _onPageChanged,
            pageView: _getPageView(),
          );
        },
      ),
    );
  }

  Widget _getPageView() {
    return PageView(
      key: _key,
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      restorationId: 'app_page_view',
      controller: _pageController,
      children: _pages,
    );
  }

  void _onPageChanged(int page) {
    _currentPage.value = page;
    _pageController.jumpToPage(page);
  }
}

class _Landscape extends StatelessWidget {
  const _Landscape({
    required this.index,
    required this.onPageChanged,
    required this.pageView,
  });

  final int? index;
  final ValueChanged<int> onPageChanged;
  final Widget pageView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: <Widget>[
          FlutterTemplateSideNavigation(
            initialIndex: index,
            onTap: onPageChanged,
          ),
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
    required this.index,
    required this.onPageChanged,
    required this.pageView,
  });

  final int? index;
  final ValueChanged<int> onPageChanged;
  final Widget pageView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: FlutterTemplateBottomNavigation(
        initialIndex: index,
        onTap: onPageChanged,
      ),
      body: pageView,
    );
  }
}
