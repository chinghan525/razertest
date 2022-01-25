part of '../home.dart';

class _HeaderAppBar extends StatelessWidget {
  const _HeaderAppBar({
    required this.height,
    required this.showTitle,
  });

  final double height;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
    );
  }
}
