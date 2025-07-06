import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'discover_widget.dart' show DiscoverWidget;
import 'package:flutter/material.dart';

class DiscoverModel extends FlutterFlowModel<DiscoverWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in Discover widget.
  bool? networkdisc;
  // State field(s) for main widget.
  ScrollController? main;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for sliderow widget.
  ScrollController? sliderow;

  @override
  void initState(BuildContext context) {
    main = ScrollController();
    columnController = ScrollController();
    sliderow = ScrollController();
  }

  @override
  void dispose() {
    main?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    columnController?.dispose();
    sliderow?.dispose();
  }
}
