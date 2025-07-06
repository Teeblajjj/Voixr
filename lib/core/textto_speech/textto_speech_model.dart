import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'textto_speech_widget.dart' show TexttoSpeechWidget;
import 'package:flutter/material.dart';

class TexttoSpeechModel extends FlutterFlowModel<TexttoSpeechWidget> {
  ///  Local state fields for this page.

  String? newaudiopath;

  String? audiotitle;

  bool? isgen = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Buildship)] action in Button widget.
  ApiCallResponse? bsresult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpeechDataRecord? newCreation;
  // Model for loadingScreen component.
  late LoadingScreenModel loadingScreenModel;

  @override
  void initState(BuildContext context) {
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loadingScreenModel.dispose();
  }
}
