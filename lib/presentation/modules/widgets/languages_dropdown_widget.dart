import 'package:flutter/material.dart';

class LanguagesDropdownWidget extends StatelessWidget {
  const LanguagesDropdownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("Català"),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("Español"),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("English"),
          ),
        ),
      ],
    );
  }
}
