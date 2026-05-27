part of '../navigation.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (NavigationState previous, NavigationState current) {
        return previous.index != current.index;
      },
      builder: (BuildContext context, NavigationState state) {
        return LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    key: ValueKey<int>(state.revision),
                    selectedIndex: state.index,
                    onDestinationSelected: (int index) {
                      context.read<NavigationBloc>().push(index);
                    },
                    labelType: NavigationRailLabelType.all,
                    useIndicator: true,
                    destinations: NavigationItem.values.map((
                      NavigationItem item,
                    ) {
                      return NavigationRailDestination(
                        icon: item.widget(context),
                        label: Text(item.l10n(context)),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
