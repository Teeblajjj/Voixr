import '/backend/api_requests/api_calls.dart';
import '/components/nointernet_widget.dart';
import '/components/voice2comprec_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'voices_recorder_widget.dart' show VoicesRecorderWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VoicesRecorderModel extends FlutterFlowModel<VoicesRecorderWidget> {
  ///  Local state fields for this page.

  Color colae = Color(4279111698);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in voicesRecorder widget.
  bool? network2;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Models for voice2comprec dynamic component.
  late FlutterFlowDynamicModels<Voice2comprecModel> voice2comprecModels;

  @override
  void initState(BuildContext context) {
    voice2comprecModels = FlutterFlowDynamicModels(() => Voice2comprecModel());
  }

  @override
  void dispose() {
    voice2comprecModels.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
