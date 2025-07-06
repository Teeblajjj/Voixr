import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VoicesRecord extends FirestoreRecord {
  VoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "VoiceName" field.
  String? _voiceName;
  String get voiceName => _voiceName ?? '';
  bool hasVoiceName() => _voiceName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "accent" field.
  String? _accent;
  String get accent => _accent ?? '';
  bool hasAccent() => _accent != null;

  // "previewUrl" field.
  String? _previewUrl;
  String get previewUrl => _previewUrl ?? '';
  bool hasPreviewUrl() => _previewUrl != null;

  // "preview2" field.
  String? _preview2;
  String get preview2 => _preview2 ?? '';
  bool hasPreview2() => _preview2 != null;

  void _initializeFields() {
    _voiceName = snapshotData['VoiceName'] as String?;
    _id = snapshotData['id'] as String?;
    _accent = snapshotData['accent'] as String?;
    _previewUrl = snapshotData['previewUrl'] as String?;
    _preview2 = snapshotData['preview2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Voices');

  static Stream<VoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VoicesRecord.fromSnapshot(s));

  static Future<VoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VoicesRecord.fromSnapshot(s));

  static VoicesRecord fromSnapshot(DocumentSnapshot snapshot) => VoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVoicesRecordData({
  String? voiceName,
  String? id,
  String? accent,
  String? previewUrl,
  String? preview2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'VoiceName': voiceName,
      'id': id,
      'accent': accent,
      'previewUrl': previewUrl,
      'preview2': preview2,
    }.withoutNulls,
  );

  return firestoreData;
}

class VoicesRecordDocumentEquality implements Equality<VoicesRecord> {
  const VoicesRecordDocumentEquality();

  @override
  bool equals(VoicesRecord? e1, VoicesRecord? e2) {
    return e1?.voiceName == e2?.voiceName &&
        e1?.id == e2?.id &&
        e1?.accent == e2?.accent &&
        e1?.previewUrl == e2?.previewUrl &&
        e1?.preview2 == e2?.preview2;
  }

  @override
  int hash(VoicesRecord? e) => const ListEquality()
      .hash([e?.voiceName, e?.id, e?.accent, e?.previewUrl, e?.preview2]);

  @override
  bool isValidKey(Object? o) => o is VoicesRecord;
}
