import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'actionsheet1_model.dart';
export 'actionsheet1_model.dart';

class Actionsheet1Widget extends StatefulWidget {
  const Actionsheet1Widget({
    super.key,
    this.voiceid,
    this.voicename,
    this.usecase,
  });

  final String? voiceid;
  final String? voicename;
  final String? usecase;

  @override
  State<Actionsheet1Widget> createState() => _Actionsheet1WidgetState();
}

class _Actionsheet1WidgetState extends State<Actionsheet1Widget> {
  late Actionsheet1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Actionsheet1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      HapticFeedback.lightImpact();
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 18.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'u25wl1ws' /* Choose  type  */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                context.pushNamed(
                  TexttoSpeechWidget.routeName,
                  queryParameters: {
                    'voicename': serializeParam(
                      widget!.voicename,
                      ParamType.String,
                    ),
                    'usecase': serializeParam(
                      widget!.usecase,
                      ParamType.String,
                    ),
                    'id': serializeParam(
                      widget!.voiceid,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );

                FFAppState().deleteText();
                FFAppState().text = '';

                safeSetState(() {});
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                's3hbrkfl' /* Text to speech */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.manrope(
                        fontWeight: FontWeight.w800,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    RecordAudioWidget.routeName,
                    queryParameters: {
                      'name': serializeParam(
                        widget!.voicename,
                        ParamType.String,
                      ),
                      'usecase': serializeParam(
                        widget!.usecase,
                        ParamType.String,
                      ),
                      'id': serializeParam(
                        FFAppState().Voiceid,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );

                  FFAppState().deleteUploadedAudio();
                  FFAppState().UploadedAudio = '';

                  FFAppState().deleteInstlyRecorded();
                  FFAppState().InstlyRecorded = '';

                  safeSetState(() {});
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  '4s77k2eu' /* Voice to speech */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FontWeight.w800,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pop();
                },
                text: FFLocalizations.of(context).getText(
                  '2f12xk1r' /* Cancel */,
                ),
                icon: Icon(
                  Icons.close_outlined,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.lexendDeca(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
