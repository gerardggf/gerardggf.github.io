import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

import '../home/home_controller.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class LanguagesFloatingActionButtonWidget extends ConsumerWidget {
  const LanguagesFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);
    final notifier = ref.watch(homeControllerProvider.notifier);
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        if (controller.languagesDisplayed)
          Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    notifier.updateLocale(AppLocale.ca.name);
                    html.window.location.reload();
                  },
                  label: Text(texts.global.catalan),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    notifier.updateLocale(AppLocale.es.name);
                    html.window.location.reload();
                  },
                  label: Text(texts.global.spanish),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    notifier.updateLocale(AppLocale.en.name);
                    html.window.location.reload();
                  },
                  label: Text(texts.global.english),
                ),
              ),
            ],
          ),
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            icon: const Icon(Icons.language),
            onPressed: () {
              notifier.updateLanguagesDisplayed(!controller.languagesDisplayed);
            },
            label: Text(texts.global.language),
          ),
        ),
      ],
    );
  }
}
