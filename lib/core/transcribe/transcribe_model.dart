import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_screentranscript_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'transcribe_widget.dart' show TranscribeWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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
  // Stores action output result for [Custom Action - getLocalfileUrl] action in IconButton widget.
  dynamic recurl;
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
