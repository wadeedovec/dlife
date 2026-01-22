import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpaPackagesRecord extends FirestoreRecord {
  SpaPackagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "duration_min" field.
  String? _durationMin;
  String get durationMin => _durationMin ?? '';
  bool hasDurationMin() => _durationMin != null;

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
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _benefits = getDataList(snapshotData['benefits']);
    _isActive = snapshotData['is_active'] as bool?;
    _tag = snapshotData['tag'] as String?;
    _durationMin = snapshotData['duration_min'] as String?;
    _facilityID = snapshotData['facilityID'] as DocumentReference?;
    _sortOrder = castToType<int>(snapshotData['sort_order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spa_packages');

  static Stream<SpaPackagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpaPackagesRecord.fromSnapshot(s));

  static Future<SpaPackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpaPackagesRecord.fromSnapshot(s));

  static SpaPackagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpaPackagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpaPackagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpaPackagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpaPackagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpaPackagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpaPackagesRecordData({
  String? title,
  double? price,
  String? description,
  bool? isActive,
  String? tag,
  String? durationMin,
  DocumentReference? facilityID,
  int? sortOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'is_active': isActive,
      'tag': tag,
      'duration_min': durationMin,
      'facilityID': facilityID,
      'sort_order': sortOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpaPackagesRecordDocumentEquality implements Equality<SpaPackagesRecord> {
  const SpaPackagesRecordDocumentEquality();

  @override
  bool equals(SpaPackagesRecord? e1, SpaPackagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.benefits, e2?.benefits) &&
        e1?.isActive == e2?.isActive &&
        e1?.tag == e2?.tag &&
        e1?.durationMin == e2?.durationMin &&
        e1?.facilityID == e2?.facilityID &&
        e1?.sortOrder == e2?.sortOrder;
  }

  @override
  int hash(SpaPackagesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.description,
        e?.benefits,
        e?.isActive,
        e?.tag,
        e?.durationMin,
        e?.facilityID,
        e?.sortOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is SpaPackagesRecord;
}
