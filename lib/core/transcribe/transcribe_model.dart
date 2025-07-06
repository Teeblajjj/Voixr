import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_screentranscript_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'transcribe_widget.dart' show TranscribeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class TranscribeModel extends FlutterFlowModel<TranscribeWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  bool isPlaying = false;

  String? language = 'en';

  bool created = false;

  bool isworking = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer1 widget.
  final timer1InitialTimeMs = 0;
  int timer1Milliseconds = 0;
  String timer1Value = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer1Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  bool isDataUploading_uploadDataTrnscrb = false;
  FFUploadedFile uploadedLocalFile_uploadDataTrnscrb =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataTrnscrb = '';

  AudioRecorder? audioRecorder;
  String? rectsrnew;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading_daddimFg7 = false;
  FFUploadedFile uploadedLocalFile_daddimFg7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_daddimFg7 = '';

  AudioPlayer? soundPlayer;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  LanguagesRecord? langi;
  // Stores action output result for [Backend Call - API (Transcription)] action in Button widget.
  ApiCallResponse? tr;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TranscriptionsRecord? fulltransx;
  // Model for loadingScreentranscript component.
  late LoadingScreentranscriptModel loadingScreentranscriptModel;

  @override
  void initState(BuildContext context) {
    loadingScreentranscriptModel =
        createModel(context, () => LoadingScreentranscriptModel());
  }

  @override
  void dispose() {
    timer1Controller.dispose();
    loadingScreentranscriptModel.dispose();
  }
}
