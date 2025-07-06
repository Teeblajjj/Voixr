import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguagesRecord extends FirestoreRecord {
  LanguagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "LanguageName" field.
  String? _languageName;
  String get languageName => _languageName ?? '';
  bool hasLanguageName() => _languageName != null;

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  void _initializeFields() {
    _id = snapshotData['ID'] as String?;
    _languageName = snapshotData['LanguageName'] as String?;
    _code = snapshotData['Code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('languages');

  static Stream<LanguagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LanguagesRecord.fromSnapshot(s));

  static Future<LanguagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LanguagesRecord.fromSnapshot(s));

  static LanguagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LanguagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LanguagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LanguagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LanguagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LanguagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLanguagesRecordData({
  String? id,
  String? languageName,
  String? code,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID': id,
      'LanguageName': languageName,
      'Code': code,
    }.withoutNulls,
  );

  return firestoreData;
}

class LanguagesRecordDocumentEquality implements Equality<LanguagesRecord> {
  const LanguagesRecordDocumentEquality();

  @override
  bool equals(LanguagesRecord? e1, LanguagesRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.languageName == e2?.languageName &&
        e1?.code == e2?.code;
  }

  @override
  int hash(LanguagesRecord? e) =>
      const ListEquality().hash([e?.id, e?.languageName, e?.code]);

  @override
  bool isValidKey(Object? o) => o is LanguagesRecord;
}
