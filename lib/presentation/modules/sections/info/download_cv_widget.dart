import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../../utils/url_actions.dart';

class DownloadCvWidget extends StatelessWidget {
  const DownloadCvWidget({
    super.key,
    required this.title,
    required this.path,
    this.enabled = true,
  });

  final String title, path;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: !enabled
                    ? null
                    : () {
                        downloadCV(path);
                      },
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                color: Colors.black,
                child: IconButton(
                  onPressed: !enabled
                      ? null
                      : () {
                          downloadCV(path);
                        },
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
