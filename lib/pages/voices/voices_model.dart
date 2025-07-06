import '/components/voice2comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voices_widget.dart' show VoicesWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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
