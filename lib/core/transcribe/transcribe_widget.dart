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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
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
import 'transcribe_model.dart';
export 'transcribe_model.dart';

/// Create a page for audio transcription this page takes inout as audio file
/// or record its file, a swith if user need translation and then transcribe
/// button, ,ake it modern and futuristic
class TranscribeWidget extends StatefulWidget {
  const TranscribeWidget({super.key});

  static String routeName = 'transcribe';
  static String routePath = 'transcribe';

  @override
  State<TranscribeWidget> createState() => _TranscribeWidgetState();
}

class _TranscribeWidgetState extends State<TranscribeWidget> {
  late TranscribeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TranscribeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isRecording = false;
      _model.isPlaying = false;
      _model.language = 'en';
      _model.isworking = false;
      safeSetState(() {});
      FFAppState().deleteInstlyRecorded();
      FFAppState().InstlyRecorded = '';

      safeSetState(() {});
      HapticFeedback.lightImpact();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: _model.isworking == false
            ? PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(HomeWidget.routeName);
                                },
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 2.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.credits,
                                                              0),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                        ),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Icon(
                                                    Icons.stars,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    size: 22.0,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      LibrarypageWidget
                                                          .routeName);
                                                },
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.history_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 29.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 22.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'o3swmd7k' /* AudioTranscription */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4lyw8zik' /* Transform your audio into text... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 18.0, 18.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 8.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Lottie.asset(
                                                'assets/jsons/Animation_-_1751291532015.json',
                                                width: 200.0,
                                                height: 200.0,
                                                fit: BoxFit.contain,
                                                animate: (_model.isRecording ==
                                                        true) ||
                                                    (_model.isPlaying == true),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 7.0),
                                              child: FlutterFlowTimer(
                                                initialTime:
                                                    _model.timer1InitialTimeMs,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  milliSecond: false,
                                                ),
                                                controller:
                                                    _model.timer1Controller,
                                                updateStateInterval: Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.timer1Milliseconds =
                                                      value;
                                                  _model.timer1Value =
                                                      displayTime;
                                                  if (shouldUpdate)
                                                    safeSetState(() {});
                                                },
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: const CircleBorder(),
                                          child: Container(
                                            width: 75.0,
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 88.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              icon: Icon(
                                                Icons.upload,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 33.0,
                                              ),
                                              onPressed: () async {
                                                final selectedFiles =
                                                    await selectFiles(
                                                  allowedExtensions: ['mp3'],
                                                  multiFile: false,
                                                );
                                                if (selectedFiles != null) {
                                                  safeSetState(() => _model
                                                          .isDataUploading_uploadDataTrnscrb =
                                                      true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedFiles
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedFiles.map(
                                                        (f) async =>
                                                            await uploadData(
                                                                f.storagePath,
                                                                f.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading_uploadDataTrnscrb =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedFiles
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedFiles
                                                              .length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile_uploadDataTrnscrb =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl_uploadDataTrnscrb =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                      context,
                                                      'Success!',
                                                    );
                                                  } else {
                                                    safeSetState(() {});
                                                    showUploadMessage(
                                                      context,
                                                      'Failed to upload file',
                                                    );
                                                    return;
                                                  }
                                                }

                                                HapticFeedback.lightImpact();
                                                FFAppState().InstlyRecorded = _model
                                                    .uploadedFileUrl_uploadDataTrnscrb;
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: const CircleBorder(),
                                          child: Container(
                                            width: 75.0,
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                if (_model.isRecording == false)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 88.0,
                                                    buttonSize: 73.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.mic,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 33.0,
                                                    ),
                                                    onPressed: () async {
                                                      await requestPermission(
                                                          microphonePermission);
                                                      _model.timer1Controller
                                                          .onResetTimer();

                                                      await startAudioRecording(
                                                        context,
                                                        audioRecorder: _model
                                                                .audioRecorder ??=
                                                            AudioRecorder(),
                                                      );

                                                      _model.timer1Controller
                                                          .onStartTimer();
                                                      _model.isRecording = true;
                                                      safeSetState(() {});
                                                      HapticFeedback
                                                          .lightImpact();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            '...Recording!',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                if (_model.isRecording == true)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 88.0,
                                                    buttonSize: 73.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.stop_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 33.0,
                                                    ),
                                                    onPressed: () async {
                                                      await stopAudioRecording(
                                                        audioRecorder: _model
                                                            .audioRecorder,
                                                        audioName:
                                                            'recordedFileBytes',
                                                        onRecordingComplete:
                                                            (audioFilePath,
                                                                audioBytes) {
                                                          _model.rectsrnew =
                                                              audioFilePath;
                                                          _model.recordedFileBytes =
                                                              audioBytes;
                                                        },
                                                      );

                                                      _model.timer1Controller
                                                          .onStopTimer();
                                                      _model.recurl =
                                                          await actions
                                                              .getLocalfileUrl(
                                                        _model.rectsrnew,
                                                      );
                                                      FFAppState()
                                                              .InstlyRecorded =
                                                          utility_functions_library_8g4bud_functions
                                                              .convertStringToAudioPath(
                                                                  getJsonField(
                                                        _model.recurl,
                                                        r'''$..url''',
                                                      ).toString())!;
                                                      FFAppState()
                                                              .UploadedAudio =
                                                          getJsonField(
                                                        _model.recurl,
                                                        r'''$..url''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                      _model.isRecording =
                                                          false;
                                                      safeSetState(() {});
                                                      HapticFeedback
                                                          .lightImpact();

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: const CircleBorder(),
                                          child: Container(
                                            width: 75.0,
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                if (_model.isPlaying == false)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 88.0,
                                                    buttonSize: 75.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.play_arrow,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 35.0,
                                                    ),
                                                    onPressed: () async {
                                                      if (valueOrDefault<bool>(
                                                        (FFAppState().UploadedAudio !=
                                                                    null &&
                                                                FFAppState()
                                                                        .UploadedAudio !=
                                                                    '') ||
                                                            (FFAppState()
                                                                        .InstlyRecorded !=
                                                                    null &&
                                                                FFAppState()
                                                                        .InstlyRecorded !=
                                                                    ''),
                                                        false,
                                                      )) {
                                                        _model.isPlaying = true;
                                                        safeSetState(() {});
                                                        _model.soundPlayer ??=
                                                            AudioPlayer();
                                                        if (_model.soundPlayer!
                                                            .playing) {
                                                          await _model
                                                              .soundPlayer!
                                                              .stop();
                                                        }
                                                        _model.soundPlayer!
                                                            .setVolume(1.0);
                                                        await _model
                                                            .soundPlayer!
                                                            .setUrl(FFAppState()
                                                                .InstlyRecorded)
                                                            .then((_) => _model
                                                                .soundPlayer!
                                                                .play());

                                                        _model.soundPlayer
                                                            ?.stop();
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'No Audio Yet! Please Upload or Record.',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                if (_model.isPlaying == true)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 88.0,
                                                    buttonSize: 75.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.stop_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 35.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.soundPlayer
                                                          ?.stop();
                                                      _model.isPlaying = false;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                              child: FutureBuilder<List<LanguagesRecord>>(
                                future: FFAppState().language(
                                  uniqueQueryKey: valueOrDefault<String>(
                                    currentUserReference?.id,
                                    '8753645876',
                                  ),
                                  requestFn: () => queryLanguagesRecordOnce(),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: LinearProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LanguagesRecord>
                                      dropDownLanguagesRecordList =
                                      snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??=
                                          FFLocalizations.of(context).getText(
                                        'm4vcvqqe' /* English */,
                                      ),
                                    ),
                                    options: dropDownLanguagesRecordList
                                        .map((e) => e.languageName)
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue = val);
                                      _model.langi =
                                          await queryLanguagesRecordOnce(
                                        queryBuilder: (languagesRecord) =>
                                            languagesRecord.where(
                                          'LanguageName',
                                          isEqualTo: _model.dropDownValue,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.language = _model.langi?.code;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'enn1rpzn' /* Select target language */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderWidth: 1.0,
                                    borderRadius: 12.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 8.0))
                              .addToStart(SizedBox(height: 16.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.created == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      SingleWidget.routeName,
                                      queryParameters: {
                                        'docref': serializeParam(
                                          _model.fulltransx?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.description_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AnimatedDefaultTextStyle(
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    duration: Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeIn,
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        TranscriptionCall
                                                            .translated(
                                                          (_model.tr
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        'My Transcript',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 25,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Transcribed  ${dateTimeFormat(
                                                      "relative",
                                                      _model.fulltransx
                                                          ?.createdTime,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Your file contains ${formatNumber(
                                                      _model.fulltransx
                                                          ?.numberOfWords,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    )} characters',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 33.0,
                                                buttonSize: 44.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                icon: Icon(
                                                  Icons.read_more_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    SingleWidget.routeName,
                                                    queryParameters: {
                                                      'docref': serializeParam(
                                                        _model.fulltransx
                                                            ?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText
                                          ],
                                          stops: [0.5, 1.0, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -1.0),
                                          end: AlignmentDirectional(-1.0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState().InstlyRecorded !=
                                                  null &&
                                              FFAppState().InstlyRecorded !=
                                                  '') {
                                            _model.created = false;
                                            _model.isworking = true;
                                            safeSetState(() {});
                                            _model.tr =
                                                await TranscriptionCall.call(
                                              audio:
                                                  FFAppState().InstlyRecorded,
                                              language: valueOrDefault<String>(
                                                _model.language,
                                                'en',
                                              ),
                                            );

                                            if ((_model.tr?.succeeded ??
                                                true)) {
                                              var transcriptionsRecordReference =
                                                  TranscriptionsRecord
                                                      .collection
                                                      .doc();
                                              await transcriptionsRecordReference
                                                  .set(
                                                      createTranscriptionsRecordData(
                                                userId:
                                                    currentUserReference?.id,
                                                transcript: TranscriptionCall
                                                    .defaultENG(
                                                  (_model.tr?.jsonBody ?? ''),
                                                ),
                                                audio:
                                                    FFAppState().InstlyRecorded,
                                                language: _model.dropDownValue,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                translatedTranscript:
                                                    TranscriptionCall
                                                        .translated(
                                                  (_model.tr?.jsonBody ?? ''),
                                                ),
                                                audioDuration: 3000,
                                                numberOfWords:
                                                    valueOrDefault<int>(
                                                  functions.textCount(
                                                      TranscriptionCall
                                                          .translated(
                                                    (_model.tr?.jsonBody ?? ''),
                                                  )!),
                                                  0,
                                                ),
                                              ));
                                              _model.fulltransx = TranscriptionsRecord
                                                  .getDocumentFromData(
                                                      createTranscriptionsRecordData(
                                                        userId:
                                                            currentUserReference
                                                                ?.id,
                                                        transcript:
                                                            TranscriptionCall
                                                                .defaultENG(
                                                          (_model.tr
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        audio: FFAppState()
                                                            .InstlyRecorded,
                                                        language: _model
                                                            .dropDownValue,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        translatedTranscript:
                                                            TranscriptionCall
                                                                .translated(
                                                          (_model.tr
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        audioDuration: 3000,
                                                        numberOfWords:
                                                            valueOrDefault<int>(
                                                          functions.textCount(
                                                              TranscriptionCall
                                                                  .translated(
                                                            (_model.tr
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
                                                          0,
                                                        ),
                                                      ),
                                                      transcriptionsRecordReference);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Your Transcript is Ready!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              _model.created = true;
                                              _model.isworking = false;
                                              safeSetState(() {});
                                            } else {
                                              _model.created = false;
                                              _model.isworking = false;
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Internet Error Try Again!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Record or upload a valid Audio file!',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            _model.created = false;
                                            _model.isworking = false;
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'kdfkqja6' /* Start Transcription */,
                                        ),
                                        icon: Icon(
                                          Icons.auto_awesome_rounded,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 54.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.download,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ].addToEnd(SizedBox(height: 44.0)),
                    ),
                  ),
                ),
              ),
            ),
            if (_model.isworking == true)
              wrapWithModel(
                model: _model.loadingScreentranscriptModel,
                updateCallback: () => safeSetState(() {}),
                child: LoadingScreentranscriptWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
