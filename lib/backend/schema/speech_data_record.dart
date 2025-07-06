import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpeechDataRecord extends FirestoreRecord {
  SpeechDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "original_text" field.
  String? _originalText;
  String get originalText => _originalText ?? '';
  bool hasOriginalText() => _originalText != null;

  // "original_audio_url" field.
  String? _originalAudioUrl;
  String get originalAudioUrl => _originalAudioUrl ?? '';
  bool hasOriginalAudioUrl() => _originalAudioUrl != null;

  // "modified_audio_url" field.
  String? _modifiedAudioUrl;
  String get modifiedAudioUrl => _modifiedAudioUrl ?? '';
  bool hasModifiedAudioUrl() => _modifiedAudioUrl != null;

  // "source_type" field.
  String? _sourceType;
  String get sourceType => _sourceType ?? '';
  bool hasSourceType() => _sourceType != null;

  // "voice_id" field.
  String? _voiceId;
  String get voiceId => _voiceId ?? '';
  bool hasVoiceId() => _voiceId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "duration_sec" field.
  int? _durationSec;
  int get durationSec => _durationSec ?? 0;
  bool hasDurationSec() => _durationSec != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "newAudio" field.
  String? _newAudio;
  String get newAudio => _newAudio ?? '';
  bool hasNewAudio() => _newAudio != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "byname" field.
  String? _byname;
  String get byname => _byname ?? '';
  bool hasByname() => _byname != null;

  void _initializeFields() {
    _originalText = snapshotData['original_text'] as String?;
    _originalAudioUrl = snapshotData['original_audio_url'] as String?;
    _modifiedAudioUrl = snapshotData['modified_audio_url'] as String?;
    _sourceType = snapshotData['source_type'] as String?;
    _voiceId = snapshotData['voice_id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _durationSec = castToType<int>(snapshotData['duration_sec']);
    _userId = snapshotData['user_id'] as String?;
    _newAudio = snapshotData['newAudio'] as String?;
    _title = snapshotData['title'] as String?;
    _byname = snapshotData['byname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SpeechData');

  static Stream<SpeechDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpeechDataRecord.fromSnapshot(s));

  static Future<SpeechDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpeechDataRecord.fromSnapshot(s));

  static SpeechDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpeechDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpeechDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpeechDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpeechDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpeechDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpeechDataRecordData({
  String? originalText,
  String? originalAudioUrl,
  String? modifiedAudioUrl,
  String? sourceType,
  String? voiceId,
  DateTime? createdAt,
  int? durationSec,
  String? userId,
  String? newAudio,
  String? title,
  String? byname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'original_text': originalText,
      'original_audio_url': originalAudioUrl,
      'modified_audio_url': modifiedAudioUrl,
      'source_type': sourceType,
      'voice_id': voiceId,
      'created_at': createdAt,
      'duration_sec': durationSec,
      'user_id': userId,
      'newAudio': newAudio,
      'title': title,
      'byname': byname,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpeechDataRecordDocumentEquality implements Equality<SpeechDataRecord> {
  const SpeechDataRecordDocumentEquality();

  @override
  bool equals(SpeechDataRecord? e1, SpeechDataRecord? e2) {
    return e1?.originalText == e2?.originalText &&
        e1?.originalAudioUrl == e2?.originalAudioUrl &&
        e1?.modifiedAudioUrl == e2?.modifiedAudioUrl &&
        e1?.sourceType == e2?.sourceType &&
        e1?.voiceId == e2?.voiceId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.durationSec == e2?.durationSec &&
        e1?.userId == e2?.userId &&
        e1?.newAudio == e2?.newAudio &&
        e1?.title == e2?.title &&
        e1?.byname == e2?.byname;
  }

  @override
  int hash(SpeechDataRecord? e) => const ListEquality().hash([
        e?.originalText,
        e?.originalAudioUrl,
        e?.modifiedAudioUrl,
        e?.sourceType,
        e?.voiceId,
        e?.createdAt,
        e?.durationSec,
        e?.userId,
        e?.newAudio,
        e?.title,
        e?.byname
      ]);

  @override
  bool isValidKey(Object? o) => o is SpeechDataRecord;
}
