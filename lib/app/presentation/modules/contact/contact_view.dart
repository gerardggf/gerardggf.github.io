import 'package:flutter/material.dart';
import 'package:gerardggf_cv/app/core/utils/extensions/num_to_sizedbox.dart';
import 'package:gerardggf_cv/app/core/utils/url_launcher.dart';

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
        _ContactRow(icon: Icons.phone, label: '+34 622 80 65 51'),
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
          label: 'linkedin.com/in/gerardgutierrez',
          onTap: () =>
              launchUrlString('https://linkedin.com/in/gerardgutierrez'),
        ),
        _ContactRow(
          icon: Icons.code,
          label: 'github.com/gerardggf',
          onTap: () => launchUrlString('https://github.com/gerardggf'),
        ),
        _ContactRow(
          icon: Icons.queue_music,
          label: 'github.com/gerardggf',
          onTap: () => launchUrlString('https://www.youtube.com/@sanfaina/'),
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
        child: ListTile(
          leading: Icon(icon),
          title: SelectableText(label),
          trailing: const Icon(Icons.open_in_new),
        ),
      ),
    );
  }
}
