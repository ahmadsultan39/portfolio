import 'package:flutter/material.dart';

class ProjectScreens extends StatefulWidget {
  final int index;
  final String projectName;
  final List<String> images;
  ProjectScreens(this.index, this.projectName, this.images);

  @override
  State<ProjectScreens> createState() => _ProjectScreensState();
}

class _ProjectScreensState extends State<ProjectScreens> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              '${widget.index}- ${widget.projectName}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.images.length,
                itemBuilder: (ctx, i) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1,
                  //     color: Theme.of(context).accentColor,
                  //   ),
                  // ),
                  constraints: BoxConstraints(maxHeight: 410,maxWidth: 220),
                  child: Image.asset(
                    widget.images[i],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
