import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertiesRecord extends FirestoreRecord {
  PropertiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "property_name" field.
  String? _propertyName;
  String get propertyName => _propertyName ?? '';
  bool hasPropertyName() => _propertyName != null;

  // "propertyID" field.
  String? _propertyID;
  String get propertyID => _propertyID ?? '';
  bool hasPropertyID() => _propertyID != null;

  // "blockID" field.
  String? _blockID;
  String get blockID => _blockID ?? '';
  bool hasBlockID() => _blockID != null;

  // "sort_index" field.
  int? _sortIndex;
  int get sortIndex => _sortIndex ?? 0;
  bool hasSortIndex() => _sortIndex != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _propertyName = snapshotData['property_name'] as String?;
    _propertyID = snapshotData['propertyID'] as String?;
    _blockID = snapshotData['blockID'] as String?;
    _sortIndex = castToType<int>(snapshotData['sort_index']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('properties')
          : FirebaseFirestore.instance.collectionGroup('properties');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('properties').doc(id);

  static Stream<PropertiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PropertiesRecord.fromSnapshot(s));

  static Future<PropertiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PropertiesRecord.fromSnapshot(s));

  static PropertiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PropertiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PropertiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PropertiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PropertiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PropertiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPropertiesRecordData({
  String? propertyName,
  String? propertyID,
  String? blockID,
  int? sortIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'property_name': propertyName,
      'propertyID': propertyID,
      'blockID': blockID,
      'sort_index': sortIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class PropertiesRecordDocumentEquality implements Equality<PropertiesRecord> {
  const PropertiesRecordDocumentEquality();

  @override
  bool equals(PropertiesRecord? e1, PropertiesRecord? e2) {
    return e1?.propertyName == e2?.propertyName &&
        e1?.propertyID == e2?.propertyID &&
        e1?.blockID == e2?.blockID &&
        e1?.sortIndex == e2?.sortIndex;
  }

  @override
  int hash(PropertiesRecord? e) => const ListEquality()
      .hash([e?.propertyName, e?.propertyID, e?.blockID, e?.sortIndex]);

  @override
  bool isValidKey(Object? o) => o is PropertiesRecord;
}
