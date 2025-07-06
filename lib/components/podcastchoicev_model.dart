import '/flutter_flow/flutter_flow_util.dart';
import 'podcastchoicev_widget.dart' show PodcastchoicevWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PodcastchoicevModel extends FlutterFlowModel<PodcastchoicevWidget> {
  ///  Local state fields for this component.

  bool isplaying = false;

  bool isplaying2 = false;

  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
