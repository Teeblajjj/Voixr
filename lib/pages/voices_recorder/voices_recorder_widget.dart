import '/backend/api_requests/api_calls.dart';
import '/components/voice2comprec_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'voices_recorder_model.dart';
export 'voices_recorder_model.dart';

class VoicesRecorderWidget extends StatefulWidget {
  const VoicesRecorderWidget({super.key});

  static String routeName = 'voicesRecorder';
  static String routePath = 'voicesRecorder';

  @override
  State<VoicesRecorderWidget> createState() => _VoicesRecorderWidgetState();
}

class _VoicesRecorderWidgetState extends State<VoicesRecorderWidget> {
  late VoicesRecorderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoicesRecorderModel());
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
                'mf4k755n' /* Choose a voice */,
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
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  safeSetState(() {
                    FFAppState()
                        .clearVoice1CacheKey(_model.apiRequestLastUniqueKey);
                    _model.apiRequestCompleted = false;
                  });
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState()
                              .voice1(
                            uniqueQueryKey: 'Voices',
                            requestFn: () => MainGroup.voicesCall.call(
                              voiceType: 'default',
                            ),
                          )
                              .then((result) {
                            try {
                              _model.apiRequestCompleted = true;
                              _model.apiRequestLastUniqueKey = 'Voices';
                            } finally {}
                            return result;
                          }),
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
                                      model:
                                          _model.voice2comprecModels.getModel(
                                        allItem.toString(),
                                        allIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: Voice2comprecWidget(
                                        key: Key(
                                          'Keywng_${allItem.toString()}',
                                        ),
                                        name: getJsonField(
                                          allItem,
                                          r'''$.name''',
                                        ),
                                        usecase: getJsonField(
                                          allItem,
                                          r'''$..use_case''',
                                        ),
                                        id: getJsonField(
                                          allItem,
                                          r'''$.voice_id''',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
