import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/created_audio_history_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'record_audio_widget.dart' show RecordAudioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class RecordAudioModel extends FlutterFlowModel<RecordAudioWidget> {
  ///  Local state fields for this page.

  bool isrecording = false;

  bool isPlaying = false;

  String? newAUPath;

  String? audtitle;

  bool isgen = false;

  String? pgestuploaded;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  bool isDataUploading_uploadDataVdr = false;
  FFUploadedFile uploadedLocalFile_uploadDataVdr =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataVdr = '';

  AudioRecorder? audioRecorder;
  String? fullaudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Custom Action - getLocalfileUrl] action in IconButton widget.
  dynamic? recurlnow;
  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - API (Buildship VoiceChanger)] action in Button widget.
  ApiCallResponse? stsresult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpeechDataRecord? stssaved;
  // Model for loadingScreen component.
  late LoadingScreenModel loadingScreenModel;

  @override
  void initState(BuildContext context) {
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    loadingScreenModel.dispose();
  }
}
