part of '../navigation.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (NavigationState previous, NavigationState current) {
        return previous.index != current.index;
      },
      builder: (BuildContext context, NavigationState state) {
        return BottomNavigationBar(
          key: ValueKey<int>(state.revision),
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            context.read<NavigationBloc>().push(index);
          },
          items: NavigationItem.values.map((NavigationItem item) {
            return BottomNavigationBarItem(
              icon: item.widget(context),
              label: item.l10n(context),
            );
          }).toList(),
        );
      },
    );
  }
}
