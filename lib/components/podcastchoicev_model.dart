import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'podcastchoicev_widget.dart' show PodcastchoicevWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

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
