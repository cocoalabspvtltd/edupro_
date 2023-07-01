import 'package:pgs_edupro/application/video/live_videos/live_videos_bloc_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/videos/video_repository.dart';
import 'package:pgs_edupro/presentation/ui/videos/live_videos_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/top_videos_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/trending_videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoScreen extends StatelessWidget {
  final String title;
  const VideoScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TrendingVideosBloc(VideoRepository())
            ..add(const TrendingVideosEvent.loadVideos()),
        ),
        BlocProvider(
          create: (_) => TopVideosBloc(VideoRepository())
            ..add(const TopVideosEvent.loadVideos()),
        ),
        BlocProvider(
          create: (_) => LiveVideosBloc(VideoRepository())
            ..add(const LiveVideosEvent.loadVideos()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: title == 'Trending Videos'
            ? const TrendingVideosScreen(
                fromHome: false,
              )
            : title == 'Top Videos'
                ? const TopVideosScreen(
                    fromHome: false,
                  )
                : title == 'Live Videos'
                    ? const LiveVideosScreen(
                        fromHome: false,
                      )
                    : Container(),
      ),
    );
  }
}
