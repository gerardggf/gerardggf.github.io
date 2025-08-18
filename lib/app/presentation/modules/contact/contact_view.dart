import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerardggf_cv/app/core/utils/extensions/num_to_sizedbox.dart';
import 'package:gerardggf_cv/app/core/utils/functions/snack_bar.dart';
import 'package:gerardggf_cv/app/core/utils/functions/url_launcher.dart';
import 'package:gerardggf_cv/app/presentation/modules/home/home_view.dart';
import 'package:go_router/go_router.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  static const String routeName = 'contact';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Contacto',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        10.h,
        _ContactRow(
          icon: Icons.phone,
          label: '+34 622 80 65 51',
          onTap: () {
            Clipboard.setData(ClipboardData(text: '+34 622 80 65 51'));
            showSnackBarText(
              context,
              'Número de contacto copiado en el portapapeles',
            );
          },
        ),
        _ContactRow(
          icon: Icons.email_outlined,
          label: 'gerard.ggf@gmail.com',
          onTap: () {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'gerard.ggf@gmail.com',
            );
            launchUrlC(emailUri);
          },
        ),
        _ContactRow(
          icon: Icons.link,
          label: 'LinkedIn',
          onTap: () =>
              launchUrlString('https://linkedin.com/in/gerardgutierrez'),
        ),
        _ContactRow(
          icon: Icons.code,
          label: 'GitHub',
          onTap: () => launchUrlString('https://github.com/gerardggf'),
        ),
        _ContactRow(
          icon: Icons.queue_music,
          label: 'YouTube',
          onTap: () => launchUrlString('https://www.youtube.com/@sanfaina/'),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: TextButton.icon(
            onPressed: () {
              context.goNamed(HomeView.routeName);
            },
            label: Text('Inicio'),
            icon: Icon(Icons.home),
          ),
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _ContactRow({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon),
              10.w,
              Expanded(child: Text(label)),
              Icon(Icons.open_in_new),
            ],
          ),
        ),
      ),
    );
  }
}
