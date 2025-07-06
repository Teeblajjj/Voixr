// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguagesStruct extends FFFirebaseStruct {
  LanguagesStruct({
    String? name,
    String? id,
    String? isncode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _isncode = isncode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "isncode" field.
  String? _isncode;
  String get isncode => _isncode ?? '';
  set isncode(String? val) => _isncode = val;

  bool hasIsncode() => _isncode != null;

  static LanguagesStruct fromMap(Map<String, dynamic> data) => LanguagesStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        isncode: data['isncode'] as String?,
      );

  static LanguagesStruct? maybeFromMap(dynamic data) => data is Map
      ? LanguagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'isncode': _isncode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'isncode': serializeParam(
          _isncode,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguagesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isncode: deserializeParam(
          data['isncode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguagesStruct &&
        name == other.name &&
        id == other.id &&
        isncode == other.isncode;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id, isncode]);
}

LanguagesStruct createLanguagesStruct({
  String? name,
  String? id,
  String? isncode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LanguagesStruct(
      name: name,
      id: id,
      isncode: isncode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LanguagesStruct? updateLanguagesStruct(
  LanguagesStruct? languages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    languages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLanguagesStructData(
  Map<String, dynamic> firestoreData,
  LanguagesStruct? languages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (languages == null) {
    return;
  }
  if (languages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && languages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final languagesData = getLanguagesFirestoreData(languages, forFieldValue);
  final nestedData = languagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = languages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLanguagesFirestoreData(
  LanguagesStruct? languages, [
  bool forFieldValue = false,
]) {
  if (languages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(languages.toMap());

  // Add any Firestore field values
  languages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLanguagesListFirestoreData(
  List<LanguagesStruct>? languagess,
) =>
    languagess?.map((e) => getLanguagesFirestoreData(e, true)).toList() ?? [];
