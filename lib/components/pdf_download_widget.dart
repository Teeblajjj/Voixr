import '/flutter_flow/flutter_flow_util.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdf_download_model.dart';
export 'pdf_download_model.dart';

class PdfDownloadWidget extends StatefulWidget {
  const PdfDownloadWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<PdfDownloadWidget> createState() => _PdfDownloadWidgetState();
}

class _PdfDownloadWidgetState extends State<PdfDownloadWidget> {
  late PdfDownloadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfDownloadModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
