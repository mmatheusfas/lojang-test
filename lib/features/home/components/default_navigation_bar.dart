// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DefaultNavigationBar extends StatelessWidget {
  final Color backgroundColor;
  final Color indicatorColor;
  final int selectedIndex;
  final void Function(int) onDestinationSelected;
  final List<Widget> destinations;

  const DefaultNavigationBar({
    Key? key,
    required this.backgroundColor,
    required this.indicatorColor,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(64),
        child: NavigationBar(
          height: 45,
          elevation: 0,
          backgroundColor: backgroundColor,
          onDestinationSelected: onDestinationSelected,
          selectedIndex: selectedIndex,
          indicatorColor: indicatorColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: destinations,
        ),
      ),
    );
  }
}
