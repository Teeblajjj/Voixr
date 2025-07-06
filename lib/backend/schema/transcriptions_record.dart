import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranscriptionsRecord extends FirestoreRecord {
  TranscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "transcript" field.
  String? _transcript;
  String get transcript => _transcript ?? '';
  bool hasTranscript() => _transcript != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "translatedTranscript" field.
  String? _translatedTranscript;
  String get translatedTranscript => _translatedTranscript ?? '';
  bool hasTranslatedTranscript() => _translatedTranscript != null;

  // "audioDuration" field.
  int? _audioDuration;
  int get audioDuration => _audioDuration ?? 0;
  bool hasAudioDuration() => _audioDuration != null;

  // "numberOfWords" field.
  int? _numberOfWords;
  int get numberOfWords => _numberOfWords ?? 0;
  bool hasNumberOfWords() => _numberOfWords != null;

  // "Audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _transcript = snapshotData['transcript'] as String?;
    _language = snapshotData['language'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _translatedTranscript = snapshotData['translatedTranscript'] as String?;
    _audioDuration = castToType<int>(snapshotData['audioDuration']);
    _numberOfWords = castToType<int>(snapshotData['numberOfWords']);
    _audio = snapshotData['Audio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transcriptions');

  static Stream<TranscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TranscriptionsRecord.fromSnapshot(s));

  static Future<TranscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TranscriptionsRecord.fromSnapshot(s));

  static TranscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TranscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TranscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TranscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TranscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TranscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranscriptionsRecordData({
  String? userId,
  String? transcript,
  String? language,
  DateTime? createdTime,
  String? translatedTranscript,
  int? audioDuration,
  int? numberOfWords,
  String? audio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'transcript': transcript,
      'language': language,
      'createdTime': createdTime,
      'translatedTranscript': translatedTranscript,
      'audioDuration': audioDuration,
      'numberOfWords': numberOfWords,
      'Audio': audio,
    }.withoutNulls,
  );

  return firestoreData;
}

class TranscriptionsRecordDocumentEquality
    implements Equality<TranscriptionsRecord> {
  const TranscriptionsRecordDocumentEquality();

  @override
  bool equals(TranscriptionsRecord? e1, TranscriptionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.transcript == e2?.transcript &&
        e1?.language == e2?.language &&
        e1?.createdTime == e2?.createdTime &&
        e1?.translatedTranscript == e2?.translatedTranscript &&
        e1?.audioDuration == e2?.audioDuration &&
        e1?.numberOfWords == e2?.numberOfWords &&
        e1?.audio == e2?.audio;
  }

  @override
  int hash(TranscriptionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.transcript,
        e?.language,
        e?.createdTime,
        e?.translatedTranscript,
        e?.audioDuration,
        e?.numberOfWords,
        e?.audio
      ]);

  @override
  bool isValidKey(Object? o) => o is TranscriptionsRecord;
}
