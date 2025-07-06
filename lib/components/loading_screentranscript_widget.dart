import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_screentranscript_model.dart';
export 'loading_screentranscript_model.dart';

class LoadingScreentranscriptWidget extends StatefulWidget {
  const LoadingScreentranscriptWidget({super.key});

  @override
  State<LoadingScreentranscriptWidget> createState() =>
      _LoadingScreentranscriptWidgetState();
}

class _LoadingScreentranscriptWidgetState
    extends State<LoadingScreentranscriptWidget> {
  late LoadingScreentranscriptModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreentranscriptModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.oncreentext = 'Starting transcription';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.oncreentext = 'Transcribing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Loading rich text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Adding final polish...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Prepping your audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing ...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      _model.oncreentext = 'Getting your text ready';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your words...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.oncreentext = 'Transcribing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Loading rich text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Adding final polish...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Prepping your audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing ...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      _model.oncreentext = 'Getting your text ready';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your words...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.oncreentext = 'Transcribing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Loading rich text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Adding final polish...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Prepping your audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing ...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      _model.oncreentext = 'Getting your text ready';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your words...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.oncreentext = 'Transcribing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Loading rich text...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Adding final polish...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Prepping your audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing audio...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Tuning the vibes...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      _model.oncreentext = 'Processing ...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      _model.oncreentext = 'Getting your text ready';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.oncreentext = 'Crafting your words...';
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/APP_pa_SgeCREEN12.gif',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: Text(
                      _model.oncreentext,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFEAEAEA),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(22.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFFE608A9),
                            size: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '9gfagmhk' /* Generation takes about 10-60 s... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'z82a4f6s' /* Your Transcription Text file  ... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ],
        ),
      ),
    );
  }
}
