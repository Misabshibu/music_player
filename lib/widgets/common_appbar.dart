import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar({
    super.key,
    required this.leadingWidget,
    required this.title,
    required this.actionWidgets,
  });
  final Widget leadingWidget;
  final String title;
  final List<Widget> actionWidgets;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        leading: leadingWidget,
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: actionWidgets);
  }
}
