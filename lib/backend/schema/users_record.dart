import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;

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

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "myFavs" field.
  List<String>? _myFavs;
  List<String> get myFavs => _myFavs ?? const [];
  bool hasMyFavs() => _myFavs != null;

  // "firsttimeUser" field.
  bool? _firsttimeUser;
  bool get firsttimeUser => _firsttimeUser ?? false;
  bool hasFirsttimeUser() => _firsttimeUser != null;

  // "isfree" field.
  bool? _isfree;
  bool get isfree => _isfree ?? false;
  bool hasIsfree() => _isfree != null;

  // "SubTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  bool hasSubTitle() => _subTitle != null;

  // "Subcredit" field.
  int? _subcredit;
  int get subcredit => _subcredit ?? 0;
  bool hasSubcredit() => _subcredit != null;

  // "SubDesc" field.
  String? _subDesc;
  String get subDesc => _subDesc ?? '';
  bool hasSubDesc() => _subDesc != null;

  // "SubAmount" field.
  double? _subAmount;
  double get subAmount => _subAmount ?? 0.0;
  bool hasSubAmount() => _subAmount != null;

  // "entitledto" field.
  String? _entitledto;
  String get entitledto => _entitledto ?? '';
  bool hasEntitledto() => _entitledto != null;

  // "subDate" field.
  DateTime? _subDate;
  DateTime? get subDate => _subDate;
  bool hasSubDate() => _subDate != null;

  // "subExpireDate" field.
  DateTime? _subExpireDate;
  DateTime? get subExpireDate => _subExpireDate;
  bool hasSubExpireDate() => _subExpireDate != null;

  // "Expired" field.
  bool? _expired;
  bool get expired => _expired ?? false;
  bool hasExpired() => _expired != null;

  // "initialCRbal" field.
  int? _initialCRbal;
  int get initialCRbal => _initialCRbal ?? 0;
  bool hasInitialCRbal() => _initialCRbal != null;

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
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _myFavs = getDataList(snapshotData['myFavs']);
    _firsttimeUser = snapshotData['firsttimeUser'] as bool?;
    _isfree = snapshotData['isfree'] as bool?;
    _subTitle = snapshotData['SubTitle'] as String?;
    _subcredit = castToType<int>(snapshotData['Subcredit']);
    _subDesc = snapshotData['SubDesc'] as String?;
    _subAmount = castToType<double>(snapshotData['SubAmount']);
    _entitledto = snapshotData['entitledto'] as String?;
    _subDate = snapshotData['subDate'] as DateTime?;
    _subExpireDate = snapshotData['subExpireDate'] as DateTime?;
    _expired = snapshotData['Expired'] as bool?;
    _initialCRbal = castToType<int>(snapshotData['initialCRbal']);
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
  bool? isAdmin,
  bool? firsttimeUser,
  bool? isfree,
  String? subTitle,
  int? subcredit,
  String? subDesc,
  double? subAmount,
  String? entitledto,
  DateTime? subDate,
  DateTime? subExpireDate,
  bool? expired,
  int? initialCRbal,
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
      'isAdmin': isAdmin,
      'firsttimeUser': firsttimeUser,
      'isfree': isfree,
      'SubTitle': subTitle,
      'Subcredit': subcredit,
      'SubDesc': subDesc,
      'SubAmount': subAmount,
      'entitledto': entitledto,
      'subDate': subDate,
      'subExpireDate': subExpireDate,
      'Expired': expired,
      'initialCRbal': initialCRbal,
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
        e1?.isAdmin == e2?.isAdmin &&
        listEquality.equals(e1?.myFavs, e2?.myFavs) &&
        e1?.firsttimeUser == e2?.firsttimeUser &&
        e1?.isfree == e2?.isfree &&
        e1?.subTitle == e2?.subTitle &&
        e1?.subcredit == e2?.subcredit &&
        e1?.subDesc == e2?.subDesc &&
        e1?.subAmount == e2?.subAmount &&
        e1?.entitledto == e2?.entitledto &&
        e1?.subDate == e2?.subDate &&
        e1?.subExpireDate == e2?.subExpireDate &&
        e1?.expired == e2?.expired &&
        e1?.initialCRbal == e2?.initialCRbal;
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
        e?.isAdmin,
        e?.myFavs,
        e?.firsttimeUser,
        e?.isfree,
        e?.subTitle,
        e?.subcredit,
        e?.subDesc,
        e?.subAmount,
        e?.entitledto,
        e?.subDate,
        e?.subExpireDate,
        e?.expired,
        e?.initialCRbal
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
