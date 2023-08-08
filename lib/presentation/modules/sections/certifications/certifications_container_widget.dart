import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../../utils/format_datetimes.dart';

class CertificationContainerWidget extends StatefulWidget {
  const CertificationContainerWidget({
    super.key,
    required this.school,
    required this.certification,
    this.assetPath,
    this.date,
    this.content,
    this.certificatePath,
    this.technologies,
  });

  final String school, certification;
  final String? content, certificatePath, assetPath;
  final DateTime? date;
  final List<String>? technologies;

  @override
  State<CertificationContainerWidget> createState() =>
      _CertificationContainerWidgetState();
}

class _CertificationContainerWidgetState
    extends State<CertificationContainerWidget> {
  bool panelIsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (widget.assetPath != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(widget.assetPath!),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.certification,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  widget.school,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.date != null
                      ? getMonthYearFromDatetime(widget.date!)
                      : 'Actualmente',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
                if (widget.content != null) Text('· ${widget.content}'),
                if (widget.technologies != null)
                  Wrap(
                    children: widget.technologies!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5).copyWith(
                              top: 15,
                              bottom: 0,
                            ),
                            child: Chip(
                              label: Text(e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                if (widget.certificatePath != null) const SizedBox(height: 20),
                if (widget.certificatePath != null)
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      panelIsExpanded = isExpanded;
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return const ListTile(
                            title: Text('Certificado'),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(10).copyWith(top: 0),
                          child: Image.asset(
                            widget.certificatePath!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        isExpanded: panelIsExpanded,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
