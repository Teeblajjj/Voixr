import '/components/voice2comppocast_copy_widget.dart';
import '/components/voice2comppocast_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choosepodcaster1_widget.dart' show Choosepodcaster1Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Choosepodcaster1Model extends FlutterFlowModel<Choosepodcaster1Widget> {
  ///  Local state fields for this component.

  bool isplaying = false;

  bool isplaying2 = false;

  bool isplaying3 = false;

  bool isplaying4 = false;

  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // Models for voice2comppocastCopy dynamic component.
  late FlutterFlowDynamicModels<Voice2comppocastCopyModel>
      voice2comppocastCopyModels;
  // Models for voice2comppocast dynamic component.
  late FlutterFlowDynamicModels<Voice2comppocastModel> voice2comppocastModels;

  @override
  void initState(BuildContext context) {
    voice2comppocastCopyModels =
        FlutterFlowDynamicModels(() => Voice2comppocastCopyModel());
    voice2comppocastModels =
        FlutterFlowDynamicModels(() => Voice2comppocastModel());
  }

  @override
  void dispose() {
    voice2comppocastCopyModels.dispose();
    voice2comppocastModels.dispose();
  }
}
