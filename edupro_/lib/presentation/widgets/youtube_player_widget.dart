import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerWidget extends StatefulWidget {
  final bool? hideFullScreenButtton;
  final String url;
  final bool displayPlayerOnly;
  final bool repeatForever;
  const YoutubeVideoPlayerWidget({
    super.key,
    required this.url,
    this.displayPlayerOnly = false,
    this.hideFullScreenButtton = false,
    this.repeatForever = false,
  });

  @override
  YoutubeVideoPlayerWidgetState createState() =>
      YoutubeVideoPlayerWidgetState();
}

class YoutubeVideoPlayerWidgetState extends State<YoutubeVideoPlayerWidget> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  //late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
        hideControls: widget.hideFullScreenButtton!,
        showLiveFullscreenButton: widget.hideFullScreenButtton!,
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: widget.repeatForever,
        isLive: false,
        forceHD: false,
        enableCaption: !widget.hideFullScreenButtton!,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    // _videoMetaData = const YoutubeMetaData();
    // _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        // _playerState = _controller.value.playerState;
        //   _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        //SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controlsTimeOut: widget.hideFullScreenButtton ?? false
            ? const Duration(seconds: 0)
            : const Duration(seconds: 3),
        controller: _controller,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: !widget.hideFullScreenButtton!,
        progressIndicatorColor: Colors.blueAccent,
        actionsPadding: EdgeInsets.zero,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
          if (!widget.hideFullScreenButtton!) ...[
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
          // IconButton(
          //   icon: const Icon(
          //     Icons.settings,
          //     color: Colors.white,
          //     size: 25.0,
          //   ),
          //   onPressed: () {
          //     _controller;
          //     log('Settings Tapped!');
          //   },
          // ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.seekTo(const Duration(seconds: 1));
          _showSnackBar('Restarted!');
        },
      ),
      builder: (context, player) => widget.displayPlayerOnly
          ? player
          : ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _space,
                      Text(_videoMetaData.title),
                      _space,
                      _space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            onPressed: _isPlayerReady
                                ? () {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                    setState(() {});
                                  }
                                : null,
                          ),
                          IconButton(
                            icon: Icon(
                                _muted ? Icons.volume_off : Icons.volume_up),
                            onPressed: _isPlayerReady
                                ? () {
                                    _muted
                                        ? _controller.unMute()
                                        : _controller.mute();
                                    setState(() {
                                      _muted = !_muted;
                                    });
                                  }
                                : null,
                          ),
                          FullScreenButton(
                            controller: _controller,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                      _space,
                      Row(
                        children: <Widget>[
                          const Text(
                            "Volume",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: Slider(
                              inactiveColor: Colors.transparent,
                              value: _volume,
                              min: 0.0,
                              max: 100.0,
                              divisions: 10,
                              label: '${(_volume).round()}',
                              onChanged: _isPlayerReady
                                  ? (value) {
                                      setState(() {
                                        _volume = value;
                                      });
                                      _controller.setVolume(_volume.round());
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      _space,
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // Widget _text(String title, String value) {
  //   return RichText(
  //     text: TextSpan(
  //       text: '$title : ',
  //       style: TextStyle(
  //         color: primaryColor,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       children: [
  //         TextSpan(
  //           text: value,
  //           style: TextStyle(
  //             color: primaryColor,
  //             fontWeight: FontWeight.w300,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Color _getStateColor(PlayerState state) {
  //   switch (state) {
  //     case PlayerState.unknown:
  //       return Colors.grey[700]!;
  //     case PlayerState.unStarted:
  //       return Colors.pink;
  //     case PlayerState.ended:
  //       return Colors.red;
  //     case PlayerState.playing:
  //       return Colors.blueAccent;
  //     case PlayerState.paused:
  //       return Colors.orange;
  //     case PlayerState.buffering:
  //       return Colors.yellow;
  //     case PlayerState.cued:
  //       return Colors.blue[900]!;
  //     default:
  //       return Colors.blue;
  //   }
  // }

  Widget get _space => const SizedBox(height: 10);

  // Widget _loadCueButton(String action) {
  //   return Expanded(
  //     child: MaterialButton(
  //       color: Colors.blueAccent,
  //       onPressed: _isPlayerReady
  //           ? () {
  //               if (_idController.text.isNotEmpty) {
  //                 var id = YoutubePlayer.convertUrlToId(
  //                       _idController.text,
  //                     ) ??
  //                     '';
  //                 if (action == 'LOAD') _controller.load(id);
  //                 if (action == 'CUE') _controller.cue(id);
  //                 FocusScope.of(context).requestFocus(FocusNode());
  //               } else {
  //                 _showSnackBar('Source can\'t be empty!');
  //               }
  //             }
  //           : null,
  //       disabledColor: Colors.grey,
  //       disabledTextColor: Colors.black,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 14.0),
  //         child: Text(
  //           action,
  //           style: const TextStyle(
  //             fontSize: 18.0,
  //             color: Colors.white,
  //             fontWeight: FontWeight.w300,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
