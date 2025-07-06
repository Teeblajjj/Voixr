import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'voice2comppocast_copy_model.dart';
export 'voice2comppocast_copy_model.dart';

class Voice2comppocastCopyWidget extends StatefulWidget {
  const Voice2comppocastCopyWidget({
    super.key,
    this.name,
    this.usecase,
    this.link,
    this.id,
    required this.whos,
    this.audio,
  });

  final String? name;
  final String? usecase;
  final String? link;
  final String? id;
  final String? whos;
  final String? audio;

  @override
  State<Voice2comppocastCopyWidget> createState() =>
      _Voice2comppocastCopyWidgetState();
}

class _Voice2comppocastCopyWidgetState
    extends State<Voice2comppocastCopyWidget> {
  late Voice2comppocastCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Voice2comppocastCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.whos == 'Host' ? true : false) {
          FFAppState().HostName = widget!.name!;
          FFAppState().HostVid = widget!.id!;
          safeSetState(() {});
          Navigator.pop(context);
        } else {
          FFAppState().GuestName = widget!.name!;
          FFAppState().GuestVid = widget!.id!;
          safeSetState(() {});
          Navigator.pop(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.name,
                          'name',
                        ).maybeHandleOverflow(
                          maxChars: 11,
                        ),
                        textAlign: TextAlign.center,
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
                        valueOrDefault<String>(
                          widget!.usecase,
                          'usecase',
                        ).maybeHandleOverflow(
                          maxChars: 10,
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
                    ].divide(SizedBox(height: 2.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.isplaying = true;
                    safeSetState(() {});
                    _model.soundPlayer ??= AudioPlayer();
                    if (_model.soundPlayer!.playing) {
                      await _model.soundPlayer!.stop();
                    }
                    _model.soundPlayer!.setVolume(1.0);
                    _model.soundPlayer!
                        .setUrl(widget!.audio!)
                        .then((_) => _model.soundPlayer!.play());

                    await Future.delayed(const Duration(milliseconds: 3500));
                    _model.isplaying = false;
                    safeSetState(() {});
                    _model.soundPlayer?.stop();
                  },
                  text: valueOrDefault<String>(
                    _model.isplaying ? 'Pause' : 'Play',
                    'Play',
                  ),
                  icon: Icon(
                    Icons.graphic_eq_rounded,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 30.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconAlignment: IconAlignment.start,
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(44.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
