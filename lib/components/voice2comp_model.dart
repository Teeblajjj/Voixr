import '/flutter_flow/flutter_flow_util.dart';
import 'voice2comp_widget.dart' show Voice2compWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Voice2compModel extends FlutterFlowModel<Voice2compWidget> {
  ///  Local state fields for this component.

  bool isplaying = false;

  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
