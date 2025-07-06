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

// convert recoreded AudioPath to UploadedFile
import 'dart:io';
import 'dart:typed_data';

Future<FFUploadedFile?> convertAudioPathToUploadedFile(
    String audioFilePath) async {
  try {
    // Check if the file path is empty or null
    if (audioFilePath.isEmpty) {
      return null;
    }

    // Create a File object from the path
    final File audioFile = File(audioFilePath);

    // Check if the file exists
    if (!await audioFile.exists()) {
      return null;
    }

    // Read the file as bytes
    final Uint8List fileBytes = await audioFile.readAsBytes();

    // Get the file name from the path
    final String fileName = audioFile.path.split('/').last;

    // Create and return FFUploadedFile
    return FFUploadedFile(
      name: fileName,
      bytes: fileBytes,
    );
  } catch (e) {
    // Handle any errors that might occur during file operations
    print('Error converting audio path to uploaded file: $e');
    return null;
  }
}
