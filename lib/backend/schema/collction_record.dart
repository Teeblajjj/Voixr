import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollctionRecord extends FirestoreRecord {
  CollctionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "plays" field.
  int? _plays;
  int get plays => _plays ?? 0;
  bool hasPlays() => _plays != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "episods" field.
  List<DocumentReference>? _episods;
  List<DocumentReference> get episods => _episods ?? const [];
  bool hasEpisods() => _episods != null;

  // "episodsNum" field.
  int? _episodsNum;
  int get episodsNum => _episodsNum ?? 0;
  bool hasEpisodsNum() => _episodsNum != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "fllowersNum" field.
  int? _fllowersNum;
  int get fllowersNum => _fllowersNum ?? 0;
  bool hasFllowersNum() => _fllowersNum != null;

  // "byname" field.
  String? _byname;
  String get byname => _byname ?? '';
  bool hasByname() => _byname != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _plays = castToType<int>(snapshotData['plays']);
    _likes = castToType<int>(snapshotData['likes']);
    _episods = getDataList(snapshotData['episods']);
    _episodsNum = castToType<int>(snapshotData['episodsNum']);
    _image = snapshotData['image'] as String?;
    _followers = getDataList(snapshotData['followers']);
    _fllowersNum = castToType<int>(snapshotData['fllowersNum']);
    _byname = snapshotData['byname'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('collction')
          : FirebaseFirestore.instance.collectionGroup('collction');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('collction').doc(id);

  static Stream<CollctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollctionRecord.fromSnapshot(s));

  static Future<CollctionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollctionRecord.fromSnapshot(s));

  static CollctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollctionRecordData({
  String? name,
  DocumentReference? user,
  int? plays,
  int? likes,
  int? episodsNum,
  String? image,
  int? fllowersNum,
  String? byname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'user': user,
      'plays': plays,
      'likes': likes,
      'episodsNum': episodsNum,
      'image': image,
      'fllowersNum': fllowersNum,
      'byname': byname,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollctionRecordDocumentEquality implements Equality<CollctionRecord> {
  const CollctionRecordDocumentEquality();

  @override
  bool equals(CollctionRecord? e1, CollctionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.user == e2?.user &&
        e1?.plays == e2?.plays &&
        e1?.likes == e2?.likes &&
        listEquality.equals(e1?.episods, e2?.episods) &&
        e1?.episodsNum == e2?.episodsNum &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.fllowersNum == e2?.fllowersNum &&
        e1?.byname == e2?.byname;
  }

  @override
  int hash(CollctionRecord? e) => const ListEquality().hash([
        e?.name,
        e?.user,
        e?.plays,
        e?.likes,
        e?.episods,
        e?.episodsNum,
        e?.image,
        e?.followers,
        e?.fllowersNum,
        e?.byname
      ]);

  @override
  bool isValidKey(Object? o) => o is CollctionRecord;
}
