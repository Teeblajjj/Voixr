import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'librarypage_widget.dart' show LibrarypageWidget;
import 'package:flutter/material.dart';

class LibrarypageModel extends FlutterFlowModel<LibrarypageWidget> {
  ///  Local state fields for this page.

  bool isplaying = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in LIBRARYPAGE widget.
  bool? networklib;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for SCROLLCOM widget.
  ScrollController? scrollcom;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for bosaved widget.
  ScrollController? bosaved;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<SpeechDataRecord> simpleSearchResults = [];
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    scrollcom = ScrollController();
    bosaved = ScrollController();
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    scrollcom?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    bosaved?.dispose();
    columnController1?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    listViewController?.dispose();
  }
}
