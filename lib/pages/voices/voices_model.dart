import '/backend/api_requests/api_calls.dart';
import '/components/actionsheet1_widget.dart';
import '/components/voice2comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'voices_widget.dart' show VoicesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class VoicesModel extends FlutterFlowModel<VoicesWidget> {
  ///  Local state fields for this page.

  Color colae = Color(4279111698);

  bool isplaying = false;

  bool isplaying2 = false;

  bool isplaynig3 = false;

  bool isplaynig4 = false;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // Models for voice2comp dynamic component.
  late FlutterFlowDynamicModels<Voice2compModel> voice2compModels;

  @override
  void initState(BuildContext context) {
    voice2compModels = FlutterFlowDynamicModels(() => Voice2compModel());
  }

  @override
  void dispose() {
    voice2compModels.dispose();
  }
}
