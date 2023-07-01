import 'package:pgs_edupro/application/my_courses/my_course_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_course_videos_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';

class MyCourseVideosListView extends StatefulWidget {
  const MyCourseVideosListView({
    Key? key,
    required ScrollController itemsScrollController,
    required this.videos,
  })  : _itemsScrollController = itemsScrollController,
        super(key: key);

  final ScrollController _itemsScrollController;
  final List<MyCourseVideoData> videos;

  @override
  State<MyCourseVideosListView> createState() => _MyCourseVideosListViewState();
}

class _MyCourseVideosListViewState extends State<MyCourseVideosListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return widget.videos.isEmpty
        ? const CommonResultsEmptyWidget()
        : ListView.builder(
            controller: widget._itemsScrollController,
            shrinkWrap: true,
            itemCount: widget.videos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  (index + 1).toString(),
                  style: boldWord,
                ),
                title: Text(
                  widget.videos[index].videoTitle ?? "",
                  style: boldValue,
                ),
                subtitle:
                    Text('video - ${widget.videos[index].videoDuration ?? ""}'),
                selectedTileColor: primaryColor[100]!.withOpacity(.5),
                selected: selectedIndex == index ? true : false,
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                  context.read<MyCourseBloc>().add(MyCourseEvent.changeVideoTo(
                      widget.videos[index].videoUrl ?? ''));
                },
              );
            });
  }
}
