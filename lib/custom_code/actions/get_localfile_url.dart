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
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';

Future<dynamic> getLocalfileUrl(String? localfile) async {
  try {
    // Validate input
    if (localfile == null || localfile.isEmpty) {
      return {'error': 'No file path provided'};
    }

    final File originalFile = File(localfile);
    if (!await originalFile.exists()) {
      return {'error': 'File does not exist at the given path'};
    }

    // Create output .mp3 file path
    final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final Directory tempDir = await getTemporaryDirectory();
    final String mp3FilePath = p.join(tempDir.path, 'Voixr_$currentDate.mp3');

    // Run FFmpeg to convert to MP3
    final String ffmpegCommand =
        '-i "${originalFile.path}" -vn -ar 44100 -ac 2 -b:a 192k "$mp3FilePath"';
    final session = await FFmpegKit.execute(ffmpegCommand);

    final File convertedFile = File(mp3FilePath);
    if (!await convertedFile.exists()) {
      return {'error': 'MP3 conversion failed'};
    }

    // Upload converted MP3 file to Firebase Storage
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference ref =
        storage.ref().child('audio_uploads/Voixr_$currentDate.mp3');
    final UploadTask uploadTask = ref.putFile(convertedFile);
    final TaskSnapshot snapshot = await uploadTask;
    final String downloadUrl = await snapshot.ref.getDownloadURL();

    // Get audio duration
    final AudioPlayer player = AudioPlayer();
    Duration? duration;
    try {
      await player.setFilePath(mp3FilePath);
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
