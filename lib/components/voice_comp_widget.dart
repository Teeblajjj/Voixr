import '/components/actionsheet1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'voice_comp_model.dart';
export 'voice_comp_model.dart';

class VoiceCompWidget extends StatefulWidget {
  const VoiceCompWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.url,
    this.voiceId,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;
  final dynamic parameter4;
  final dynamic url;
  final dynamic voiceId;

  @override
  State<VoiceCompWidget> createState() => _VoiceCompWidgetState();
}

class _VoiceCompWidgetState extends State<VoiceCompWidget> {
  late VoiceCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceCompModel());
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
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x0C000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      'https://images.unsplash.com/photo-1636690424408-4330adc3e583?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8YWklMjB2b2ljfGVufDB8fHx8MTc0NDc4MTUxMHww&ixlib=rb-4.0.3&q=80&w=1080',
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Actionsheet1Widget(
                          voiceid: widget!.voiceId?.toString(),
                          voicename: widget!.parameter1?.toString(),
                          usecase: widget!.parameter4?.toString(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  FFAppState().Voiceid = widget!.voiceId!.toString();
                  safeSetState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget!.parameter1!.toString().maybeHandleOverflow(
                            maxChars: 23,
                            replacement: '…',
                          ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.manrope(
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Text(
                      '${widget!.parameter4?.toString()} • ${valueOrDefault<String>(
                        widget!.parameter2?.toString(),
                        'Voixr',
                      )}'
                          .maybeHandleOverflow(
                        maxChars: 18,
                        replacement: '…',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).button,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        if (_model.isplaying == true)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.soundPlayer?.stop();
                              _model.isplaying = false;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.pause,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 25.0,
                            ),
                          ),
                        if (_model.isplaying == false)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.soundPlayer?.stop();
                              FFAppState().audiopath = widget!.url!.toString();
                              safeSetState(() {});
                              _model.isplaying = true;
                              safeSetState(() {});
                              _model.soundPlayer ??= AudioPlayer();
                              if (_model.soundPlayer!.playing) {
                                await _model.soundPlayer!.stop();
                              }
                              _model.soundPlayer!.setVolume(1.0);
                              _model.soundPlayer!
                                  .setUrl(FFAppState().audiopath)
                                  .then((_) => _model.soundPlayer!.play());

                              await Future.delayed(
                                  const Duration(milliseconds: 3500));
                              _model.isplaying = false;
                              safeSetState(() {});
                              _model.soundPlayer?.stop();
                            },
                            child: Icon(
                              Icons.play_arrow_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 25.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 89.0,
                  buttonSize: 35.0,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Actionsheet1Widget(
                            voiceid: widget!.voiceId?.toString(),
                            voicename: widget!.parameter1?.toString(),
                            usecase: widget!.parameter4?.toString(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    FFAppState().Voiceid = widget!.voiceId!.toString();
                    safeSetState(() {});
                  },
                ),
              ].divide(SizedBox(width: 4.0)),
            ),
          ],
        ),
      ),
    );
  }
}
