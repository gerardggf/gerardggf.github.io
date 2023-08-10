import 'package:flutter/material.dart';
import '../../../../const.dart';

class ProjectContainerWidget extends StatefulWidget {
  const ProjectContainerWidget({
    super.key,
    required this.name,
    required this.type,
    required this.content,
    required this.date,
    this.screenshotPaths,
  });

  final String name, type, content;
  final DateTime date;
  final List<String>? screenshotPaths;

  @override
  State<ProjectContainerWidget> createState() => _ProjectContainerWidgetState();
}

class _ProjectContainerWidgetState extends State<ProjectContainerWidget> {
  late final PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${widget.type} - ${widget.date.year}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.content,
          ),
          if (widget.screenshotPaths != null)
            Expanded(
              child: widget.screenshotPaths!.length == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: PageView(
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var path in widget.screenshotPaths!)
                            Image.asset(
                              'img/projects/$path',
                              fit: BoxFit.fitWidth,
                            ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await _pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                            setState(() {
                              currentPage = _pageController.page?.toInt() ?? 0;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_left_outlined,
                            size: 50,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: PageView(
                              controller: _pageController,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var path in widget.screenshotPaths!)
                                  Image.asset(
                                    'img/projects/$path',
                                    fit: BoxFit.fitHeight,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                            setState(() {
                              currentPage = _pageController.page?.toInt() ?? 0;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_right_outlined,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
            ),
          if (widget.screenshotPaths != null &&
              widget.screenshotPaths?.length != 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < widget.screenshotPaths!.length; i++)
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color:
                          currentPage == i ? Colors.black : Colors.transparent,
                      border: Border.all(width: 1),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
