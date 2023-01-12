import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Descargar CV"),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text("-"),
            const SizedBox(
              width: 30,
            ),
            const Text("Terrassa, 2022"),
          ],
        ),
      ),
    );
  }
}
