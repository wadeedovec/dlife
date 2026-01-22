import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpaServicesRecord extends FirestoreRecord {
  SpaServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "facilityID" field.
  DocumentReference? _facilityID;
  DocumentReference? get facilityID => _facilityID;
  bool hasFacilityID() => _facilityID != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  bool hasSortOrder() => _sortOrder != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _isActive = snapshotData['is_active'] as bool?;
    _duration = snapshotData['duration'] as String?;
    _facilityID = snapshotData['facilityID'] as DocumentReference?;
    _sortOrder = castToType<int>(snapshotData['sort_order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spa_services');

  static Stream<SpaServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpaServicesRecord.fromSnapshot(s));

  static Future<SpaServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpaServicesRecord.fromSnapshot(s));

  static SpaServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpaServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpaServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpaServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpaServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpaServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpaServicesRecordData({
  String? title,
  String? description,
  double? price,
  bool? isActive,
  String? duration,
  DocumentReference? facilityID,
  int? sortOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'is_active': isActive,
      'duration': duration,
      'facilityID': facilityID,
      'sort_order': sortOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpaServicesRecordDocumentEquality implements Equality<SpaServicesRecord> {
  const SpaServicesRecordDocumentEquality();

  @override
  bool equals(SpaServicesRecord? e1, SpaServicesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.isActive == e2?.isActive &&
        e1?.duration == e2?.duration &&
        e1?.facilityID == e2?.facilityID &&
        e1?.sortOrder == e2?.sortOrder;
  }

  @override
  int hash(SpaServicesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.price,
        e?.isActive,
        e?.duration,
        e?.facilityID,
        e?.sortOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is SpaServicesRecord;
}
