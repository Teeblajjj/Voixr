import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'single_widget.dart' show SingleWidget;
import 'package:flutter/material.dart';

class SingleModel extends FlutterFlowModel<SingleWidget> {
  ///  Local state fields for this page.

  bool isplaying = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
