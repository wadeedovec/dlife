import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "category_date" field.
  DateTime? _categoryDate;
  DateTime? get categoryDate => _categoryDate;
  bool hasCategoryDate() => _categoryDate != null;

  // "category_status" field.
  int? _categoryStatus;
  int get categoryStatus => _categoryStatus ?? 0;
  bool hasCategoryStatus() => _categoryStatus != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _categoryDate = snapshotData['category_date'] as DateTime?;
    _categoryStatus = castToType<int>(snapshotData['category_status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? category,
  DateTime? categoryDate,
  int? categoryStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'category_date': categoryDate,
      'category_status': categoryStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.categoryDate == e2?.categoryDate &&
        e1?.categoryStatus == e2?.categoryStatus;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.category, e?.categoryDate, e?.categoryStatus]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
