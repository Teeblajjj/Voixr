import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/voice2comptextsp_copy_widget.dart';
import '/components/voice2comptextsp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'voices_textspch_model.dart';
export 'voices_textspch_model.dart';

class VoicesTextspchWidget extends StatefulWidget {
  const VoicesTextspchWidget({super.key});

  static String routeName = 'voicesTextspch';
  static String routePath = 'voicesTextspch';

  @override
  State<VoicesTextspchWidget> createState() => _VoicesTextspchWidgetState();
}

class _VoicesTextspchWidgetState extends State<VoicesTextspchWidget> {
  late VoicesTextspchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoicesTextspchModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed(HomeWidget.routeName);
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'bj4mds55' /* choose a voice */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: StreamBuilder<List<VoicesRecord>>(
                        stream: FFAppState().voice2(
                          uniqueQueryKey: 'Voices',
                          requestFn: () => queryVoicesRecord(),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 177.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: 90.0,
                                  height: 90.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 90.0,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<VoicesRecord> gridViewVoicesRecordList =
                              snapshot.data!;

                          return GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              10.0,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewVoicesRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewVoicesRecord =
                                  gridViewVoicesRecordList[gridViewIndex];
                              return wrapWithModel(
                                model: _model.voice2comptextspModels.getModel(
                                  gridViewVoicesRecord.reference.id,
                                  gridViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: Voice2comptextspWidget(
                                  key: Key(
                                    'Key8zu_${gridViewVoicesRecord.reference.id}',
                                  ),
                                  name: gridViewVoicesRecord.voiceName,
                                  usecase: gridViewVoicesRecord.accent,
                                  link: gridViewVoicesRecord.previewUrl,
                                  id: gridViewVoicesRecord.id,
                                  audio: gridViewVoicesRecord.preview2,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: FFAppState().voice1(
                          uniqueQueryKey: 'Voices',
                          requestFn: () => MainGroup.voicesCall.call(
                            voiceType: 'default',
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 177.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: 90.0,
                                  height: 90.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 90.0,
                                  ),
                                ),
                              ),
                            );
                          }
                          final gridViewVoicesResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final all = MainGroup.voicesCall
                                      .voices(
                                        gridViewVoicesResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];

                              return GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  66.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: all.length,
                                itemBuilder: (context, allIndex) {
                                  final allItem = all[allIndex];
                                  return wrapWithModel(
                                    model: _model.voice2comptextspCopyModels
                                        .getModel(
                                      allItem.toString(),
                                      allIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: Voice2comptextspCopyWidget(
                                      key: Key(
                                        'Keykoy_${allItem.toString()}',
                                      ),
                                      id: getJsonField(
                                        allItem,
                                        r'''$.voice_id''',
                                      ).toString(),
                                      name: getJsonField(
                                        allItem,
                                        r'''$.name''',
                                      ),
                                      usecase: getJsonField(
                                        allItem,
                                        r'''$..use_case''',
                                      ),
                                      link: getJsonField(
                                        allItem,
                                        r'''$.preview_url''',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
