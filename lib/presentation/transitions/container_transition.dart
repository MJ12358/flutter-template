import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';

/// A container transition widget that uses the OpenContainer from
/// the animations package.
///
/// The [openBuilder] is called to build the widget that will be displayed
/// when the container is opened. There is an open issue where the [openBuilder]
/// is called multiple times, causing unwanted rebuilds.
///
/// https://github.com/flutter/flutter/issues/74111
class ContainerTransition<T extends Object?> extends StatelessWidget {
  const ContainerTransition({
    super.key,
    required this.closedBuilder,
    required this.openBuilder,
    this.closedShape = const RoundedRectangleBorder(),
  });

  final CloseContainerBuilder closedBuilder;
  final OpenContainerBuilder<T> openBuilder;
  final ShapeBorder closedShape;

  const ContainerTransition.fab({
    super.key,
    required this.closedBuilder,
    required this.openBuilder,
  }) : closedShape = const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(
           Radius.circular(56.0 / 2),
         ),
       );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    return OpenContainer<T>(
      clipBehavior: Clip.none,
      closedColor: theme.scaffoldBackgroundColor,
      openColor: theme.scaffoldBackgroundColor,
      closedElevation: 0.0,
      openElevation: 0.0,
      closedShape: closedShape,
      closedBuilder: closedBuilder,
      openBuilder: openBuilder,
      tappable: false,
    );
  }
}
