import '/components/voice2comptextsp_copy_widget.dart';
import '/components/voice2comptextsp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'voices_textspch_widget.dart' show VoicesTextspchWidget;
import 'package:flutter/material.dart';

class VoicesTextspchModel extends FlutterFlowModel<VoicesTextspchWidget> {
  ///  Local state fields for this page.

  Color colae = Color(4279111698);

  ///  State fields for stateful widgets in this page.

  // Models for voice2comptextsp dynamic component.
  late FlutterFlowDynamicModels<Voice2comptextspModel> voice2comptextspModels;
  // Models for voice2comptextspCopy dynamic component.
  late FlutterFlowDynamicModels<Voice2comptextspCopyModel>
      voice2comptextspCopyModels;

  @override
  void initState(BuildContext context) {
    voice2comptextspModels =
        FlutterFlowDynamicModels(() => Voice2comptextspModel());
    voice2comptextspCopyModels =
        FlutterFlowDynamicModels(() => Voice2comptextspCopyModel());
  }

  @override
  void dispose() {
    voice2comptextspModels.dispose();
    voice2comptextspCopyModels.dispose();
  }
}
