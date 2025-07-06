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

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';

Future<dynamic> getLocalfileUrl(String? localfile) async {
  try {
    if (localfile == null || localfile.isEmpty) {
      return {'error': 'No file path provided'};
    }

    final File inputFile = File(localfile);
    if (!await inputFile.exists()) {
      return {'error': 'File does not exist at the given path'};
    }

    // Generate output mp3 file path in the same directory
    final String dirPath = inputFile.parent.path;
    final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final String fileName = 'Voixr_$currentDate.mp3';
    final String outputPath = '$dirPath/$fileName';

    // Convert to MP3 using FFmpeg
    final String command =
        '-y -i "${inputFile.path}" -codec:a libmp3lame "$outputPath"';
    await FFmpegKit.execute(command);

    final File outputFile = File(outputPath);
    if (!await outputFile.exists()) {
      return {'error': 'MP3 conversion failed'};
    }

    // Upload to Firebase Storage
    final Reference ref =
        FirebaseStorage.instance.ref().child('audio_uploads/$fileName');
    final UploadTask uploadTask = ref.putFile(outputFile);
    final TaskSnapshot snapshot = await uploadTask;
    final String downloadUrl = await snapshot.ref.getDownloadURL();

    // Get audio duration
    final AudioPlayer player = AudioPlayer();
    Duration? duration;

    try {
      await player.setFilePath(outputPath);
      duration = player.duration ?? Duration.zero;
    } catch (_) {
      duration = Duration.zero;
    } finally {
      await player.dispose();
    }

    return {
      'url': downloadUrl,
      'duration': duration.inSeconds,
    };
  } catch (e) {
    return {'error': 'Upload failed: ${e.toString()}'};
  }
}
