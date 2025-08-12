import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/app/core/constants/assets.dart';
import 'package:gerardggf_cv/app/core/utils/extensions/num_to_sizedbox.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        const Text(
          'Gerard Gutiérrez Flotats',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        ),
        8.h,
        Wrap(
          spacing: 12,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Icon(Icons.place, size: 18),
            Text('Terrassa, España'),
            SizedBox(width: 16),
            Icon(Icons.link, size: 18),
            Text('linkedin.com/in/gerardgutierrez'),
            SizedBox(width: 16),
            Icon(Icons.code, size: 18),
            Text('github.com/gerardggf'),
          ],
        ),
        20.h,
        const Text(
          'Desarrollador de software con más de 5 años de experiencia liderando proyectos en el ámbito del Internet of Things (IoT). Experto en el desarrollo de soluciones integradas con Firebase, Google Cloud, APIs REST, Bluetooth Low Energy (BLE) y Wi-Fi, orientadas a la conectividad, escalabilidad y optimización del rendimiento.',
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
        24.h,
        const Text(
          'Tecnologías',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        8.h,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            Chip(label: Text('Dart')),
            Chip(label: Text('Flutter')),
            Chip(label: Text('Kotlin')),
            Chip(label: Text('Swift')),
            Chip(label: Text('Python')),
            Chip(label: Text('BLE')),
            Chip(label: Text('SQL')),
            Chip(label: Text('Stripe')),
            Chip(label: Text('DataWeave')),
            Chip(label: Text('JavaScript')),
            Chip(label: Text('HTML')),
            Chip(
              label: Text('CSS', style: TextStyle(color: Colors.grey)),
            ),
            Chip(
              label: Text('Angular', style: TextStyle(color: Colors.grey)),
            ),
            Chip(
              label: Text('Solidity', style: TextStyle(color: Colors.grey)),
            ),
            Chip(
              label: Text('WiFi IoT', style: TextStyle(color: Colors.grey)),
            ),

            Chip(
              label: Text(
                'ACL Analytics',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Chip(
              label: Text('VBA', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
        24.h,
        const Text(
          'Herramientas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        8.h,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            Chip(label: Text('VSCode')),
            Chip(label: Text('Firebase')),
            Chip(label: Text('REST APIs')),
            Chip(label: Text('GitHub')),
            Chip(label: Text('Codemagic')),
            Chip(label: Text('AnyPoint Studio')),
            Chip(label: Text('XCode')),
            Chip(label: Text('Trello')),
            Chip(label: Text('Excel')),
            Chip(label: Text('Android Studio')),
            Chip(label: Text('GCP')),
            Chip(
              label: Text('AWS', style: TextStyle(color: Colors.grey)),
            ),
            Chip(
              label: Text('Remix IDE', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
        24.h,
        const Text(
          'Descargar currículum',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        8.h,
        Row(
          children: [
            Expanded(
              child: _DownloadCVCard(
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(Assets.cvEsp),
                    webOnlyWindowName: '_blank',
                  )) {
                    if (kDebugMode) {
                      print('No se pudo abrir el CV');
                    }
                  }
                },
                text: 'Español',
              ),
            ),
            10.w,
            Expanded(
              child: _DownloadCVCard(onTap: () {}, text: 'Inglés'),
            ),
          ],
        ),
      ],
    );
  }
}

class _DownloadCVCard extends StatelessWidget {
  const _DownloadCVCard({required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.file_download, size: 34),
              5.h,
              Text(text, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
