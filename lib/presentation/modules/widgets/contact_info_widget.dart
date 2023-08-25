import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/utils/custom_snack_bar.dart';
import 'package:gerardggf_cv/presentation/utils/url_actions.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.label,
    required this.data,
    this.asset,
    this.url,
    this.color,
  });

  final String label, data;
  final String? url;
  final Widget? asset;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding),
      child: InkWell(
        onTap: url == null
            ? null
            : url!.toLowerCase() == 'copy'
                ? () {
                    Clipboard.setData(
                      const ClipboardData(text: "+34622806551"),
                    );
                    showCustomSnackBar(
                      context: context,
                      text: texts.global.phoneNumberCopiedTopClipboard,
                    );
                  }
                : () async {
                    await launchSomeUrl(
                      Uri.parse(url!),
                    );
                  },
        child: Container(
          padding: const EdgeInsets.all(kPadding),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (asset != null)
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: asset!,
                  ),
                ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SelectableText(
                        data,
                        style: TextStyle(
                          color: url == null ? Colors.black : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
