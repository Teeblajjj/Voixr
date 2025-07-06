import '/components/voice2comprec_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'voices_recorder_widget.dart' show VoicesRecorderWidget;
import 'package:flutter/material.dart';

class VoicesRecorderModel extends FlutterFlowModel<VoicesRecorderWidget> {
  ///  Local state fields for this page.

  Color colae = Color(4279111698);

  ///  State fields for stateful widgets in this page.

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
