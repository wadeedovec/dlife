import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "facility_id" field.
  DocumentReference? _facilityId;
  DocumentReference? get facilityId => _facilityId;
  bool hasFacilityId() => _facilityId != null;

  // "cart_items" field.
  List<String>? _cartItems;
  List<String> get cartItems => _cartItems ?? const [];
  bool hasCartItems() => _cartItems != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _facilityId = snapshotData['facility_id'] as DocumentReference?;
    _cartItems = getDataList(snapshotData['cart_items']);
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? userId,
  DocumentReference? facilityId,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'facility_id': facilityId,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartsRecordDocumentEquality implements Equality<CartsRecord> {
  const CartsRecordDocumentEquality();

  @override
  bool equals(CartsRecord? e1, CartsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.facilityId == e2?.facilityId &&
        listEquality.equals(e1?.cartItems, e2?.cartItems) &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CartsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.facilityId, e?.cartItems, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is CartsRecord;
}
