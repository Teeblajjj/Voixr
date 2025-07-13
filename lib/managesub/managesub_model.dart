import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'managesub_widget.dart' show ManagesubWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ManagesubModel extends FlutterFlowModel<ManagesubWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? topup5000;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? topup10000;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? topup15000;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
