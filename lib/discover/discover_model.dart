import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nointernet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'discover_widget.dart' show DiscoverWidget;
import 'package:badges/badges.dart' as badges;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

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
