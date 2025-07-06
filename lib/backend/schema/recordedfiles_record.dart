import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordedfilesRecord extends FirestoreRecord {
  RecordedfilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _audio = snapshotData['audio'] as String?;
    _userID = snapshotData['userID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recordedfiles');

  static Stream<RecordedfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordedfilesRecord.fromSnapshot(s));

  static Future<RecordedfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordedfilesRecord.fromSnapshot(s));

  static RecordedfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecordedfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordedfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordedfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordedfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordedfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordedfilesRecordData({
  String? audio,
  DocumentReference? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'audio': audio,
      'userID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecordedfilesRecordDocumentEquality
    implements Equality<RecordedfilesRecord> {
  const RecordedfilesRecordDocumentEquality();

  @override
  bool equals(RecordedfilesRecord? e1, RecordedfilesRecord? e2) {
    return e1?.audio == e2?.audio && e1?.userID == e2?.userID;
  }

  @override
  int hash(RecordedfilesRecord? e) =>
      const ListEquality().hash([e?.audio, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is RecordedfilesRecord;
}
