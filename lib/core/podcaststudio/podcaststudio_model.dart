import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/choosepodcaster1_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'podcaststudio_widget.dart' show PodcaststudioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PodcaststudioModel extends FlutterFlowModel<PodcaststudioWidget> {
  ///  Local state fields for this page.

  String? previewAudio;

  String? title;

  String? audio;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pgoerpsr' /* Enter your podcast title is re... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (enhanx)] action in Button widget.
  ApiCallResponse? apiehnx;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rwicth9r' /* What should they discuss? is r... */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v5wzwpms' /* Enter host name is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2869ljs1' /* Enter guest name is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Dialogue-Button widget.
  bool? formpod;
  // Stores action output result for [Backend Call - API (Podcast studioText)] action in Dialogue-Button widget.
  ApiCallResponse? apiResultpodcastscpt;
  // Stores action output result for [Backend Call - API (MAinPodcastAudio)] action in Dialogue-Button widget.
  ApiCallResponse? thePodcast;
  // Stores action output result for [Backend Call - Create Document] action in Dialogue-Button widget.
  PodcastsRecord? newpodDataDIALOGUE;
  // Stores action output result for [Validate Form] action in Solo-Button widget.
  bool? formpod1;
  // Stores action output result for [Backend Call - API (Podcast studio Solo)] action in Solo-Button widget.
  ApiCallResponse? apiResultwp5;
  // Stores action output result for [Backend Call - Create Document] action in Solo-Button widget.
  PodcastsRecord? newpodData1;
  // Model for loadingScreen component.
  late LoadingScreenModel loadingScreenModel;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    loadingScreenModel.dispose();
  }
}
