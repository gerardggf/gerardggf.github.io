import 'package:flutter/material.dart';

class AppBarTextButton extends StatelessWidget {
  const AppBarTextButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.route,
  });

  final IconData iconData;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
        label: Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
