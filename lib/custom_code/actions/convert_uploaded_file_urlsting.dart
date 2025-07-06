// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/backend/schema/structs/index.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// an action that converts Uploaded File to audio Url sting
import 'dart:convert';
import 'dart:io';

Future<String?> convertUploadedFileUrlsting(FFUploadedFile file) async {
  try {
    // Check if the file has valid bytes
    if (file.bytes == null || file.bytes!.isEmpty) {
      return null;
    }

    // Convert bytes to base64 data URL for audio
    String base64String = base64Encode(file.bytes!);

    // Determine MIME type based on file name or default to audio/mpeg
    String mimeType = 'audio/mpeg';
    if (file.name != null) {
      String fileName = file.name!.toLowerCase();
      if (fileName.endsWith('.wav')) {
        mimeType = 'audio/wav';
      } else if (fileName.endsWith('.m4a')) {
        mimeType = 'audio/m4a';
      } else if (fileName.endsWith('.aac')) {
        mimeType = 'audio/aac';
      } else if (fileName.endsWith('.ogg')) {
        mimeType = 'audio/ogg';
      }
    }

    // Create data URL string
    String audioUrl = 'data:$mimeType;base64,$base64String';

    return audioUrl;
  } catch (e) {
    print('Error converting uploaded file to audio URL: $e');
    return null;
  }
}
