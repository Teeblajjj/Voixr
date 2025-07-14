import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  static String routeName = 'Onboarding';
  static String routePath = 'onboarding';

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      HapticFeedback.mediumImpact();
      setDarkModeSetting(context, ThemeMode.dark);
    });
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
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 670.0,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/APP_pa_SgeCREEN12.gif',
                                  width: double.infinity,
                                  height: 210.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 10.0, 24.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'laafw5yw' /* Voixr */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      font: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 38.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'aagduu72' /* Tap in. Speak out. Be heard. */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFAEAFB1),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 44.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(18.0, 34.0, 18.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(SigninWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'h6zxvauu' /* Sign in */,
                          ),
                          icon: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconAlignment: IconAlignment.end,
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 19.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).primaryText,
                            hoverTextColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 64.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(CreateAccountWidget.routeName);
                          },
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '4wnqsxlw' /* Don't have an account? */,
                                  ),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '66jxaqg2' /*  Sign up! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                        decoration: TextDecoration.underline,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFB0B1B2),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
