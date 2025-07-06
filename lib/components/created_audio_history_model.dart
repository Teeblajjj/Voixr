import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'created_audio_history_widget.dart' show CreatedAudioHistoryWidget;
import 'package:flutter/material.dart';

class CreatedAudioHistoryModel
    extends FlutterFlowModel<CreatedAudioHistoryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<SpeechDataRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
