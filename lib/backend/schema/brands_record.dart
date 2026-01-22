import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandsRecord extends FirestoreRecord {
  BrandsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "brand_logo" field.
  String? _brandLogo;
  String get brandLogo => _brandLogo ?? '';
  bool hasBrandLogo() => _brandLogo != null;

  // "brand_status" field.
  int? _brandStatus;
  int get brandStatus => _brandStatus ?? 0;
  bool hasBrandStatus() => _brandStatus != null;

  // "brand_website" field.
  String? _brandWebsite;
  String get brandWebsite => _brandWebsite ?? '';
  bool hasBrandWebsite() => _brandWebsite != null;

  // "brand_created_at" field.
  DateTime? _brandCreatedAt;
  DateTime? get brandCreatedAt => _brandCreatedAt;
  bool hasBrandCreatedAt() => _brandCreatedAt != null;

  void _initializeFields() {
    _brandName = snapshotData['brand_name'] as String?;
    _brandLogo = snapshotData['brand_logo'] as String?;
    _brandStatus = castToType<int>(snapshotData['brand_status']);
    _brandWebsite = snapshotData['brand_website'] as String?;
    _brandCreatedAt = snapshotData['brand_created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brands');

  static Stream<BrandsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrandsRecord.fromSnapshot(s));

  static Future<BrandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BrandsRecord.fromSnapshot(s));

  static BrandsRecord fromSnapshot(DocumentSnapshot snapshot) => BrandsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrandsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrandsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BrandsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrandsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrandsRecordData({
  String? brandName,
  String? brandLogo,
  int? brandStatus,
  String? brandWebsite,
  DateTime? brandCreatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'brand_name': brandName,
      'brand_logo': brandLogo,
      'brand_status': brandStatus,
      'brand_website': brandWebsite,
      'brand_created_at': brandCreatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrandsRecordDocumentEquality implements Equality<BrandsRecord> {
  const BrandsRecordDocumentEquality();

  @override
  bool equals(BrandsRecord? e1, BrandsRecord? e2) {
    return e1?.brandName == e2?.brandName &&
        e1?.brandLogo == e2?.brandLogo &&
        e1?.brandStatus == e2?.brandStatus &&
        e1?.brandWebsite == e2?.brandWebsite &&
        e1?.brandCreatedAt == e2?.brandCreatedAt;
  }

  @override
  int hash(BrandsRecord? e) => const ListEquality().hash([
        e?.brandName,
        e?.brandLogo,
        e?.brandStatus,
        e?.brandWebsite,
        e?.brandCreatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is BrandsRecord;
}
