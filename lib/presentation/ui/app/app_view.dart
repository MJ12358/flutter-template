import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/presentation/ui/app/app.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_template/presentation/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_template/presentation/widgets/navigation/side_navigation.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late int _currentPage;
  late final GlobalKey _key;
  late final PageController _pageController;

  final List<Widget> _pages = const <Widget>[
    Placeholder(),
    SettingsView(),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _key = GlobalKey();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            index: _currentPage,
            onPageChanged: _onPageChanged,
            pageView: _getPageView(),
          );
        },
        portraitBuilder: (_) {
          return _Portrait(
            index: _currentPage,
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
      controller: _pageController,
      children: _pages,
    );
  }

  void _onPageChanged(int page) {
    _currentPage = page;
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
