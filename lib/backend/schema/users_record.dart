import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "FName" field.
  String? _fName;
  String get fName => _fName ?? '';
  bool hasFName() => _fName != null;

  // "LName" field.
  String? _lName;
  String get lName => _lName ?? '';
  bool hasLName() => _lName != null;

  // "Credits" field.
  int? _credits;
  int get credits => _credits ?? 0;
  bool hasCredits() => _credits != null;

  // "firsttime" field.
  bool? _firsttime;
  bool get firsttime => _firsttime ?? false;
  bool hasFirsttime() => _firsttime != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "myFavs" field.
  List<String>? _myFavs;
  List<String> get myFavs => _myFavs ?? const [];
  bool hasMyFavs() => _myFavs != null;

  // "subscribers" field.
  List<DocumentReference>? _subscribers;
  List<DocumentReference> get subscribers => _subscribers ?? const [];
  bool hasSubscribers() => _subscribers != null;

  // "subNum" field.
  int? _subNum;
  int get subNum => _subNum ?? 0;
  bool hasSubNum() => _subNum != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fName = snapshotData['FName'] as String?;
    _lName = snapshotData['LName'] as String?;
    _credits = castToType<int>(snapshotData['Credits']);
    _firsttime = snapshotData['firsttime'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _myFavs = getDataList(snapshotData['myFavs']);
    _subscribers = getDataList(snapshotData['subscribers']);
    _subNum = castToType<int>(snapshotData['subNum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? fName,
  String? lName,
  int? credits,
  bool? firsttime,
  bool? isAdmin,
  int? subNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'FName': fName,
      'LName': lName,
      'Credits': credits,
      'firsttime': firsttime,
      'isAdmin': isAdmin,
      'subNum': subNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fName == e2?.fName &&
        e1?.lName == e2?.lName &&
        e1?.credits == e2?.credits &&
        e1?.firsttime == e2?.firsttime &&
        e1?.isAdmin == e2?.isAdmin &&
        listEquality.equals(e1?.myFavs, e2?.myFavs) &&
        listEquality.equals(e1?.subscribers, e2?.subscribers) &&
        e1?.subNum == e2?.subNum;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.fName,
        e?.lName,
        e?.credits,
        e?.firsttime,
        e?.isAdmin,
        e?.myFavs,
        e?.subscribers,
        e?.subNum
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
