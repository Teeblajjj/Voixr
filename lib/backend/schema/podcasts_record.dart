import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PodcastsRecord extends FirestoreRecord {
  PodcastsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "hostName" field.
  String? _hostName;
  String get hostName => _hostName ?? '';
  bool hasHostName() => _hostName != null;

  // "guestName" field.
  String? _guestName;
  String get guestName => _guestName ?? '';
  bool hasGuestName() => _guestName != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "durationSeconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  bool hasDurationSeconds() => _durationSeconds != null;

  // "dialogue" field.
  String? _dialogue;
  String get dialogue => _dialogue ?? '';
  bool hasDialogue() => _dialogue != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "audioUrl2" field.
  String? _audioUrl2;
  String get audioUrl2 => _audioUrl2 ?? '';
  bool hasAudioUrl2() => _audioUrl2 != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "userRefId" field.
  String? _userRefId;
  String get userRefId => _userRefId ?? '';
  bool hasUserRefId() => _userRefId != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "like" field.
  int? _like;
  int get like => _like ?? 0;
  bool hasLike() => _like != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "playa" field.
  int? _playa;
  int get playa => _playa ?? 0;
  bool hasPlaya() => _playa != null;

  // "byname" field.
  String? _byname;
  String get byname => _byname ?? '';
  bool hasByname() => _byname != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  bool hasFeatured() => _featured != null;

  // "trending" field.
  bool? _trending;
  bool get trending => _trending ?? false;
  bool hasTrending() => _trending != null;

  void _initializeFields() {
    _topic = snapshotData['topic'] as String?;
    _hostName = snapshotData['hostName'] as String?;
    _guestName = snapshotData['guestName'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _durationSeconds = castToType<int>(snapshotData['durationSeconds']);
    _dialogue = snapshotData['dialogue'] as String?;
    _audioUrl = snapshotData['audioUrl'] as String?;
    _audioUrl2 = snapshotData['audioUrl2'] as String?;
    _description = snapshotData['Description'] as String?;
    _language = snapshotData['language'] as String?;
    _userRefId = snapshotData['userRefId'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _like = castToType<int>(snapshotData['like']);
    _image = snapshotData['image'] as String?;
    _playa = castToType<int>(snapshotData['playa']);
    _byname = snapshotData['byname'] as String?;
    _featured = snapshotData['featured'] as bool?;
    _trending = snapshotData['trending'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Podcasts');

  static Stream<PodcastsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PodcastsRecord.fromSnapshot(s));

  static Future<PodcastsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PodcastsRecord.fromSnapshot(s));

  static PodcastsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PodcastsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PodcastsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PodcastsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PodcastsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PodcastsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPodcastsRecordData({
  String? topic,
  String? hostName,
  String? guestName,
  DateTime? createdAt,
  int? durationSeconds,
  String? dialogue,
  String? audioUrl,
  String? audioUrl2,
  String? description,
  String? language,
  String? userRefId,
  DocumentReference? userref,
  int? like,
  String? image,
  int? playa,
  String? byname,
  bool? featured,
  bool? trending,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'topic': topic,
      'hostName': hostName,
      'guestName': guestName,
      'createdAt': createdAt,
      'durationSeconds': durationSeconds,
      'dialogue': dialogue,
      'audioUrl': audioUrl,
      'audioUrl2': audioUrl2,
      'Description': description,
      'language': language,
      'userRefId': userRefId,
      'userref': userref,
      'like': like,
      'image': image,
      'playa': playa,
      'byname': byname,
      'featured': featured,
      'trending': trending,
    }.withoutNulls,
  );

  return firestoreData;
}

class PodcastsRecordDocumentEquality implements Equality<PodcastsRecord> {
  const PodcastsRecordDocumentEquality();

  @override
  bool equals(PodcastsRecord? e1, PodcastsRecord? e2) {
    return e1?.topic == e2?.topic &&
        e1?.hostName == e2?.hostName &&
        e1?.guestName == e2?.guestName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.durationSeconds == e2?.durationSeconds &&
        e1?.dialogue == e2?.dialogue &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.audioUrl2 == e2?.audioUrl2 &&
        e1?.description == e2?.description &&
        e1?.language == e2?.language &&
        e1?.userRefId == e2?.userRefId &&
        e1?.userref == e2?.userref &&
        e1?.like == e2?.like &&
        e1?.image == e2?.image &&
        e1?.playa == e2?.playa &&
        e1?.byname == e2?.byname &&
        e1?.featured == e2?.featured &&
        e1?.trending == e2?.trending;
  }

  @override
  int hash(PodcastsRecord? e) => const ListEquality().hash([
        e?.topic,
        e?.hostName,
        e?.guestName,
        e?.createdAt,
        e?.durationSeconds,
        e?.dialogue,
        e?.audioUrl,
        e?.audioUrl2,
        e?.description,
        e?.language,
        e?.userRefId,
        e?.userref,
        e?.like,
        e?.image,
        e?.playa,
        e?.byname,
        e?.featured,
        e?.trending
      ]);

  @override
  bool isValidKey(Object? o) => o is PodcastsRecord;
}
